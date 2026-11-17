-- Sam Sarsaparilla: the adventurer camped on the road by Goldshire (Forever's camping). Voice: bibles/camping.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sam", id = TODO_NPC("Sam Sarsaparilla"), name = "Sam Sarsaparilla",
  bible = "bibles/camping.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cheerful" }, values = { "friendly", "curious" },
  notices = { "craft" },
  impression = {
    first = "Sam Sarsaparilla calls himself an adventurer, though his adventuring seems to be mostly walking a long way and then sitting by a fire. I've heard worse philosophies.",
    third = "{name} shared a fire with Sam Sarsaparilla, a cheerful wanderer who swears the sitting is the best part of any journey.",
  },

  greetings = {
    { id = "g_fire", text = "Well, hello there! Pull up a log; the fire's going and the kettle's nearly there." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favorite passer-by! The fire's still warm, so sit." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? Then you're halfway to a camp already, because everything starts with a fire." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! You'll want to learn to pitch a tent. Rest by a fire with a tent beside it and you'll feel like a new person." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Mostly it is, and I've no shame in it. The wind and I have walked a long way together, so perhaps your spirits and I are old friends already." } },
      choices = {
        { text = "A good rest earns a good road tomorrow, Sam.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Real adventurers don't sit by fires all day, Sam.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would, as long as you didn't summon anything into my stew. A fellow at the Lion's Pride says warlocks are all wicked, but you've only been polite to me, and I judge a person by how they share a fire." } },
      choices = {
        { text = "Then I'll share it gladly, and keep the imp out of the stew.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your friend has a point, Sam. Be more careful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sam.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, by Stone Cairn Lake, and I woke with a wolf sniffing my boots, so I've kept a fire ever since. I expect your people never needed one, but a man needs his comforts, and the wolf did leave eventually, with one of my socks." } },
      choices = {
        { text = "A good camp has rules: a fire, a watch and a cleared ring.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules are for towns. Out here I sleep wherever I stop.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not a bit of it. They come up the road dented and bleeding and say they'll rest after the next wolf, and then there's always a next wolf. Sit by a fire properly once and you'll fight twice as well tomorrow." } },
      choices = {
        { text = "You're right. I'll sit, and I'll fight better for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rest is for when the work's done, and it never is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've nothing worth stealing but a kettle and a bedroll, and the Defias have better targets on the Westbrook road than me. Besides, anyone who'll sit by my fire and listen to my stories has paid for whatever they take." } },
      choices = {
        { text = "Your kettle's safe with me, Sam. I'd never rob a host.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sleeping camper's an easy mark. You should be more careful.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a fire you've worked for is half the point of camping, though I won't deny I've wished for a spell when the wood's wet. Light it once with magic and I'd never learn to do it properly, so I suppose I'd better say no." } },
      choices = {
        { text = "You're right. The proper way is worth learning first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic does it faster. Take the easy road, Sam.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly, though the Marshal says there are strangers on the road in red bandanas, and I've started sleeping with my kettle where I can reach it. I'm not much of a fighter, I'll admit, but nobody's ever robbed a man who offered them tea first." } },
      choices = {
        { text = "Then I'll keep watch tonight, so you can rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who can't defend himself shouldn't sleep on the road.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sam.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin by my fire! That's the safest I've felt all week, so sit down and take your boots off, if plate has boots." },
        { id = "h_default", key = true,
          text = "Sam Sarsaparilla, adventurer, or trying to be. Mostly I walk a long way and then sit by a fire, which is the best part." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "The Marshal sent you to check on me? Ha! Can't blame him, with strangers on the road and all, so sit down and I'll show you how harmless I am." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire a while. No, longer than that. You'll feel it when you've properly rested." },
        { id = "h_far", when = { minLevel = 25 },
          text = "Look at the boots on you. Those have been somewhere. Sit down and tell me where; I've only got as far as this log." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came up on my fire so quiet I nearly put the kettle over your boots. Sit down anyway; a body that sneaks still needs tea." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Could you light my fire for me some evening? I've been at it with flint for an hour some nights, and it's undignified." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit down before you fall down; whoever you fought today, they'll still be there tomorrow, and the fire's warm now." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, sleeping rough like me by the look of you! Pull up a log, because a fire's always better with somebody who's walked further than I have." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Do you ever take your demon camping? I've always wondered whether imps like a fire or just like setting things on one." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, walking the roads like me. Sit by the fire. Do your spirits like a good long rest as much as I do?" },
      },
      again = {
        { id = "h_again", text = "What else? There's tea, if you're staying a while." },
        { id = "h_again2", text = "Go on, the kettle won't boil any faster for you leaving." },
      },
      choices = {
        { text = "Odd to camp with an inn right there.", next = "why" },
        { text = "How does a camp work?", next = "camp" },
        { text = "You look like you're headed somewhere far.", next = "road" },
        { text = "The Marshal sent me to check on you.", next = "marshal", when = { questActive = TODO_QUEST("The Adventurer") } },
        { text = "Let me bless the fire.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've slept rough from here to the jungle.", next = "far", when = { minLevel = 25 } },
        { text = "A hunter sleeps rough with a beast for a pillow.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Anyone could sneak up on you out here.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why not just carry a spark-stone like everyone else?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think warriors rest enough, Sam?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is it safe, camping out here alone, Sam?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever sleep under the trees without a fire?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I doubt you'd share your campfire with a warlock, Sam.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Adventuring seems to be mostly walking and sitting, Sam.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Enjoy the fire.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "Inns are lovely, but they're for stopping. A camp's for going on. And anyone walking past can share your fire, which is how you meet people worth knowing." } },
      choices = {
        { text = "Who shares your fire?", next = "why_share" },
        { text = "Teach me.", next = "camp", fx = { affinity = 2, learn = { "camping" } } },
      },
    },
    why_share = {
      lines = {
        { id = "ws_default", text = "Anyone! A dwarf with a fishing rod last night. A gnome who asked whether the fire was running properly. Each of them left the camp a little better." },
      },
      choices = {
        { text = "That sounds nice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or they ate your food.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Start with a campfire. Any cook can learn to build one. Then every trade adds something around it, and everyone who sits down gets the good of it." },
      },
      choices = {
        { text = "What can my trade add?", next = "camp_trade" },
        { text = "And then?", next = "camp_rest" },
      },
    },
    camp_trade = {
      lines = {
        { id = "ct_default", text = "Ask the trainers in Goldshire. Michelle Belle at the inn knows kits, Lee Brown knows fish, and Helene and Adele out by the lake know hides." },
        { id = "ct_lw", when = { profession = "Leatherworking" },
          text = "A tent, you lucky thing. Adele Fielder by the lake will show you. Rest beside a tent and you wake up feeling twice as clever." },
        { id = "ct_fish", when = { profession = "Fishing" },
          text = "A fish bowl, and don't laugh, because a happy camp's a strong camp. Lee Brown on the lake pier will teach you." },
        { id = "ct_aid", when = { profession = "First Aid" },
          text = "A first aid kit. Michelle Belle upstairs at the inn will show you. Somebody always needs one by the second night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
    camp_rest = {
      lines = {
        { id = "cr_default", text = "Then you sit, properly sit. A few minutes by the fire and you'll feel it settle in you: rested, sharper and ready for the road." },
      },
      choices = {
        { text = "Why not in town?", next = "camp_town" },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    camp_town = {
      lines = {
        { id = "cw_default", text = "Folk in town don't care for campfires in the square, and I can't say I blame them after the haystack business. Out here nobody minds but the wolves, and the wolves don't vote." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    road = {
      lines = {
        { id = "r_default", text = "Wherever the road goes, Westfall next maybe, or Redridge. I hear the lake there's lovely, if you don't mind gnolls." },
      },
      choices = {
        { text = "That's a long road to walk alone.", next = "road_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_alone = {
      lines = {
        { id = "ra_default", text = "Never alone at a campfire; that's the whole trick of it. You light it, and people come." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    marshal = {
      lines = {
        { id = "m_default", text = "And here I am, checking back! Tell McBride I'm harmless, and he's welcome at the fire any evening he likes." },
      },
      choices = { { text = "I'll tell him.", next = "BUSINESS", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Bless away! A fire that's been prayed over feels warmer. That might be in my head. I don't mind if it is." },
      },
      choices = {
        { text = "Light keep this fire, and all who sit by it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Fire keeps us warm, and prayers have nothing to do with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = {
        { id = "f_default", text = "Then you should be teaching me! Sit down and tell me the strangest thing you ever cooked over a fire, and I'll tell you mine after." },
      },
      choices = {
        { text = "Raptor, once. Don't.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I don't talk about it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_l", text = "Now that's the life! Warm on one side, and nobody sneaks up on you in the night, unless they're bigger than the beast. Does it snore, though? Everyone asks me about snoring." },
        { id = "hunter_pet", when = { pet = { type = "Beast" } },
          text = "And there's the pillow, right there! Does {pet} snore? Everyone asks me about snoring, and I've never had an answer for a beast." },
      },
      choices = {
        { text = "Like a dwarf after a feast.", next = "hunter2", fx = { trait = { witty = 1 } } },
        { text = "Never. It's always listening.", next = "hunter2", fx = { trait = { cautious = 1 } } },
      },
    },
    hunter2 = {
      lines = { { id = "hunter2_l", text = "I'll put that in my next letter to the Marshal; he thinks camping's a hobby for fools. Pull up a log, if you like, and bring the pillow." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Not much of a story yet! That's why I'm out here. Ask me again in a year." } },
    advice = { { id = "tp_ad", text = "Sit down more. Everybody who's in a hurry ends up at the spirit healer." } },
    camping = {
      { id = "tp_camping", text = "A campfire first; any cook can learn it. Then a tent if you work leather, a fish bowl if you fish. The more trades at a fire, the better the rest." },
      { id = "tp_camping2", text = "Sit down and I'll walk you through it.", next = "camp" },
    },
    _none = { { id = "tp_none", text = "No idea! I've only just got here, so ask in Goldshire." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire camps up by Goldshire some months, and I learned more about sleeping outdoors from their wagon folk than from any book. They pitch a whole town in one afternoon and pack it up before breakfast!" } },
    booty_bay = { { id = "tp_booty_bay", text = "One day I want to walk all the way to Booty Bay and camp every night of the road. Everyone says the jungle will eat me, which only makes me want to go more." } },
    everlook = { { id = "tp_everlook", text = "I've heard the goblins in Everlook sell you a seat by the fire by the hour. I'd like to see somebody try that at my campfire, because I'd invite them to sit down for free." } },
  },
}
