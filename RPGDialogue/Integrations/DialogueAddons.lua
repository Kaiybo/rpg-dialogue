-- Other addons that replace the talk/quest windows (Immersion, DialogueUI).
-- Two dialogue windows must never fight. Default ("auto"): with DialogueUI, the whole
-- conversation is drawn inside DialogueUI's own window (Integrations/DialogueUIView.lua);
-- with Immersion (not studied yet), RPG Dialogue steps back. "takeover": RPG Dialogue's own
-- box first, over the other addon's window, which waits underneath (Compat's DialogueUI
-- section).
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

-- With DialogueUI on "auto": draw conversations inside its window.
function I.InsideDialogueUI()
  if I.DialogueAddonLoaded() ~= "DialogueUI" then return false end
  return (ns.db and ns.db.settings.otherAddons or "auto") == "auto"
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
  if not other then return end
  -- Once, with DialogueUI: our windows take its parchment (Window style), so the box that
  -- still opens now and then (its window busy, a fallback) matches it. Switchable back.
  local st = ns.db.settings
  if other == "DialogueUI" and not st.lookDuiOffered then
    st.lookDuiOffered = true
    if st.look == "game" then st.look = "dialogueui" end
  end
  local told = ns.db.settings.toldAboutOther
  if told == other .. (I.InsideDialogueUI() and ":inside" or "") or (other ~= "DialogueUI" and told == other) then return end
  local mode = I.Mode()
  if mode == "normal" and other == "DialogueUI" then
    ns.db.settings.toldAboutOther = other .. (I.InsideDialogueUI() and ":inside" or "")
    ns.Print((I.InsideDialogueUI() and L.OTHER_ADDON_INSIDE or L.OTHER_ADDON_TOGETHER):format(other, other))
  elseif mode == "stepback" then
    ns.db.settings.toldAboutOther = other
    ns.Print(L.OTHER_ADDON_NOTICE:format(other))
  end
end)
