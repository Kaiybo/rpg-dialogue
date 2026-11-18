-- Caretaker Alen, who keeps the corpse pit and a general store at Light's Hope. Voice: bibles/alen.md
-- Underpaid, overworked, half-drunk, and a good deal kinder than he'd ever admit.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "alen", id = TODO_NPC("Caretaker Alen"), name = "Caretaker Alen",
  bible = "bibles/alen.md", role = "vendor", tier = "quest",
  communities = { "light_hope" }, temper = { "gruff" }, values = { "practical", "kind" },
  notices = { "drink", "kit" },
  impression = {
    first = "Caretaker Alen tosses the dead into the pit at Light's Hope and complains about his wages to anyone in earshot. Under the grumbling, he worries about the souls left wandering Stratholme more than he lets on.",
    third = "{name} met Caretaker Alen, who keeps the corpse pit and sells supplies at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_pit", text = "They hand the corpses to me, and I toss them in the pit. Want something, or are you volunteering?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Good, you're not a corpse, because I'm full up today." },
    { id = "g_zaeldarr", when = { questActive = TODO_QUEST("Zaeldarr the Outcast") }, text = "The Undercroft, to the west. Big dead troll, lots of stolen bodies, can't miss him." },
    { id = "g_egan", when = { questActive = TODO_QUEST("The Restless Souls") }, text = "Found Egan yet? He walks around near Stratholme poking at ghosts with his contraptions. Look for the dwarf talking to nobody." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and do you know how many bodies I've shoveled since? No, and neither do I, I stopped counting at the first hundred." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You look tougher than last time. Good; tough ones take longer to end up in my pit." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Heard you got somebody's back up round the chapel. Can't blame you, I do it every day, but I don't get paid enough to watch you do it." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "You've been at the bottle too, eh? Can't say I blame you, considering the view. Just don't fall in the pit, I'm not fishing you out." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of you. Another week like that and you'll be in my pit, and I'll have to toss you in personally." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alen, caretaker, which is a fancy word for the fellow with the shovel. I keep the pit, I sell the bandages, and I don't get paid near enough for either." },
        { id = "h_zaeldarr_before", when = { questBefore = TODO_QUEST("Zaeldarr the Outcast") },
          text = "As if the Plaguelands weren't trouble enough, now I've got grave robbers, and they're dead trolls, of all things, who sneak in at night and cart the bodies off out of my pit. Their chief is a big rotten brute called Zaeldarr, and he hides out in the Undercroft to the west." },
        { id = "h_zaeldarr_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Zaeldarr the Outcast"), days = 3 } },
          text = "Zaeldarr's done for? Ha! Now my corpses stay where I toss them, which is all I've ever asked of a corpse." },
        { id = "h_souls_before", when = { questDone = TODO_QUEST("Zaeldarr the Outcast"), questBefore = TODO_QUEST("The Restless Souls") },
          text = "There's something else that bothers me, and it's not thieves. Folk in Stratholme threw themselves in the fires rather than be turned, and now they walk the streets as ghosts, and somebody ought to help them." },
        { id = "h_souls_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Restless Souls") },
          text = "Egan says you freed a good few of those poor souls in Stratholme. Don't make a fuss about it, but I had a drink for each of them, and that's a lot of drinks." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, eh? Ashbringer this, Ashbringer that, all you lot ever talk about. Never heard of it, myself, and stop asking." },
      },
      again = {
        { id = "h_again", text = "What else? The pit isn't going to fill itself, well, actually it is." },
        { id = "h_again2", text = "Go on, then. I've got a minute before the next cart comes." },
      },
      choices = {
        { text = "Tell me about the pit.", next = "pit" },
        { text = "Who's Egan?", next = "egan", when = { any = { { questActive = TODO_QUEST("The Restless Souls") }, { questDone = TODO_QUEST("The Restless Souls") } } } },
        { text = "Why do you stay at a job you hate?", next = "job" },
        { text = "You don't seem to hate the Scourge's victims.", next = "souls", when = { questDone = TODO_QUEST("Zaeldarr the Outcast") } },
        { text = "Can I bless the pit before you fill it again?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Show me what you're selling.", next = "BUSINESS" },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },

    pit = {
      lines = { { id = "pi_default", text = "Everything the Dawn kills that used to be a person goes in there, so it can't get up again. We burn it when the wind's right, and when it's not, well, you've smelled it." } },
      choices = {
        { text = "You must wonder who they were.", next = "pit_who" },
        { text = "Something else, Alen.", next = "BACK" },
      },
    },
    pit_who = {
      lines = { { id = "pw_default", text = "Every day, and I wish I didn't. Farmers, mostly, and soldiers, and once a little girl's shoe, which I kept, because I couldn't throw it in." } },
      choices = {
        { text = "You care more than you let on.", next = "pit_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pit_care = {
      big = true,
      lines = { { id = "pc_default", text = "Don't spread that around, it'll ruin my reputation. Somebody's got to toss them in, and I'd rather it was someone who minds than someone who doesn't." } },
      choices = {
        { text = "Then the dead are in good hands. Thank you.", next = "BACK", reply = "Shh, I said not to spread it. But thank you, all the same.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "They're just bodies, Alen. Stop thinking about it.", next = "BACK", reply = "I try, believe me, and it never works. Somebody has to mind, and I drew the short straw.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    egan = {
      lines = { { id = "eg_default", text = "A dwarf with a head full of gears and a heart full of hate for the Scourge, which is the right way round, if you ask me. He's been working on a way to set the souls of the dead loose from what's holding them, and he's closer than anybody else." } },
      choices = {
        { text = "Where do I find him?", next = "egan_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    egan_where = {
      lines = { { id = "ew_default", text = "He walks the eastern Plaguelands near Stratholme, testing his contraptions on anything that glows. If you hear swearing in Dwarven coming out of a ruin, that's him." } },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    job = {
      lines = { { id = "jo_default", text = "Because nobody else would do it, and the Dawn feeds me, and the pit never asks how my day went. Also I lost a bet, but that's a longer story and it doesn't make me look good." } },
      choices = {
        { text = "Tell me the bet.", next = "job_bet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_bet = {
      lines = { { id = "jb_default", text = "No. Some things a man takes to his grave, and seeing as I work next to one, I'll be keeping it close." } },
      choices = {
        { text = "Then I'll leave the graves to you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    souls = {
      lines = { { id = "so_default", text = "Hate them? No. The ones in Stratholme chose the fire over the Scourge, and they're still stuck walking the streets for their trouble, and that's not right by anyone's reckoning." } },
      choices = {
        { text = "Then let's set them free.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bless = {
      lines = { { id = "bl_default", text = "If it makes you feel better, go on, and say one for me while you're at it. Not that I think the Light listens much out here, but it can't hurt, and the smell won't get any worse." } },
      choices = {
        { text = "Light keep them, and you, Alen.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Never you mind what I was. Now I'm the fellow with the shovel, and that's enough of a story for anybody." } },
    advice = { { id = "tp_ad", text = "Don't stand downwind of the pit, and don't ask for a raise. Trust me on both." } },
    argent_dawn = { { id = "tp_argent", text = "Good folk, mostly. Terrible pay." } },
    scourge = { { id = "tp_scourge", text = "The Scourge sends me more work than any honest man could keep up with, and the Dawn pays me the same whether I toss in ten or a hundred. I don't complain, except to anyone who'll listen." } },
    stratholme = { { id = "tp_stratholme", text = "There are souls still wandering Stratholme that never got a proper burial, and it keeps me up some nights. Somebody ought to see to them, and it won't be me, because I'm not that brave." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "That's his necropolis up in the sky to the east, and I've learned not to look at it too long. It gives me a crick in the neck and a chill in the heart." } },
    holy_light = { { id = "tp_holy_light", text = "The chapel ground keeps the dead off it, and I thank the Light for that every morning. It's the only safe place I've slept in years." } },
    _none = { { id = "tp_none", text = "How should I know? I shovel things. Ask the Duke, he reads." } },
  },
}
