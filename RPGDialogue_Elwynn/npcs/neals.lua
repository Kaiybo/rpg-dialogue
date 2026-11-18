-- Brother Neals, Northshire Abbey (the bell tower, where the wine is tasted). Voice: bibles/neals.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "neals", id = TODO_NPC("Brother Neals"), name = "Brother Neals",
  bible = "bibles/neals.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "drink", "faith" },
  impression = {
    first = "Brother Neals keeps the Abbey's cellars and its tally with equal devotion. He admitted cheerfully to failing at moderation, which made me trust him rather more.",
    third = "{name} met Brother Neals, keeper of Northshire Abbey's cellars, who loves a careful tally almost as much as the wine.",
  },

  greetings = {
    { id = "g_light", text = "Light be with you." },
    { id = "g_manifest", when = { questActive = TODO_QUEST("Grape Manifest") }, text = "Ah, the manifest! Hand it here, friend, and carefully, if you please." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "You've been sampling, I see. Moderation, friend, and I say that as someone who has failed at it often." },
    { id = "n_priest_gnome", cat = "faith", when = { race = "Gnome", class = "PRIEST" },
      text = "A gnome who follows the Light! I'd heard there were some now, but I'd not quite believed it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hope so, or I'm in trouble. The Light is gentle with honest failings. I'd guess your spirits are too." } },
      choices = {
        { text = "Honest failings are forgivable, Brother. The Light knows.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light demands better, Brother. Try harder.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now and then, and always to ask whether a frost spell would help the wine keep. It would not, friend, for good wine wants a cellar and patience, not cleverness, though I do appreciate the offer more than I should." } },
      choices = {
        { text = "Patience it is, then. I'll leave the wine be.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little frost never hurt a bottle, Brother.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It did, before the Defias took the vineyard, and now I'm pouring the last of the good years one careful cup at a time. I've noted it in the tally under hardship, though I confess the tally is mostly me." } },
      choices = {
        { text = "Save the last casks for the Brothers who've earned them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Pour freely, Brother. Wine's for drinking, not hoarding.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bread and water, officially, and a modest selection of the vintage for our guests, also officially. The recruits who survive the kobolds sometimes earn a cup, and I see that they get one." } },
      choices = {
        { text = "A cup earned is a cup I'll take gladly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Pour it now, Brother. I'll earn it later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The wolves, twice this spring, when someone left the cellar door open. One ate a whole wheel of cheese and fell asleep on the potatoes, which I've recorded under losses, with a note." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks very interested in my potatoes. I'll ask it, kindly, to look elsewhere." },
      },
      choices = {
        { text = "I'll keep my beast out of your stores, Brother.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A bit of cheese won't be missed, Brother.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Wine, friend, nothing but wine, for our guests and for the occasional brother who needs comforting after evening prayers. I'd be very sorry to find a barrel lighter than my tally says it should be." } },
      choices = {
        { text = "Your barrels are safe, Brother. I'd never rob the Abbey.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A barrel or two won't be missed by the Light.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a barrel of our best red went sour the very night one of her students wandered down here, and the brothers have long memories for wine. I'm sure it was a coincidence, but I'd still rather you drank upstairs." } },
      choices = {
        { text = "I'll respect the brothers' wishes and keep to the surface.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Coincidence or not, your wine was never mine to guard.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "The Abbey's cellars are a quiet comfort, friend, for our guests, naturally." },
        { id = "q_manifest_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Grape Manifest"), days = 2 } },
          text = "Every barrel accounted for. The Light loves a careful tally almost as much as I do." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Do they still make novices copy the old texts by candlelight at the Cathedral, or has Stormwind gone soft?" },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Brother Sammuel's pupil? Mind he doesn't work you too hard. He forgets that some of us enjoy supper." },
        { id = "h_book", tags = { "news" }, once = true, priority = 15, when = { bookRead = "The Seven Kingdoms" },
          text = "You've read The Seven Kingdoms? Then you know Stromgarde won't let go of what it was. Neither will I, of the Abbey." },
        { id = "h_kind", when = { alignment = { axis = "light", min = 40 } },
          text = "There's a kindness about you, friend. It shows, you know; it always shows." },
        { id = "h_asleep", when = { metBefore = true }, text = "I fell asleep in the library again, friend, face-down in a book of prayers. The Light, I'm told, found it very funny." },
        { id = "h_stairs", when = { questActive = TODO_QUEST("Grape Manifest") },
          text = "You climbed all the way up the bell tower with Milly's manifest! Sit, sit, and catch your breath; I'll pour while you do." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "I know that face! You used to bring the tallies up these stairs and pretend you hadn't read them, but you had, and I always knew." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a quiet step, friend, and the Abbey's cellars are full of quiet things, so I'll be watching where you put it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've come from the graveyard, friend, I can smell it, and the brothers don't like La Salle's students in the cellars." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my cellar! Do mind the barrels, friend; each one is accounted for, and you are not." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Please, your animal stays on the stairs; it has been known for creatures to discover the cheese." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf in the Abbey's cellars, and welcome, friend! We've wine, cheese and a fair amount of quiet, though the wolves took one of the cheeses." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage of Northshire! Brother Bremen's students are a thirsty lot, I find, though I couldn't say why." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Come, have a taste. I've failed at moderation again, I confess. The Light forgives, and so should your spirits." },
      },
      again = {
        { id = "h_again", text = "Something else, friend? The bells won't ring for an hour." },
        { id = "h_again2", text = "Go on, I'm in no hurry. I'm rarely in a hurry, up here." },
      },
      choices = {
        { text = "Tell me about the Abbey.", next = "abbey" },
        { text = "You seem fond of your wine, Brother.", next = "wine" },
        { text = "What's in the library worth reading?", next = "library" },
        { text = "How do I keep my faith when it's hard?", next = "faith", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "About the manifest...", next = "BUSINESS", when = { questActive = TODO_QUEST("Grape Manifest") } },
        { text = "You seem to be guarding something in the Abbey's cellars, Brother.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why do the brothers mind warlocks near the wine?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the Abbey's cellars hold that a warrior would want?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Something's been at the Abbey's stores, by the look of it.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Abbey make its wine from its own grapes?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do mages ever visit the Abbey's cellars, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Surely the Light forgives a little indulgence, Brother.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just paying my respects.", next = "END" },
      },
    },
    abbey = {
      lines = {
        { id = "a_default", key = true,
          text = "Archbishop Faol's clerics trained the first paladins here. The walls remember, even if Stormwind forgets.",
          fx = { learn = { "northshire_abbey" } } },
      },
      choices = {
        { text = "These walls look newer than that.", next = "abbey_war" },
        { text = "I'd like to see the library sometime.", next = "BACK", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "Old stones. Nothing more.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    abbey_war = {
      big = true,
      lines = {
        { id = "aw_default", text = "They are. The orcs burned the old Abbey in the First War, and they hunted the clerics first, because a healer sends a soldier back to the line, you see." },
      },
      choices = {
        { text = "And after the war?", next = "abbey_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abbey_after = {
      lines = {
        { id = "aa_default", text = "In the Second War the Twilight's Hammer camped on our ruins. Archbishop Faol rebuilt the Abbey afterwards and founded the Brotherhood you see today, and I thank him for it nightly." },
      },
      choices = {
        { text = "I'll remember him too.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Faol's long gone, so I'll save my thanks for the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wine = {
      lines = {
        { id = "w_default", text = "I keep the stores of food and drink, you see, and keeping them requires inventory. Inventory requires tasting, and tasting requires honesty, and I am very honest." },
      },
      choices = {
        { text = "Where do your grapes come from, Brother?", next = "wine_milly" },
        { text = "That's a lot of honesty, Brother.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Brother Sammuel says the cellar tally is short again.", tag = "Deceive", next = "wine_caught",
          check = { pass = { any = { { disposition = { min = 55 } }, { origin = "human_abbey_novice" }, { class = "PRIEST" } } } },
          fail = { next = "wine_wise", fx = { affinity = -1 } } },
      },
    },
    wine_milly = {
      lines = {
        { id = "wm_default", text = "Milly Osworth grows them across the river. When the brigands overran her vineyard I very nearly despaired, though only nearly." },
        { id = "wm_saved", when = { questDone = TODO_QUEST("Grape Manifest") },
          text = "Saved, thanks to you! A full load of bushels in our stores. There'll be wine this year, and I'll be the first to tell you if it's any good." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    library = {
      lines = {
        { id = "l_default", text = "Prayers, histories and our own records. A Guardian once slept ten years in the clerics' care, here in this valley: Medivh, long before everything that came after." },
      },
      choices = {
        { text = "Medivh? Here?", next = "library_medivh" },
        { text = "A library like this must keep something locked away.", next = "library_locked" },
      },
    },
    library_medivh = {
      lines = {
        { id = "lm_default", text = "He was only a boy then, struck down by more power than he could hold, and it took a hundred clerics to contain it. We kept him safe, but we couldn't keep him from what came after." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    library_locked = {
      lines = {
        { id = "ll_default", text = "There's a protected wing, for dangerous books. One went missing with a novice who ran off to the Defias, so now I lock the cellar as well, and twice over.",
          fx = { learn = { "defias" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    faith = {
      big = true,
      lines = {
        { id = "f_default", text = "Badly, some days. When Milly's vines were overrun I despaired, then I prayed, and then help walked in; faith is mostly staying put long enough to see the answer." },
      },
      choices = {
        { text = "And when no one walks in?", next = "faith_none" },
        { text = "That's a comfort, Brother.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Staying put sounds like an excuse to do nothing.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    faith_none = {
      lines = {
        { id = "fn_default", text = "Then you're the one who walks in, for somebody else. That's what the clerics did in the First War. Unarmed, and they never once hung back." },
      },
      choices = {
        { text = "Then I'll be the one who walks in.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Walking unarmed into a war sounds like foolishness to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wine_caught = {
      lines = {
        { id = "wc_default", text = "Short, is it? Oh dear, oh, dear me, well, there may have been a cask from last autumn's pressing that needed tasting rather more thoroughly than the others, for the sake of the inventory." },
        { id = "wc_after", text = "Several times, if I'm honest, and I am, as I said, very honest. Tell Sammuel I'll make up the difference from my own stipend, and perhaps don't mention the bell tower, where the cups are." },
      },
      choices = {
        { text = "Your secret's safe, Brother.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Actually, Sammuel said nothing.", next = "wine_relief" },
      },
    },
    wine_relief = {
      lines = {
        { id = "wr_default", text = "He said nothing? You wicked thing, you've had a full confession out of an old brother for free. Well, the Light saw it, and the Light has a sense of humour, or I'd have been struck down years ago." },
        { id = "wr_novice", when = { origin = "human_abbey_novice" }, text = "And you a novice of this very Abbey, too. I taught you to read the manifest, and this is the thanks I get, though I'll admit it was neatly done." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wine_wise = {
      lines = {
        { id = "ww_default", text = "Does he now? Brother Sammuel has never once been down to the cellar, friend, because he says the stairs disagree with him. Nice try, though." },
        { id = "ww_default2", text = "The tally is perfect, and I know it's perfect because I wrote it myself this morning. Somebody's been telling you tales." },
      },
      choices = {
        { text = "My mistake, Brother.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Abbey's records pass through my hands, along with a good deal of gossip from the novices. Ask me about any of this, friend." },
    },
    background = { { id = "tp_bg", text = "A brother of Northshire. I keep the stores and climb the bell tower, and only one of those is good for my knees." } },
    advice = { { id = "tp_ad", text = "Keep a careful tally of everything: barrels, prayers and debts. The Light loves a careful tally, and so do creditors." } },
    northshire_abbey = { { id = "t_abbey", text = "Rebuilt by Archbishop Faol after the wars. Its foundations are older than most of the walls in Stormwind, and better kept." } },
    defias = { { id = "t_defias", text = "I pray for them, and then I lock the cellar." } },
    _none = { { id = "t_none", text = "I'd have to look that up, and the library closes at dusk." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood of Northshire is Archbishop Faol's work, raised on the ruins after the Second War, and I keep its records. Most of them are about barrels, which is how you know it's a real holy order and not a story." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Echo Ridge Mine shows up in my ledgers as rope, picks and bandages, a little more of each every week. The kobolds are winning the accounting, friend, if nothing else." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is patient, and so is a good bookkeeper, so I think the Light would make a fine one. Brother Sammuel calls that blasphemy, but he smiled when he said it." } },
    scourge = { { id = "tp_scourge", text = "The Abbey was founded by clerics from Lordaeron, and we still keep their names in our books. I've had to add a great many dates to that page lately." } },
  },
}
