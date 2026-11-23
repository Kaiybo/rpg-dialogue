-- Redridge folk a roster scan found missing: Amy Davenport (trade goods), Bridge Worker Daniel,
-- Clyde Ranthal (leatherworking supplies), Franklin Hamar and Gloria Femmel in the Lakeshire Inn,
-- and two more of the watch, Guard Ashlock on the bridge and Guard Hiett in the town.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bridge Worker Daniel: one of Oslow's crew on the Lakeshire bridge; careful, sparing with words.
P:NPC {
  key = "bridge_daniel", id = TODO_NPC("Bridge Worker Daniel"), name = "Bridge Worker Daniel", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "careful", "quiet" }, values = { "craft", "dutiful" },
  notices = { "craft" },
  impression = {
    first = "Bridge Worker Daniel sets stone on the Lakeshire bridge with a plumb line never far from his hand. He answered what I asked and nothing more, and went back to checking a course he had already checked.",
    third = "{name} met Bridge Worker Daniel, one of Foreman Oslow's crew on the Lakeshire bridge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the fresh course there, if you would. It wants another day before anyone leans on it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The same stone's still drying, so the same warning stands." },
  },
  notice = {
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf on the bridge! I'd be glad of your eye on this arch, if you've a moment, since your folk were cutting stone before mine had learned to stack it." },
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "You know stone, or iron at any rate. You'll see why I keep looking at that pier, then." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Daniel, and I lay stone for Foreman Oslow. Dmitri does the talking for the crew, so if it's news you're after you'd do better with him, but I'll answer what I can." } },
      again = {
        { id = "h_again", text = "Was there something else? I can talk while this sets." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "How's the bridge coming along?", next = "bridge" },
        { text = "You check everything twice, I notice.", next = "twice" },
        { text = "What's the crew like to work with?", next = "crew" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "Slower than the Foreman wants and faster than it ought to go. We lost tools in the lake and iron to the gnolls, and the rains are coming, so every day he asks for a week's work out of us.", fx = { learn = { "everstill_bridge" } } } },
      choices = {
        { text = "Will it hold when it's done?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "My part will, because I won't sign to a course I haven't trued. The orcs burned the last bridge from on top, and no mason can build against that, but nothing will bring this one down from underneath." } },
      choices = { { text = "That's a mason's promise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    twice = {
      lines = { { id = "t_default", text = "A crooked stone at the bottom is a crooked bridge at the top, and by then it's too late to say so. Matthew mixes a good mortar and Trent can lift anything, but somebody has to hold the line, and I find I can't leave it to chance." } },
      choices = { { text = "The town's lucky you can't. Something else.", next = "BACK" } },
    },
    crew = {
      lines = { { id = "c_default", text = "They're good men, every one. Jess talks enough for the lot of us and Trent grumbles enough for two, so Alex and I are left free to get on, which suits us both." } },
      choices = {
        { text = "And Foreman Oslow?", next = "oslow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oslow = {
      lines = { { id = "o_default", text = "He shouts, but he's never asked a man to do what he wouldn't do himself, and he was first into the water after those tools. I've worked under quieter foremen and trusted them a good deal less." } },
      choices = { { text = "High praise from you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a mason on the bridge crew. I lay the stone and see that it's straight, and there isn't much more to tell." } },
    everstill_bridge = { { id = "tp_eb", text = "The orcs burned it, and we're building it back in stone. It'll be done when it's right, and not before, if I've any say." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm afraid. Dmitri hears more than I do." } },
  },
}

-- Guard Hiett: Lakeshire watch; kin to Kimberly Hiett the fletcher, and the best shot on the wall.
P:NPC {
  key = "guard_hiett", id = TODO_NPC("Guard Hiett"), name = "Guard Hiett", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "keen", "blunt" }, values = { "dutiful", "skill" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Guard Hiett keeps her post in Lakeshire with a sword at her hip and an archer's habit of measuring distances. She shares a name and a bluntness with the town's fletcher, and has strong views on how many arrows the watch is owed.",
    third = "{name} met Guard Hiett of the Lakeshire watch.",
  },
  greetings = {
    { id = "g_default", text = "Move along or state your business, {class}. I don't mind which, so long as it's one of them." },
    { id = "g_back", when = { metBefore = true }, text = "You're still about, then. Good; the ones who stay are worth more than the ones who pass through." },
  },
  notice = {
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "That's a well-kept bow, and you carry it like you use it. We've a wall that could do with you, if you've an evening." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Another sword's always welcome. Marshal Marris is by the bridge road, if you've come to be useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guard Hiett, Lakeshire watch. I keep this post by day and a place on the wall when the horn goes, and of the two I'd choose the wall." } },
      again = {
        { id = "h_again", text = "Anything else? Make it short." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Hiett? Like the fletcher?", next = "kim" },
        { text = "Why do you prefer the wall?", next = "wall" },
        { text = "How is the watch holding up?", next = "holding" },
        { text = "Where do the gnolls hide from arrows?", next = "shoot", when = { class = "HUNTER" } },
        { text = "As you were, guard.", next = "END" },
      },
    },
    kim = {
      lines = { { id = "k_default", text = "Kimberly's my kin, and she makes the arrows I shoot, which keeps it in the family. She says the watch looses them faster than she can feather them, and I tell her that's rather the purpose of an arrow." } },
      choices = {
        { text = "Does she take that well?", next = "takes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    takes = {
      lines = { { id = "t_default", text = "She throws a fletching jig at me, usually, and then hands me a full quiver. I bring back every shaft I can pull out of a gnoll, and we call that even." } },
      choices = { { text = "A thrifty family. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wall = {
      lines = { { id = "w_default", text = "Because I can do something up there. A sword on a street corner waits for trouble to arrive, but a bow on the wall goes out to meet it at two hundred paces, and I've never been much good at waiting." } },
      choices = { { text = "I know the feeling. Something else.", next = "BACK" } },
    },
    holding = {
      lines = { { id = "ho_default", text = "We're holding, and that's the honest word for it. There are gnolls to the south and west and Blackrock to the north, and Stormwind answers the Magistrate's letters with more letters.", fx = { learn = { "redridge_gnolls" } } } },
      choices = { { text = "Letters won't hold a wall. Something else.", next = "BACK" } },
    },
    shoot = {
      lines = { { id = "s_default", text = "In the gullies, where they think the slope covers them. Get above them before you loose, aim for the ones carrying torches, and the rest lose heart quicker than you'd credit." } },
      choices = { { text = "High ground and torchbearers. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire watch, and a Hiett, so I grew up with a bow in my hand. The sword came with the uniform." } },
    redridge_gnolls = { { id = "tp_gn", text = "They're thick in the hills south and west. I've put arrows in a fair few, and there are always more." } },
    _none = { { id = "tp_none", text = "Not my post, not my business. Try the town hall." } },
  },
}
