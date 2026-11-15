-- Commander Althea Ebonlocke, the Night Watch, Darkshire. Voice: bibles/althea.md
-- Holds the town with a militia, adventurers and very little sleep.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "althea", id = TODO_NPC("Commander Althea Ebonlocke"), name = "Commander Althea Ebonlocke",
  bible = "bibles/althea.md", role = "soldier", tier = "major",
  communities = { "darkshire" }, temper = { "steady" }, values = { "brave", "lawful", "stern" },
  notices = { "soldier", "night" },

  greetings = {
    { id = "g_watch", text = "Night Watch. State your business, {class}, and then make yourself useful." },
    { id = "g_recruit", when = { questDone = TODO_QUEST("The Night Watch") }, text = "You're one of mine now, or near enough, so report." },
    { id = "g_hero", when = { townStanding = { town = "darkshire", min = 55 } }, text = "There's the reason half my watchers are still alive. Sit down, if only for a moment." },
    { id = "g_ladim", when = { questActive = TODO_QUEST("Mor'Ladim") }, text = "If you're going after Mor'Ladim, take friends with you, and I mean that." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, minLevel = 20 },
      text = "You'd make a decent watcher. We don't pay, we don't sleep, and the woods want to eat us, so are you interested?" },
    { id = "n_night", cat = "night", when = { timeOfDay = "night" },
      text = "Out after dark, in Duskwood? Either you're very brave or you haven't been here long, so stay in the lamplight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Commander Ebonlocke of the Night Watch. We're sworn to keep Darkshire's people alive, and some nights that's the whole of the oath, and plenty." },
        { id = "h_watch", tags = { "news" }, when = { questActive = TODO_QUEST("The Night Watch") },
          text = "The dead don't stay in the cemeteries out here, so thin them for me. Every skeleton you put down is one less at our gate." },
        { id = "h_watch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Night Watch"), days = 3 } },
          text = "My watchers slept a full night, and two of them didn't know what to do with themselves." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "It's an old murder of some visiting nobles, years ago. Smitts never let it go, and now it seems neither will you, so follow it to the end." },
        { id = "h_morgan", when = { questActive = TODO_QUEST("Morgan Ladimore") },
          text = "Sirra sent you with a name, did he? Ladimore. Most of us stopped using it; we call what's left of him Mor'Ladim, when we call him anything at all." },
        { id = "h_ladim", tags = { "news" }, when = { questActive = TODO_QUEST("Mor'Ladim") },
          text = "He walks the cemetery in a slow, crooked circle and always ends at his own grave. He's killed some of my strongest, so don't go alone." },
        { id = "h_ello", text = "The mayor writes to Stormwind while I train farmers to hold a pike. One of us will save this town, and it won't be the letters." },
        { id = "h_new", when = { maxLevel = 22 },
          text = "You're green for Duskwood. Keep to the road, keep a torch lit, and don't follow lights into the trees." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Can your people see through this fog any better than mine? No? Then you're as welcome as anyone else holding a sword." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, good. My watchers bleed, and all I have for them is bandages and bad jokes, so stay a night if you can stand the howling." },
        { id = "h_roll", when = { metBefore = true }, text = "We lost no one last night. Write that down somewhere, because it doesn't happen often enough." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Good, it's you. My watchers stand a little straighter when you're in town, and I'll take every bit of that I can get." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, because the lamps won't light themselves." },
        { id = "h_again2", text = "Go on. I've a shift change in an hour and nothing better to do until then." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then, and keep half an eye on the gate while you do." },
      },
      choices = {
        { text = "What's out in the woods?", next = "woods" },
        { text = "How can I help the Watch?", next = "help" },
        { text = "Who are your watchers?", next = "watchers" },
        { text = "What is Mor'Ladim?", next = "morladim" },
        { text = "You and the mayor are kin?", next = "ello" },
        { text = "Let me tend your wounded watchers.", next = "priest", when = { class = "PRIEST" } },
        { text = "Did Stalvan Mistmantle do it?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "That stitched thing on the road...", next = "stitches", when = { questDone = TODO_QUEST("Translation to Ello") } },
        { text = "I'll keep to the lamplight.", next = "END" },
      },
    },

    woods = {
      big = true,
      lines = {
        { id = "w_default", text = "Worgen, the walking dead, and ogres down from the pass. Then there's the fog, which isn't a creature but behaves like one, so pick your poison." },
      },
      choices = {
        { text = "I'll take them all.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1, learn = { "worgen" } } },
        { text = "How do you live like this?", next = "live" },
        { text = "Where do the dead come from?", next = "woods_dead" },
      },
    },
    live = {
      lines = { { id = "l_default", text = "Badly, and together, and with a great deal of lamp oil." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    woods_dead = {
      lines = {
        { id = "wd_default", text = "From the cemeteries, and Raven Hill's has swallowed the village it served. The scouts say something in a house above it keeps the dead walking, and that it's a man, not a monster." },
      },
      choices = {
        { text = "Who is he?", next = "woods_fel" },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },
    woods_fel = {
      lines = {
        { id = "wf_default", text = "Morbent Fel, a necromancer on Forlorn Rowe, above the graves. Sven Yorgen, out by the western river, has made him the whole of his life, so ask Sven.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Why hasn't the Watch gone after him?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      lines = {
        { id = "hp_default", text = "Talk to my watchers at the posts, because they know what needs killing this week. It changes from week to week, but it never shrinks." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { learn = { "night_watch" }, standing = { darkshire = 1 } } },
        { text = "What needs killing this week?", next = "help_week" },
      },
    },
    help_week = {
      lines = {
        { id = "hw_default", text = "Skeletons in Tranquil Gardens, south of town. Live through that and there's Raven Hill's graveyard, and if you live through that, I'll find you something worse." },
      },
      choices = {
        { text = "You make it sound inviting.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Point me at them.", next = "BUSINESS", fx = { affinity = 1, standing = { darkshire = 1 } } },
      },
    },

    watchers = {
      lines = {
        { id = "wa_default", text = "Farmers, bakers, a tanner, and two brothers who never agree on anything. Stormwind pulled its guards out, so we trained our own, and they're good." },
      },
      choices = {
        { text = "Do they get paid?", next = "watchers_pay" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    watchers_pay = {
      lines = {
        { id = "wp_default", text = "In lamp oil and gratitude. The council gives what it has, which is the lamp oil, and the gratitude is mine." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's a hard way to keep an army.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
        { text = "How many names have you lost this year, Commander?", tag = "Persuade", next = "watchers_names",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "WARRIOR" } }, { townStanding = { town = "darkshire", min = 30 } } } } },
          fail = { next = "watchers_roster", fx = { affinity = -1 } } },
      },
    },

    morladim = {
      big = true,
      lines = {
        { id = "ml_default", text = "He's a dead knight who won't lie down. He walks Raven Hill's cemetery and kills my watchers on patrol, some of my strongest among them, and I'd like him gone." },
      },
      choices = {
        { text = "Who was he, alive?", next = "morladim_who" },
        { text = "Then he needs putting down.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
      },
    },
    morladim_who = {
      lines = {
        { id = "mw_default", text = "Morgan Ladimore. Sirra knew him before the war and keeps the whole sorry tale on a shelf, so read it, then come back and ask me for the hard part.",
          fx = { learn = { "ladimore" } } },
      },
      choices = {
        { text = "Does it make him easier to kill, knowing?", next = "morladim_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morladim_know = {
      lines = {
        { id = "mk_default", text = "No, it always makes it harder, but know it anyway. The ones who don't end up swinging at shadows, and he isn't one." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ello = {
      lines = {
        { id = "el_default", text = "Kin, yes. He talks to Stormwind and I talk to the dead, mostly with a pike, and we each think the other is wasting their time. We're both right." },
      },
      choices = {
        { text = "Does he know you think that?", next = "ello_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ello_know = {
      lines = {
        { id = "ek_default", text = "He's a politician, so he knows exactly what everyone thinks, and he writes the letters anyway. I respect that more than I'd ever tell him." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll make no promises; he might like to hear it.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Then you're welcome here. The ones back from Raven Hill don't sleep, and some of them ask whether the dead up there feel anything. I've no answer for them, but you might." },
      },
      choices = {
        { text = "I'll sit with them tonight.", next = "BACK", fx = { affinity = 3, standing = { darkshire = 2 }, align = { light = 1 } },
          journal = { first = "Sat a night with the Night Watch's wounded in Darkshire, at Commander Ebonlocke's welcome.",
                      third = "{name} sat a night with the Night Watch's wounded in Darkshire." } },
        { text = "The dead feel nothing now, and they should hear that plainly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do I tell them?", next = "priest_answer" },
      },
    },
    priest_answer = {
      lines = {
        { id = "pa_default", text = "Tell them whatever's true, because they'll know if it isn't. Watchers can smell a lie; Stormwind's been feeding them comfortable ones for years." },
      },
      choices = {
        { text = "Then they'll get the truth.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Sometimes a kind lie is what lets a man sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stalvan = {
      lines = {
        { id = "st_default", text = "I've had my eye on that tutor for years, but proof's the trouble. Smitts has pages and Daltry has the town's signatures, so lay them side by side and I'll do the rest." },
      },
      choices = {
        { text = "And if they match?", next = "stalvan_match" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stalvan_match = {
      lines = {
        { id = "sm_default", text = "Then someone walks up to that manor north of town with a sword and my order. I'd go myself, but Darkshire won't let me leave the gate." },
      },
      choices = {
        { text = "Send me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "stalvan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stitches = {
      big = true,
      lines = {
        { id = "sc_default", text = "It came down the road from Raven Hill bellowing for Darkshire and went through two of my camps. Don't tell me who made it, because I already know." },
      },
      choices = {
        { text = "I fetched his supplies. I didn't know.", next = "stitches_guilt" },
        { text = "It's done now.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stitches_guilt = {
      lines = {
        { id = "sg_default", text = "Nobody did; he was sweet to half this town. Next time a hermit wants thread, ask him what he's sewing." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 }, learn = { "embalmer" } } } },
    },
    watchers_names = {
      big = true,
      lines = {
        { id = "wn_default", text = "Nine since the thaw, and I can tell you every one of them and where they fell, because I'm the one who knocks on the door afterwards. I don't let the council do it; they make speeches." },
        { id = "wn_after", text = "I keep the roster with the dead names still on it, crossed through but not scratched out. Ello thinks it's morbid, and maybe it is, but I'll not have anyone in this town forget they stood a watch." },
        { id = "wn_priest", when = { class = "PRIEST" }, text = "If you're staying the night, there are two mothers on the Raven Hill road who'd take a priest at the door better than they took me. I'd count it a kindness." },
      },
      choices = {
        { text = "They won't be forgotten.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's keep the tenth off that list.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    watchers_roster = {
      lines = {
        { id = "wr_default", text = "Enough that I don't talk about it with strangers on the road. Ask me how to keep the rest alive instead; that's the question I can use." },
        { id = "wr_default2", text = "The roster's my business, and the Watch's. You'll forgive me if I keep the count to myself." },
      },
      choices = {
        { text = "Fair, Commander.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My watchers bring me every report from the woods, and none of them are pleasant. Ask me about any of this, and I'll tell you plainly." },
    },
    background = { { id = "tp_bg", text = "I command the Night Watch. I don't have a story so much as a roster, and every name on it matters more than mine." } },
    advice = { { id = "tp_ad", text = "Keep to the roads by day and the lamps by night, and never follow a light into the trees, whoever seems to be holding it." } },
    night_watch = { { id = "tp_watch", text = "Volunteers, mostly: farmers, bakers, and a tanner who swears he's killed forty ghouls, though he's killed six." } },
    worgen = { { id = "tp_worgen", text = "Don't ask me where they came from; ask how many there are, because that's the useful question." } },
    stalvan = { { id = "tp_stalvan", text = "A tutor who killed the girl he taught and the man she was to marry, and maybe more besides. That's the short version, and the long one keeps Smitts up at night." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle runs a militia too. I'd like to meet him some day and compare notes on being forgotten." } },
    ladimore = {
      { id = "tp_ladimore_next", text = "Mor'Ladim is my watchers' worst night, most weeks. Ask me what you want to know.", next = "morladim" },
      { id = "tp_ladimore", text = "He was one of ours once, a knight of this town, and now he's the thing my patrols walk around." },
    },
    morbent_fel = { { id = "tp_morbent", text = "He's a necromancer up on Forlorn Rowe. The dead he raises are my watchers' business, but the man himself is Sven Yorgen's." } },
    embalmer = { { id = "tp_embalmer", text = "That was a children's story until it walked down my road, and I've doubled the lamps on the Raven Hill side since." } },
    _none = { { id = "tp_none", text = "That's not a Watch matter, and if it ever becomes one, it'll find me." } },
  },
}
