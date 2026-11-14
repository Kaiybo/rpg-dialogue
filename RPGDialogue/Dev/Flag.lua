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
  return entry
end

function Flag.List()
  local list = ns.db.flagged
  if #list == 0 then ns.Print(L.FLAG_NONE); return end
  ns.Print(L.FLAG_LIST:format(#list))
  for i, f in ipairs(list) do
    C.Print(("  %d. %s (%s)%s"):format(i, tostring(f.line), tostring(f.npc), f.note and (": " .. f.note) or ""))
  end
end
