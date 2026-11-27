-- Brother Wilhelm, Paladin Trainer, Goldshire. Voice: bibles/wilhelm.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wilhelm", id = TODO_NPC("Brother Wilhelm"), name = "Brother Wilhelm", title = "Paladin Trainer",
  bible = "bibles/wilhelm.md", role = "trainer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "pious", "kind", "honest" },
  spiritSensitive = true,
  prejudice = { class = "WARLOCK", amount = 12, why = "Fought in the Second War and saw what Gul'dan's warlocks made of good men; gives warlocks the fence and nothing more." },
  notices = { "kit", "affliction", "lock_shadow" },
  impression = {
    first = "He says he mends souls, and slowly.",
    third = "{name} met Brother Wilhelm, Goldshire's paladin trainer, who teaches what a paladin's oath costs in practice.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Come through the gate; I'll not keep you beyond the fence today." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Stay beyond my fence, and keep your business brief." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I fought in the Second War, and I saw what Gul'dan's warlocks made of good men. Stay beyond my fence, and keep that creature further still." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "You've no place at a paladin's door, and you know it. Say your piece from where you stand." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've kept to the fence every time I asked, and you've done good work in Goldshire. I'll speak with you, though I'll not forget what you carry." },
    { id = "g_op_forsaken_hate", when = { opinion = { topic = "forsaken", stance = "hate" } }, text = "Back again? Good. I've been thinking about what you said of the Forsaken, and I'd like you to stay for evening prayers before you go north." },
    { id = "g_default", text = "Brother Wilhelm. Mind the forge smoke, it gets everywhere." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Back for more? Good, sit down, if you can find a dry spot." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "Lost? The smith's round the front. I only mend souls, and slowly." },
    { id = "g_rall", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tome of Divinity"), days = 3 } },
      text = "Well? Did Duthorian Rall frighten you? He frightens everyone, and it's a kindness, mostly." },
  },

  notice = {
    { id = "n_dented", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Your plate's half off you. A paladin who can't stand up can't protect anyone. Smith first, then me." },
    { id = "n_shining", cat = "kit", when = { class = "PALADIN", durability = { min = 0.95 } },
      text = "Polished, every buckle of it. Somebody at the Abbey taught you right." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Poison" } },
      text = "You've picked something up out there, so hold still while I cleanse it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The Light flinched when you came in, friend, the way a hand flinches from a cold stove, and I felt it before I saw you. That doesn't mean it's given up on you, so don't you give up on it either." },
  },

  start = "hello",
  nodes = {
    op_forsaken = {
      lines = {
        { id = "op_forsaken_a", text = "That's the question the old knights quarrel over at night, when they've had too much of Farley's wine. Some of the Forsaken were Lordaeron's own priests and farmers once, and some of them still pray. You've seen more of the world than I have lately, so what do you make of them?" },
      },
      choices = {
        { text = "They're victims of the Scourge. They deserve pity, not a pyre.", next = "op_forsaken_1", fx = { opinion = { forsaken = "pity", undeath = "curse" }, align = { light = 1 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "They're dead things that walk. The Light should finish them.", next = "op_forsaken_2", fx = { opinion = { forsaken = "hate", undeath = "abomination" }, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Pity the ones who were. Watch the Dark Lady who leads them.", next = "op_forsaken_3", fx = { opinion = { forsaken = "distrust", sylvanas = "distrust" }, trait = { cautious = 1 } } },
        { text = "I've walked the Light longer than you, Brother. It turns from no one.", next = "op_forsaken_4", when = { race = "Dwarf", class = "PALADIN" }, fx = { opinion = { forsaken = "pity", the_light = "for_all" }, affinity = 2 } },
        { text = "I'd rather not say, Brother.", next = "BACK" },
      },
    },
    op_forsaken_1 = {
      lines = { { id = "op_forsaken_r1", text = "That's the hardest mercy there is, and I'm glad someone in this yard can manage it. Uther would have, I think, though he'd have kept his hammer close." } },
      choices = { { text = "Something else, Brother.", next = "BACK" } },
    },
    op_forsaken_2 = {
      lines = { { id = "op_forsaken_r2", text = "A great many good paladins say exactly that, and some of them say it in the Scarlet Crusade's red tabards now. Be careful what you let that thought turn you into." } },
      choices = { { text = "Something else, Brother.", next = "BACK" } },
    },
    op_forsaken_3 = {
      lines = { { id = "op_forsaken_r3", text = "The banshee queen, yes, and nobody can say what she wants. A sensible answer, and a paladin needs sense as much as he needs mercy." } },
      choices = { { text = "Something else, Brother.", next = "BACK" } },
    },
    op_forsaken_4 = {
      lines = { { id = "op_forsaken_r4", text = "Spoken like Ironforge, and I'll take the correction. The Light is older than any of our orders, and it's never once asked my permission." } },
      choices = { { text = "Something else, Brother.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think anything that helps a person stand straighter is mending of a kind, and your spirits might do that, in their way." } },
      choices = {
        { text = "Then let's both help folk stand straight, Brother.", next = "BACK", reply = "Gladly, friend, and I'll count you a fellow worker in it. The Light won't mind the company.", fx = { align = { light = 1 } } },
        { text = "Souls are the Light's business. Spirits should keep away.", next = "BACK", reply = "Perhaps, but I've seen spirits do good that the Light was too far away to reach. I'll not judge them for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think they both ask a person to tend something greater than themselves, and both punish neglect slowly. Brother Sammuel says I'm too generous to the trees, and I say he's never tended anything that grew." } },
      choices = {
        { text = "Then we serve together, Brother, each in our proper place.", next = "BACK", reply = "That's well put, and I'll tell Sammuel a druid said so. He'll pretend not to hear.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Perhaps, but I'll follow the land and not any church.", next = "BACK", reply = "Then follow it faithfully, and we'll serve the same end by different roads. I'll not ask more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light favours those who protect, and a hunter who keeps the wolves off a farmer's flock is doing just that. I've seen hunters with more grace in them than some of the paladins I've trained." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Light favours those who protect, and a hunter who keeps the wolves off a farmer's flock is doing just that. Your {pet} is a fine creature, so treat it as a comrade, and the Light will see your heart in it." },
      },
      choices = {
        { text = "I hunt to protect, not to kill.", next = "BACK", reply = "That's a fine thing to say, and I believe you. Keep the farmers' flocks whole and you'll do more good than half my students.", fx = { align = { light = 1 } } },
        { text = "I hunt for the meat and the coin, Brother.", next = "BACK", reply = "Honest, at least, and there's no shame in feeding yourself. The farmers still benefit.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not through your stealth, but through your intentions, sometimes, because the Light shows me the shape of a person's heart if I look. Yours seems decent enough, though I'd be lying if I said I couldn't see a few shadows in it." } },
      choices = {
        { text = "I'll try to keep those shadows from growing, Brother.", next = "BACK", reply = "That's all I'd ask of anyone, and more than most will try. When they trouble you, come and sit by the forge and we'll talk it through.", fx = { align = { light = 1 } } },
        { text = "Shadows keep me alive, Brother. I'll keep them.", next = "BACK", reply = "They might, for a while, but shadows grow when you're not watching. I'll pray you notice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience under pressure, and how to keep your head when a gnoll's swinging at it, which is more than your books will teach you. The Light and the arcane aren't so different, because both ask you to hold steady when everything around you is breaking." } },
      choices = {
        { text = "Steadiness is worth learning. I'll heed your lesson, Brother.", next = "BACK", reply = "Good, and you'll find it serves you in the tower as well as the field. Come and train with us.", fx = { align = { order = 1 } } },
        { text = "Books teach me well enough. I need no sermons.", next = "BACK", reply = "Then I'll not preach at you, friend. But a gnoll doesn't care how many books you've read.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I think anyone can, because the Light doesn't keep a ledger of who's worth saving, though it does ask you to turn around. I've seen it happen once, and the man wept for a week, and then he never stopped smiling." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I think anyone can, because the Light doesn't keep a ledger of who's worth saving, though it does ask you to turn around, and that creature at your heel would have to stay behind when you did. I've seen it happen once, and the man wept for a week, and then he never stopped smiling." },
      },
      choices = {
        { text = "Perhaps one day I'll turn, Brother. Keep the door open.", next = "BACK", reply = "It's always open, friend, and I'll be glad to see you at it. I'm behind the smithy most mornings.", fx = { align = { light = 1 } } },
        { text = "I've no need of redemption. My path is chosen.", next = "BACK", reply = "Then I'll pray for you anyway, quietly. The door won't close.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I teach the paladins who come through Goldshire. Most of them stand a little straighter when they leave, and some only limp less." },
        { id = "h_new", when = { class = "PALADIN", maxLevel = 9 },
          text = "Fresh down from the Abbey. Brother Sammuel gives you the oath; I teach you what it weighs." },
        { id = "h_tome_before", when = { class = "PALADIN", questBefore = TODO_QUEST("Tome of Divinity") },
          text = "Duthorian Rall keeps the Tome of Divinity at the Cathedral. One day soon he'll want to see what you're made of, and I'll tell you when." },
        { id = "h_tome_active", tags = { "news" }, when = { questActive = TODO_QUEST("Tome of Divinity") },
          text = "Duthorian Rall's in the Cathedral of Light in Stormwind, so go to him. He's said kind things about you, and he doesn't say many." },
        { id = "h_tome_done", when = { questDone = TODO_QUEST("Tome of Divinity") },
          text = "So the Cathedral's seen you. Whatever you're set to, do it properly. Rall always finds out, and so does the Light." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "This far from the mountain? Ironforge must be running out of anvils to pray at." },
        { id = "h_outgrown", when = { class = "PALADIN", minLevel = 20 },
          text = "You've outgrown my little patch behind the smithy, and the Cathedral has teachers who forgot more than I'll ever learn. Still, come by." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "Something in you has gone quiet, the kind of quiet people get when they stop arguing with their conscience." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "I hear things here behind the forge, and not all I've heard about you was kind. Tell me it was wrong." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, behind the smithy. Priestess Josetta's at the inn, if you're looking for your own, but if you've come to compare notes, sit, because I don't get many." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my yard. Most of your kind avoid me, because they think a paladin can see straight through them, and they're half right." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll find no books here, only sweat and the Light, though a mage could do worse than learn a little of both." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You come to my door with a shadow at your heel. I'll not turn you away, but I'll ask you to keep that creature beyond the fence, because the Light and it don't agree." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "You come to my door smelling of the fel, as bold as you please. I'll speak with you across the fence, and that's as near as you'll come." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You again. You've earned a word at my gate, I suppose, though I'll still keep my hammer where I can reach it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the paladin's yard. You're welcome here, and so is your companion, if it keeps off the practice dummies." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you stand straight enough, so I'd guess someone taught you well before you crossed the sea." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I mend souls, slowly. Do your spirits mend too, or only strike?" },
      },
      again = {
        { id = "h_again", text = "Something else? I've time. The forge doesn't, but I do." },
        { id = "h_again2", text = "Go on. Ask what's on your mind, not what you think I want to hear." },
      },
      choices = {
        { text = "Even a warlock can find his way back to the Light.", next = "BACK", reply = "The Light may welcome him home. I am only a man, and slower to forgive.", fx = { align = { light = 1 } } }, -- dp_stance
        { text = "The Light should turn its back on demon-callers forever.", next = "BACK", reply = "Careful. I once said the same, and the Light humbled me for it.", fx = { align = { light = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What is the Tome of Divinity?", next = "tome", when = { class = "PALADIN" } },
        { text = "What's the hardest part of the oath?", next = "oath" },
        { text = "Why teach behind a smithy?", next = "smithy" },
        { text = "What do paladins learn that priests don't?", next = "priest", when = { class = "PRIEST" } },
        { text = "I squired for the Silver Hand, before it broke.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "What should I be practising, Brother?", next = "practise", when = { class = "PALADIN" } },
        { text = "Ironforge has plenty of anvils, Brother. I came to learn.", next = "dwarf", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "Isn't a paladin just a warrior who prays?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Does anything in Goldshire trouble you, Brother?", next = "cellar" },
        { text = "I'd guess a paladin can see through a rogue, Brother.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What could a mage learn from a paladin, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt a warlock can be redeemed, Brother. I doubt I want to be.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light favour hunters, Brother Wilhelm?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Light and nature seem to serve the same end, Brother.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think spirits can mend a soul, Brother Wilhelm?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Another time, Brother.", next = "END" },
      },
    },
    tome = {
      lines = {
        { id = "t_default", key = true,
          text = "It's a book the Abbey's clerics kept, long before my time. Ogres carried it off in the First War, and even Lord Lothar went after it and needed rescuing." },
      },
      choices = {
        { text = "But it came back.", next = "tome2" },
        { text = "Ogres reading a holy book? That's a thought.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    tome2 = {
      lines = {
        { id = "t2_default", text = "It came back, and now paladins learn from it in Stormwind and Ironforge. Every page of it was paid for by someone." },
        { id = "t2_paladin", when = { class = "PALADIN" },
          text = "It came back, and you'll read it, if Duthorian Rall judges you ready, so read it like it cost something, because it did." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { learn = { "tome_of_divinity" }, affinity = 1 } },
        { text = "What's the hardest part of the oath?", next = "oath" },
      },
    },
    oath = {
      big = true,
      lines = {
        { id = "o_default", text = "Mercy, because anyone can be brave in a crowd. Being patient with a man who's wronged you, alone and with nobody watching, is what costs a paladin sleep." },
        { id = "o_squire", when = { origin = "human_paladin_squire" },
          text = "You squired for the Silver Hand, so you've seen good knights forget mercy. Don't think it can't happen to you, because that's how it always happens." },
      },
      choices = {
        { text = "Then I'll practise mercy.", next = "BACK", reply = "Then you'll be a better paladin than most, and a better one than me some days. It's hard work.", fx = { align = { light = 2 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "Mercy gets good knights killed.", next = "BACK", reply = "It does, sometimes, and I've buried a few who were merciful. But I'll not trade it for anything.", fx = { align = { light = -2 } } },
        { text = "Some people don't deserve it.", next = "deserve", fx = { trait = { stern = 1 } } },
      },
    },
    deserve = {
      lines = {
        { id = "d_default", text = "No, and that's rather the point of it. If they deserved it, it would just be fairness." },
      },
      choices = {
        { text = "Even the Forsaken, Brother? Does mercy reach that far?", next = "op_forsaken" },
        { text = "I hadn't thought of it like that.", next = "BACK", reply = "It's a hard thing to think about, and I've spent years on it. Keep turning it over.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fairness suits me fine.", next = "BACK", reply = "Fairness is a fine thing, and the world needs more of it. But mercy's what the Light asks.", fx = { align = { order = 1 } } },
      },
    },
    smithy = {
      lines = {
        { id = "s_default", text = "Because Smith Argus keeps a fire going, and the yard behind it is flat. Lyria Du Lac, who trains the warriors, shares it with me, and her lot and mine bruise each other on alternate mornings." },
      },
      choices = {
        { text = "Who gets the yard at noon?", next = "smithy_noon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smithy_noon = {
      lines = {
        { id = "sn_default", text = "Lyria, by her account, and me, by mine. The Light hasn't ruled on it yet, though I suspect it's on her side." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "To stand in front. You heal from behind the line, and we heal from inside it with a hammer in the other hand; it's the same Light, with different bruises." },
      },
      choices = {
        { text = "And what do priests know that you don't?", next = "priest_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_know = {
      lines = {
        { id = "pk_default", text = "How to sit still with someone who's dying and not reach for a weapon. I've never managed it, but Josetta has, so ask her how, and then tell me." },
      },
      choices = {
        { text = "I'm still learning that myself.", next = "BACK", reply = "So am I, and I'm no better at it than I was ten years ago. Tell me if Josetta's secret rubs off on you.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Sitting still while someone dies isn't for me.", next = "BACK", reply = "It isn't for most of us, and I'll not judge you. But somebody has to do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    squire = {
      big = true,
      lines = {
        { id = "sq_default", text = "Then you've seen the Order at its best and watched it come apart, and I'm sorry. Keep the oath anyway; the Order was only ever the people who kept it." },
      },
      choices = {
        { text = "That's what I'm trying to do.", next = "BACK", reply = "Then you're keeping the Order alive, whether you know it or not. Light keep you.", fx = { affinity = 3, align = { light = 2 } } },
        { text = "The oath died with the Order, and I've let it go.", next = "BACK", reply = "I'm sorry to hear it, and I'll not argue with you. But I still keep mine, every morning.", fx = { align = { light = -2 } } },
        { text = "Some days it feels pointless.", next = "squire_point" },
      },
    },
    squire_point = {
      lines = {
        { id = "sp_default", text = "Then it's working, because an oath that never feels pointless was never tested. Come and see me on those days, and I'll make tea." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Holy Light on yourself between fights, before you need it, and Devotion Aura, until you forget it's there. A paladin who has to remember his aura is a paladin who'll forget it on the day it matters." },
        { id = "practise_old", when = { minLevel = 20 },
          text = "Lay on Hands, and the restraint not to use it. You'll want to save everyone with it, and it'll only save one, so practise choosing, which is the harder skill." },
      },
      choices = {
        { text = "Choosing who to save is cruel.", next = "practise_choose" },
        { text = "I'll practise until it's habit.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    practise_choose = {
      lines = { { id = "practise_choose_l", text = "It is. That's why we practise it here, on straw dummies, so that when it's real, you've already wept over it once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "Then I'll take back the joke and keep the welcome. Ironforge kept the Hand's oath when the north lost it, and I'm not sure I've anything to teach a dwarf about holding to a vow." },
        { id = "dwarf_hand", when = { origin = "dwarf_silver_hand" },
          text = "Then I'll take back the joke. You took the oath in Ironforge after the Order broke in the north, and that's more faith than I had at your age." },
      },
      choices = {
        { text = "Teach me what it weighs, Brother.", next = "BACK", fx = { affinity = 2 } },
        { text = "A vow's easy. Keeping it is hard.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "warrior_l", text = "Lyria Du Lac would say that, and she'd mean it kindly, more or less. A paladin is a warrior who's promised the Light he'll stop when it tells him to, and that promise is the whole difference." } },
      choices = {
        { text = "I'd rather decide for myself when to stop.", next = "BACK", reply = "That's the warrior's way, and I'll not fault Lyria for it. But I'd rather have the promise.", fx = { align = { light = -1 } } },
        { text = "That's a promise worth making.", next = "BACK", reply = "It is, and I hope you'll make it. It's the hardest and best thing I ever did.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    cellar = {
      lines = { { id = "cellar_l", text = "The warlocks in the inn's cellar trouble me. I look at the door every time I pass, and I don't go in. The kingdom permits them, and the Light hasn't told me to break down a door yet; when it does, I'll know." } },
      choices = {
        { text = "Some doors you break without being told.", next = "BACK", reply = "Some, perhaps, but I'll not be the one to break this one without cause. When the Light speaks, I'll listen.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The kingdom's law comes first.", next = "BACK", reply = "It does, and I'll keep it, though it sits badly with me. The door stays shut for now.", fx = { align = { order = 1 } } },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You've shown the Light's own patience with me, and I've been a hard man to be patient with." },
    },
    grievance = {
      { id = "dp_gv", text = "You've given me cause to doubt you, and I doubted you already. Mind the fence." },
    },
    background = { { id = "tp_bg", text = "A brother of the Light who teaches paladins behind a smithy. Grander men have had smaller callings." } },
    advice = { { id = "tp_ad", text = "Mercy is harder than courage. Practise it when it's easy, so it's there when it isn't." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome of Divinity was the Abbey's book, though Duthorian Rall keeps it now. Ask him, and be ready for homework." } },
    defias = { { id = "tp_defias", text = "Some of them were honest men, once. I pray for those, and I watch the rest." } },
    hogger = { { id = "tp_hogger", text = "I don't pray for Hogger. I have limits, and he found them." } },
    lions_pride = { { id = "tp_inn", text = "Farley pours a fair cup. I've been known to sit in the corner and pretend I'm not listening." } },
    northshire_abbey = { { id = "tp_abbey", text = "That's Brother Sammuel's house, with a floor worn smooth where every one of us has knelt." } },
    _none = { { id = "tp_none", text = "I'm a trainer behind a smithy, friend. That's beyond my little patch." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light isn't earned in one great deed but in a thousand small mercies nobody sees. The great deeds come after, if they come at all." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You carry the Light now, and it will feel heavy on the days you'd rather be angry. Carry it anyway, because those are the days it matters most." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "The Silver Hand was the finest order of knights the world has known, and it broke when Lordaeron fell. Those of us who still wear the Light's armor carry what's left of it, whether or not we carry the name." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "The Tome's trail leads to Heroes' Vigil, to a dwarf who gave his life on that island and had it given back by the Light. If you're my student, you may walk that road yourself one day." } },
    arthas = { { id = "tp_arthas", text = "Arthas was a paladin, taught the same prayers we teach, and he turned his hammer on his own people. Every paladin should think on that once, and then pray never to think on it again." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is an abomination before the Light, and if you're sent against it, go with a clear heart and a heavy hammer. Bring both back if you can." } },
  },
}
