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

-- The journal on screen: a book you click to open it (drag to move, right-click for settings).
-- Shown unless turned off in settings ("Show the journal button").
local book
function Launcher.Book()
  if book then return book end
  book = CreateFrame("Button", "RPGDialogueJournalButton", UIParent)
  book:SetSize(40, 40)
  book:SetFrameStrata("MEDIUM")
  book:SetMovable(true)
  book:SetClampedToScreen(true)
  book:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  book:RegisterForDrag("LeftButton")
  local icon = book:CreateTexture(nil, "ARTWORK")
  icon:SetAllPoints()
  icon:SetTexture(ICON)
  -- Unread diary entries: a small count in the corner.
  book.badge = book:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  book.badge:SetPoint("BOTTOMRIGHT", 2, -2)
  book.badge:SetTextColor(1, 0.82, 0)
  local hl = book:CreateTexture(nil, "HIGHLIGHT")
  hl:SetAllPoints()
  hl:SetColorTexture(1, 1, 1, 0.2)
  local pos = ns.db.settings.pos.journalButton
  if pos then book:SetPoint(pos[1], UIParent, pos[1], pos[2], pos[3]) else book:SetPoint("RIGHT", UIParent, "RIGHT", -60, 120) end
  book:SetScript("OnDragStart", book.StartMoving)
  book:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, _, x, y = self:GetPoint()
    ns.db.settings.pos.journalButton = { point, x, y }
  end)
  book:SetScript("OnClick", function(_, button) onClick(button) end)
  book:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText(L.J_TITLE)
    GameTooltip:AddLine(L.JOURNAL_BUTTON_TIP, 1, 1, 1, true)
    local n = ns.Journal and ns.Journal.Unread and ns.Journal.Unread() or 0
    if n > 0 then GameTooltip:AddLine(L.J_UNREAD:format(n), 1, 0.82, 0) end
    GameTooltip:Show()
  end)
  book:SetScript("OnLeave", function() GameTooltip:Hide() end)
  return book
end

function Launcher.UpdateBadge()
  if not book or not book.badge then return end
  local n = ns.Journal and ns.Journal.Unread and ns.Journal.Unread() or 0
  book.badge:SetText(n > 0 and (n > 99 and "99+" or tostring(n)) or "")
end

function Launcher.Refresh()
  if ns.db.settings.journalButton ~= false then Launcher.Book():Show() elseif book then book:Hide() end
  Launcher.UpdateBadge()
end

ns.OnLogin(function()
  Launcher.Refresh()
  local ok = C.RegisterCompartment({
    text = L.ADDON_NAME, icon = ICON, notCheckable = true,
    func = function(_, _, _, _, button) onClick(button) end,
  })
  if not ok then minimapButton() end
end)
