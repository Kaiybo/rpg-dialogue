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
