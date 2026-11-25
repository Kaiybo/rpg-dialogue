-- /rpgd why [n]: which line won, its score, the runners-up, why others failed or were held.
local _, ns = ...

local C = ns.Compat
local Why = {}
ns.Why = Why

local MAX_ROWS, MAX_FAILS = 6, 8

function Why.Format(t)
  local out = {}
  out[#out + 1] = ("%s · node %s · slot %s · seed %s"):format(tostring(t.key or t.npc), tostring(t.node or "-"),
    tostring(t.slot), tostring(t.seed))
  if t.ctx then out[#out + 1] = "ctx: " .. t.ctx end
  for _, n in ipairs(t.notes) do out[#out + 1] = "  " .. n end
  for i, r in ipairs(t.rows) do
    if i > MAX_ROWS then out[#out + 1] = ("  … %d more eligible"):format(#t.rows - MAX_ROWS); break end
    out[#out + 1] = ("  %s %4d  %s  %s%s"):format(r.win and "|cff40ff40WIN|r " or "     ", tonumber(r.score) or 0, tostring(r.gid), tostring(r.parts),
      r.stale and " (seen recently)" or "")
  end
  for i, h in ipairs(t.held) do
    if i > MAX_FAILS then break end
    out[#out + 1] = ("  |cffffd040HELD|r       %s  %s"):format(tostring(h[1]), tostring(h[2]))
  end
  for i, f in ipairs(t.fails) do
    if i > MAX_FAILS then out[#out + 1] = ("  … %d more failed"):format(#t.fails - MAX_FAILS); break end
    out[#out + 1] = ("  |cffff6060FAIL|r       %s  %s"):format(tostring(f[1]), tostring(f[2]))
  end
  return out
end

-- Prints the last conversation's traces (or only the n-th most recent).
function Why.Print(n)
  local traces = ns.Engine.traces
  if #traces == 0 then ns.Print("Nothing to explain yet. Talk to someone first."); return end
  local s = ns.Conversation.session
  if s and s.reason then ns.Print("Opened " .. tostring(s.mode) .. ": " .. tostring(s.reason)) end
  local list = {}
  if n then
    list[1] = traces[#traces - n + 1]
  else
    -- Every trace from the most recent conversation (same seed).
    local seed = traces[#traces].seed
    for i = #traces, 1, -1 do
      if traces[i].seed == seed then table.insert(list, 1, traces[i]) end
    end
  end
  for _, t in ipairs(list) do
    if t then
      ns.Print("why:")
      for _, line in ipairs(Why.Format(t)) do C.Print(line) end
    end
  end
end
