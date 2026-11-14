-- Total RP 3 (optional). When it's loaded and the setting is on, NPCs call you by your
-- roleplay name (and title): {name} becomes "Sir Aldric" instead of "Aldricx".
-- Read-only: nothing is ever written to Total RP 3, and everything works without it.
local _, ns = ...

local C = ns.Compat

local I = ns.Integrations or {}
ns.Integrations = I

I.TRP3_ADDON = "totalRP3"
local MAX_LEN = 40

-- Drops color codes, textures, links and stray whitespace from profile text.
local function clean(s)
  if type(s) ~= "string" then return nil end
  s = s:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
  s = s:gsub("|T.-|t", ""):gsub("|A.-|a", ""):gsub("|H.-|h(.-)|h", "%1"):gsub("|n", " ")
  s = s:gsub("%s+", " "):gsub("^ ", ""):gsub(" $", "")
  if s == "" then return nil end
  return s
end
I.CleanRoleplayText = clean

function I.RoleplayAddonLoaded()
  return C.IsAddOnLoaded(I.TRP3_ADDON)
end

-- The name NPCs use, or nil to use the character's own name.
function I.RoleplayName()
  local s = ns.db and ns.db.settings
  if not s or not s.trp3Name or not I.RoleplayAddonLoaded() then return nil end
  local p = C.RoleplayProfile()
  if not p then return nil end
  local first = clean(p.first) or (clean(p.full) and clean(p.full):match("^(%S+)"))
  if not first then return nil end
  local title = s.trp3Title and clean(p.title) or nil
  local name = title and (title .. " " .. first) or first
  if #name > MAX_LEN then name = first end
  if #name > MAX_LEN then return nil end
  return name
end
