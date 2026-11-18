-- Sergeant Yohwa: Lieutenant Doren's sergeant at the Rebel Camp, who knows Kurzen's soldiers by name and fights them with their own tactics. Voice: bibles/yohwa.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "yohwa", id = TODO_NPC("Sergeant Yohwa"), name = "Sergeant Yohwa",
  bible = "bibles/yohwa.md", role = "soldier", tier = "quest",
  communities = { "rebel_camp" }, temper = { "brisk", "stern" }, values = { "dutiful", "loyal" },
  notices = { "soldier", "weary" },

  impression = {
    first = "Sergeant Yohwa threatened to take a cane to me before she asked my name, and I think she meant both kindly. She knows Kurzen's soldiers personally, which makes fighting them harder for her than she lets on.",
    third = "{name} met Sergeant Yohwa, Lieutenant Doren's hard-handed sergeant at the Rebel Camp in Stranglethorn Vale.",
  },

  greetings = {
    { id = "g_default", text = "You watch where you step around here, {g:son|lass}. You're not part of our outfit, but that doesn't mean I won't take a cane to you if you fall out of line." },
    { id = "g_back", when = { metBefore = true }, text = "Back on your feet, good. Report, then, and keep it short." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I'd marked you down as Kurzen's. I'm glad to cross it out." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've filled out since I last saw you, and you stand like a soldier now. Somebody's been training you, or the jungle has." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "Word is you've been throwing your weight around camp. My people have had enough of that from the Colonel, so save it for the Compound." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You hold that weapon like it's been issued, not bought. Good, because I need soldiers, not heroes." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the Compound chewed you up and spat you out. Sit, drink some water, and don't argue with me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Yohwa, and I serve under Lieutenant Doren. We're fighting a losing battle with Colonel Kurzen, who's a brilliant tactician and outnumbers us ten to one, so if you're here to help, I've work for you." },
        { id = "h_rebellion", tags = { "news" }, when = { questActive = TODO_QUEST("The Second Rebellion") },
          text = "Your orders are to go into Kurzen's camp to the east, kill his jungle fighters, lots of them, and get out before his reinforcements close on you. We use his own covert tactics against him, or we don't survive." },
        { id = "h_rebellion_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Second Rebellion"), days = 3 } },
          text = "That took some pressure off the camp, and the lads slept last night for the first time in a week. Now that you've had a taste, do you still want to throw your lot in with us?" },
        { id = "h_medicine", tags = { "news" }, when = { questActive = TODO_QUEST("Bad Medicine") },
          text = "I need Jungle Remedies taken off Kurzen's medicine men, and a sample of Venom Fern Extract from the supply boxes in his Compound. Kurzen poisons our fighters and heals his own, and I mean to stop both." },
        { id = "h_forces", tags = { "news" }, when = { questActive = TODO_QUEST("Special Forces") },
          text = "Kurzen's commandos and headshrinkers hold the cave they call the Stockpile, and they're skilled and loyal and cruel. Clear them out, then report to the Lieutenant himself." },
        { id = "h_forces_done", when = { questDone = TODO_QUEST("Special Forces") },
          text = "The Lieutenant told me what you did in the Stockpile. I'd hoped we weren't alone out here, and now I'm starting to believe it." },
        { id = "h_human", when = { race = "Human", faction = "Alliance" },
          text = "Stormwind, by the look of you. You'll forgive us if we don't salute, for the last orders we got from Stormwind came through Kurzen, and look where they led." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, I've a patrol to send out." },
        { id = "h_again2", text = "Anything more, {g:son|lass}? Out with it." },
      },
      choices = {
        { text = "Do you know the men you're fighting?", next = "known" },
        { text = "How does Kurzen keep his army fighting?", next = "medicine" },
        { text = "Fighting a man who outnumbers you can't be easy.", next = "tactics" },
        { text = "Why fight Kurzen at all?", next = "leave" },
        { text = "I could help make your remedies.", next = "xalchemy", when = { profession = "Alchemy" } },
        { text = "Let me tend your wounded, Sergeant.", next = "xheal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "I'll get to work.", next = "END" },
      },
    },

    known = {
      lines = {
        { id = "kn_default", text = "Many of them, aye, for I marched with them out of Stormwind and drilled half of them myself. They're skilled, loyal and cruel now, and I taught them the first two, so I've only myself to blame for being outmatched." },
      },
      choices = {
        { text = "Does it trouble you to see them killed?", next = "known_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    known_trouble = {
      lines = {
        { id = "kt_default", text = "Every day, because a sergeant who stops caring about her soldiers is no sergeant at all. But they made their choice when they followed the Colonel, and I made mine." },
      },
      choices = {
        { text = "They followed orders. They deserve mercy if they yield.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They chose Kurzen. No quarter for them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    medicine = {
      lines = {
        { id = "me_default", text = "Kurzen keeps a great many medicine men who patch his soldiers with Jungle Remedies, and poison ours with extracts of venom fern. Take away his healers and his army wears out like ours does." },
      },
      choices = {
        { text = "And the venom fern sample?", next = "medicine_fern" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medicine_fern = {
      lines = {
        { id = "mf_default", text = "So we can study it and brew our own remedies, because I've buried three good fighters who took a scratch and turned black by morning. Brother Nimetz, our camp priest, helps where he can, but prayer doesn't neutralize poison." },
        { id = "mf_done", when = { questDone = TODO_QUEST("Bad Medicine") },
          text = "We're studying the sample you brought, and the first batch of our own remedy saved a scout yesterday. That's one more soldier alive because of you." },
      },
      choices = {
        { text = "Using their own medicine against them. Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tactics = {
      lines = {
        { id = "ta_default", text = "You don't stand and trade blows, that's for certain. You hit hard where he's thin, you're gone before he can turn, and you make him wonder where you'll come from next, which is what he taught us to do to the trolls." },
      },
      choices = {
        { text = "That's not much like the Stormwind army.", next = "tactics_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tactics_honor = {
      lines = {
        { id = "th_default", text = "No, it isn't, and the drill masters in Stormwind would faint to hear me say it. But Stormwind's army has a few thousand soldiers and a king's treasury, and we have a camp in the jungle and whatever we can steal." },
      },
      choices = {
        { text = "Fight dirty if it keeps you alive.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Win honorably, or the victory won't mean much.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    leave = {
      lines = {
        { id = "le_default", text = "Because the Colonel stopped being the man we marched behind, and the orders he gave stopped being orders a decent soldier could follow. Lieutenant Doren saw it first, and I followed the Lieutenant." },
      },
      choices = {
        { text = "That's still desertion, by army law.", next = "leave_law" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave_law = {
      lines = {
        { id = "ll_default", text = "It is, and if Stormwind ever sends someone to hang us for it, I'll explain myself on the scaffold. Until then, I'll keep my people alive and leave the law to people who've never been to Stranglethorn." },
      },
      choices = {
        { text = "You did the right thing. The law can bend.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Duty means following orders, even bad ones.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xalchemy = {
      big = true,
      lines = {
        { id = "xa_default", text = "Could you now? Then you'll want the extract once we've got it, and every fern you can find on the hills. I'll not promise you pay, but I'll promise you'll be the most popular face in camp." },
      },
      choices = {
        { text = "I'll brew for the camp, no charge.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      big = true,
      lines = {
        { id = "xh_default", text = "Bless you, then, and start with the cots by the fire, for those are the ones the fern got. Don't let them tell you they're fine, because soldiers always say they're fine." },
      },
      choices = {
        { text = "I'll see to all of them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A sergeant of Stormwind once, a sergeant of rebels now, and still shouting at recruits either way." } },
    advice = { { id = "tp_ad", text = "Never let a jungle scratch go untreated, {g:son|lass}. Out here, that's how most of us die." } },
    kurzen = { { id = "tp_kurzen", text = "Kurzen was my commander once, and I followed him into this jungle. I won't follow him any further." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is a good man, but Stormwind's forgotten us down here, and I don't think he knows how bad it's gotten. I'd tell him myself if I could." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's full of soft recruits who think they're tough, and I'd love to get my hands on a few of them. I'd make soldiers out of them in a week." } },
    holy_light = { { id = "tp_holy_light", text = "I don't pray much, but Brother Nimetz does, and I've seen him keep men alive who should've died. Maybe the Light's real, and maybe he's just good at his job." } },
    second_war = { { id = "tp_second_war", text = "I was a recruit in the Second War, and I learned to fight from sergeants who'd fought orcs. I teach the same way now, with a cane and a shout." } },
    _none = { { id = "tp_none", text = "Not my department. Ask the Lieutenant, or better yet, don't." } },
  },
}
