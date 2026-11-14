-- Compact mode: one short line in a small bar on top of Blizzard's window, plus a Talk
-- button. Used for repeat visits when the NPC has nothing new.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local Bar = {}
UI.Compact = Bar

local WIDTH = 440
local bar
local hideToken

local function create()
  bar = CreateFrame("Button", nil, Theme.Parent())
  bar:SetSize(WIDTH, 40)
  bar:SetFrameStrata(Theme.Strata())
  bar:SetClampedToScreen(true)
  bar:Hide()
  Theme.Decorate(bar, 4)
  bar.text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  bar.text:SetPoint("LEFT", 12, 0)
  bar.text:SetWidth(WIDTH - 100)
  bar.text:SetJustifyH("LEFT")
  bar.text:SetWordWrap(true)
  bar.talk = Theme.Button(bar, L.TALK, 70, 22)
  bar.talk:SetPoint("RIGHT", -10, 0)
  bar.talk:SetScript("OnClick", function() ns.Conversation.TalkNow() end)
  bar:SetScript("OnClick", function() ns.Conversation.TalkNow() end)
end

local function anchorTo(anchor)
  bar:ClearAllPoints()
  if anchor then
    bar:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, 4)
  else
    bar:SetPoint("TOP", UIParent, "TOP", 0, -140)
  end
end

-- v: { name, text, anchor = frame|nil, autoHide = seconds|nil }
function Bar.Show(v)
  if not bar then create() end
  local size = Theme.TextSize()
  Theme.Recolor(bar)
  Theme.StyleButton(bar.talk)
  Theme.SetFont(bar.text, "body", size - 1)
  Theme.TextColor(bar.text, "text")
  local hex = Theme.Hex("name")
  bar.text:SetText(hex .. (v.name or "") .. ":|r " .. (v.text or ""))
  bar:SetHeight(math.max(36, (bar.text:GetStringHeight() or 14) + 16))
  bar:SetScale(Theme.Scale())
  anchorTo(v.anchor)
  bar:Show()
  if hideToken then hideToken.cancelled = true end
  if v.autoHide then
    local token = { cancelled = false }
    hideToken = token
    C.After(v.autoHide, function() if not token.cancelled then Bar.Hide() end end)
  end
end

function Bar.Reanchor(anchor)
  if bar and bar:IsShown() then anchorTo(anchor) end
end

function Bar.Hide()
  if bar then bar:Hide() end
  if hideToken then hideToken.cancelled = true end
end

function Bar.IsShown() return bar ~= nil and bar:IsShown() end
function Bar.Text() return bar and bar.text:GetText() end

-- Blocker: an empty frame of ours over Blizzard's faded window (or DialogueUI's), so its
-- invisible buttons can't be clicked by accident. That window itself is never touched
-- beyond its alpha. With DialogueUI loaded it sits one strata above that window.
local Blocker = {}
UI.Blocker = Blocker
local blocker

function Blocker.Cover(target)
  if not blocker then
    blocker = CreateFrame("Frame", nil, Theme.Parent())
    blocker:SetFrameStrata(Theme.Strata("blocker"))
    blocker:SetFrameLevel(1)
    blocker:EnableMouse(true)
  end
  blocker:ClearAllPoints()
  blocker:SetAllPoints(target)
  blocker:Show()
end

function Blocker.Uncover()
  if blocker then blocker:Hide() end
end
