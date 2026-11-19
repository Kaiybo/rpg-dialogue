-- Auberdine, more of its people (0.37.0). Voice: bibles/auberdine.md
-- Classic only: Tharnariun's thistle bear quests, Sentinel Elissa Starbreeze taking Maestra's Post's
-- supplies, and Caylais Moonfeather's hippogryphs.
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tharnariun", id = TODO_NPC("Tharnariun Treetender"), name = "Tharnariun Treetender",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "patient" }, values = { "healing", "curious" },
  prejudice = { class = "WARLOCK", amount = 11, why = "Druid nursing corrupted bears; blames fel taint for the sickness." },
  notices = { "pet", "form", "lock_taint" },
  impression = {
    first = "He wants a sick bear brought alive, which says most of it.",
    third = "{name} met Tharnariun Treetender, a druid of Auberdine trying to cure the madness spreading through Darkshore's thistle bears.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "My bears are sick with something foul, and you walk in smelling of foulness. Stay back from the cages, because I'll not risk it." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've helped more than you've harmed around Auberdine, I'll give you that. I still keep you away from the cages." },
    { id = "g_bears", text = "Mind the cage, friend; it is empty now, but I hope it will not stay that way for long." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with all your fingers. The bears have not had the better of you yet, I see." },
    { id = "g_hope", when = { questDone = TODO_QUEST("Tharnariun's Hope") },
      text = "The cubs born this spring are calm, friend, every one I have seen. I owe that to you more than to any of my potions." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, friend, and still have all your fingers, I see. The bears have not had the better of you yet." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much since you first helped me with the thistle bears. Strength and gentleness together are rare, so keep both." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk in the village these past days. A healer's work, in its way, and I'm glad of it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Keep your companion away from the thistle bears, and away from anything that foams at the mouth. Whatever this is, I do not know yet whether it passes from beast to beast." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ha, for a moment you gave me a fright! A clear-eyed bear is the finest thing I've seen all week, so stay as you are a moment and let me look at you." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "There is fel in you, more than a novice's dabbling, and it smells exactly like the moss I have been scraping from the bears near the Blackwood camps. I would ask what you have been doing, but I fear you would tell me." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "To heal it, if I can, because a sick bear is a patient and not an enemy. Your spirits will understand that better than most." } },
      choices = {
        { text = "Then I will help you bring one alive, Tharnariun.", next = "BACK", reply = "Bless you, shaman, for the bears have few enough friends on this coast. Bring me one breathing, and we may save the rest.", fx = { align = { light = 1 } } },
        { text = "A sick bear is dangerous. End it.", next = "BACK", reply = "Dangerous, yes, and so is a fever in a child, yet we do not end the child. I need one alive, if you can manage it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them, I'm afraid, for the madness has gone too deep in the worst of them. But I need one alive for my cure, so when you meet them, strike to stop them rather than to finish them, if you can manage it." } },
      choices = {
        { text = "I'll strike to stop them, not to kill.", next = "BACK", reply = "That is exactly what I hoped to hear from a warrior. Stopping is harder than killing, and kinder by far.", fx = { align = { honor = 1 } } },
        { text = "A mad bear is a dead bear. I won't hold back.", next = "BACK", reply = "Then I cannot stop you, and I will not pretend the worst of them are saveable. Only bring me one alive before you are done.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Put down? I want them cured, not killed, if there is any cure to be had. If you're as good with poisons as you say, tell me what makes a bear foam and turn on its own cubs, for that is what I'm chasing." },
      },
      choices = {
        { text = "I'll help you find a cure.", next = "BACK", reply = "Thank you, rogue, and your knowledge of what goes into the blood may be the key. Tell me everything you know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some can't be saved. A quick end is mercy.", next = "BACK", reply = "Some cannot, and I will grant you that much, for I have ended a few myself. But let us find out which ones first.", fx = { align = { light = -1 } } },
        { text = "What's causing the madness?", next = "cause" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "I wondered the same, for there is old Highborne magic in every ruin along this coast. But this smells of fel, not arcane, and fel is worse." },
      },
      choices = {
        { text = "Then I'll help you trace it to its source.", next = "BACK", reply = "Then you may find the Blackwood furbolgs at the end of the trail. Tread carefully, for fel spreads to whoever handles it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel or arcane, I'd still want to study it.", next = "BACK", reply = "Study it from a distance, mage, and with a great deal of care. Fel has a way of studying you back.", fx = { align = { light = -1 } } },
        { text = "Why do you need them alive?", next = "alive" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It might soothe the wounds, but the sickness is in the blood and the land beneath them, and I fear it runs deeper than any one prayer. Still, I would rather you tried than that you did not." } },
      choices = {
        { text = "Every creature deserves healing if I can give it.", next = "BACK", reply = "Then you have a druid's heart under a priest's robe. Lay hands on any bear you find, and I will watch for a change.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to end their suffering cleanly than heal them.", next = "BACK", reply = "Sometimes it is, and I have done it myself with a heavy heart. But let me try a cure before we decide that for all of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Kill the ones that attack you, because I would not ask you to die for a bear, but do not hunt them for sport. Every one you spare is one I might yet heal." } },
      choices = {
        { text = "I'll only fight the ones that come for me.", next = "BACK", reply = "Then the bears will have one more friend on this coast, paladin, and heaven knows they need one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A rabid bear is a danger. I'll clear them out.", next = "BACK", reply = "They are a danger, and I cannot argue that. Only spare the ones who flee from you, for they may still be saved.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Fel moss grows thick near the Blackwood camps, and the furbolgs there have gone the same way the bears are going. I can't prove it yet, which is why I need a sick bear brought to me alive, and not a dead one torn apart by whatever you keep." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Fel moss grows thick near the Blackwood camps, and the furbolgs there have gone the same way the bears are going. My cubs have backed into their pens at the sight of your servant, so leave it here when you go, because I need a sick bear brought to me alive, not torn apart by a demon." },
      },
      choices = {
        { text = "The bears deserve a cure, not a blade.", next = "BACK", reply = "Spoken like one who knows what fel does to a living thing. I will not ask how you came to know it.", fx = { align = { light = 1 } } },
        { text = "A sickness is a sickness. Put the poor beasts down.", next = "BACK", reply = "A sickness can be cured, if someone cares enough to try. I would rather try than give up.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dd_blackwood = {
      lines = {
        { id = "ddb_default", text = "That is the question that keeps me from sleep. The thistle bears' sickness looks nothing like the furbolgs' madness, but both began the same season, and the forest does not usually fall ill twice at once by chance." },
      },
      choices = {
        { text = "Then whoever poisoned them should answer for it.", next = "BACK", reply = "If we ever find them, they will, and I will not stand in the Sentinels' way. Until then I tend what I can.", fx = { align = { order = 1 } } },
        { text = "Heal the bears first. Blame can wait.", next = "BACK", reply = "Spoken like a druid. Yes, the bears first, always, and the hunting of satyrs to those with the stomach for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_blackwood", tags = { "news" }, when = { questDone = TODO_QUEST("The Blackwood Corrupted") }, text = "Thundris showed me the satyr's work you uncovered in the Blackwood camps, the poisoned food and the rest. So the furbolgs were made sick by a hand and not by the land, and that changes how I think of the bears as well." },
        { id = "h_default", key = true,
          text = "I am Tharnariun Treetender. The thistle bears of Darkshore have gone mad, and not with ordinary rage, for they foam and stagger and turn on their own cubs. I have tended these forests since the old days, and I mean to learn what is doing it and cure it if I can." },
        { id = "h_plagued", tags = { "news" }, when = { questActive = TODO_QUEST("Plagued Lands") },
          text = "Take the trap and bring me a rabid thistle bear, alive and caged, because a dead one tells me only how it died. Be gentle with it if you can, though I know it will not return the favour." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing of the Infected") },
          text = "The bear you caught confirmed my fear: the sickness spreads, and those too far gone cannot be brought back. Thin their numbers before the healthy bears catch it, and forgive me for asking it of you." },
        { id = "h_hope", tags = { "news" }, when = { questActive = TODO_QUEST("Tharnariun's Hope") },
          text = "The Den Mother is the heart of it, for she bears the sick cubs and the sick cubs grow into sick bears. End her, and Darkshore's bears may have a generation that is born whole." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and welcome. You will feel it when you take the bear's shape near them, a sour note under the skin, and I would like to know if it feels the same to you as to me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The thistle bears will come at you foaming, and I'd ask you to remember that they're sick, not savage." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Then you may understand that a sick bear is still a patient, even if it is a patient that wants to tear your arm off." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I hope your order spares creatures as readily as it spares people, because the bears here never chose their madness." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Whatever is poisoning my bears, your kind has poisoned better forests than this one. Say your business from where you stand." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. The bears don't growl at you as much as they did, and nor do I. What is it?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep whatever trails you well back from my bears. Whatever is souring their blood smells a good deal like it." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Thistle Bear", min = 20 } },
          text = "You've put down a good many of the thistle bears, I hear, and I'll not scold you, because a mad bear is a danger to everyone. But one brought to me alive could teach me more than a hundred carcasses." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The thistle bears are sick, and I want one brought to me alive, so perhaps your spirits could calm it where my potions cannot." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time while the potion steeps." },
        { id = "h_again2", text = "Go on, friend; the bears will still be mad when we finish talking." },
        { id = "h_again3", text = "Ask away. A healer's work is half waiting in any case." },
      },
      choices = {
        { text = "If the furbolgs were poisoned, could the bears have been too?", next = "dd_blackwood", when = { questDone = TODO_QUEST("The Blackwood Corrupted") } },
        { text = "What's making the bears mad?", next = "cause" },
        { text = "Why take a bear alive?", next = "alive" },
        { text = "Is anyone else in Auberdine chasing this sickness?", next = "terenthis_t" },
        { text = "I've felt that sour note in bear form myself.", next = "druid_th", when = { class = "DRUID" } },
        { text = "Could my companion catch the sickness?", next = "hunter_th", when = { class = "HUNTER", pet = { named = true } } },
        { text = "I caught you a bear. What did you learn?", next = "caught", when = { questDone = TODO_QUEST("Plagued Lands") } },
        { text = "I've poisons that could put a mad bear down quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Arcane magic could be behind the bears' madness.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Must I kill the thistle bears, Tharnariun?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a priest's healing touch the sickness in the bears?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should I kill the maddened bears, or leave them be?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think something darker made the bears sick?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do you want a sick bear alive, Tharnariun?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll see what I can do.", next = "END", fx = { affinity = 1, standing = { auberdine = 1 } } },
      },
    },
    cause = {
      lines = {
        { id = "c_default", text = "I do not know yet, and I will not guess aloud, because guesses spread faster than sickness. It came from the north and east, as everything wrong in Darkshore seems to, and it moves through the bears the way fever moves through a crowded house." },
      },
      choices = {
        { text = "Could it be what's turning the furbolgs?", next = "cause2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cause2 = {
      lines = {
        { id = "c2_default", text = "Terenthis thinks so, and I think he wants it to be, because one enemy is easier to fight than two. The bears do not eat the moss as the furbolgs do, so I am not yet sure he is right." },
      },
      choices = {
        { text = "Then keep looking until you're sure.", next = "cause3" },
        { text = "Something else.", next = "BACK", fx = { learn = { "fel_moss" } } },
      },
    },
    cause3 = {
      big = true,
      lines = {
        { id = "c3_default", text = "I will, though the bears cannot wait for me to be sure. That is what keeps me awake, friend: sometimes I must act on half an answer, and put down creatures I would rather have saved." },
      },
      choices = {
        { text = "Save every one you can, whatever it costs.", next = "BACK", reply = "Whatever it costs, yes, and I will pay my share. Thank you for believing it can be done.", fx = { align = { order = -1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Put down the sick ones and protect the rest.", next = "BACK", reply = "That may be what we come to, and I will not pretend otherwise. But not before I have tried everything else.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    alive = {
      lines = {
        { id = "a_default", text = "Because I cannot cure what I have only seen through the brush. I need to watch the sickness work, day by day, and see what eases it and what makes it worse." },
      },
      choices = {
        { text = "Isn't that cruel to the bear?", next = "alive2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive2 = {
      lines = {
        { id = "a2_default", text = "It is, a little, and I do not pretend otherwise. But one bear in a cage for a season may spare a hundred bears in the hills, and I sit with it every evening so it is not alone." },
      },
      choices = {
        { text = "One suffering for a hundred is a fair bargain.", next = "BACK", reply = "It is a fair bargain, and a cruel one, and I hate myself a little for making it. The bear will be cared for.", fx = { align = { light = -1 } } },
        { text = "Then make its cage as gentle as you can.", next = "BACK", reply = "I will, as gentle as I know how, and I will sit with it every night. That is my promise to the bear.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    terenthis_t = {
      lines = {
        { id = "t_default", text = "Terenthis and I share a moonwell and an argument. He burns moss in the hills and I brew cures by the shore, and each of us thinks the other is a little too slow. Gwennyth, the priestess on the beach, has her dead sea creatures too." },
        { id = "t_heard", when = { heardLine = "terenthis.h_default" },
          text = "You've heard him already, then, and he's told you the furbolgs are sick rather than evil. He's right, and I'd say the same of my bears, though I would say it more quietly." },
      },
      choices = {
        { text = "Gwennyth's sea creatures are dying too.", next = "gwennyth_t" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gwennyth_t = {
      lines = {
        { id = "gt_default", text = "I've walked the shore with her once or twice, and I could not tell her why they die. Bears and threshers and turtles, all at once; it is too much for one sickness, and too much for chance." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    caught = {
      lines = {
        { id = "ca_default", text = "That the sickness lives in the blood and grows worse in the dark of the moon, which I would never have learned from a corpse. The bear sleeps more quietly with the potion, though she is not cured, and she may never be." },
      },
      choices = {
        { text = "Then the potion is a start.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_th = {
      lines = {
        { id = "dt_default", text = "Then it is not my imagination, and that is worth more to me than you know. Tell me, did it feel like poison, or like something calling to you from a long way off?" },
      },
      choices = {
        { text = "Like poison. Something in the blood.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Like a call. I didn't like it.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    hunter_th = {
      lines = {
        { id = "ht_default", text = "I do not know, and I would rather not find out on {pet}. Keep it from fighting the rabid ones tooth to tooth, and if it ever starts to foam, bring it to me at once, whatever the hour." },
      },
      choices = {
        { text = "I will. Thank you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know bears better than I know people, but I listen to both. Ask, and I'll answer what I can." },
    },
    background = { { id = "tp_bg", text = "I am a druid of the Circle, and I tend the beasts of this shore. Lately that means tending sick ones, and washing bear froth off my sleeves twice a day." } },
    advice = { { id = "tp_ad", text = "If a bear foams at the mouth, do not let it close on you, and wash any bite in the moonwell before you sleep." } },
    furbolgs = { { id = "tp_furbolgs", text = "Terenthis has the furbolgs and I have the bears, and I would not trade with him for anything." } },
    fel_moss = { { id = "tp_moss", text = "The bears do not eat it, so far as I can see, and that is why I doubt it is the whole story." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle taught me that every beast has its place, even the ones I must put down. I try to remember it on the bad days." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The beasts of this shore were never meant to sicken like this. I've walked the Dream to look for the cause, and found only more questions, so I came back to wash bears." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the only furbolgs left untouched, up in Felwood. If ours ever recover, I'd want them to recover into something like that." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight keeps the Dream, and the Dream keeps the beasts, in its way. If the dragons are troubled, I'd expect the bears to feel it first." } },
    blackfathom = { { id = "tp_blackfathom", text = "The cult in Blackfathom poisons the water, and the beasts drink the water. I don't need a druid's wisdom to see where that ends." } },
    _none = { { id = "tp_none", text = "I could not tell you, friend. Ask me about bears, and I'll talk until you beg me to stop." } },
  },
}

P:NPC {
  key = "elissa", id = TODO_NPC("Sentinel Elissa Starbreeze"), name = "Sentinel Elissa Starbreeze",
  bible = "bibles/auberdine.md", role = "soldier", tier = "quest",
  communities = { "auberdine" }, temper = { "brisk" }, values = { "dutiful", "fair" },
  notices = { "race", "class", "lock_eyes" },
  impression = {
    first = "She counts crates the way other Sentinels count arrows.",
    third = "{name} met Sentinel Elissa Starbreeze, who keeps Auberdine's stores and its ties to the paladins at Maestra's Post.",
  },

  greetings = {
    { id = "g_stores", text = "Ishnu-alah. If you're here about supplies, speak quickly, and if you're carrying any, put them down gently." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. Everything you've carried for us has arrived whole, and the couriers before you lost a crate a week to the murlocs." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human! Delgren's company has taught me that your people keep their promises, so I'll assume you keep yours until you prove otherwise." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, like Delgren the Purifier's company. They came across the sea to fight our demons, and I have not forgotten it." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { class = "WARLOCK", aura = { 132, 2970, 11743 } },
      text = "You are watching the shadows behind the boats where the cultists like to wait, and I think you see more there than I do. I will not ask what lends you that sight, so long as you tell me what it shows you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We never get enough, but we manage, and a shaman's help is counted gladly. If your spirits could keep the damp off the crates, I'd count that too." } },
      choices = {
        { text = "Count me among the help, Elissa.", next = "BACK", reply = "Then you are counted, shaman, and gladly. You're the first line in my tally I've smiled at all week.", fx = { align = { order = 1 } } },
        { text = "Supplies are someone else's worry.", next = "BACK", reply = "They are mine, and I would not wish them on anyone else. Still, every crate helps the Sentinels.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Herbs and linen, mostly, and more clean water than you would think, because every sick creature they bring back to the village has to be washed and fed. I keep a careful tally, since the Circle asks for more each month and Darnassus sends less." } },
      choices = {
        { text = "Keep your tally. Fair shares keep a village alive.", next = "BACK", reply = "They do, and I am glad someone understands it. You'd be amazed how many travellers think my crates refill themselves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sick need what they need. Give it without counting.", next = "BACK", reply = "I wish I could, druid, but the stores run out faster than you would think. I give what I can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Better than I expected, and they hold against the Dark Strand with a stubbornness I've come to admire. They need blades more than prayers in Ashenvale, so if you're going south, carry their supplies and stay a while." } },
      choices = {
        { text = "I'll carry the supplies and stand with them.", next = "BACK", reply = "Then they will be glad of both, warrior, and so will I. Delgren's people have more crates than hands to guard them.", fx = { align = { honor = 1 } } },
        { text = "I'll carry the crates. The fighting's their business.", next = "BACK", reply = "That is more than most offer, and I am grateful for it. A hungry Sentinel shoots wide.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Meat for the stores, hides for the Sentinels' winter gear, and the threshers kept away from the fishing boats. I count everything that comes in, so if you bring it, I'll know exactly whose it was." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Meat for the stores, hides for the Sentinels' winter gear, and the threshers kept away from the fishing boats. Your {pet} has its own entry in my head now, I'm afraid. Everything that comes through Auberdine gets counted, and that includes beasts that eat from its stores." },
      },
      choices = {
        { text = "I'll supply Auberdine before I sell anywhere else.", next = "BACK", reply = "Then Auberdine will be grateful, hunter, and so will the Sentinels in winter. Every hide counts.", fx = { align = { honor = 1 } } },
        { text = "I sell to whoever pays the most.", next = "BACK", reply = "Then I hope Auberdine pays well enough, because we need you. I will not beg.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They would, if I were not sitting on them, which I am, day and night. If you're so good at lifting, lift something from the Dark Strand and bring it to Delgren at Maestra's Post." },
      },
      choices = {
        { text = "I'll bring it straight to Delgren.", next = "BACK", reply = "Good. Delgren will be glad of it, and I can strike one worry off my list.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take it, and keep the best for myself.", next = "BACK", reply = "Then bring the rest to Delgren, at least, and I will not ask about the best. The Dark Strand will not miss it.", fx = { align = { honor = -1 } } },
        { text = "Who are the Dark Strand?", next = "strand" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I am sure you do, and that is exactly why Delgren would want you in irons rather than in his camp. If you want to be useful, tell me where they meet, and then go somewhere the Sentinels are not." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "I am sure you do, and you bring the proof of it with you, standing there at your shoulder for every Sentinel to see. Delgren would want you in irons for less, so tell me where they meet, and then take that creature somewhere the Sentinels are not." },
      },
      choices = {
        { text = "I'll tell you everything, and fight them too.", next = "BACK", reply = "Then Delgren may yet be glad of you. Tell me everything, and fight well.", fx = { align = { light = 1 } } },
        { text = "Their methods aren't wrong, only their masters.", next = "BACK", reply = "Their masters are the whole of what is wrong with them. Be careful whose methods you share.", fx = { align = { light = -1 } } },
        { text = "Who are Delgren and his paladins?", next = "delgren_e" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Always, for linen and salves go out with every patrol and come back stained or not at all. If you have the gift of healing, spend it here before you spend it in the woods, because the Sentinels are what holds this coast." } },
      choices = {
        { text = "Then I'll tend the patrols before I go anywhere.", next = "BACK", reply = "Then I will tell the patrols you are coming, priest. Half of them have been binding their own wounds with sailcloth.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've my own road. The Sentinels manage without me.", next = "BACK", reply = "They do, after a fashion, and they will go on managing. I only wish they did not have to.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well enough, so long as each keeps to its own orders, and Delgren keeps to his very carefully. Some of my sisters still mistrust humans with hammers, but I count crates, and the crates from Stormwind have always arrived." } },
      choices = {
        { text = "Then we'll keep our word, as Delgren has.", next = "BACK", reply = "Delgren keeps his word, and I will be glad to see you do the same. The village needs it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to the Light, not to Sentinel orders.", next = "BACK", reply = "Then the Light had better speak kindly of Sentinels, paladin. We will be watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Water is what we're always short of, because the barrels from Rut'theran go stale on the crossing and the Darkshore streams aren't to be trusted since the groves soured. Delgren's humans at Maestra's Post have a mage or two of their own, and I'll admit I envy them for it." },
      },
      choices = {
        { text = "Then I'll help where I can, Sentinel.", next = "BACK", reply = "Then start at the well by the inn, and the Sentinels will thank you. They drink more than you'd think, for people who barely sweat.", fx = { align = { order = 1 } } },
        { text = "I'm no water-carrier. I came here to fight.", next = "BACK", reply = "Then fight, and I will find someone else to carry water. The Dark Strand will be glad of you.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dd_strand = {
      lines = {
        { id = "dds_default", text = "Fewer, but not gone, and they are not common bandits. They whisper of old powers at the Tower of Althalaxx, and some among them are our own kind, kaldorei who have turned their backs on Elune for promises in the dark." },
      },
      choices = {
        { text = "Kaldorei among them? That's a bitter thing.", next = "BACK", reply = "Bitter, and shameful. The Highborne made the same choice once, and the whole world paid for it. Keep your blade ready." },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_strand", tags = { "news" }, when = { killed = { name = "Dark Strand", min = 30 } }, text = "My scouts say the Dark Strand cultists along the coast have lost a great many of their number, and that the bodies all fell to the same blade. I would rather that blade stayed in Darkshore a while longer, {class}." },
        { id = "h_default", key = true,
          text = "I am Sentinel Elissa Starbreeze. I keep Auberdine's stores, and I keep our accounts with Maestra's Post in Ashenvale, where Delgren the Purifier and his paladins hunt the Dark Strand, those Highborne-hearted fools." },
        { id = "h_supplies", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies to Auberdine") },
          text = "Supplies from Maestra's Post? Delgren is generous, and Auberdine is grateful. A human paladin sending aid to elves across a forest is something my grandmother would never have believed." },
        { id = "h_after", when = { questDone = TODO_QUEST("Supplies to Auberdine") },
          text = "Delgren's crates went out to the watch posts the same day you brought them. Tell him, if you pass that way, that Auberdine does not forget a kindness." },
        { id = "h_tower", when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "You're working with Balthule at the Tower of Althalaxx, I hear. Be wary there, because warlocks who hole up in an old tower have usually had time to set traps." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Delgren's paladins could use more of your kind at Maestra's Post, and I could use help getting their supplies there." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I keep lists of everything Auberdine needs, and half of it comes in on a hunter's back." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Your bandages and your prayers are both in short supply on this coast, and I would be glad of either." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Delgren's people have been fair partners at Maestra's Post, so I will treat you as fairly as they have treated us." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. Your people ask my stores for more herbs and bandages every month, so I hope you have come to tell me the groves are mending." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. If you can conjure water, I'll put you to better use than most adventurers who come through, though I suppose you'll want to be off killing something." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I count crates and the help that comes with them, as the Sentinels have always counted, so tell me whether you'll be one I count." },
      },
      again = {
        { id = "h_again", text = "What else? I've three crates to count before the Moonspray comes in." },
        { id = "h_again2", text = "Go on, I'm listening, though I'm counting too." },
      },
      choices = {
        { text = "The Dark Strand are fewer now, Sentinel.", next = "dd_strand", when = { killed = { name = "Dark Strand", min = 30 } } },
        { text = "Tell me about Delgren's company.", next = "delgren_e" },
        { text = "Who are the Dark Strand?", next = "strand" },
        { text = "Auberdine's stores must run short, this far out.", next = "short" },
        { text = "My people sent those paladins. Do you trust us?", next = "human_e", when = { race = "Human" } },
        { text = "Glynda says the Sentinels are stretched thin.", next = "thin_e", when = { heardLine = "glynda.h_default" } },
        { text = "Your stores would be easy to lift, Sentinel.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the humans at Maestra's Post fight well, Sentinel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does Auberdine need from its hunters, Sentinel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Dark Strand bargain with the Legion. I know how they think.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do Auberdine's stores run short of healing supplies?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How do the Sentinels and the Silver Hand work together?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the druids need from your stores, Sentinel?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a mage be useful to your stores, Sentinel?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you get enough supplies in Auberdine, Elissa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Elune keep you.", next = "END", fx = { standing = { auberdine = 1 } } },
      },
    },
    delgren_e = {
      lines = {
        { id = "de_default", text = "Humans of the Light who came to help us against demons and the walking dead, and found warlocks in our forest instead. I didn't expect much of them, and they have been better allies than I deserved to have doubted." },
      },
      choices = {
        { text = "Why did you doubt them?", next = "delgren_e2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delgren_e2 = {
      lines = {
        { id = "de2_default", text = "Because outsiders who come to help usually want something, and I have been a Sentinel a long time. Delgren wants nothing but to see the cult broken, so far as I can tell, and I've stopped looking for the catch." },
      },
      choices = {
        { text = "Some people simply want to help.", next = "BACK", reply = "Some do, and I am trying to believe it of Delgren. It is not easy after so long.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Keep looking. Everyone wants something.", next = "BACK", reply = "I will, and I always have. It's how I've kept Auberdine's stores from walking off.", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    strand = {
      lines = {
        { id = "s_default", text = "A cult of warlocks, holed up in the Tower of Althalaxx out in the hills. Balthule Shadowstrike watches them for Delgren, and Feero Ironhand carries word between his camp and ours." },
      },
      choices = {
        { text = "Why here, of all places?", next = "strand2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_strand" } } },
      },
    },
    strand2 = {
      big = true,
      lines = {
        { id = "s2_default", text = "Darkshore is full of old Highborne stones that still remember magic, and a cult hungry for power would come to them like flies to a wound. I'd tear every one of those ruins down myself, but the elders call them our history." },
      },
      choices = {
        { text = "Tear them down. History won't stop a warlock.", next = "BACK", reply = "Perhaps they should come down, and I have thought it myself. But the elders would never allow it.", fx = { align = { order = 1 }, learn = { "dark_strand" } } },
        { text = "Keep them. Guard them better instead.", next = "BACK", reply = "That is what the elders say, and they may be right. But guarding them takes Sentinels we do not have.", fx = { align = { order = -1 }, learn = { "dark_strand" } } },
      },
    },
    short = {
      lines = {
        { id = "sh_default", text = "Arrows, bandages and patience, in that order. The Bravery brings us dwarven iron and the Moonspray brings us Darnassus's blessings, but neither brings enough of the first two." },
      },
      choices = {
        { text = "I'll bring what I can find.", next = "BACK", fx = { affinity = 1, standing = { auberdine = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_e = {
      lines = {
        { id = "hu_default", text = "I trust Delgren, and I'm learning to trust the rest of you one crate at a time. That's more than many of my sisters would say, so take it as the compliment it is." },
      },
      choices = {
        { text = "I'll earn the rest of it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    thin_e = {
      lines = {
        { id = "te_default", text = "Thinner, because Glynda counts only the Sentinels she can see. I count the ones on the road to Ashenvale and the ones riding guard on the Bravery as well, and there are never enough of any of them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything that comes into Auberdine passes my tally, and gossip comes in with the crates. Ask." },
    },
    background = { { id = "tp_bg", text = "I am a Sentinel who counts things. Someone has to, and I'm better at it than at poetry." } },
    advice = { { id = "tp_ad", text = "Carry more bandages than you think you need, because Darkshore has a way of using them up." } },
    dark_strand = { { id = "tp_strand", text = "Warlocks in the Tower of Althalaxx, and Delgren's paladins after them. I hope he gets there first." } },
    sentinels = { { id = "tp_sent", text = "We guard the village, the road and the boats, and we are never quite enough for all three." } },
    blackfathom = { { id = "tp_blackfathom", text = "I've counted Twilight's Hammer patrols on the road south to Blackfathom, and the number goes up every month. How many wait inside, I leave to braver scouts than me." } },
    theramore = { { id = "tp_theramore", text = "I log every Theramore ship that docks, crew and cargo. They're always correct, which makes me trust them more than I'd like to admit." } },
    warsong = { { id = "tp_warsong", text = "The Warsong in Ashenvale aren't my count, but I keep an ear on the numbers. They're growing too." } },
    forsaken = { { id = "tp_forsaken", text = "There are reports of undead sailors on the coast now and then. I count those twice, and I count them with my bow." } },
    _none = { { id = "tp_none", text = "That's not in my tally, I'm afraid. Ask Thundris, for he hears everything sooner or later, and he forgets nothing." } },
  },
}

P:NPC {
  key = "caylais", id = TODO_NPC("Caylais Moonfeather"), name = "Caylais Moonfeather",
  title = "Hippogryph Master",
  bible = "bibles/auberdine.md", role = "flightmaster", tier = "service",
  communities = { "auberdine" }, temper = { "cheerful" }, values = { "dutiful", "kind" },
  notices = { "race", "lock_steed" },
  impression = {
    first = "The sea wind worries her more than anything on the ground.",
    third = "{name} met Caylais Moonfeather, who keeps the hippogryphs at Auberdine.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah! The birds are fed and rested, so if you're flying, go now, before the big grey one starts sulking again." },
    { id = "g_wind", when = { timeOfDay = "night" }, text = "The night wind off the sea is cold up there, so wrap up before you go, and trust the bird." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Off the Bravery, are you? Don't worry, a hippogryph flies smoother than any gryphon, or so I'm told by every dwarf who has turned green on one." },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "Please leave your burning horse at the foot of the roost, because the big grey one has already seen it and is pretending to be dead. I have only just got him eating again since the last warlock." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are restless, yes, because something on this coast unsettles them. Perhaps your spirits could calm them." } },
      choices = {
        { text = "Then I will help calm them, Caylais.", next = "BACK", reply = "Thank you, shaman. They have been restless for weeks, and two of them have stopped eating.", fx = { align = { order = 1 } } },
        { text = "Restless birds fly faster.", next = "BACK", reply = "They do, but they also throw riders, and I would rather they were calm. Help me, if you can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, and back again with fewer of them, because the Warsong have been cruel in Ashenvale this season. I give the warriors my calmest birds on the way south, because they'll need to be calm when they land." } },
      choices = {
        { text = "Then send me south. Astranaar needs blades.", next = "BACK", reply = "Then I will send you south with the next flight. Astranaar loses Sentinels to the orcs every week.", fx = { align = { honor = 1 } } },
        { text = "I'll go south when the pay is worth it.", next = "BACK", reply = "Then you may wait a long time, warrior. Astranaar pays in gratitude, mostly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They fish, mostly, out over the water at dawn, and they'll take a crab off the beach if nobody stops them. The sea wind has been strange this season, though, and they come back tired, which worries me more than any beast on land." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They fish, mostly, out over the water at dawn, and they'll take a crab off the beach if nobody stops them. Your {pet} should stay on the ground while my birds are landing. A hippogryph coming down hard doesn't look where it puts its talons." },
      },
      choices = {
        { text = "I'll keep my companion clear of the roost.", next = "BACK", reply = "Thank you, hunter. The last wolf that wandered under the roost is still limping.", fx = { align = { order = 1 } } },
        { text = "My companion can look after itself near birds.", next = "BACK", reply = "It can, but the birds may not let it. Keep it close, please.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "My hippogryphs carry anyone who pays and doesn't kick them, and they see everything, whatever the passenger would prefer. The Sentinels at Rut'theran ask me who flies, and I tell them." },
      },
      choices = {
        { text = "Good. I've nothing to hide.", next = "BACK", reply = "Good. They can smell a nervous rider, you know, and they make the flight as rough as they can.", fx = { align = { honor = 1 } } },
        { text = "Then I'll make sure they don't recognise me.", next = "BACK", reply = "They will, rogue, sooner or later. They never forget a face.", fx = { align = { honor = -1 } } },
        { text = "Are the flights safe?", next = "safe" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Your spell takes you to the human cities and nowhere near the places that matter here, so I think you'll need my birds after all. They don't like the smell of magic much, so be gentle when you mount." },
      },
      choices = {
        { text = "I'll be gentle with them.", next = "BACK", reply = "Thank you, mage. They remember a kind rider, and you'll find they fly smoother for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll learn to like it.", next = "BACK", reply = "They will not, and neither will you. Be gentle, please.", fx = { align = { order = -1 } } },
        { text = "What are your birds like?", next = "birds" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, when one flies too low over the Blackwood or a storm catches it off the coast. I mend what I can, but I'd welcome a priest's hands on a wing that won't set right." } },
      choices = {
        { text = "I'll look at any bird that needs it.", next = "BACK", reply = "Thank you, priest. The grey one has a wing that never set right, if you could look at it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I tend people, not hippogryphs.", next = "BACK", reply = "Then I will tend them myself, as I always have. They are not so different from people.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone has to watch the roads below them, because a hippogryph can't land where the furbolgs are waiting. If you clear the ground, I'll keep the sky." } },
      choices = {
        { text = "Then I'll keep the roads clear for your birds.", next = "BACK", reply = "Thank you, paladin. The furbolgs threw stones at a landing bird last week, and she nearly lost a rider.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The skies can guard themselves. I've other duties.", next = "BACK", reply = "Then the birds will manage, as they always have. But they would be grateful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll carry you, but not that thing of yours, and I'd ask you to send it off before you even reach the roost. A hippogryph that panics over open water is worse than any storm, and I've the sea wind to worry about already." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'll carry you, but not your servant, and I can already hear them stamping in the roost with it standing here. Dismiss it now, please, because a hippogryph that panics over open water is worse than any storm, and I've the sea wind to worry about already." },
      },
      choices = {
        { text = "I'll send it off. The birds come first.", next = "BACK", reply = "Thank you. I've seen a panicked hippogryph break a rider's arm in two places.", fx = { align = { honor = 1 } } },
        { text = "They'll get used to it, or they'll learn.", next = "BACK", reply = "They will not, I am afraid, and you will be walking. Dismiss it, please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_fall = {
      lines = {
        { id = "ddf_default", text = "Never with a rider who holds on, and I've flown the route to Rut'theran more times than I can count. Most falls happen on Darkshore's cliffs, from people who think they can climb down faster than they can walk around." },
      },
      choices = {
        { text = "That sounds like something I'd do.", next = "BACK", reply = "Then take the long way round, and arrive alive. The cliffs will still be there tomorrow." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You've fallen from a height before, haven't you? You eye the hippogryphs as if they might drop you over the sea. They won't, so long as you hold on and don't try to climb down early." },
        { id = "h_default", key = true,
          text = "I am Caylais Moonfeather, and these are my hippogryphs. They'll carry you over the water to Rut'theran Village or south to Astranaar, and farther once you've walked the roads and they know where you mean to go." },
        { id = "h_back", when = { metBefore = true },
          text = "Back for another flight? Feather-in-the-Mist has been looking for you; she remembers riders who don't kick." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My birds grumble about plate, and one of them bites, so hold still on the crossing and let them carry it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. My birds have watched your companion since you climbed the rise, and I think they're deciding whether it's prey." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The birds are calmer around healers, I find, and they've had little enough calm this season." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be heavy in the saddle, but my birds have carried worse, and they'll carry you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My birds have gone stiff in the feathers since you came up, and they only do that when the wind carries something they don't like." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My hippogryphs have moods like the weather over the sea, so perhaps your wind spirits will understand them better than I do." },
      },
      again = {
        { id = "h_again", text = "Anything else, or shall I saddle a bird?" },
        { id = "h_again2", text = "Ask away; they won't mind waiting a little longer." },
      },
      choices = {
        { text = "I've fallen before. Are your hippogryphs ever careless?", next = "dd_fall", when = { deathCause = "falling" } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What are the hippogryphs like?", next = "birds" },
        { text = "Flying seems a risky way to travel.", next = "safe" },
        { text = "I've never ridden a hippogryph. Any advice?", next = "first", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "I could swim to Rut'theran in seal form, you know.", next = "druid_c", when = { class = "DRUID", minLevel = 16 } },
        { text = "Do your hippogryphs carry passengers who'd rather not be seen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could teleport home, but your birds are lovely.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs carry warriors to Astranaar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your hippogryphs hunt on their own, Caylais?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your hippogryphs ever come back hurt?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it a paladin's place to guard the flight paths?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will your hippogryphs carry me, Caylais, or only some of us?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are your hippogryphs troubled lately, Caylais?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    birds = {
      lines = {
        { id = "b_default", text = "Proud and clever and moody as autumn, all of them. They're the forest's own creatures, so they don't care for the salt here, but they put up with it for my sake." },
      },
      choices = {
        { text = "Do they ever refuse to fly?", next = "birds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds2 = {
      lines = {
        { id = "b2_default", text = "When the moonkin are restless on the eastern ridge, yes, and I've stopped arguing with them about it. Whatever has maddened those poor creatures, the birds can smell it on the wind." },
      },
      choices = { { text = "I'll trust their noses, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "Safer than the road, at least. Nothing in Darkshore flies high enough to trouble a hippogryph, though I'd keep my eyes open over Ashenvale, where the Horde has started looking up." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Sit tall, hold the harness and not the feathers, and don't look down until you're over the water. If you're going to be sick, lean left, because the bird hates it on her right wing." },
      },
      choices = {
        { text = "Left. I'll remember.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "I'll manage.", next = "BACK" },
      },
    },
    druid_c = {
      lines = {
        { id = "dr_default", text = "You could, and the sharks in the channel would thank you for it. Race my birds there one day, and I'll put a silver on them to beat you by an hour." },
      },
      choices = { { text = "You're on.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise hippogryphs and send them where they're needed. There's not much more to me than feathers." } },
    advice = { { id = "tp_ad", text = "Never fly hungry and never fly angry, and that goes for the bird as well as for you." } },
    nordrassil = { { id = "tp_nordrassil", text = "My birds came from Hyjal's aeries, and on clear days they look north for it. Hippogryphs never quite forget where they hatched." } },
    theramore = { { id = "tp_theramore", text = "Theramore's too far south for my birds, so I send folk down to the ships. Hippogryphs don't love salt air." } },
    everlook = { { id = "tp_everlook", text = "I've flown north to Everlook once, and the goblins there tried to buy my bird. I'll not be flying north again." } },
    _none = { { id = "tp_none", text = "I only know the sky, friend. Ask someone with their feet on the ground and their eyes off the moon." } },
  },
}
