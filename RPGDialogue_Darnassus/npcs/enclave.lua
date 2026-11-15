-- The Cenarion Enclave: the druid, hunter and rogue trainers, and Jenal behind the Arch Druid's tree.
-- Voices: bibles/enclave.md
-- Fandral is written straight: abrasive and proud, nothing more is hinted.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jenal: shuffles dirt outside the Enclave and calls himself a visionary; receives the Un'Goro soil.
P:NPC {
  key = "jenal", id = TODO_NPC("Jenal"), name = "Jenal",
  title = "Ditch Digger",
  bible = "bibles/enclave.md", role = "worker", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "chatty" }, values = { "ambitious", "proud" },
  notices = { "class", "kit" },

  impression = {
    first = "Jenal digs ditches behind the Cenarion Enclave and insists he is a visionary kept down by lesser minds. He asked me not to step in the dirt, then talked about his dreams for a long while.",
    third = "{name} met Jenal, who shovels dirt behind the Cenarion Enclave and considers himself a misunderstood visionary.",
  },

  greetings = {
    { id = "g_dirt", text = "Mind where you step, please. That pile is sorted, and so is that one." },
    { id = "g_back", when = { metBefore = true }, text = "You again! At last, someone who listens. Don't step in the dirt." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Perhaps you'll understand, since you've a calling yourself. Mine is greater things than this shovel, though the shovel hasn't heard yet." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Circle's own. Tell the Arch Druid I'm still out here, would you? He forgets, and I suspect it's on purpose." },
    { id = "n_dirty", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been rolling in worse dirt than mine, I see. Mine is at least sorted." },
  },

  start = "hello",
  nodes = {
    gnome_j = {
      lines = {
        { id = "gj_default", text = "Machines that dig! There, you see, a visionary idea, and I'm nearly certain I had it first. Don't mention it to the Arch Druid, though, because he'd only make me dig the machine a ditch." },
      },
      choices = {
        { text = "I could sketch one for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The druids would never allow it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jenal, at your service, though not for long, I hope. I'm a dreamer, you see, a visionary, and until the world sees it I help the Cenarion Circle by moving these piles of dirt about." },
        { id = "h_soil", tags = { "news" }, when = { questActive = TODO_QUEST("Un'Goro Soil") },
          text = "Is that soil from Un'Goro? Unload it here, carefully, noble {class}. It must have been quite a burden, not unlike the burden of being a visionary, and I'll see to the honorarium the Arch Druid set aside." },
        { id = "h_soil_done", when = { questDone = TODO_QUEST("Un'Goro Soil") },
          text = "Your Un'Goro soil is in the third pile, the important one. The Arch Druid wanted a word with you after, and I'd go, since he doesn't ask twice and he certainly doesn't ask me." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Still here, yes, and still digging. A visionary keeps odd hours, and the dirt doesn't mind the dark." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all night, and a great deal of dirt." },
        { id = "h_again2", text = "Go on, ask me something; nobody else ever does." },
      },
      choices = {
        { text = "What are you actually doing?", next = "dirt" },
        { text = "What do you dream of?", next = "dream" },
        { text = "Who's keeping you down?", next = "conspiracy" },
        { text = "What does the Circle want with Un'Goro soil?", next = "soil", when = { any = { { questActive = TODO_QUEST("Un'Goro Soil") }, { questDone = TODO_QUEST("Un'Goro Soil") } } } },
        { text = "Gnomes build machines that dig, you know.", next = "gnome_j", when = { race = "Gnome" } },
        { text = "I'll let you dig.", next = "END" },
      },
    },
    dirt = {
      lines = {
        { id = "di_default", text = "Moving it from there to here, and occasionally back again. The druids want the ground around the Enclave just so, and somebody has to do it, apparently forever." },
      },
      choices = {
        { text = "Honest work is nothing to be ashamed of.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "You're wasted on a shovel.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Who told you to do it?", next = "fandral" },
      },
    },
    fandral = {
      lines = {
        { id = "fa_default", text = "The Arch Druid himself. I told him I was a dreamer, and he looked at me with that face of his and said the world has need of people who dig ditches, too." },
      },
      choices = {
        { text = "He's not wrong.", next = "BACK", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "That was cruel of him.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
        { text = "What did you say back?", next = "fandral2" },
      },
    },
    fandral2 = {
      lines = {
        { id = "f2_default", text = "Nothing, to my lasting shame, because he's Fandral Staghelm and I am holding a shovel. I've thought of a great many good answers since, mostly at night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    dream = {
      big = true,
      lines = {
        { id = "dr_default", text = "A better future for all of us, naturally. I don't have the details yet, because a vision comes first and details come later, but when it arrives you'll hear about it." },
      },
      choices = {
        { text = "A dream without a plan is just sleep.", next = "BACK", fx = { align = { order = 1 }, trait = { skeptical = 1 }, affinity = -1 } },
        { text = "Every great thing started as a dream.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "What sort of better future?", next = "dream2" },
      },
    },
    dream2 = {
      lines = {
        { id = "d2_default", text = "One where a night elf can be judged by his ideas and not by his shovel, for a start. Beyond that, I'm keeping it to myself, because there are people who'd steal a vision like that." },
      },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    conspiracy = {
      lines = {
        { id = "co_default", text = "Conspiracies abound, friend. There are those without the vision to understand what I do, and they would keep me chained to obscurity, here, behind a tree." },
      },
      choices = {
        { text = "Name them, then.", next = "conspiracy2" },
        { text = "Perhaps no one is plotting against you.", next = "BACK", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Then outwit them. Quietly.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
      },
    },
    conspiracy2 = {
      lines = {
        { id = "c2_default", text = "I couldn't possibly, not out loud, not this close to the Enclave. Let's say a certain tree has a certain arch druid in it, and leave it there." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    soil = {
      lines = {
        { id = "so_default", text = "They say the soil of Un'Goro is rich with some sort of power, and the Arch Druid wants facts from falsehoods. I sort it, label it and keep it out of the rain, which takes more vision than you'd think." },
      },
      choices = {
        { text = "The Circle studies everything.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "People talk in front of a man with a shovel as if he were a tree stump. I've heard plenty, so ask." } },
    background = { { id = "tp_bg", text = "Visionary. Currently digging. The two will meet one day, and on that day you'll be glad you knew me." } },
    advice = { { id = "tp_ad", text = "Never let anyone tell you you're only a ditch digger, even if, at the moment, you are." } },
    cenarion_circle = { { id = "tp_circle", text = "Great druids, the lot of them, and not one of them has ever asked my opinion. Their loss." } },
    _none = { { id = "tp_none", text = "No idea, friend. I've been out here with the dirt; it doesn't gossip." } },
  },
}

-- Syurna: rogue trainer in the Enclave; plagued by Jannok's roses; sends rogues after Sethir the Ancient.
P:NPC {
  key = "syurna", id = TODO_NPC("Syurna"), name = "Syurna",
  title = "Rogue Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "cold", "sharp" }, values = { "cunning", "careful" },
  notices = { "class", "stealth" },

  impression = {
    first = "Syurna hardly speaks to anyone who isn't a rogue, and she made sure I knew it. Underneath the chill she cares a great deal about what is happening to the forests of Teldrassil.",
    third = "{name} met Syurna, the cool and guarded rogue trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_cold", text = "You're standing in my light. Was there something?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Greetings, young rogue. What do you seek tonight?" },
  },

  notice = {
    { id = "n_canal", cat = "class", when = { origin = "human_canal_pickpocket" },
      text = "You learned on Stormwind's canals, I'd wager, because you've checked where my hands are twice already. Keep the habit; it's the only one of theirs worth having." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in the shadows of the Enclave. Your kind usually stands in the middle of the room and glows; it's restful to see one who doesn't." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I saw you come in, so you can stop that. It was decent work, though, and better than Jannok's couriers ever manage." },
  },

  start = "hello",
  nodes = {
    rogue_s = {
      big = true,
      lines = {
        { id = "rs_default", text = "Shadowmeld is a gift; everything after it is patience. Humans learn the dark in alleys, but we learned it from the forest, which hides better than any alley and talks a great deal less." },
        { id = "rs_watch", when = { origin = "nightelf_watcher_trained" },
          text = "You stand with your back to the wall, like the Watchers teach, and I won't ask who taught you. Then you already know we don't take a life for coin; we take it for the forest, or not at all." },
      },
      choices = {
        { text = "Shadows or not, I keep my word.", next = "rogue_s2", fx = { align = { honor = 1 } } },
        { text = "I work in the dark because it works. Nothing more.", next = "rogue_s2", fx = { align = { honor = -1 } } },
        { text = "What's the first lesson, then?", next = "rogue_s2" },
      },
    },
    rogue_s2 = {
      lines = {
        { id = "rs2_default", text = "Stillness. Most rogues get caught moving, because they are afraid of being seen, and the fear makes them hurry; stand still in a shadow long enough and even a Sentinel will walk past you." },
      },
      choices = { { text = "I'll practise. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Syurna, and I train rogues. If you aren't one, I can't teach you anything, and I rarely talk for the pleasure of it, so choose your questions well." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "We are darkness and shadow, rogue, and the forest needs both now more than it did. Ask what you came to ask." },
        { id = "h_rose", tags = { "news" }, when = { questActive = TODO_QUEST("The Apple Falls") },
          text = "Another rose, and I suppose it's from Jannok. If I'd kept every flower that fool sent, I could have opened a shop, but his latest courier may prove more useful than he is." },
        { id = "h_sethir", tags = { "news" }, when = { questActive = TODO_QUEST("Destiny Calls") },
          text = "Sethir the Ancient hides on a branch beyond the Oracle Glade, and everyone who approached him openly met their doom. Go unseen, take what he carries and bring it to me." },
        { id = "h_sethir_done", when = { questDone = TODO_QUEST("Destiny Calls") },
          text = "Sethir's journal said what I feared: the sickness in Darkshore's forests is creeping into ours. You did well, but this is beyond a rogue's reach now." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be brief." },
        { id = "h_again2", when = { class = "ROGUE" }, text = "Go on. You've earned a few more questions." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who is Jannok?", next = "jannok" },
        { text = "What's wrong with Teldrassil's forests?", next = "forest" },
        { text = "Why do night elves need rogues?", next = "why" },
        { text = "Teach me how the kaldorei move unseen.", next = "rogue_s", when = { class = "ROGUE" } },
        { text = "I'll leave you to the shadows.", next = "END" },
      },
    },
    jannok = {
      lines = {
        { id = "ja_default", text = "Jannok Breezesong, who paints my face on his walls and forgets to eat while he sighs about the love we could have had. We never had anything; I spoke to him once, about the weather." },
      },
      choices = {
        { text = "Let him down gently, at least.", next = "BACK", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Ignore him. He'll tire of it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Why won't you see him?", next = "jannok2" },
      },
    },
    jannok2 = {
      lines = {
        { id = "j2_default", text = "Because I won't talk to anyone who isn't a rogue, and he knows it, which is why he keeps sending you. Tell him I said that, if you like; he'll only paint another picture." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    forest = {
      big = true,
      lines = {
        { id = "fo_default", text = "Something is wrong with the trees and the water beyond the Oracle Glade, and the satyr Sethir the Ancient knows more than he should. His journal points to the same sickness that grips Darkshore." },
      },
      choices = {
        { text = "The druids should be told at once.", next = "BACK", fx = { align = { order = 1 }, learn = { "satyrs" } } },
        { text = "Some things are better learned quietly first.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "satyrs" } } },
        { text = "Why steal from Sethir instead of fighting him?", next = "forest2" },
      },
    },
    forest2 = {
      lines = {
        { id = "f2_default", text = "Because force failed and diplomacy failed, and his minions came for everyone who tried either. A satyr expects a sword or a speech; he never expects a quiet hand in his pack." },
      },
      choices = {
        { text = "Stealth has its place.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather face an enemy openly.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Our enemies are older than your kingdoms and patient as stone, and not all of them can be fought in the open. The Sentinels guard the gates; we watch the places the gates don't reach." },
        { id = "wh_rogue", when = { class = "ROGUE", race = "Human" },
          text = "You'd know, human; your SI:7 has the same idea. Our ways are older, and quieter, but the Alliance needs both kinds of shadow." },
      },
      choices = {
        { text = "That's honest of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what moves in the dark parts of the forest. Choose your question carefully; I don't answer twice." } },
    background = { { id = "tp_bg", text = "I teach rogues. What I did before that isn't anyone's business." } },
    advice = { { id = "tp_ad", text = "Watch the hands, not the face. The face lies more often." } },
    satyrs = { { id = "tp_satyrs", text = "Old enemies, twisted from our own people. They hide on the edges of Teldrassil, and they know more than they should." } },
    _none = { { id = "tp_none", text = "I don't know, and I wouldn't tell a stranger if I did." } },
  },
}

-- Jocaste: hunter trainer in the Enclave; stern, revered; teaches young hunters to train their pets.
P:NPC {
  key = "jocaste", id = TODO_NPC("Jocaste"), name = "Jocaste",
  title = "Hunter Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "stern", "steady" }, values = { "wise", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Jocaste is as stern as the hunters warned, but I saw her watch the young ones with something close to pride. She speaks of balance as if it were a law she personally enforces.",
    third = "{name} met Jocaste, the stern and respected hunter trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Welcome to the Cenarion Circle, hunter. Is your companion fed and well?" },
    { id = "g_other", text = "You've come to the Enclave. Speak plainly, and I'll answer plainly." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest among the hunters. You'll find we mend our own beasts as often as you mend people, though we use rather less prayer." },
    { id = "n_pet", cat = "pet", when = { pet = { family = "Cat" } },
      text = "A good cat, and well kept. Mind its claws in the Enclave; the druids take it personally." },
    { id = "n_pet_any", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} looks healthy and alert. That tells me more about you than anything you could say." },
  },

  start = "hello",
  nodes = {
    sabers = {
      lines = {
        { id = "sb_default", text = "Then you learned the first lesson before you came to me: a saber carries you because it chooses to. Riders make patient hunters, and impatient ones, which are you?" },
      },
      choices = {
        { text = "Patient. A hunt is won in the waiting.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Impatient. The saber taught me speed.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    human_h = {
      lines = {
        { id = "hh_default", text = "Somewhere I didn't expect, and I'll admit it. Your people fence the land and farm it, so the balance is harder to see in Elwynn than in Ashenvale, but a hunter who learns to see it there will see it anywhere." },
        { id = "hh_wood", when = { origin = "human_eastvale_woodsman" },
          text = "A woodsman's child from Eastvale. Then you grew up between the axe and the forest, and you know already that a tree is not only lumber; that puts you ahead of most of my students." },
      },
      choices = {
        { text = "What do you see in Elwynn that I don't?", next = "human_h2" },
        { text = "Every land feeds its hunters. Mine included.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    human_h2 = {
      lines = {
        { id = "hh2_default", text = "Wolves pushed off their ground by your farms, and bears driven down by your logging camps, and both of them turning on the roads. Nothing in a forest goes hungry without a reason, and the reason is usually one of us." },
      },
      choices = {
        { text = "People have to eat too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the land should be given back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    gun_h = {
      lines = {
        { id = "gh_default", text = "Every beast in Teldrassil heard you arrive, I'm sure, and so did half the Sentinels. I won't tell you to put it down, since Ironforge's hunters swear by them, but a bow lets the forest keep its silence, and the forest remembers who keeps it." },
      },
      choices = {
        { text = "A clean kill matters more than a quiet one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll learn the bow as well, then.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Jocaste, and I train the hunters of Darnassus. Always respect the balance and live in awe of the nature around you, because that's the first lesson, and the last." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunter's Path") },
          text = "Yes, it's time. You're skilled enough to keep a beast at your side, so go to Dazalar in Dolanaar; he'll set you on the path to earning one." },
        { id = "h_beast", tags = { "news" }, when = { questActive = TODO_QUEST("Training the Beast") },
          text = "A fledgling hunter, with a companion of your own now. I can teach you to train it, to feed it and to call it back if it falls, so listen well." },
        { id = "h_beast_done", when = { questDone = TODO_QUEST("Training the Beast") },
          text = "You and your companion have grown since we last spoke. Remember the balance, and we shall speak again when you're ready for more." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; I'm listening." },
        { id = "h_again2", text = "Another question? Good. Hunters who stop asking stop learning." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What do you mean by balance?", next = "balance" },
        { text = "How do you choose a companion?", next = "companion" },
        { text = "Who else teaches hunters here?", next = "dorion" },
        { text = "How do I teach my companion new tricks?", next = "teach", when = { class = "HUNTER" } },
        { text = "I rode nightsabers before I ever drew a bow.", next = "sabers", when = { origin = "nightelf_nightsaber_rider" } },
        { text = "Humans hunt too. Where do I fit?", next = "human_h", when = { race = "Human", class = "HUNTER" } },
        { text = "My rifle serves me as well as any bow.", next = "gun_h", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "Farewell, Jocaste.", next = "END" },
      },
    },
    balance = {
      big = true,
      lines = {
        { id = "ba_default", text = "Take only what you need, and never kill for the pleasure of it. The forest feeds the hunter as long as the hunter remembers that she belongs to the forest, and not the other way around." },
      },
      choices = {
        { text = "The wild should be left to itself.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Someone has to keep the wild in order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "And those who break the balance?", next = "balance2" },
      },
    },
    balance2 = {
      lines = {
        { id = "b2_default", text = "Poachers, demons, orcs with axes in Ashenvale? We answer them, with arrows if we must. Balance isn't the same thing as peace, and every hunter learns that sooner or later." },
      },
      choices = {
        { text = "Then I'll answer them too.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'd rather avoid fights I don't need.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    companion = {
      lines = {
        { id = "cm_default", text = "You don't choose; you earn. A beast that follows you because you beat it will leave the first chance it gets, but one that follows you because you fed it and stood by it will die for you." },
        { id = "cm_hunter", when = { class = "HUNTER", pet = { named = true } },
          text = "Look at {pet}, and ask yourself whether it follows you from fear or from trust. You already know the answer; the beast knows it too." },
      },
      choices = {
        { text = "I'll earn its trust, then.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = {
        { id = "tc_default", text = "Patiently, and one lesson at a time, the same way I teach you. A beast learns from what it sees you do far more than from what you tell it, so fight cleanly in front of it." },
      },
      choices = {
        { text = "A companion should obey, first and always.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "A companion should be free to follow its instincts.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    dorion = {
      lines = {
        { id = "do_default", text = "Dorion, over there with his wolf, Shadow. He's gentler than I am, and the young ones like him better, which is how it should be, since they learn more from me." },
      },
      choices = {
        { text = "A stern teacher is a good one.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Kindness teaches too.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunters bring back more than pelts; they bring news from every corner of the forest. Ask, and I'll share what's worth sharing." } },
    background = { { id = "tp_bg", text = "I teach hunters, and I teach them hard. Ask any of them in ten years whether it was worth it." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself. It's watching to see whether you will." } },
    _none = { { id = "tp_none", text = "That's no concern of the hunt. Ask someone else." } },
  },
}

-- Denatharion: druid trainer in the Enclave; sends young druids up to Mathrengyl (Heeding the Call).
P:NPC {
  key = "denatharion", id = TODO_NPC("Denatharion"), name = "Denatharion",
  title = "Druid Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "calm", "patient" }, values = { "wise", "loyal" },
  notices = { "form", "class" },

  impression = {
    first = "Denatharion blesses everyone in Cenarius's name, even those who will never take a shape. He speaks of the Enclave's quarrels with a teacher's tact, and of the young druids with real fondness.",
    third = "{name} met Denatharion, a patient druid trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_cenarius", text = "The blessings of Cenarius be yours, {class}." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Back again, young druid? Good; the forest has been waiting for you to grow into it." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest in the Enclave! The Temple and the Circle are old friends who argue, so you're welcome here, as long as you don't take sides." },
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "You wear that shape well, but take it off before you sit down, please. The benches are older than you are." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Running indoors? The Arch Druid would have words, and none of them kind." },
  },

  start = "hello",
  nodes = {
    forms = {
      big = true,
      lines = {
        { id = "fm_default", text = "Every young druid asks me that, and every old one has a different answer. The bear stands and holds, the cat hunts unseen, the seal goes where we can't, and your true shape is the one you are when you come back from them." },
      },
      choices = {
        { text = "The bear. Stand where everyone can see you.", next = "forms2", fx = { align = { honor = 1 } } },
        { text = "The cat. Strike before they know you're there.", next = "forms2", fx = { align = { honor = -1 } } },
        { text = "And what if I don't come back?", next = "forms2" },
      },
    },
    forms2 = {
      lines = {
        { id = "fm2_default", text = "Then you'll not be the first, and that's why Mathrengyl tests the heart and not only the body. Come back to yourself every evening, even when it would be easier to stay four-footed, and you'll be fine." },
      },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Denatharion, one of those who teach the young druids of the Enclave. Most of them come to me knowing how to grow a vine and leave knowing why they shouldn't always." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "Mathrengyl Bearwalker has asked for you by name, young druid. He's on the second floor of the Arch Druid's tree, and you'll find no wiser teacher in all of Teldrassil." },
        { id = "h_bear_done", when = { questDone = TODO_QUEST("Body and Heart") },
          text = "You've met the Great Bear, I can tell; you stand differently. Mathrengyl chose well." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The Enclave is slow, and so are its answers, but they come." },
        { id = "h_again2", text = "Ask on, then, since questions are how roots find water." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who is Cenarius, to you?", next = "cenarius" },
        { text = "What does a young druid learn first?", next = "first" },
        { text = "How is the Circle under Fandral?", next = "circle" },
        { text = "Which shape is truest to a druid?", next = "forms", when = { class = "DRUID" } },
        { text = "Farewell.", next = "END" },
      },
    },
    cenarius = {
      big = true,
      lines = {
        { id = "ce_default", text = "The forest's demigod, and the first teacher of our druids, long ago. He fell in the war against the orcs, in Ashenvale, and we still teach in his name because the forest hasn't forgotten him either." },
      },
      choices = {
        { text = "The orcs should answer for his death.", next = "BACK", fx = { align = { honor = 1 }, learn = { "warsong" } } },
        { text = "Vengeance won't bring him back.", next = "BACK", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Do druids still feel him?", next = "cenarius2" },
      },
    },
    cenarius2 = {
      lines = {
        { id = "c2_default", text = "Some say they do, in the old groves, and I won't tell them they're wrong. I feel the forest, and that's enough for me most days." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Patience, then the bear, then the rest. A druid who rushes the shapes ends up wearing them badly, like a borrowed cloak." },
        { id = "fi_druid", when = { class = "DRUID", maxLevel = 15 },
          text = "You'll learn it soon enough. When Mathrengyl sends for you, go at once, and don't be ashamed if the Great Bear leaves you a little dazed." },
      },
      choices = {
        { text = "Patience isn't my strength.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Discipline first. I understand.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    circle = {
      lines = {
        { id = "ci_default", text = "Busy, and loud, and growing like the tree. The Arch Druid has a vision for Teldrassil, and he pursues it harder than anyone, which some admire and some find tiring." },
      },
      choices = {
        { text = "Which are you?", next = "circle2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    circle2 = {
      lines = {
        { id = "c2b_default", text = "A teacher, which means I admire him on the days I'm rested and find him tiring on the others. Don't tell him which day it is." },
      },
      choices = {
        { text = "A leader needs that drive.", next = "BACK", fx = { align = { order = 1 }, learn = { "cenarion_circle" } } },
        { text = "A leader needs to listen, too.", next = "BACK", fx = { align = { order = -1 }, learn = { "cenarion_circle" } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Enclave is full of druids, and druids talk more than you'd think. Ask, and I'll tell you what I've overheard." } },
    background = { { id = "tp_bg", text = "I teach the young druids before Mathrengyl takes them further. It's a gentle post, and I like it." } },
    advice = { { id = "tp_ad", text = "Listen to the forest before you speak for it. Most druids skip that step." } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle, and we serve the balance. Our leaders disagree sometimes, but the duty doesn't change." } },
    _none = { { id = "tp_none", text = "The forest hasn't told me that one. Try the Temple, perhaps." } },
  },
}
