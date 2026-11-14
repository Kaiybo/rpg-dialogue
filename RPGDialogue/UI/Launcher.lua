-- Launcher: the addon compartment if the client has one, else a small minimap button.
local _, ns = ...

local C = ns.Compat
local L = ns.L

local Launcher = {}
ns.UI.Launcher = Launcher

local ICON = "Interface\\Icons\\INV_Misc_Book_09"

local function onClick(button)
  if button == "RightButton" or not (ns.Journal and ns.Journal.Toggle) then
    ns.Settings.Open()
  else
    ns.Journal.Toggle()
  end
end

local function minimapButton()
  local map = C.Minimap()
  if not map then return end
  local b = CreateFrame("Button", nil, map)
  b:SetSize(31, 31)
  b:SetFrameStrata("MEDIUM")
  b:SetFrameLevel(8)
  b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  b:RegisterForDrag("LeftButton")
  local icon = b:CreateTexture(nil, "BACKGROUND")
  icon:SetSize(20, 20)
  icon:SetPoint("CENTER")
  icon:SetTexture(ICON)
  local border = b:CreateTexture(nil, "OVERLAY")
  border:SetSize(53, 53)
  border:SetPoint("TOPLEFT")
  border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
  local function place()
    local angle = math.rad(ns.db.settings.minimapAngle or 210)
    b:ClearAllPoints()
    b:SetPoint("CENTER", map, "CENTER", math.cos(angle) * 80, math.sin(angle) * 80)
  end
  b:SetScript("OnDragStart", function(self)
    self:SetScript("OnUpdate", function()
      local mx, my = map:GetCenter()
      local cx, cy = C.CursorPosition()
      if not (mx and cx) then return end
      local scale = map:GetEffectiveScale()
      ns.db.settings.minimapAngle = math.deg(math.atan2(cy / scale - my, cx / scale - mx))
      place()
    end)
  end)
  b:SetScript("OnDragStop", function(self) self:SetScript("OnUpdate", nil) end)
  b:SetScript("OnClick", function(_, button) onClick(button) end)
  b:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText(L.ADDON_NAME)
    GameTooltip:AddLine(L.LAUNCHER_TIP, 1, 1, 1, true)
    GameTooltip:Show()
  end)
  b:SetScript("OnLeave", function() GameTooltip:Hide() end)
  place()
end

ns.OnLogin(function()
  local ok = C.RegisterCompartment({
    text = L.ADDON_NAME, icon = ICON, notCheckable = true,
    func = function(_, _, _, _, button) onClick(button) end,
  })
  if not ok then minimapButton() end
end)
