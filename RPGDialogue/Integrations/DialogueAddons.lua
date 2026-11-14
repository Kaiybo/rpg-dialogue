-- Other addons that replace the talk/quest windows (Immersion, DialogueUI).
-- Two dialogue windows must never fight. Default: RPG Dialogue steps back.
local _, ns = ...

local C = ns.Compat
local L = ns.L

local I = ns.Integrations or {}
ns.Integrations = I

I.DIALOGUE_ADDONS = { "Immersion", "DialogueUI" }

function I.DialogueAddonLoaded()
  for _, name in ipairs(I.DIALOGUE_ADDONS) do
    if C.IsAddOnLoaded(name) then return name end
  end
  return nil
end

-- "normal" | "stepback" | "off"
function I.Mode()
  if not I.DialogueAddonLoaded() then return "normal" end
  local mode = ns.db and ns.db.settings.otherAddons or "stepback"
  if mode == "takeover" then return "normal" end
  if mode == "off" then return "off" end
  return "stepback"
end

ns.OnLogin(function()
  local other = I.DialogueAddonLoaded()
  if other and ns.db.settings.otherAddons == "stepback" and not ns.db.settings.toldAboutOther then
    ns.db.settings.toldAboutOther = true
    ns.Print(L.OTHER_ADDON_NOTICE:format(other))
  end
end)
