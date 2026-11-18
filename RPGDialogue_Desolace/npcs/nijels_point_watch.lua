-- Nijel's Point: Corporal Melkins (Centaur Bounty), Talendria (Vyletongue Corruption), and Baritanas
-- Skyriver (hippogryph master). Alliance. Voice: bibles/nijels_point_watch.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Corporal Melkins: human corporal of the Nijel's Point garrison, collecting centaur ears.
P:NPC {
  key = "melkins", id = TODO_NPC("Corporal Melkins"), name = "Corporal Melkins",
  bible = "bibles/nijels_point_watch.md", role = "soldier", tier = "quest",
  communities = { "nijels_point" }, temper = { "earnest", "tired" }, values = { "dutiful", "loyal" },
  notices = { "race", "class", "soldier" },
  impression = {
    first = "Corporal Melkins keeps the bounty ledger at Nijel's Point and counts centaur ears with the weary care of a man who would rather be counting sheep in Elwynn. He believes in the mission and hates the job.",
    third = "{name} met Corporal Melkins, who pays the Alliance's centaur bounty at Nijel's Point.",
  },

  greetings = {
    { id = "g_default", text = "Corporal Melkins, Nijel's Point garrison. If you're here about the bounty, I've the ledger right here." },
    { id = "g_active", when = { questActive = TODO_QUEST("Centaur Bounty") }, text = "Fifteen ears, {class}, from any clan. I'm not fussy, only thorough." },
    { id = "g_done", when = { questDone = TODO_QUEST("Centaur Bounty") }, text = "Your name's in the ledger with a good number beside it. The Captain reads it every week, you know." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. Three of the lads on the wall rotated home in that time, and I'm still here, of course." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You look harder than when you first came up the pass. Desolace does that to everyone, me included." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another Stormwind face! Where are you from? I'm Elwynn born, near Goldshire, and I haven't seen a green field in two years." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Would you say a word over the lads' graves behind the barracks before you go? Brother Anton offers, but he says the wrong sort of words." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Kreldig will want to know you're here, and he'll talk your ear off about salvage, so consider yourself warned." },
    { id = "n_kills", cat = "soldier", when = { killed = { name = "Kolkar", min = 30 } },
      text = "The patrols say the Kolkar camps are thinner, and your name keeps coming up. That's the kind of report I like writing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corporal Melkins, of the Stormwind Army's garrison here at Nijel's Point. I keep the watch rota, the stores ledger and the bounty book, which makes me the most important man in the outpost, according to me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Centaur Bounty") },
          text = "Many clans make up the centaur race, each with its own leader and its own plans, but they all share one thing, and that's cruelty. If we're ever to have peace out here, they must be driven off, so hunt them as you cross Desolace and bring me their ears, as many as you can carry." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Centaur Bounty") },
          text = "Fifteen ears, from any clan, and I'll mark them down in the book. Do it in the Alliance's service, and every ear brings this war one step closer to its end." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Centaur Bounty"), days = 3 } },
          text = "Fifteen, all counted, all in the book, and the Captain will be pleased. I'll be honest, I wash my hands three times after every count, but the numbers look good." },
        { id = "h_priest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light at Nijel's Point, and not a Scarlet one, I hope. We've had enough preaching from Brother Anton, and too little praying from anyone else." },
      },
      again = {
        { id = "h_again", text = "Anything else? The ledger can wait a minute." },
        { id = "h_again2", text = "Go on. I've a watch to post, but not for an hour." },
      },
      choices = {
        { text = "Why ears?", next = "ears" },
        { text = "How bad are the centaur here?", next = "centaur" },
        { text = "What's it like serving at Nijel's Point?", next = "post" },
        { text = "What do you think of Captain Pentigast?", next = "captain" },
        { text = "You miss Elwynn?", next = "home" },
        { text = "What needs doing?", next = "BUSINESS" },
        { text = "Carry on, Corporal.", next = "END" },
      },
    },

    ears = {
      lines = {
        { id = "ea_default", text = "Because the Captain wants proof before he'll pay, and because a centaur's ear can't be mistaken for anything else. I tried accepting tails once, and a dwarf brought me a bag of kodo tails, and I paid for every one." },
      },
      choices = {
        { text = "Doesn't the work bother you?", next = "ears_bother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ears_bother = {
      big = true,
      lines = {
        { id = "eb_default", text = "Every day, if I'm honest, but the centaur took two of our patrols last winter and left them in the pass for us to find. I tell myself it's a ledger, not a trophy shelf, and some days I even believe it." },
      },
      choices = {
        { text = "They earned it. Count every ear proudly.", next = "BACK", reply = "Proudly might be a stretch, but I'll count them, and I'll remember why the count started.", fx = { align = { light = -1 } } },
        { text = "It should bother you. That keeps you decent.", next = "BACK", reply = "That's what my mother would say, and she's probably right, so I'll keep letting it bother me a little.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    centaur = {
      lines = {
        { id = "ce_default", text = "The Kolkar raid the roads to the north, the Magram and Gelkis fight each other in the south, and every clan hates us because we're here. The Captain thinks we can play them against each other, and I think he's cleverer than I am, so I count the ears and hope." },
      },
      choices = {
        { text = "Can the clans really be played?", next = "centaur_play" },
        { text = "Something else.", next = "BACK" },
      },
    },
    centaur_play = {
      big = true,
      lines = {
        { id = "cp_default", text = "The Captain's sure of it, and he's been right before. I'd rather we just held the Point and let them be, but that's a corporal's opinion, and it's worth exactly a corporal's pay." },
      },
      choices = {
        { text = "Holding the Point is enough. Leave the clans alone.", next = "BACK", reply = "That's my thinking too, but it'll stay between you and me and the corporal's pay.", fx = { align = { order = -1 } } },
        { text = "The Captain's plan is sound. Follow it.", next = "BACK", reply = "It is, I suppose, and I'll follow it, because that's what corporals do, even when they've got doubts.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "Cold at night, hot at noon, and the water tastes of iron. We've a handful of soldiers, a dwarf salvage outfit, a keeper from the Cenarion Circle and a Scarlet priest, and none of them agree on anything except that the food is bad." },
      },
      choices = {
        { text = "What do you make of Brother Anton?", next = "post_anton" },
        { text = "Who lies behind the barracks?", next = "graves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_anton = {
      lines = {
        { id = "pa_default", text = "He's kind enough to me, and he prays harder than anyone I've met, but he keeps asking the lads which of them have doubts. I don't like a man who counts doubts the way I count ears." },
      },
      choices = {
        { text = "I'll keep an eye on him.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    graves = {
      lines = {
        { id = "gr_default", text = "Eleven of ours, mostly from the two patrols the centaur caught in the pass last winter. I carved the markers myself, because nobody else could spell all the names, and I go out there on the first of each month to clear the dust off them." },
        { id = "gr_priest", when = { class = "PRIEST" }, text = "Eleven of ours, and nobody's said a proper prayer over them since the chaplain went home. I carved the markers myself; if you'd say the words, {class}, I'd stand with you while you did." },
      },
      choices = {
        { text = "Why does it fall to you?", next = "graves_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graves_why = {
      big = true,
      lines = {
        { id = "gw_default", text = "Because I keep the ledger, and their names were in it, and it felt wrong to just strike them out. The Captain says a soldier shouldn't dwell on the dead, and he's probably right, but somebody ought to." },
      },
      choices = {
        { text = "The dead deserve remembering. Keep going.", next = "BACK", reply = "Thank you, I'll keep at it, and maybe one day somebody will do the same for me.", fx = { align = { order = -1 } } },
        { text = "The Captain's right. Duty is for the living.", next = "BACK", reply = "He probably is, and I'll keep the ledger for the living, but I'll keep a page at the back for the dead.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captain = {
      lines = {
        { id = "ca_default", text = "He's the best officer I've served under, and the hardest, and he never asks anyone to do what he wouldn't. He writes to Stormwind every week for more men, and every week they send him a letter saying no." },
      },
      choices = {
        { text = "Why won't Stormwind send more?", next = "captain_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captain_why = {
      lines = {
        { id = "cw_default", text = "Because Stormwind has its own troubles, with the Defias in Westfall and the orcs in Redridge and the king gone, and Desolace is a long way from anyone's window. We're a line in a ledger too, I suppose, and not a large one." },
      },
      choices = {
        { text = "Then we'll hold it ourselves.", next = "BACK", fx = { affinity = 1, standing = { nijels_point = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    home = {
      lines = {
        { id = "ho_default", text = "Every day. My mother keeps sheep near Goldshire, and she writes to tell me which ones have died, as if I'd remember them. I do, mind you, every one." },
        { id = "ho_human", when = { race = "Human" }, text = "Every day, and you'll understand that better than the elves do. My mother keeps sheep near Goldshire, and her letters are all about which ones have died, and I read every one twice." },
      },
      choices = {
        { text = "You'll see Elwynn again.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Farewell, Corporal.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Elwynn farm boy, Stormwind recruit, Desolace corporal. Two promotions and both of them farther from home." } },
    advice = { { id = "tp_ad", text = "Keep to the road through the pass, and if you hear hooves, get off it." } },
    _none = { { id = "tp_none", text = "Not in my ledger, I'm afraid. Try the Captain, or Kreldig, who knows everything that can be sold." } },
  },
}

-- Talendria: night elf at Nijel's Point who sends adventurers into Maraudon to heal Vyletongue's vines.
P:NPC {
  key = "talendria", id = TODO_NPC("Talendria"), name = "Talendria",
  bible = "bibles/nijels_point_watch.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "intense", "sorrowful" }, values = { "nature", "devout" },
  notices = { "race", "class" },
  impression = {
    first = "Talendria speaks about the satyr Vyletongue with a cold, private anger, as if his corruption of Maraudon were an insult to her family. She wants the caverns healed, not just cleared, and she is very particular about the difference.",
    third = "{name} met Talendria, the night elf at Nijel's Point who wants Maraudon's poisoned vines healed.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. You've the look of someone who might go where I cannot." },
    { id = "g_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") }, text = "The orange pool, then the vines. Be ready for what Vyletongue sends out of them." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vyletongue Corruption") }, text = "Eight vines healed. Small, against all he has poisoned, but every healing is a word against him." },
    { id = "g_cleared", when = { cleared = "Maraudon" }, text = "You walked to the bottom of Maraudon and returned. I can feel it on you, like the air after a storm." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of our people. Then you'll understand what a satyr is, and what he once was, and why it shames us that he lives." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The vines in Maraudon will speak to you if you let them, though you won't like what they say." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the stink of the Legion, warlock, the same stink that made the satyrs. Do not bring it near the vines." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Talendria. A satyr called Vyletongue has corrupted the caverns of Maraudon and stunted the growth of every plant inside, and I mean to see them healed, even if I must do it by another's hand." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Vyletongue Corruption") },
          text = "Take this vial. Fill it at the corrupted orange pool inside the caverns, and the coating within will counter the toxins and turn it into a healing draught; then find the Vylestem vines and pour it on them, but know that Vyletongue still controls them, and he may turn them against you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vyletongue Corruption") },
          text = "The vines will purge the corruption when you pour the draught on them, and it will come out as a living thing, a scion of rot. Destroy it, and the plant is free; eight of them, and I will know the caverns can still be saved." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vyletongue Corruption"), days = 3 } },
          text = "Eight healed, and the scions destroyed. Elune be thanked, and you as well, {name}; Maraudon is not lost yet." },
        { id = "h_young", when = { maxLevel = 38 },
          text = "You are not ready for Maraudon. Its corruption would eat you before you found the pool, so grow stronger, and then come back to me." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak plainly; I have no patience for riddles today." },
        { id = "h_again2", text = "Ask. I would rather talk than wait." },
      },
      choices = {
        { text = "What is a satyr?", next = "satyr" },
        { text = "Why do you care so much about Maraudon?", next = "why" },
        { text = "How does the vial heal the vines?", next = "vial" },
        { text = "Do you work with Keeper Marandis?", next = "marandis" },
        { text = "Why can't you go yourself?", next = "self" },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Elune keep you, Talendria.", next = "END" },
      },
    },

    satyr = {
      lines = {
        { id = "sa_default", text = "Once they were kaldorei, Highborne who bargained with the Legion for power in the old days and were twisted into horned, cloven things. They have hated everything green and living ever since, perhaps because it reminds them of what they were." },
      },
      choices = {
        { text = "Could a satyr be saved?", next = "satyr_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satyr_saved = {
      big = true,
      lines = {
        { id = "ss_default", text = "Some of the priestesses say Elune's mercy reaches even them, and I have never seen it reach one. Vyletongue has had ten thousand years to repent, and he has spent them poisoning caves." },
      },
      choices = {
        { text = "Then show him no mercy. Destroy him.", next = "BACK", reply = "That is my wish too, and I would see it done, though the priestesses would frown at me for saying so.", fx = { align = { light = -1 } } },
        { text = "Elune's mercy shouldn't have limits.", next = "BACK", reply = "Perhaps it shouldn't, and perhaps I am too young to understand, but I have seen what he did to the caves.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because Maraudon holds the body of Zaetar, son of Cenarius, and his spirit wanders there still. A satyr's poison in his resting place is an insult to everything my people hold holy." },
      },
      choices = {
        { text = "Zaetar? Who was he?", next = "why_zaetar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_zaetar = {
      lines = {
        { id = "wz_default", text = "A son of the forest lord, who loved Theradras, a princess of the earth, and their children were the first centaur. Those children killed him, and his lover hid his body in the caves, and the centaur have been savage ever since." },
      },
      choices = {
        { text = "The centaur killed their own father?", next = "why_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_father = {
      big = true,
      lines = {
        { id = "wf_default", text = "They did, and the keepers have never forgiven it, though Marandis says the children were born mad and were not to blame. I think a mad child is still a child, and a murderer is still a murderer, and I cannot decide which matters more." },
      },
      choices = {
        { text = "They were born wrong. They're not to blame.", next = "BACK", reply = "Marandis would agree with you, and perhaps you are both kinder than I am, but I have seen the bodies.", fx = { align = { honor = 1 } } },
        { text = "Murder is murder. Their blood answers for it.", next = "BACK", reply = "That is my view, though it grieves me to hold it, because they are the children of a keeper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    vial = {
      lines = {
        { id = "vi_default", text = "The coating inside the vial was made by the Circle's druids from moonwell water and crushed leaves of a plant that grows only in Moonglade. It turns the poison back upon itself, so what was killing the vines becomes what heals them." },
      },
      choices = {
        { text = "And the scions that come out?", next = "vial_scion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vial_scion = {
      lines = {
        { id = "vs_default", text = "The corruption made flesh, pushed out of the plant like a splinter from a wound, and still Vyletongue's to command. It will fight you, because it has nowhere else to go, and you must not let it crawl back into the roots." },
      },
      choices = {
        { text = "I'll make sure it doesn't.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    marandis = {
      lines = {
        { id = "ma_default", text = "The Keeper has his own purpose in Maraudon, which is greater than mine, and he doesn't explain it to me. I heal what I can reach, and he hunts what lies deeper, and we nod to each other at the moonwell." },
      },
      choices = {
        { text = "What does he hunt down there?", next = "marandis_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },

    marandis_hunt = {
      lines = {
        { id = "mh_default", text = "Theradras herself, and Zaetar's body, which the Circle wants returned to the forest. The Keeper says it plainly, as if killing a princess of the earth were an errand, and I've never known whether to admire that or fear it." },
      },
      choices = {
        { text = "I'd fear it, a little.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    self_dream = {
      lines = {
        { id = "sd_default", text = "Purple light, and something laughing behind it, and vines that tighten when I try to step back. I wake with my hands clenched, and I go to the moonwell and wash them, and it helps a little." },
      },
      choices = {
        { text = "I'll carry the vial for both of us.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    self = {
      lines = {
        { id = "se_default", text = "I went in, once, when I first came to Desolace, and I came out sick for a month, and I still dream of the purple caves. The priestesses say I was lucky, and I don't feel lucky, but I don't feel brave enough to go back, either." },
      },
      choices = {
        { text = "There's no shame in that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What do you dream of?", next = "self_dream" },
        { text = "Farewell, Talendria.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came to Desolace with the keeper's people. I stayed because Maraudon would not let me forget it." } },
    advice = { { id = "tp_ad", text = "In Maraudon, trust the glow of the crystals to guide you, but never touch them." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle sends its keepers where the land is sick. Desolace is very sick." } },
    _none = { { id = "tp_none", text = "I don't know that, and I don't care to guess." } },
  },
}

-- Baritanas Skyriver: night elf hippogryph master at Nijel's Point.
P:NPC {
  key = "baritanas", id = TODO_NPC("Baritanas Skyriver"), name = "Baritanas Skyriver", title = "Hippogryph Master",
  bible = "bibles/nijels_point_watch.md", role = "flightmaster", tier = "service",
  communities = { "nijels_point" }, temper = { "cheerful", "proud" }, values = { "duty", "nature" },
  notices = { "race", "weary", "class" },
  impression = {
    first = "Baritanas Skyriver keeps the hippogryphs at Nijel's Point and is the only person in the outpost who seems to like Desolace, because he only ever sees it from above. He is proud of his birds and slightly vain about his name.",
    third = "{name} met Baritanas Skyriver, the cheerful hippogryph master at Nijel's Point.",
  },

  greetings = {
    { id = "g_default", text = "Off you go, or in you come? Either way, the hippogryphs are ready." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the Point! The birds remember you, and they've decided you're acceptable." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah! The hippogryphs always sit a little straighter for one of our own, or perhaps I imagine it." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. You're light enough that the birds hardly notice you, which they prefer, though they do keep trying to groom your hair." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky folk! I've heard you can ride the winds yourselves, and I must admit I'm a little jealous." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You're battered. Rest at Lyshaerya's before you fly; the winds over the mountains are no place to faint." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baritanas Skyriver, keeper of the hippogryphs at Nijel's Point. From here my birds fly north to Stonetalon Peak and south to Feathermoon in Feralas, and from above, even Desolace looks almost beautiful." },
      },
      again = {
        { id = "h_again", text = "What else? The birds are preening, so I've a moment." },
        { id = "h_again2", text = "Ask away. A hippogryph master has more time than you'd think." },
      },
      choices = {
        { text = "Desolace looks beautiful from above?", next = "above" },
        { text = "Skyriver. Is that a real name?", next = "name" },
        { text = "Is it dangerous to fly here?", next = "danger" },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Farewell, Baritanas.", next = "END" },
      },
    },

    above = {
      lines = {
        { id = "ab_default", text = "Almost! The grey hills have a hundred colours in them at dawn, and the kodo graveyard shines like a lake of pearl, and you can't see the centaur from that high. Everyone on the ground thinks I'm mad, and they're not looking up." },
      },
      choices = {
        { text = "I'll look next time I fly.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "na_default", text = "As real as yours, I hope! My mother named me for the river of stars the hippogryphs fly along on Elune's nights, or so she says, though my father says she simply liked the sound of it." },
      },
      choices = {
        { text = "It suits you either way.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What do the others here think of you?", next = "name_others" },
        { text = "Something else.", next = "BACK" },
      },
    },

    name_others = {
      lines = {
        { id = "no_default", text = "The Captain thinks I'm too cheerful for a frontier post, and Kreldig thinks my birds should carry salvage, and Brother Anton thinks I'm a heathen. Lyshaerya likes me, though, and she's the one who feeds me, so I count myself well off." },
      },
      choices = {
        { text = "Sounds like you've chosen your friends well.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    danger = {
      lines = {
        { id = "da_default", text = "The harpies in Stonetalon come up at the birds sometimes, and the winds off the mountains can throw a young one into a spin. I only send the steady ones out with riders, and I lose sleep over every one of them." },
      },
      choices = {
        { text = "What do you do about the harpies?", next = "danger_harpy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_harpy = {
      big = true,
      lines = {
        { id = "dh_default", text = "Fly higher, and wider, and longer, and the birds hate it. The Sentinels say I should send the birds out with archers to clear the cliffs, and I say a hippogryph is a messenger, not a soldier." },
      },
      choices = {
        { text = "Send the archers. Clear the skies.", next = "BACK", reply = "Archers would clear them, perhaps, but my birds would never trust the sky again, and I'd rather they did.", fx = { align = { order = 1 } } },
        { text = "Keep the birds out of the fighting.", next = "BACK", reply = "Thank you, friend, that's exactly what I say, and the birds would agree if they could talk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I flew messages along the Darkshore coast before the Point needed a keeper. Desolace was a promotion, they told me." } },
    advice = { { id = "tp_ad", text = "Hold on with your knees, not your hands. The bird will thank you." } },
    _none = { { id = "tp_none", text = "I couldn't say! Ask me about birds." } },
  },
}
