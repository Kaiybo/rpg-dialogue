-- "This line is wrong": one click saves the line, the NPC, the full context and an
-- optional note to account-wide data. tools/flag_report.py turns them into a report.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Flag = {}
ns.Flag = Flag

function Flag.Save(session, note)
  local gid = session.lastLine
  local line = gid and ns.Data.Line(gid)
  local ctx = session.ctx
  for _, k in ipairs(ns.Context.DUMP_ORDER) do local _ = ctx[k] end   -- force every field
  local entry = {
    t = C.Now(),
    line = gid,
    text = line and line.text,
    npc = session.info.name, key = session.info.key, npcID = session.info.npcID,
    pack = session.info.def and session.info.def._pack,
    node = session.node,
    note = (note and note ~= "") and note or nil,
    ctx = ns.Context.Describe(ctx),
    seed = session.env.seed,
  }
  local list = ns.db.flagged
  list[#list + 1] = entry
  ns.UI.Dialogue.FlagSaved()
  ns.Print(L.FLAG_SAVED_CHAT:format(tostring(gid)))
  Flag.PrintEntry(entry)
  Flag.ShowCopy(Flag.Report(entry))
  return entry
end

-- One flag as plain text, for pasting into a bug report.
function Flag.Report(f)
  local out = {
    "[RPG Dialogue] Wrong line " .. tostring(f.line),
    "NPC: " .. tostring(f.npc) .. " (key " .. tostring(f.key) .. ", id " .. tostring(f.npcID) .. ", pack " .. tostring(f.pack) .. ")",
    "Node: " .. tostring(f.node) .. ", seed " .. tostring(f.seed),
    "Text: " .. tostring(f.text),
  }
  if f.note then out[#out + 1] = "Note: " .. f.note end
  if type(f.ctx) == "table" then
    out[#out + 1] = "Context:"
    for _, l in ipairs(f.ctx) do out[#out + 1] = "  " .. tostring(l) end
  elseif f.ctx then
    out[#out + 1] = "Context: " .. tostring(f.ctx)
  end
  return table.concat(out, "\n")
end

-- The short version in chat: the line, who said it, and the note.
function Flag.PrintEntry(f)
  C.Print(("  |cffffd200%s|r (%s, %s): %s"):format(tostring(f.line), tostring(f.npc), tostring(f.node), tostring(f.text)))
  if f.note then C.Print("  " .. L.FLAG_NOTE .. " " .. f.note) end
end

-- A small window with the full report selected, ready for Ctrl+C.
local copy
function Flag.ShowCopy(text)
  if not copy then
    copy = CreateFrame("Frame", "RPGDialogueFlagCopy", UIParent, C.Template("backdrop"))
    copy:SetSize(520, 300)
    copy:SetPoint("CENTER")
    copy:SetFrameStrata("FULLSCREEN_DIALOG")
    copy:SetToplevel(true)
    copy:EnableMouse(true)
    copy:SetMovable(true)
    copy:RegisterForDrag("LeftButton")
    copy:SetScript("OnDragStart", copy.StartMoving)
    copy:SetScript("OnDragStop", copy.StopMovingOrSizing)
    if copy.SetBackdrop then
      copy:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 6, right = 6, top = 6, bottom = 6 } })
    else
      local bg = copy:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints()
      bg:SetColorTexture(0, 0, 0, 0.9)
    end
    copy.title = copy:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    copy.title:SetPoint("TOP", 0, -14)
    copy.title:SetText(L.FLAG_COPY_TITLE)
    local close = CreateFrame("Button", nil, copy, C.Template("close"))
    close:SetPoint("TOPRIGHT", -2, -2)
    local scroll = CreateFrame("ScrollFrame", nil, copy, C.Template("scroll"))
    scroll:SetPoint("TOPLEFT", 16, -36)
    scroll:SetPoint("BOTTOMRIGHT", -34, 16)
    copy.edit = CreateFrame("EditBox", nil, scroll)
    copy.edit:SetMultiLine(true)
    copy.edit:SetAutoFocus(false)
    copy.edit:SetFontObject(ChatFontNormal)
    copy.edit:SetWidth(460)
    copy.edit:SetScript("OnEscapePressed", function() copy:Hide() end)
    copy.edit:SetScript("OnTextChanged", function(self, user) if user then self:SetText(copy.text); self:HighlightText() end end)
    copy.edit:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    scroll:SetScrollChild(copy.edit)
    if UISpecialFrames then table.insert(UISpecialFrames, "RPGDialogueFlagCopy") end
  end
  copy.text = text
  copy.edit:SetText(text)
  copy:Show()
  copy.edit:SetFocus()
  copy.edit:HighlightText()
end

function Flag.List(which)
  local list = ns.db.flagged
  if #list == 0 then ns.Print(L.FLAG_NONE); return end
  if which == "copy" or tonumber(which) then
    local i = tonumber(which)
    if i then
      if list[i] then Flag.ShowCopy(Flag.Report(list[i])) end
    else
      local all = {}
      for _, f in ipairs(list) do all[#all + 1] = Flag.Report(f) end
      Flag.ShowCopy(table.concat(all, "\n\n"))
    end
    return
  end
  ns.Print(L.FLAG_LIST:format(#list))
  for i, f in ipairs(list) do
    C.Print(("  %d. %s (%s)%s"):format(i, tostring(f.line), tostring(f.npc), f.note and (": " .. f.note) or ""))
  end
end
