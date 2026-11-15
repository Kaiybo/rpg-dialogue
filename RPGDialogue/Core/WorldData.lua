-- Static world facts the context builder needs. Zone names are English (enUS only for now).
-- Level ranges are original WoW's. Forever's new zones are listed where the brief gives
-- a range; everything else about them is unknown and left out on purpose.
local _, ns = ...

local W = {}
ns.World = W

W.LEVEL_BANDS = {
  { name = "Greenhorn", min = 1, max = 9 },
  { name = "Blooded", min = 10, max = 24 },
  { name = "Seasoned", min = 25, max = 44 },
  { name = "Veteran", min = 45, max = 54 },
  { name = "Champion", min = 55, max = 60 },
}

W.CAPITALS = {
  ["Stormwind City"] = "Alliance", ["Ironforge"] = "Alliance", ["Darnassus"] = "Alliance",
  ["Orgrimmar"] = "Horde", ["Thunder Bluff"] = "Horde", ["Undercity"] = "Horde",
}

-- Zones each race calls home. "Far from homeland" = not in any of these.
W.HOMELANDS = {
  Human = { "Elwynn Forest", "Stormwind City", "Westfall", "Redridge Mountains", "Duskwood" },
  Dwarf = { "Dun Morogh", "Ironforge", "Loch Modan", "Wetlands" },
  Gnome = { "Dun Morogh", "Ironforge", "Loch Modan" },
  NightElf = { "Teldrassil", "Darnassus", "Darkshore", "Ashenvale" },
  Orc = { "Durotar", "Orgrimmar", "The Barrens" },
  Troll = { "Durotar", "Orgrimmar", "The Barrens", "Stranglethorn Vale" },
  Tauren = { "Mulgore", "Thunder Bluff", "The Barrens" },
  Scourge = { "Tirisfal Glades", "Undercity", "Silverpine Forest" },
  Skyborne = { "Zephras Isle" },
}

-- Original level ranges. Used for under/over-leveled flags only.
W.ZONE_LEVELS = {
  ["Elwynn Forest"] = { 1, 10 }, ["Dun Morogh"] = { 1, 10 }, ["Teldrassil"] = { 1, 10 },
  ["Durotar"] = { 1, 10 }, ["Mulgore"] = { 1, 10 }, ["Tirisfal Glades"] = { 1, 10 },
  ["Zephras Isle"] = { 1, 12 },
  ["Westfall"] = { 10, 20 }, ["Loch Modan"] = { 10, 20 }, ["Darkshore"] = { 10, 20 },
  ["Silverpine Forest"] = { 10, 20 }, ["The Barrens"] = { 10, 25 },
  ["Redridge Mountains"] = { 15, 25 }, ["Stonetalon Mountains"] = { 15, 27 },
  ["Ashenvale"] = { 18, 30 }, ["Duskwood"] = { 18, 30 }, ["Wetlands"] = { 20, 30 },
  ["Hillsbrad Foothills"] = { 20, 30 }, ["Thousand Needles"] = { 25, 35 },
  ["Alterac Mountains"] = { 30, 40 }, ["Arathi Highlands"] = { 30, 40 }, ["Desolace"] = { 30, 40 },
  ["Stranglethorn Vale"] = { 30, 45 }, ["Dustwallow Marsh"] = { 35, 45 }, ["Badlands"] = { 35, 45 },
  ["Swamp of Sorrows"] = { 35, 45 }, ["Feralas"] = { 40, 50 }, ["The Hinterlands"] = { 40, 50 },
  ["Tanaris"] = { 40, 50 }, ["Searing Gorge"] = { 43, 50 }, ["Azshara"] = { 45, 55 },
  ["Blasted Lands"] = { 45, 55 }, ["Un'Goro Crater"] = { 48, 55 }, ["Felwood"] = { 48, 55 },
  ["Burning Steppes"] = { 50, 58 }, ["Western Plaguelands"] = { 51, 58 },
  ["Eastern Plaguelands"] = { 53, 60 }, ["Winterspring"] = { 55, 60 }, ["Silithus"] = { 55, 60 },
  ["Deadwind Pass"] = { 55, 60 },
}

-- GetShapeshiftFormID() -> form name used in conditions.
W.FORMS = {
  [1] = "cat", [2] = "tree", [3] = "travel", [4] = "aquatic", [5] = "bear", [8] = "bear",
  [16] = "ghostwolf", [27] = "flight", [28] = "shadow", [29] = "flight", [31] = "moonkin", [35] = "moonkin",
}
-- Also reported as forms, but nobody can see them: warrior stances and rogue stealth
-- (stealth has its own condition and reaction). Treated as no form at all.
W.NOT_SHAPES = { [17] = true, [18] = true, [19] = true, [30] = true }

-- The shape the player visibly wears, or nil.
function W.FormName(id)
  if not id or id == 0 or W.NOT_SHAPES[id] then return nil end
  return W.FORMS[id] or ("form" .. id)
end

-- Reputation: faction names used in `reputation = { faction = "...", min = "..." }` -> faction IDs
-- (from each faction's warcraft.wiki.gg page), and standings (the game's 1-8).
W.FACTION_IDS = {
  Stormwind = 72, Ironforge = 47, Darnassus = 69, Gnomeregan = 54,
  Orgrimmar = 76, ["Thunder Bluff"] = 81, Undercity = 68, ["Darkspear Trolls"] = 530,
  ["Argent Dawn"] = 529, ["Timbermaw Hold"] = 576, ["Cenarion Circle"] = 609, ["Thorium Brotherhood"] = 59,
  ["Steamwheedle Cartel"] = 169, ["Bloodsail Buccaneers"] = 87, ["Hydraxian Waterlords"] = 749,
  ["Brood of Nozdormu"] = 910, ["Zandalar Tribe"] = 270,
}
W.STANDINGS = { hated = 1, hostile = 2, unfriendly = 3, neutral = 4, friendly = 5, honored = 6, revered = 7, exalted = 8 }

W.SPELLS = {
  resurrectionSickness = 15007,
  -- Forever-only spells: IDs unknown until captured with /rpgd auras.
  camping = nil,
  walkOnAir = nil,
}

-- Fallback holiday dates (month, day ranges), used only when the calendar can't tell us.
-- Original WoW's fixed-date holidays. Moving holidays are left to the calendar API.
W.HOLIDAYS = {
  { id = "winterveil", from = { 12, 16 }, to = { 1, 2 } },
  { id = "hallowsend", from = { 10, 18 }, to = { 10, 31 } },
  { id = "midsummer", from = { 6, 21 }, to = { 7, 5 } },
  { id = "loveintheair", from = { 2, 9 }, to = { 2, 23 } },
}

-- Calendar holiday titles -> our ids.
W.HOLIDAY_TITLES = {
  ["Feast of Winter Veil"] = "winterveil", ["Hallow's End"] = "hallowsend",
  ["Midsummer Fire Festival"] = "midsummer", ["Love is in the Air"] = "loveintheair",
  ["Lunar Festival"] = "lunar", ["Noblegarden"] = "noblegarden", ["Children's Week"] = "childrensweek",
  ["Harvest Festival"] = "harvest",
}

-- NPC tooltip subtitle -> role, checked in order (Lua patterns, lower case).
W.SUBTITLE_ROLES = {
  { "innkeeper", "innkeeper" },
  { "flight master", "flightmaster" }, { "gryphon master", "flightmaster" },
  { "hippogryph master", "flightmaster" }, { "wind rider master", "flightmaster" },
  { "bat handler", "flightmaster" },
  { "stable master", "stablemaster" },
  { "banker", "banker" }, { "auctioneer", "auctioneer" },
  { "spirit healer", "spirithealer" },
  { "trainer", "trainer" },
  { "blacksmith", "blacksmith" }, { "armorer", "blacksmith" }, { "weaponsmith", "blacksmith" },
  { "bartender", "innkeeper" }, { "barkeep", "innkeeper" },
  { "supplies", "vendor" }, { "goods", "vendor" }, { "merchant", "vendor" }, { "vendor", "vendor" },
  { "food", "vendor" }, { "drink", "vendor" }, { "reagents", "vendor" }, { "tailor", "vendor" },
}

-- Interaction window type -> role (Enum.PlayerInteractionType names).
W.INTERACTION_ROLES = {
  Merchant = "vendor", Trainer = "trainer", TaxiNode = "flightmaster", Banker = "banker",
  StableMaster = "stablemaster", Auctioneer = "auctioneer", Binder = "innkeeper",
  SpiritHealer = "spirithealer", AreaSpiritHealer = "spirithealer",
}

-- Unnamed NPC name patterns -> role (lower case).
W.NAME_ROLES = {
  { "guard$", "guard" }, { "guardian$", "guard" }, { "^northshire guard", "guard" },
  { "deathguard", "guard" }, { "sentinel$", "guard" }, { "grunt$", "guard" }, { "brave$", "guard" },
  { "protector$", "guard" }, { "defender$", "guard" }, { "watcher$", "guard" },
  { "peon$", "peon" }, { "militia", "militia" }, { "peacekeeper", "guard" }, { "empyrean blade", "guard" }, { "^watcher ", "guard" },
  { "bruiser$", "guard" }, { "mountaineer$", "guard" }, { "^mountaineer ", "guard" }, { "warden$", "guard" }, { "^brave ", "guard" }, { "sentry$", "guard" }, { "^sentry ", "guard" }, { "lookout$", "guard" },
  { "^spirit healer$", "spirithealer" }, { "^spirit guide$", "spirithealer" },
  { "orphan", "child" }, { "child$", "child" }, { "^young ", "child" },
  { "^diseased soldier$", "soldier" }, { "^farholde laborer$", "worker" }, { "^farholde scout$", "guard" },
}

-- Roles that are services: compact mode by default.
W.SERVICE_ROLES = {
  vendor = true, flightmaster = true, trainer = true, banker = true, stablemaster = true,
  auctioneer = true, blacksmith = true,
}

-- Light/Order/Honor axis names for display.
W.AXES = { "light", "order", "honor" }
