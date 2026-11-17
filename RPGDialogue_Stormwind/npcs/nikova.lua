-- Nikova Raskol, Old Town, Stormwind. Voice: bibles/nikova.md
-- Grandmother of Mac, a fourteen-year-old Stockade guard stabbed by prisoners for stopping them
-- tearing blankets into red Defias bandanas. Quest: The Color of Blood.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q = TODO_QUEST("The Color of Blood")

P:NPC {
  key = "nikova", id = TODO_NPC("Nikova Raskol"), name = "Nikova Raskol",
  bible = "bibles/nikova.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "gruff" }, values = { "loyal", "practical" },
  notices = { "soldier", "kin", "light" },

  impression = {
    first = "Nikova Raskol is an old Old Town woman with a hard mouth and red-rimmed eyes. Her grandson Mac was a Stockade guard, fourteen years old, and the Defias in the cells killed him over a few torn blankets.",
    third = "{name} met Nikova Raskol, an Old Town grandmother whose grandson Mac was killed guarding the Stockade.",
  },

  greetings = {
    { id = "g_op_city_proud", when = { opinion = { topic = "stormwind", stance = "proud" } }, text = "Still proud of the city, are you? Walk down my street at night once, and then come and tell me." },
    { id = "g_op_masons", when = { gossip = { topic = "defias", stance = "masons_wronged" } }, text = "They say down the street that you stood up for the stonemasons. Good. Just don't forget a boy died in the Stockade for their grudge." },
    { id = "g_default", text = "If you're selling something, I've nothing to buy it with, and if you're from the Watch, you're a month late." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, sit if you're stopping; I don't like folk looming over me." },
    { id = "g_quest", when = { questActive = Q }, text = "Have you got them? Don't stand there with your hands empty and tell me how hard it was, I'll not hear it." },
    { id = "g_after", when = { questDone = Q }, text = "Come in, come in. You're the one who went down there for my Mac, and I'll not forget it while I've breath." },
    { id = "g_away", when = { away = 14, questDone = Q }, text = "Gone {away}, and I'd begun to think the Stockade had swallowed you too. Sit down; you're thin." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've filled out since last time, and you carry yourself like the guards used to before the war took the good ones." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The women at the pump say you've been decent to people round here. I'll judge that for myself, but it's a start." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard about you from the pump, and none of it good. Say what you want and be quick." },
  },

  notice = {
    { id = "n_guard", cat = "soldier", when = { origin = "human_city_guard" },
      text = "You were in the Guard, weren't you? You've the walk. Did you ever stand a shift at the Stockade with a boy called Mac?" },
    { id = "n_young", cat = "kin", when = { maxLevel = 15, race = "Human" },
      text = "Light, you're barely older than he was. Does your grandmother know where you are?" },
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. The Cathedral sent a brother to say the words over Mac, and they were lovely words, and I couldn't hear one of them." },
  },

  start = "hello",
  nodes = {
    op_city = {
      lines = {
        { id = "op_city_a", text = "Ha! The Watch comes running when a lord's purse is cut, and it strolls when one of ours is knifed. You walk this city with a sword on your back, so tell me plainly, what do you make of Stormwind these days?" },
      },
      choices = {
        { text = "It's the last great city of men. I'm proud to defend it.", next = "op_city_1", fx = { opinion = { stormwind = "proud" }, align = { order = 1 } } },
        { text = "It's rotten at the top, and Old Town pays for it.", next = "op_city_2", fx = { opinion = { stormwind = "abandoned_its_own" }, align = { order = -1 }, affinity = 2 } },
        { text = "The city's tired and broke, but it's still trying.", next = "op_city_3", fx = { opinion = { stormwind = "patience" }, trait = { kind = 1 } } },
        { text = "Ironforge keeps its poor fed. Stormwind could learn something.", next = "op_city_4", when = { race = "Dwarf" }, fx = { opinion = { stormwind = "abandoned_its_own", dwarves = "admire" } } },
        { text = "I keep out of politics, grandmother.", next = "BACK" },
      },
    },
    op_city_1 = {
      lines = { { id = "op_city_r1", text = "Proud, is it? So was Mac, in his tabard, and they put him in a cell with killers for a wage that wouldn't buy boots. Be proud, then, but keep your eyes open." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_city_2 = {
      lines = { { id = "op_city_r2", text = "There, you've said it, and the sky didn't fall. Say it to the Watch and it might, so say it to me instead, whenever you like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_city_3 = {
      lines = { { id = "op_city_r3", text = "Trying, aye, the way an old woman tries to climb her stairs. I'll give it that much, since it's what I do every night myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_city_4 = {
      lines = { { id = "op_city_r4", text = "Could it, now? Then put that in a letter to the Regent, and sign it with a dwarf's name, because they'd never read it with mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Nikova Raskol. I've lived in Old Town since before the orcs burned it, and I'll die in it, though I'd hoped to see my grandson Mac grown first, before the Stockade took him." },
        { id = "h_before", when = { questBefore = Q, minLevel = 20 },
          text = "You've the look of someone who isn't afraid of the Stockade. I've a thing that needs doing down there, if you've the stomach to hear about my Mac." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q },
          text = "Ten of those red rags, that's what I asked. Every prisoner who wears one wore it to spit on my boy, and I want them off their necks." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { Q, days = 3 } },
          text = "I burned them, all ten, in the grate last night, and I sat and watched every thread go. It didn't bring him back, but I slept, and I'd not slept since the funeral." },
        { id = "h_done", when = { questDone = Q },
          text = "There's a candle in the window for Mac, and on the bad nights I light one for you as well, so you'd best not get yourself killed." },
        { id = "h_cleared", tags = { "news" }, when = { cleared = "The Stockade" },
          text = "They say someone went all the way down and put the whole riot in the ground. If it was you, I'll not ask how it felt; I'll only say thank you." },
        { id = "h_mason", when = { origin = "human_stonemason_child" },
          text = "A Stonemason's child, are you? Your guild's men built this city and then turned bandit when the nobles wouldn't pay, and it was their red that killed my Mac." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf. Mac wanted to go to Ironforge, see the forges, he said. He'd saved eleven copper towards it, and it's still in the jar." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "You're one of the tall folk from over the sea. Mac would've stared at you something rude, and I'd have clipped his ear for it." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; it's all I have now." },
        { id = "h_again2", text = "Go on, ask. Nobody else does any more." },
        { id = "h_again3", text = "Well? I'm listening, though my ears aren't what they were." },
      },
      choices = {
        { text = "You spoke of Mac as if you loved him.", next = "mac" },
        { text = "Something happened in the Stockade, I take it.", next = "death" },
        { text = "Why the bandanas?", next = "bandanas", when = { any = { { questActive = TODO_QUEST("The Color of Blood") }, { questDone = TODO_QUEST("The Color of Blood") } } } },
        { text = "What's Old Town like these days?", next = "oldtown" },
        { text = "I stood shifts at the Stockade. I knew him, a little.", next = "xguard", when = { origin = "human_city_guard" } },
        { text = "My guild never meant for this, Nikova.", next = "xmason", when = { origin = "human_stonemason_child" } },
        { text = "Shall I pray with you for him?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I've been down to the lower tiers. It's done.", next = "xcleared", when = { cleared = "The Stockade" } },
        { text = "I'll get you what you need.", next = "BUSINESS" },
        { text = "I'm sorry for your loss. Good day.", next = "END" },
      },
    },

    mac = {
      lines = {
        { id = "m_default", text = "My daughter's boy. She died of the coughing sickness the winter after we came back from Lordaeron, so I raised him, and he was a good lad, mostly, with big ears and no sense." },
      },
      choices = {
        { text = "How did a boy end up guarding the Stockade?", next = "mac_guard" },
        { text = "He sounds like he was a good lad.", next = "mac_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mac_guard = {
      lines = {
        { id = "mg_default", text = "Because there weren't men enough. The good ones went off to Westfall and Redridge and Lakeshire, and the Watch took whoever could hold a spear upright, and Mac could, just about." },
      },
      choices = {
        { text = "The city had no right to send a child down there.", next = "mac_blame", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Every family gave someone. He served, and that counts.", next = "mac_blame", fx = { align = { order = 1 } } },
        { text = "Did he want to go?", next = "mac_want" },
      },
    },
    mac_want = {
      lines = {
        { id = "mw_default", text = "Want to? He begged. A tabard, a wage, and a bit of standing in the street, and the girls at the pump looking twice. I signed for him myself, and that's the part I can't put down." },
      },
      choices = {
        { text = "You couldn't have known, Nikova.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mac_blame = {
      lines = {
        { id = "mb_default", text = "You can say what you like, I've said worse at his grave. The Warden came to the door with his cap in his hands and couldn't look at me, and I'll give him that much: he knew." },
      },
      choices = {
        { text = "Does the Warden still send word?", next = "thelwater" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thelwater = {
      lines = {
        { id = "th_default", text = "He sends a few silver at the turn of the month, wrapped in paper, no letter. I think it's from his own pocket, because the city's never sent a thing." },
      },
      choices = {
        { text = "That's decent of him.", next = "BACK" },
        { text = "Guilt money. He should answer for what happened.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let it lie. He's carrying it too.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    mac_like = {
      lines = {
        { id = "ml_default", text = "Hungry, always, and he whistled through his teeth till I wanted to throttle him. He brought me oranges off the boats when he got his first wage, three of them, and two were bad." },
        { id = "ml_kid", when = { maxLevel = 15 }, text = "Like you, a bit, all elbows and eagerness. He'd have asked you a hundred questions about where you'd been and believed every answer." },
      },
      choices = {
        { text = "He sounds like a good lad.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    death = {
      lines = {
        { id = "d_default", text = "The prisoners were tearing up the blankets the Cathedral gave them, making them into scarves, red ones, the Defias colour. Mac told them to stop, because that was his job, and one of them put a shiv in him for it.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "I hope the man who did it was caught.", next = "death_who" },
        { text = "The Defias have earned the rope, every one.", next = "death_who", fx = { align = { light = -1 } } },
        { text = "Some of those prisoners are just hungry men, Nikova.", next = "death_hungry", fx = { affinity = -2, align = { light = 1 } } },
      },
    },
    death_who = {
      lines = {
        { id = "dw_default", text = "Caught? He never left his cell. They say they can't tell which one it was, because they all wear the same red and they all keep their mouths shut, so they all hang or none do, and none do." },
      },
      choices = {
        { text = "Then they all share the blame.", next = "BACK" },
        { text = "I could find out which one it was.", next = "death_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_find = {
      lines = {
        { id = "df_default", text = "And then what, you'd kill him in his cell? No. I've thought about it, every night, and I'm too old to want another mother's boy dead on my account, even that one's." },
      },
      choices = {
        { text = "That's a mercy he doesn't deserve.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's the bravest thing I've heard in this city.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    death_hungry = {
      lines = {
        { id = "dh_default", text = "Hungry, is it? So was Mac, every day of his life, and he never stuck a knife in anybody. You can take your pity out of my house and give it to someone who's buried nothing." },
      },
      choices = {
        { text = "I meant no offence. Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },

    bandanas = {
      lines = {
        { id = "b_default", text = "Because they wear them to say they're Defias, and they wore them the night he died. I can't touch the men, but I can take their colours off them, and I'll burn every one I get." },
        { id = "b_done", when = { questDone = Q }, text = "You brought me ten, and I burned all ten, and I've not regretted a thread. If you see another on a prisoner's neck, you know where my grate is." },
      },
      choices = {
        { text = "Who are the Defias, anyway?", next = "defias" },
        { text = "Burning cloth won't change anything.", next = "bandanas_point", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bandanas_point = {
      lines = {
        { id = "bp_default", text = "It changes me. Ten men in that cell will wake up cold and bare-necked and know somebody remembers, and that's as much justice as Stormwind's ever handed an Old Town widow." },
      },
      choices = {
        { text = "Then I'll take every last rag off them.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The city owes you more than rags. Make them pay it.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    defias = {
      lines = {
        { id = "de_default", text = "Stonemasons, once. They rebuilt this city after the orcs and the nobles never paid them, so now they're bandits in Westfall and their friends fill the Stockade. I've some pity for the first part, and none left for the rest.",
          fx = { learn = { "stonemasons" } } },
      },
      choices = {
        { text = "The nobles cheated them. That's where the blame starts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Unpaid or not, they chose the knife.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    oldtown = {
      lines = {
        { id = "o_default", text = "Louder than it was, and poorer. The Pig and Whistle's full every night, the walls are cracked where nobody's paid to mend them, and half the men on my street are off at one front or another." },
      },
      choices = {
        { text = "Does the city do right by Old Town?", next = "op_city" },
        { text = "Who looks after you now?", next = "oldtown_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown_alone = {
      lines = {
        { id = "oa_default", text = "Myself, as I always have. Elly from the Pig and Whistle brings me the end of the stew some nights, and pretends she was only passing, and I pretend to believe her." },
      },
      choices = {
        { text = "Elly sounds kind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xguard = {
      lines = {
        { id = "xg_default", text = "Did you? Then tell me, and don't dress it up: was he any good at it, or did they keep him on because they had no one else?" },
      },
      choices = {
        { text = "He was good. Steady, and the prisoners respected him.", next = "xguard_kind", fx = { affinity = 3, align = { honor = -1 } } },
        { text = "He was green, but he never once left his post.", next = "xguard_true", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    xguard_kind = {
      lines = { { id = "xgk_default", text = "Respected him? Nobody respects a boy with ears like that. You're kind, though, and I'll take it, because kindness is thin on the ground this year." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xguard_true = {
      lines = { { id = "xgt_default", text = "Never left his post. No, he wouldn't have, the stubborn little fool, not even when he should have run. Thank you for the truth; it's worth more to me than sweet words." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xmason = {
      lines = {
        { id = "xm_default", text = "Never meant it? Your guild's men went to Westfall with their hammers and came back with knives. I don't blame you for your father's trade, but don't you dare tell me nobody meant it." },
      },
      choices = {
        { text = "The nobles robbed us first, Nikova. That much is true.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Whatever they were owed, it didn't buy Mac's life.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },

    xpriest = {
      lines = {
        { id = "xp_default", text = "Pray if you like, and I'll sit here while you do. I stopped asking the Light for things the day they carried him home, but I'll not stop you asking for me." },
      },
      choices = {
        { text = "The Light was with him at the end. I believe that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then I won't pray. I'll listen instead.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },

    xcleared = {
      lines = {
        { id = "xc_default", text = "All of it? The riot and the man behind it, and those cells quiet at last? Then sit here a minute and let an old woman hold your hand, and don't you dare tell me about the blood." },
      },
      choices = {
        { text = "I'll sit with you as long as you like.", next = "BACK", fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Old Town, born and wed and widowed, with a few hard years in Lordaeron between. Nothing grand, but it was mine." } },
    advice = { { id = "tp_ad", text = "Don't sign for anything you'd not sign for twice. I learned that too late." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. Ask at the Pig and Whistle; they know everything there, and most of it wrong." } },
  },
}
