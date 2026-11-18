-- /rpgd export and /rpgd import: a copyable text string holding a character's whole story.
-- The format is data, never code: a small typed serializer, base64, a version header and a
-- checksum. Import validates everything first and refuses a bad string without touching
-- existing data.
local _, ns = ...

local U = ns.Util
local Export = {}
ns.Export = Export

Export.HEADER = "RPGD1"
Export.FIELDS = {
  "npc", "heard", "quests", "align", "traits", "opinions", "flags", "claims", "deeds", "threads",
  "towns", "origin", "originsApplied", "topics", "books", "deaths", "deathCount", "homeInn",
  "journal", "insanity", "notes", "conversations", "arrived", "journalRead",
}

---------------------------------------------------------------------------
-- Serializer: n<number>; | s<len>:<bytes> | T | F | {<key><value>...}
---------------------------------------------------------------------------
local function ser(v, out, depth)
  if depth > 30 then error("too deep") end
  local t = type(v)
  if t == "number" then out[#out + 1] = "n" .. string.format("%.17g", v) .. ";"
  elseif t == "string" then out[#out + 1] = "s" .. #v .. ":" .. v
  elseif t == "boolean" then out[#out + 1] = v and "T" or "F"
  elseif t == "table" then
    out[#out + 1] = "{"
    for k, x in pairs(v) do
      local kt = type(k)
      if (kt == "string" or kt == "number") and (type(x) ~= "function") then
        ser(k, out, depth + 1)
        ser(x, out, depth + 1)
      end
    end
    out[#out + 1] = "}"
  end
end

function Export.Serialize(v)
  local out = {}
  ser(v, out, 0)
  return table.concat(out)
end

function Export.Deserialize(s)
  local pos = 1
  local function value(depth)
    if depth > 30 then error("too deep") end
    local c = s:sub(pos, pos)
    if c == "n" then
      local e = s:find(";", pos, true)
      if not e then error("bad number") end
      local n = tonumber(s:sub(pos + 1, e - 1))
      if not n then error("bad number") end
      pos = e + 1
      return n
    elseif c == "s" then
      local colon = s:find(":", pos, true)
      local len = colon and tonumber(s:sub(pos + 1, colon - 1))
      if not len or len < 0 then error("bad string") end
      local str = s:sub(colon + 1, colon + len)
      if #str ~= len then error("truncated string") end
      pos = colon + len + 1
      return str
    elseif c == "T" then pos = pos + 1; return true
    elseif c == "F" then pos = pos + 1; return false
    elseif c == "{" then
      pos = pos + 1
      local t = {}
      while s:sub(pos, pos) ~= "}" do
        if pos > #s then error("unclosed table") end
        local k = value(depth + 1)
        t[k] = value(depth + 1)
      end
      pos = pos + 1
      return t
    end
    error("unexpected '" .. c .. "' at " .. pos)
  end
  local ok, result = pcall(value, 0)
  if not ok then return nil, result end
  if pos <= #s then return nil, "trailing data" end
  return result
end

---------------------------------------------------------------------------
-- Base64 (plain arithmetic, no bit library)
---------------------------------------------------------------------------
local ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local DECODE = {}
for i = 1, 64 do DECODE[ALPHA:sub(i, i)] = i - 1 end

function Export.B64Encode(data)
  local out = {}
  for i = 1, #data, 3 do
    local a, b, c = data:byte(i, i + 2)
    local n = a * 65536 + (b or 0) * 256 + (c or 0)
    local c1, c2 = math.floor(n / 262144) % 64, math.floor(n / 4096) % 64
    local c3, c4 = math.floor(n / 64) % 64, n % 64
    out[#out + 1] = ALPHA:sub(c1 + 1, c1 + 1) .. ALPHA:sub(c2 + 1, c2 + 1)
      .. (b and ALPHA:sub(c3 + 1, c3 + 1) or "=") .. (c and ALPHA:sub(c4 + 1, c4 + 1) or "=")
  end
  return table.concat(out)
end

function Export.B64Decode(text)
  text = text:gsub("%s", "")
  if #text % 4 ~= 0 then return nil end
  local out = {}
  for i = 1, #text, 4 do
    local chunk = text:sub(i, i + 3)
    local n, pad = 0, 0
    for j = 1, 4 do
      local ch = chunk:sub(j, j)
      local v
      if ch == "=" then v = 0; pad = pad + 1 else v = DECODE[ch]; if not v then return nil end end
      n = n * 64 + v
    end
    local a, b, c = math.floor(n / 65536) % 256, math.floor(n / 256) % 256, n % 256
    out[#out + 1] = string.char(a)
    if pad < 2 then out[#out + 1] = string.char(b) end
    if pad < 1 then out[#out + 1] = string.char(c) end
  end
  return table.concat(out)
end

---------------------------------------------------------------------------
-- Export / import
---------------------------------------------------------------------------
function Export.Build()
  local payload = { schema = ns.SavedData.SCHEMA, name = ns.Compat.Name("player"), data = {} }
  for _, f in ipairs(Export.FIELDS) do payload.data[f] = ns.char[f] end
  local body = Export.B64Encode(Export.Serialize(payload))
  return Export.HEADER .. ":" .. U.Hash(body) .. ":" .. body
end

-- Returns the decoded payload, or nil and a reason. Never touches saved data.
function Export.Check(text)
  if type(text) ~= "string" then return nil, "empty" end
  text = U.Trim(text)
  local header, sum, body = text:match("^(%w+):(%d+):(.+)$")
  if header ~= Export.HEADER then return nil, "not an RPG Dialogue export (or a newer version)" end
  if tonumber(sum) ~= U.Hash(body) then return nil, "the string is damaged or incomplete" end
  local raw = Export.B64Decode(body)
  if not raw then return nil, "the string is damaged" end
  local payload, err = Export.Deserialize(raw)
  if type(payload) ~= "table" or type(payload.data) ~= "table" then return nil, "unreadable data (" .. tostring(err) .. ")" end
  if (tonumber(payload.schema) or 0) > ns.SavedData.SCHEMA then return nil, "made by a newer RPG Dialogue" end
  for k, v in pairs(payload.data) do
    local expected = ns.SavedData.CHAR_DEFAULTS[k]
    if expected ~= nil and type(v) ~= type(expected) then return nil, "field " .. tostring(k) .. " has the wrong type" end
  end
  return payload
end

-- Applies a checked payload. The previous data is kept in _quarantine, never wiped.
function Export.Apply(payload)
  local c = ns.char
  local backup = {}
  for _, f in ipairs(Export.FIELDS) do backup[f] = c[f] end
  c._quarantine[#c._quarantine + 1] = { path = "(before import)", value = backup, t = ns.Compat.Now() }
  for _, f in ipairs(Export.FIELDS) do
    if payload.data[f] ~= nil then c[f] = payload.data[f] end
  end
  local fixed = ns.SavedData.Prepare(c, ns.SavedData.CHAR_DEFAULTS, ns.SavedData.MIGRATIONS.char)
  ns.char = fixed
  ns.Compat.SetSV("RPGDialogueCharDB", fixed)
  return true
end

---------------------------------------------------------------------------
-- Character sheet (0.82.0): everything about the character as plain, readable text, for
-- copying out of the game (a forum post, a roleplay profile, a backup you can read). Not
-- importable; /rpgd export is the restorable string. Every game call is protected, so a
-- missing API just leaves its section out.
---------------------------------------------------------------------------
local function plain(s)
  s = tostring(s or "")
  s = s:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|T.-|t", ""):gsub("|A.-|a", "")
  s = s:gsub("|H.-|h(.-)|h", "%1")
  return s
end

local SLOTS = {
  { 1, "Head" }, { 2, "Neck" }, { 3, "Shoulder" }, { 15, "Back" }, { 5, "Chest" }, { 4, "Shirt" },
  { 19, "Tabard" }, { 9, "Wrist" }, { 10, "Hands" }, { 6, "Waist" }, { 7, "Legs" }, { 8, "Feet" },
  { 11, "Finger" }, { 12, "Finger" }, { 13, "Trinket" }, { 14, "Trinket" }, { 16, "Main hand" },
  { 17, "Off hand" }, { 18, "Ranged" },
}
local STATS = { "Strength", "Agility", "Stamina", "Intellect", "Spirit" }
local RESISTS = { [2] = "Fire", [3] = "Nature", [4] = "Frost", [5] = "Shadow", [6] = "Arcane" }

local function money(c)
  c = tonumber(c) or 0
  local g, s, k = math.floor(c / 10000), math.floor(c / 100) % 100, c % 100
  local out = {}
  if g > 0 then out[#out + 1] = g .. "g" end
  if s > 0 or g > 0 then out[#out + 1] = s .. "s" end
  out[#out + 1] = k .. "c"
  return table.concat(out, " ")
end

local function pct(v) return v and string.format("%.2f%%", v) or nil end

function Export.Sheet()
  local C, call = ns.Compat, ns.Compat.Call
  local c = ns.char
  local out = {}
  local function line(s) if s and s ~= "" then out[#out + 1] = plain(s) end end
  local function kv(k, v) if v ~= nil and v ~= "" then out[#out + 1] = k .. ": " .. plain(v) end end
  local function section(title) out[#out + 1] = ""; out[#out + 1] = "== " .. title .. " ==" end

  -- Who
  local name = C.Name("player") or "?"
  local realm = call("GetRealmName")
  out[#out + 1] = "RPG Dialogue character sheet: " .. name .. (realm and (" of " .. realm) or "")
  out[#out + 1] = "Written " .. tostring(call("date", "%Y-%m-%d %H:%M") or "") .. " (RPG Dialogue " .. tostring(ns.VERSION or C.AddOnMeta("RPGDialogue", "Version") or "?") .. ")"
  section("Character")
  kv("Name", name)
  kv("Realm", realm)
  kv("Level", C.Level("player"))
  kv("Race", C.Race("player"))
  kv("Class", C.Class("player"))
  local sex = call("UnitSex", "player")
  kv("Sex", sex == 2 and "Male" or sex == 3 and "Female" or nil)
  kv("Faction", call("UnitFactionGroup", "player"))
  local guild, rank = call("GetGuildInfo", "player")
  if guild then kv("Guild", guild .. (rank and (" (" .. rank .. ")") or "")) end
  local zone, sub = call("GetRealZoneText") or call("GetZoneText"), call("GetSubZoneText")
  kv("Location", zone and (zone .. ((sub and sub ~= "" and sub ~= zone) and (", " .. sub) or "")))
  kv("Hearthstone", call("GetBindLocation"))
  local m = call("GetMoney")
  if m then kv("Money", money(m)) end
  local xp, xpMax = call("UnitXP", "player"), call("UnitXPMax", "player")
  if xp and xpMax and xpMax > 0 then
    local rest = call("GetXPExhaustion")
    kv("Experience", xp .. " / " .. xpMax .. (rest and (" (" .. rest .. " rested)") or ""))
  end
  kv("Health", call("UnitHealthMax", "player"))
  local pmax = call("UnitPowerMax", "player") or call("UnitManaMax", "player")
  if pmax and pmax > 0 then kv("Power", pmax) end

  -- Stats
  local stats = {}
  for i, label in ipairs(STATS) do
    local _, v = call("UnitStat", "player", i)
    if v then stats[#stats + 1] = label .. " " .. math.floor(v) end
  end
  if #stats > 0 then
    section("Attributes")
    line(table.concat(stats, ", "))
    local _, armor = call("UnitArmor", "player")
    kv("Armor", armor and math.floor(armor))
    local res = {}
    for i = 2, 6 do
      local _, v = call("UnitResistance", "player", i)
      if v and v > 0 then res[#res + 1] = RESISTS[i] .. " " .. math.floor(v) end
    end
    if #res > 0 then kv("Resistances", table.concat(res, ", ")) end
    local base, pos, neg = call("UnitAttackPower", "player")
    if base then kv("Attack power", math.floor(base + (pos or 0) + (neg or 0))) end
    local rbase, rpos, rneg = call("UnitRangedAttackPower", "player")
    if rbase and rbase > 0 then kv("Ranged attack power", math.floor(rbase + (rpos or 0) + (rneg or 0))) end
    local combat = {}
    local function add(label, v) if v and v > 0 then combat[#combat + 1] = label .. " " .. pct(v) end end
    add("crit", call("GetCritChance"))
    add("ranged crit", call("GetRangedCritChance"))
    add("spell crit", call("GetSpellCritChance", 2))
    add("dodge", call("GetDodgeChance"))
    add("parry", call("GetParryChance"))
    add("block", call("GetBlockChance"))
    if #combat > 0 then kv("Chances", table.concat(combat, ", ")) end
  end

  -- Gear
  local gear = {}
  for _, s in ipairs(SLOTS) do
    local link = call("GetInventoryItemLink", "player", s[1])
    if link then
      local item = link:match("%[(.-)%]") or plain(link)
      local _, _, quality, ilvl = call("GetItemInfo", link)
      local q = quality and _G["ITEM_QUALITY" .. quality .. "_DESC"]
      local extra = {}
      if q then extra[#extra + 1] = q end
      if ilvl and ilvl > 0 then extra[#extra + 1] = "item level " .. ilvl end
      gear[#gear + 1] = s[2] .. ": " .. item .. (#extra > 0 and (" (" .. table.concat(extra, ", ") .. ")") or "")
    end
  end
  if #gear > 0 then section("Equipped"); for _, g in ipairs(gear) do line(g) end end

  -- Talents
  local tabs = call("GetNumTalentTabs") or 0
  if tabs > 0 then
    local tlines, spent = {}, 0
    for t = 1, tabs do
      local r = { call("GetTalentTabInfo", t) }
      local tname, points
      if type(r[1]) == "number" then tname, points = r[2], r[5] else tname, points = r[1], r[3] end
      points = tonumber(points) or 0
      if tname then
        spent = spent + points
        local picks = {}
        for i = 1, (call("GetNumTalents", t) or 0) do
          local n, _, _, _, rk, maxRk = call("GetTalentInfo", t, i)
          if n and (rk or 0) > 0 then picks[#picks + 1] = n .. " " .. rk .. "/" .. (maxRk or "?") end
        end
        tlines[#tlines + 1] = tname .. " (" .. points .. ")" .. (#picks > 0 and (": " .. table.concat(picks, ", ")) or "")
      end
    end
    if #tlines > 0 then
      section("Talents (" .. spent .. " points)")
      for _, l in ipairs(tlines) do line(l) end
    end
  end

  -- Skills and professions
  local nSkills = call("GetNumSkillLines") or 0
  if nSkills > 0 then
    section("Skills")
    local group
    for i = 1, nSkills do
      local n, header, _, rk, temp, mod, maxRk = call("GetSkillLineInfo", i)
      if n then
        if header then group = n; line("- " .. n)
        else
          local v = (rk or 0) + (temp or 0) + (mod or 0)
          line("  " .. n .. ((maxRk and maxRk > 1) and (" " .. v .. "/" .. maxRk) or ""))
        end
      end
    end
  end

  -- Reputation
  local nFac = call("GetNumFactions") or 0
  if nFac > 0 then
    section("Reputation")
    for i = 1, nFac do
      local n, _, standing, bMin, bMax, bVal, _, _, header, _, hasRep = call("GetFactionInfo", i)
      if n then
        if header and not hasRep then line("- " .. n)
        else
          local label = standing and _G["FACTION_STANDING_LABEL" .. standing] or tostring(standing or "?")
          local prog = (bMin and bMax and bVal and bMax > bMin) and (" " .. (bVal - bMin) .. "/" .. (bMax - bMin)) or ""
          line("  " .. n .. ": " .. label .. prog)
        end
      end
    end
  end

  -- RPG Dialogue: the numbers behind the journal.
  section("Standing in numbers")
  local a = c.align or {}
  kv("Light / Shadow", a.light or 0)
  kv("Order / Wild", a.order or 0)
  kv("Honor / Cunning", a.honor or 0)
  if (a.taint or 0) > 0 then kv("Taint", a.taint) end
  local title = ns.Effects.TitleName and ns.Effects.TitleName()
  kv("Title", title)
  local traits = {}
  for tname, n in pairs(c.traits or {}) do
    if type(n) == "number" and n ~= 0 then traits[#traits + 1] = { tname, n } end
  end
  table.sort(traits, function(x, y) if x[2] ~= y[2] then return x[2] > y[2] end return x[1] < y[1] end)
  local tl = {}
  for _, t in ipairs(traits) do tl[#tl + 1] = t[1] .. " " .. t[2] end
  if #tl > 0 then kv("Traits", table.concat(tl, ", ")) end
  if ns.Insanity and ns.Insanity.Level and (ns.Insanity.Level() or 0) > 0 then kv("Insanity", ns.Insanity.Level()) end
  kv("Conversations", c.conversations or 0)
  kv("Deaths", c.deathCount or 0)
  if c.homeInn then kv("Home inn", type(c.homeInn) == "table" and (c.homeInn.name or c.homeInn.zone) or c.homeInn) end

  -- The journal, every page.
  local J = ns.Journal
  if J and J.Text then
    local pages = { { "sheet", "Myself" }, { "stories", "Stories" }, { "people", "People" },
                    { "heard", "Heard of" }, { "chronicle", "Diary" } }
    for _, p in ipairs(pages) do
      local ok, text = pcall(J.Text, p[1], "")
      if ok and text and text ~= "" then
        section("Journal: " .. p[2])
        for l in (text .. "\n"):gmatch("(.-)\n") do
          l = plain(l)
          if l:match("%S") then out[#out + 1] = l else out[#out + 1] = "" end
        end
      end
    end
  end
  if c.notes and U.Trim(c.notes) ~= "" then
    section("Notes")
    out[#out + 1] = plain(c.notes)
  end
  return table.concat(out, "\n")
end
