-- Other addons that replace the talk/quest windows (Immersion, DialogueUI).
-- Two dialogue windows must never fight. Default ("auto"): with DialogueUI, RPG Dialogue
-- talks first and then hands you to DialogueUI's window, which waits underneath (see
-- Compat's DialogueUI section); with Immersion (not studied yet), RPG Dialogue steps back.
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
  local other = I.DialogueAddonLoaded()
  if not other then return "normal" end
  local mode = ns.db and ns.db.settings.otherAddons or "auto"
  if mode == "auto" then mode = (other == "DialogueUI") and "takeover" or "stepback" end
  if mode == "takeover" then return "normal" end
  if mode == "off" then return "off" end
  return "stepback"
end

ns.OnLogin(function()
  local other = I.DialogueAddonLoaded()
  if not other or ns.db.settings.toldAboutOther == other then return end
  local mode = I.Mode()
  if mode == "normal" and other == "DialogueUI" then
    ns.db.settings.toldAboutOther = other
    ns.Print(L.OTHER_ADDON_TOGETHER:format(other, other))
  elseif mode == "stepback" then
    ns.db.settings.toldAboutOther = other
    ns.Print(L.OTHER_ADDON_NOTICE:format(other))
  end
end)
