-- Books (rarely): the addon notices what you read. Now and then a book teaches a topic;
-- more rarely an NPC reacts (condition bookRead, budget: once a day).
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Books = {}
ns.Books = Books

function Books.Find(title)
  for _, def in pairs(ns.Data.books) do
    if def.title == title then return def end
  end
  return nil
end

function Books.OnRead(title)
  local def = Books.Find(title)
  local c = ns.char
  c.journal[#c.journal + 1] = { t = C.Now(), kind = "book", text = L.BOOK_READ:format(title), voice = "first" }
  if def and def.topics then
    ns.Effects.Apply({ learn = def.topics }, { now = C.Now(), info = { name = title } })
  end
end

ns.Listen("BOOK_READ", Books.OnRead)
