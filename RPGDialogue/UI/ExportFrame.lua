-- Export/import box: a multi-line text field to copy from (export) or paste into (import).
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local X = {}
UI.ExportFrame = X

local frame
local mode, checked

local function create()
  frame = CreateFrame("Frame", nil, UIParent)
  frame:SetSize(460, 300)
  frame:SetPoint("CENTER")
  frame:SetFrameStrata("DIALOG")
  frame:EnableMouse(true)
  frame:Hide()
  Theme.Decorate(frame, 6, { chrome = "frame" })
  frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.title:SetDrawLayer("OVERLAY", 7)
  frame.hint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.hint:SetPoint("TOPLEFT", 16, -36)
  frame.hint:SetWidth(428)
  frame.hint:SetJustifyH("LEFT")
  frame.scroll = CreateFrame("ScrollFrame", nil, frame, C.Template("scroll"))
  frame.scroll:SetPoint("TOPLEFT", 16, -70)
  frame.scroll:SetPoint("BOTTOMRIGHT", -34, 44)
  frame.edit = CreateFrame("EditBox", nil, frame.scroll)
  frame.edit:SetFontObject("ChatFontNormal")   -- an EditBox needs a font before any text
  frame.edit:SetMultiLine(true)
  frame.edit:SetAutoFocus(false)
  frame.edit:SetWidth(400)
  frame.edit:SetFontObject(GameFontHighlightSmall)
  frame.edit:SetShadowOffset(0, 0)
  frame.edit:SetScript("OnEscapePressed", function() frame:Hide() end)
  frame.edit:SetScript("OnTextChanged", function() if mode == "import" then checked = nil; X.Refresh() end end)
  frame.scroll:SetScrollChild(frame.edit)
  frame.action = Theme.Button(frame, "", 140, 22)
  frame.action:SetScript("OnClick", function() X.Action() end)
  frame.close = Theme.CloseButton(frame)
  frame.close:SetScript("OnClick", function() frame:Hide() end)
end

-- Game look: title in the title bar, the text on parchment from just under it, the button
-- on the bottom bar. Wood look: all on the wood-framed parchment.
local function placeParts(game)
  frame.title:ClearAllPoints()
  frame.close:ClearAllPoints()
  frame.action:ClearAllPoints()
  if game then
    frame.title:SetPoint("TOPLEFT", 12, -5)
    frame.title:SetPoint("TOPRIGHT", -24, -5)
    frame.title:SetJustifyH("CENTER")
    frame.close:SetPoint("TOPRIGHT", 1, 0)
    frame.action:SetPoint("BOTTOMRIGHT", -6, 4)
    local inset = Theme.GamePart(frame, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -24)
      inset:SetPoint("BOTTOMRIGHT", -6, 26)
    end
    Theme.FitPaper(frame, 450, 300 - 24 - 26)
  else
    frame.title:SetPoint("TOPLEFT", 16, -14)
    frame.title:SetJustifyH("LEFT")
    frame.close:SetPoint("TOPRIGHT", -12, -12)
    frame.action:SetPoint("BOTTOMRIGHT", -16, 14)
  end
end

function X.Refresh()
  frame.action:SetShown(mode == "import")
  frame.action:SetText(checked and L.IMPORT_CONFIRM or L.IMPORT_CHECK)
end

function X.Show(m)
  if not frame then create() end
  mode, checked = m, nil
  local game = Theme.IsGame()
  Theme.Recolor(frame)
  placeParts(game)
  Theme.StyleButton(frame.action)
  Theme.StyleButton(frame.close, 12)
  Theme.SetFont(frame.title, "name", game and 13 or 18)
  Theme.Shadow(frame.title, game)
  Theme.TextColor(frame.title, game and "title" or "name")
  Theme.SetFont(frame.hint, "body", 12)
  Theme.TextColor(frame.hint, "text")
  if m == "export" then
    frame.title:SetText(L.EXPORT_TITLE)
    frame.hint:SetText(L.EXPORT_HINT)
    frame.edit:SetText(ns.Export.Build())
    frame.edit:HighlightText()
    frame.edit:SetFocus()
  else
    frame.title:SetText(L.IMPORT_TITLE)
    frame.hint:SetText(L.IMPORT_HINT)
    frame.edit:SetText("")
    frame.edit:SetFocus()
  end
  X.Refresh()
  frame:Show()
end

-- Import is two clicks: check (nothing changes), then confirm.
function X.Action()
  if mode ~= "import" then return end
  if not checked then
    local payload, why = ns.Export.Check(frame.edit:GetText())
    if not payload then
      frame.hint:SetText(L.IMPORT_BAD:format(why))
      return
    end
    checked = payload
    frame.hint:SetText(L.IMPORT_OK:format(tostring(payload.name or "?")))
  else
    ns.Export.Apply(checked)
    frame:Hide()
    ns.Print(L.IMPORT_DONE)
  end
  X.Refresh()
end
