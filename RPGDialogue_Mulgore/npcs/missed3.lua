-- Bloodhoof Village's teachers the roster scan found unwritten: Chaw Stronghide (leatherworking) and
-- Yonn Deepcut (skinning), who share a lodge, Vira Younghoof (bandages), Reban Freerunner (pet trainer),
-- and Vorn Skyseer, who welcomes newcomers. Forever: Chaw, Yonn and Vira each end a Camping 101 quest
-- from Kaga Wildhoof. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Chaw Stronghide: leatherworking trainer at Bloodhoof Village. Forever: Camping 101: Leatherworking.
---------------------------------------------------------------------------
P:NPC {
  key = "chaw_stronghide", id = TODO_NPC("Chaw Stronghide"), name = "Chaw Stronghide", title = "Leatherworking Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "patient" }, values = { "craft", "tradition" },
  notices = { "craft", "class" },
  impression = {
    first = "Chaw Stronghide sits among stretched hides in a lodge at Bloodhoof Village, working an awl through leather as thick as his thumb. He talks while he stitches, and he never once looks down at the needle.",
    third = "{name} met Chaw Stronghide, the leatherworking trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Come in and mind the frames, {class}. If you have brought hides, lay them where I can see the grain." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, so show me your last seam before you ask me for the next lesson." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have the stained fingers of the craft already. Good, for it means I may skip the part where I explain which side of the hide is the outside." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin your own kills, I see. Yonn beside me will sharpen that skill, and then I will show you what to do with what you bring home." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Chaw Stronghide, and I teach the working of leather to any who will sit still for it. Yonn Deepcut here takes the hide off the beast, and I see that it is put to a use worthy of the beast." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Leatherworking") }, text = "Kaga Wildhoof has sent you from her camp, I take it, as she does every traveller with a needle. Show me that you can work a hide and I will show you what a leatherworker adds to a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Leatherworking") }, text = "How does the camp fare with a leatherworker's hand in it? Keep the stitching dry, and it will serve you through many seasons on the trail." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk as long as the thread lasts." },
        { id = "h_again2", text = "Ask, and hand me that awl while you do." },
      },
      choices = {
        { text = "What can a leatherworker add to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Leatherworking") } },
        { text = "What does leather mean to the tauren?", next = "leather" },
        { text = "You and Yonn work side by side.", next = "yonn" },
        { text = "What makes a seam hold?", next = "seam" },
        { text = "I'd learn what you teach.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "A camp is a fire until a crafter sits down at it, and after that it becomes whatever the crafter knows how to make. Hide keeps the rain off and the wind out, and a traveller who can stitch it never has to sleep cold.", fx = { learn = { "camping" } } } },
      choices = {
        { text = "Did the tribe camp that way in the old days?", next = "camp_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_old = {
      lines = { { id = "co_default", text = "Every night of my youth was spent that way, with the tents down at dawn and up again at dusk, and the hides carried on kodo-back between. Kaga's camping is a game to the young, but it is our whole history played small, and I am glad she teaches it." } },
      choices = { { text = "Then I'll learn it properly. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    leather = {
      lines = { { id = "l_default", text = "It is our roof, our clothing, our drums and the covers of our lore, and all of it was once a living thing that the Earth Mother gave into our keeping. To work it badly is to waste a life, and I do not let my students forget that.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "That's a heavy thing to lay on a student.", next = "leather_heavy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_heavy = {
      lines = { { id = "lh_default", text = "It is, and it should be. My first master made me wear the first vest I ever stitched for a whole winter, and I thought about that kodo every time the wind found a gap in it." } },
      choices = {
        { text = "Did the second vest fit better?", next = "leather_second" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_second = {
      lines = { { id = "ls_default", text = "The second fit so well that I wore it until I outgrew it, and then my sister wore it after me. That is the whole of the craft, young one, for you make a thing well enough that it outlasts your need of it." } },
      choices = { { text = "A good measure. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yonn = {
      lines = { { id = "y_default", text = "We have shared this lodge for many seasons, and we have shared one argument for all of them. He says a hide is ruined or saved by the first cut, and I say by the last stitch, and so each of us blames the other when a student's work goes wrong." } },
      choices = {
        { text = "I'd say the first cut matters most.", next = "BACK", when = { profession = "Skinning" }, reply = "Then you have been listening to Yonn, and I will forgive you for it once your stitching improves." },
        { text = "Something else.", next = "BACK" },
      },
    },
    seam = {
      lines = { { id = "s_default", text = "Good thread helps, which Wunna Darkmane sells, and so does even spacing, which no one can sell you. Mostly it is patience, because a seam that was hurried will open at the worst moment the plains can find." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Stronghide have made the tents and harness of the Bloodhoof for generations, and I have taught the craft since we settled by the lake." } },
    camping = { { id = "tp_camping", text = "Kaga Wildhoof has the young ones making camps outside the village, and she sends the crafters among them to us to learn their part." } },
    earth_mother = { { id = "tp_em", text = "She gives the beast and the beast gives the hide, and I am only the last pair of hands in a long giving." } },
    advice = { { id = "tp_adv", text = "Cut once and stitch twice, and never stitch when you are angry." } },
    _none = { { id = "tp_none", text = "That is not a thing I can stitch an answer to, so ask an elder." } },
  },
}

---------------------------------------------------------------------------
-- Yonn Deepcut: skinning trainer at Bloodhoof Village. Forever: Camping 101: Skinning.
---------------------------------------------------------------------------
P:NPC {
  key = "yonn_deepcut", id = TODO_NPC("Yonn Deepcut"), name = "Yonn Deepcut", title = "Skinning Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "dry" }, values = { "respect", "skill" },
  notices = { "craft", "class" },
  impression = {
    first = "Yonn Deepcut keeps a row of knives on a hide beside him in a Bloodhoof lodge, each one honed until the edge all but disappears. He tests a blade on the hair of his own forearm and speaks with the dry calm of a tauren who is never rushed.",
    third = "{name} met Yonn Deepcut, the skinning trainer of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, {class}. Show me your knife before you show me anything else." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and your knife looks better kept than it did, which I take as a compliment." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You have skinned before, for I can see it in how you carry the blade away from your leg. We will find out how well when I see your next hide." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter who cannot skin has done only half of the hunt and left the other half for the swoops. I hope you are not such a one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Yonn Deepcut, and I teach skinning. It is the first thing done after a kill and the thing most often done badly, and Chaw beside me has to work with whatever my students bring him." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Skinning") }, text = "Kaga Wildhoof sent you over from her camp, did she? Then bring me proof that you can take a hide off cleanly, and I will show you what a skinner brings to the fire." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: Skinning") }, text = "I hear from Kaga that your camp is the better for a skinner's work. Keep the knife sharp out there, for a dull one in the wild is worse than none." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while I hone this." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "What does a skinner bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Skinning") } },
        { text = "How do you take a hide properly?", next = "proper" },
        { text = "Chaw says the last stitch matters most.", next = "chaw", when = { heardLine = "chaw_stronghide.y_default" } },
        { text = "Which beasts should a beginner skin?", next = "beasts" },
        { text = "Your name is a little alarming.", next = "name" },
        { text = "Teach me the knife.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Every camp of the old wandering had a skinner's corner, downwind of the fire, where the day's hunt was dressed before the light went. A camp without one eats, but it never has anything left over to trade.", fx = { learn = { "camping" } } } },
      choices = { { text = "Downwind, I'll remember. Something else.", next = "BACK" } },
    },
    proper = {
      lines = { { id = "p_default", text = "You give thanks first, and I do not teach the rest to anyone who skips that part. Then you make one long cut along the belly and let the weight of the hide do the pulling, because a skinner who saws at it is only making rags." } },
      choices = {
        { text = "Why insist on the thanks?", next = "proper_thanks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proper_thanks = {
      lines = { { id = "pt_default", text = "Because your hands are steadier when your heart is settled, to begin with. And because the beast's spirit is still near, and I would not wish it to see itself handled by someone who thought it was only meat.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "Do other peoples skin without thanks?", next = "proper_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proper_others = {
      lines = { { id = "po_default", text = "The gnolls do, and the goblins' hunters do worse, since they take the hide and leave everything else for the flies. I have walked past what they leave behind on the plain, and it is the only thing in my work that has ever turned my stomach.", fx = { learn = { "venture_company" } } } },
      choices = {
        { text = "My people honour the kill too.", next = "BACK", when = { race = { "Orc", "Troll" } }, reply = "So I have seen, and it is one of the reasons the tribes took so readily to yours.", fx = { affinity = 1 } },
        { text = "I'll not skin that way. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    chaw = {
      lines = { { id = "ch_default", text = "Chaw has never in his life been handed a hide with three holes in it and asked to make a tent. I have seen what students do with a knife, and I promise you that no stitch yet invented will rescue it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    beasts = {
      lines = { { id = "b_default", text = "Begin with the plainstriders, which are forgiving, and then the prairie wolves, whose hide is thin enough to punish a careless hand. Leave the kodo until you are sure of yourself, for it is a great deal of hide to apologise to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "It alarms everyone except the beasts, who are past minding. The name is my grandfather's, and it speaks of a single cut made deep enough the first time, which is the kindest sort." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I dressed the kills of the Bloodhoof hunt for many years before the elders asked me to teach it instead." } },
    camping = { { id = "tp_camping", text = "Kaga's young campers come to me for the skinner's part of it, and most of them need a sharper knife." } },
    earth_mother = { { id = "tp_em", text = "We thank her and the beast together, with the knife still in its sheath." } },
    venture_company = { { id = "tp_vc", text = "Their hunters strip the hide and leave the rest to rot, and I have no patience for anyone who learned the knife that way." } },
    advice = { { id = "tp_adv", text = "Hone the knife every evening, whether or not you used it that day." } },
    _none = { { id = "tp_none", text = "I cannot cut to the heart of that one, so ask someone wiser." } },
  },
}

---------------------------------------------------------------------------
-- Vira Younghoof: first aid (bandage) trainer at Bloodhoof Village. Forever: Camping 101: First Aid.
---------------------------------------------------------------------------
P:NPC {
  key = "vira_younghoof", id = TODO_NPC("Vira Younghoof"), name = "Vira Younghoof", title = "Bandage Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "gentle" }, values = { "kind", "practical" },
  notices = { "weary", "class" },
  impression = {
    first = "Vira Younghoof rolls clean linen into bandages outside her tent in Bloodhoof Village, and her eyes go at once to any traveller who is limping. Her voice is soft and her hands are firm, and she uses both without asking leave.",
    third = "{name} met Vira Younghoof, who teaches the binding of wounds at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, {class}. Turn around once for me, so that I can see whether you are hiding a hurt." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and walking evenly, which pleases me more than any greeting." },
  },
  notice = {
    { id = "n_hurt", cat = "weary", when = { hp = { max = 0.5 } },
      text = "You are bleeding through your wrappings, child. Sit down here at once, and we will talk after I have seen to it." },
    { id = "n_healer", cat = "class", when = { class = { "DRUID", "SHAMAN", "PRIEST" } },
      text = "You have the healing gift, and I honour it. Learn the bandage anyway, for there will be a day when your strength is spent and your friend is still bleeding." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vira Younghoof, and I teach how to close a wound with cloth and clean hands. It is a humble craft beside a shaman's, but it works in the dark, in the rain and when the spirits are not listening." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: First Aid") }, text = "So Kaga Wildhoof has sent me another camper. Show me that you can wrap a wound so it stays wrapped, and I will show you what a healer's hands add to a camp." },
        { id = "h_campdone", when = { questDone = TODO_QUEST("Camping 101: First Aid") }, text = "I hope the camp is going well, and that nobody has needed what I showed you. Keep the linen dry and away from the cook pot, all the same." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, dear one?" },
        { id = "h_again2", text = "Speak, and I will keep rolling while you do." },
      },
      choices = {
        { text = "What does a camp need from a healer?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: First Aid") } },
        { text = "What hurts do you see most?", next = "hurts" },
        { text = "Why learn bandages when shaman can heal?", next = "why" },
        { text = "Where does the linen come from?", next = "linen" },
        { text = "Teach me to bind a wound.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "It needs a clean place set apart from the fire's smoke, with water that has been boiled and cloth that has been kept dry. Most hurts on the trail are small ones, and they only turn bad when there is nowhere proper to tend them.", fx = { learn = { "camping" } } } },
      choices = { { text = "A clean corner, then. Something else.", next = "BACK" } },
    },
    hurts = {
      lines = { { id = "hu_default", text = "I see gnoll bites from the west, wolf bites from the north, and long raking cuts from the swoops on anyone who fishes without looking up. Since the goblins came there are burns as well, from whatever it is they throw." } },
      choices = {
        { text = "Which is the worst of them?", next = "hurts_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurts_worst = {
      lines = { { id = "hw_default", text = "The gnoll bite, without question, because their mouths are foul and the wound sickens days after it seems to have closed. I wash those three times and I am still not easy until a week has gone by." } },
      choices = {
        { text = "What do you wash them with?", next = "hurts_wash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurts_wash = {
      lines = { { id = "hws_default", text = "Boiled water and a little silverleaf steeped in it, which the herb gatherers bring me from the foot of the bluffs. It stings fiercely, and I have found that the bravest warriors make the most noise about it." } },
      choices = {
        { text = "I wouldn't make a sound.", next = "BACK", when = { class = "WARRIOR" }, reply = "That is exactly what Brave Strongbash told me, and they heard him at the far side of the lake.", fx = { affinity = 1 } },
        { text = "I gather herbs. I'll bring silverleaf.", next = "BACK", when = { profession = "Herbalism" }, reply = "That would be a kindness, and I would not refuse it, for the gnolls have been busy.", fx = { affinity = 2 } },
        { text = "I can believe it. Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "A shaman's healing is a gift that the spirits lend, and what is lent can be withheld. A bandage asks nothing of anyone except that you learned how to tie it, and I have seen it save lives that no one else was near enough to save." } },
      choices = {
        { text = "Everyone should carry their own cure.", next = "BACK", reply = "That is my whole teaching in one breath. I would have every tauren in Mulgore carry linen, and need me a little less.", fx = { align = { order = -1 } } },
        { text = "Better to leave healing to those called to it.", next = "BACK", reply = "The called cannot be everywhere, child, and the plains are very wide. I honour them, and I teach the rest of you regardless.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    linen = {
      lines = { { id = "l_default", text = "Much of it is taken from the gnolls and the goblins' workers by travellers like you, who have no use for it themselves. I would rather it bound a wound than sat in a gnoll's den, so I waste no pity on how it was come by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I tended the hurts of the tribe on the trail when we had no healer to spare, and I have gone on tending them since." } },
    camping = { { id = "tp_camping", text = "Kaga Wildhoof sends her campers to me for the healer's part, and I am glad of it, for the young are careless near fire." } },
    venture_company = { { id = "tp_vc", text = "Their powder burns are slow to heal, and I have treated far too many of them this season." } },
    advice = { { id = "tp_adv", text = "Bind the wound before you chase whatever gave it to you, because the chase will keep and the blood will not." } },
    _none = { { id = "tp_none", text = "I cannot mend that question, dear one, so take it to an elder." } },
  },
}

---------------------------------------------------------------------------
-- Vorn Skyseer: Bloodhoof Village; ends Welcome! (the gift-voucher greeting quest).
---------------------------------------------------------------------------
P:NPC {
  key = "vorn_skyseer", id = TODO_NPC("Vorn Skyseer"), name = "Vorn Skyseer", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "hospitality", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Vorn Skyseer stands a little apart in Bloodhoof Village with his face turned up toward the bluffs and the clouds beyond them. He welcomes each new arrival as though the sky had already told him they were coming.",
    third = "{name} met Vorn Skyseer, who welcomes newcomers to Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Bloodhoof Village, {class}. The winds said that someone was coming along the road, and I am glad that it was you." },
    { id = "g_back", when = { metBefore = true }, text = "The winds bring you back to us, and they bring you a little changed, I think." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You come with An'she's first light, which is the best omen a traveller can carry." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You listen to the wind as I watch the sky, shaman. Perhaps between the two of us we have the whole of the weather." },
    { id = "n_far", cat = "race", when = { race = { "Orc", "Troll", "Scourge" } },
      text = "You were not born under this sky, and still it has room for you. Be at ease here, for no one in the village will ask you to explain yourself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vorn Skyseer. I read what the clouds and the birds have to say over Mulgore, and I greet those who come to Bloodhoof with a gift owed to them." },
        { id = "h_welcome", tags = { "news" }, when = { questActive = TODO_QUEST("Welcome!") }, text = "You carry a voucher, and I am the one it was meant for. Give it to me, friend, and choose your gift with care, for such a thing is given only once." },
        { id = "h_welcomed", when = { questDone = TODO_QUEST("Welcome!") }, text = "I am Vorn Skyseer, as you will recall, and I hope the gift I gave you travels well at your side. The sky has been clear over you since, as far as I can read it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of the sky, or of me?" },
        { id = "h_again2", text = "Speak, friend, for the clouds will wait." },
      },
      choices = {
        { text = "What is this voucher I was given?", next = "voucher", when = { questActive = TODO_QUEST("Welcome!") } },
        { text = "What do you see in the sky?", next = "sky" },
        { text = "What should a newcomer know of Bloodhoof?", next = "village" },
        { text = "I have no voucher. Am I still welcome?", next = "welcome" },
        { text = "May the sky stay clear for you.", next = "END", fx = { affinity = 1 } },
      },
    },
    voucher = {
      lines = { { id = "v_default", text = "It is a token of welcome sent ahead of you by friends from far away, to be honoured in the first village you came to. I do not ask who they were, for a gift is not made better by questions." } },
      choices = { { text = "Then I'll choose well. Something else.", next = "BACK" } },
    },
    sky = {
      lines = { { id = "s_default", text = "Today I see swoops circling high over the lake, which means fair weather, and a line of cloud on the western rim that means it will not last. The sky rarely lies, though it often says less than one would wish." } },
      choices = {
        { text = "Does it tell you more than the weather?", next = "sky_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_more = {
      lines = { { id = "sm_default", text = "At times it does. The harpies of Windfury Ridge have been flying further south than they used to, and the eagles have left the eastern hills where the goblins are cutting. The sky notices what is done to the land beneath it.", fx = { learn = { "venture_company" } } } },
      choices = {
        { text = "And what does it say of the days ahead?", next = "sky_ahead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_ahead = {
      lines = { { id = "sa_default", text = "It says that Mulgore will need its young to be strong sooner than the elders hoped. I do not read doom in that, only work, and I have never yet known the tauren to be afraid of work." } },
      choices = {
        { text = "The wind tells me the same.", next = "BACK", when = { class = { "SHAMAN", "DRUID" } }, reply = "Then I am glad to have it confirmed by one who hears what I can only see.", fx = { affinity = 1 } },
        { text = "Then I'll get to work. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "Know that it is Cairne's own tribe who live here, and that his son Baine speaks for the village while the chieftain sits in Thunder Bluff. Know also that no one goes hungry at Kauth's fire, whatever their people.", fx = { learn = { "cairne" } } } },
      choices = {
        { text = "Even one of the Forsaken?", next = "BACK", when = { race = "Scourge" }, reply = "Even so. You may not need the stew, but you are owed the seat, and I would have you take it." },
        { text = "A generous village. Something else.", next = "BACK" },
      },
    },
    welcome = {
      lines = { { id = "w_default", text = "You are welcome twice over, since you came with nothing in your hand and still stopped to speak with an old sky-watcher. The voucher is only a custom, while the welcome is the truth of the matter." } },
      choices = { { text = "Thank you, Vorn. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has read the skies for the Bloodhoof since the wandering years, when a missed storm could cost the tribe a herd." } },
    cairne = { { id = "tp_ca", text = "The chieftain asked that every newcomer be greeted, and it is the most pleasant duty in the village." } },
    venture_company = { { id = "tp_vc", text = "The birds have gone from the hills where they dig, and that tells me all I need to know of them." } },
    earth_mother = { { id = "tp_em", text = "An'she and Mu'sha are her eyes, and I spend my days looking back at them." } },
    _none = { { id = "tp_none", text = "The sky is silent on that, friend, and so I must be as well." } },
  },
}
