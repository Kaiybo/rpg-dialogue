-- 0.36.0: every class and race has its own material, not only priests.
-- Every class trainer pool is a conversation; every playable race has origins, with
-- class-specific ones; and each class's own trainer offers lessons only to that class.

local CLASSES = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" }
local RACES = { "Human", "Dwarf", "Gnome", "NightElf", "Skyborne", "Orc", "Troll", "Tauren", "Scourge" }

local function boot()
  local ns = Loader.Boot({ packs = { "RPGDialogue_World" } })
  return ns
end

local function pool(ns, id)
  for _, p in pairs(ns.Data.pools) do if p.id == id then return p end end
end

local function count(t) local n = 0 for _ in pairs(t or {}) do n = n + 1 end return n end

describe("Class trainers", function()
  local ns = boot()
  for _, class in ipairs(CLASSES) do
    it("the " .. class:lower() .. " trainer pool is a conversation with its own stance", function()
      local p = pool(ns, "trainer_" .. class:lower())
      ok(p, "pool exists")
      ok(p.nodes and p.start and p.nodes[p.start], "has a hub")
      ok(count(p.nodes) >= 4, "at least four nodes, has " .. count(p.nodes))
      local stance = false
      for _, node in pairs(p.nodes) do
        for _, c in ipairs(node.choices or {}) do
          if c.fx and c.fx.align then stance = true end
        end
      end
      ok(stance, "a node where the player takes a stance")
      local teach = false
      for _, c in ipairs(p.nodes[p.start].choices or {}) do
        if c.next == "BUSINESS" and c.when and c.when.class == class then teach = true end
      end
      ok(teach, "lessons offered to the trainer's own class")
    end)
  end
end)

describe("Origins", function()
  local ns = boot()
  for _, race in ipairs(RACES) do
    it(race .. " has origins, and class-specific ones", function()
      local all, classed = 0, 0
      for _, def in pairs(ns.Data.origins) do
        if def.race == race then
          for _, o in ipairs(def.origins or {}) do
            if o.id ~= "other" then all = all + 1 end
            if o.class then classed = classed + 1 end
          end
        end
      end
      ok(all >= 5, race .. ": at least five origins, has " .. all)
      ok(classed >= 2, race .. ": at least two class origins, has " .. classed)
    end)
  end
end)
