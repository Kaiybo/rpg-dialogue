-- Brother Wilhelm, Paladin Trainer, Goldshire. Voice: bibles/wilhelm.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wilhelm", id = TODO_NPC("Brother Wilhelm"), name = "Brother Wilhelm", title = "Paladin Trainer",
  bible = "bibles/wilhelm.md", role = "trainer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "pious", "kind", "honest" },
  spiritSensitive = true,
  notices = { "kit", "affliction" },
  impression = {
    first = "Brother Wilhelm works in the forge smoke and seems to measure people by how straight they stand when they leave. He mends souls, he says, and slowly.",
    third = "{name} met Brother Wilhelm, Goldshire's paladin trainer, who teaches what a paladin's oath costs in practice.",
  },

  greetings = {
    { id = "g_default", text = "Brother Wilhelm. Mind the forge smoke, it gets everywhere." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Back for more? Good, sit down, if you can find a dry spot." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "Lost? The smith's round the front. I only mend souls, and slowly." },
    { id = "g_rall", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tome of Divinity"), days = 3 } },
      text = "Well? Did Rall frighten you? He frightens everyone, and it's a kindness, mostly." },
  },

  notice = {
    { id = "n_dented", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Your plate's half off you. A paladin who can't stand up can't protect anyone. Smith first, then me." },
    { id = "n_shining", cat = "kit", when = { class = "PALADIN", durability = { min = 0.95 } },
      text = "Polished, every buckle of it. Somebody at the Abbey taught you right." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Poison" } },
      text = "You've picked something up out there. Hold still. A paladin learns to cleanse that soon enough, and not soon enough for you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think anything that makes a person stand straighter is good. Your spirits might do that, in their way." } },
      choices = {
        { text = "Then let's both help folk stand straight, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Souls are the Light's business. Spirits should keep away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think they both ask a person to tend something greater than themselves, and both punish neglect slowly. Brother Sammuel says I'm too generous to the trees, and I say he's never tended anything that grew." } },
      choices = {
        { text = "Then we serve together, Brother, each in our proper place.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Perhaps, but I'll follow the land and not any church.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Light favours those who protect, and a hunter who keeps the wolves off a farmer's flock is doing just that. I've seen hunters with more grace in them than some of the paladins I've trained." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a fine creature. Treat it as a comrade, and the Light will see your heart in it." },
      },
      choices = {
        { text = "I hunt to protect, not to kill.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for the meat and the coin, Brother.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not through your stealth, but through your intentions, sometimes, because the Light shows me the shape of a person's heart if I look. Yours seems decent enough, though I'd be lying if I said I couldn't see a few shadows in it." } },
      choices = {
        { text = "I'll try to keep those shadows from growing, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Shadows keep me alive, Brother. I'll keep them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience under pressure, and how to keep your head when a gnoll's swinging at it, which is more than your books will teach you. The Light and the arcane aren't so different, because both ask you to hold steady when everything around you is breaking." } },
      choices = {
        { text = "Steadiness is worth learning. I'll heed your lesson, Brother.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Books teach me well enough. I need no sermons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think anyone can, because the Light doesn't keep a ledger of who's worth saving, though it does ask you to turn around. I've seen it happen once, and the man wept for a week, and then he never stopped smiling." } },
      choices = {
        { text = "Perhaps one day I'll turn, Brother. Keep the door open.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I've no need of redemption. My path is chosen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I teach the paladins who come through Goldshire. Most of them stand a little straighter when they leave, and some only limp less." },
        { id = "h_new", when = { class = "PALADIN", maxLevel = 9 },
          text = "Fresh down from the Abbey. Brother Sammuel gives you the oath; I teach you what it weighs." },
        { id = "h_tome_before", when = { class = "PALADIN", questBefore = TODO_QUEST("Tome of Divinity") },
          text = "Duthorian Rall keeps the Tome of Divinity at the Cathedral. One day soon he'll want to see what you're made of. I'll tell you when." },
        { id = "h_tome_active", tags = { "news" }, when = { questActive = TODO_QUEST("Tome of Divinity") },
          text = "Rall's in the Cathedral of Light, in the city. Go. He's said kind things about you, and he doesn't say many." },
        { id = "h_tome_done", when = { questDone = TODO_QUEST("Tome of Divinity") },
          text = "So the Cathedral's seen you. Whatever you're set to, do it properly. Rall always finds out, and so does the Light." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "This far from the mountain? Ironforge must be running out of anvils to pray at." },
        { id = "h_outgrown", when = { class = "PALADIN", minLevel = 20 },
          text = "You've outgrown my little patch behind the smithy, and the Cathedral has teachers who forgot more than I'll ever learn. Still, come by." },
        { id = "h_light", when = { alignment = { axis = "light", min = 40 } },
          text = "Something in you has gone quiet. The kind of quiet people get when they stop arguing with their conscience." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "I hear things, here behind the forge. Not all of them about you were kind. Tell me they were wrong." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, behind the smithy. Josetta's at the inn, if you're looking for your own. If you've come to compare notes, sit. I don't get many." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my yard. Most of your kind avoid me, because they think a paladin can see straight through them, and they're half right." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll find no books here, only sweat and the Light, though a mage could do worse than learn a little of both." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, here at my door. I'll not turn you away, but I'll ask you to keep that creature beyond the fence, because the Light and it don't agree." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in the paladin's yard. You're welcome here, and so is your companion, if it keeps off the practice dummies." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you stand straight enough, so I'd guess someone taught you well before you crossed the sea." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I mend souls, slowly. Do your spirits mend too, or only strike?" },
      },
      again = {
        { id = "h_again", text = "Something else? I've time. The forge doesn't, but I do." },
        { id = "h_again2", text = "Go on. Ask what's on your mind, not what you think I want to hear." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What is the Tome of Divinity?", next = "tome" },
        { text = "What's the hardest part of the oath?", next = "oath" },
        { text = "Why teach behind a smithy?", next = "smithy" },
        { text = "What do paladins learn that priests don't?", next = "priest", when = { class = "PRIEST" } },
        { text = "I squired for the Silver Hand, before it broke.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "What should I be practising, Brother?", next = "practise", when = { class = "PALADIN" } },
        { text = "Ironforge has plenty of anvils, Brother. I came to learn.", next = "dwarf", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "Du Lac says a paladin is a warrior who prays.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you know what goes on in the inn's cellar?", next = "cellar" },
        { text = "Can a paladin really see through a rogue, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What could a mage learn from a paladin, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think a warlock can ever be redeemed, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light favour hunters, Brother Wilhelm?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Light and nature serve the same end, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think spirits can mend a soul, Brother Wilhelm?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Another time, Brother.", next = "END" },
      },
    },
    tome = {
      lines = {
        { id = "t_default", key = true,
          text = "A book the Abbey's clerics kept, long before me. Ogres carried it off in the First War, down into the Deadmines. Even Lothar went after it and needed rescuing." },
      },
      choices = {
        { text = "But it came back.", next = "tome2" },
        { text = "Ogres reading. That's a thought.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    tome2 = {
      lines = {
        { id = "t2_default", text = "It came back. Now the paladins of the Silver Hand learn from it, in Stormwind and Ironforge. Every page of it was paid for by someone." },
        { id = "t2_paladin", when = { class = "PALADIN" },
          text = "It came back, and you'll read it, if Rall judges you ready. Read it like it cost something. It did." },
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
          text = "You squired for the Silver Hand. You've seen good knights forget mercy. Don't think it can't happen to you. It's how it always happens." },
      },
      choices = {
        { text = "Then I'll practise mercy.", next = "BACK", fx = { align = { light = 2 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "Mercy gets good knights killed.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Some people don't deserve it.", next = "deserve", fx = { trait = { stern = 1 } } },
      },
    },
    deserve = {
      lines = {
        { id = "d_default", text = "No, and that's rather the point of it. If they deserved it, it would just be fairness." },
      },
      choices = {
        { text = "I hadn't thought of it like that.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fairness suits me fine.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    smithy = {
      lines = {
        { id = "s_default", text = "Because Argus keeps a fire going, and the yard behind it is flat. Lyria Du Lac shares it with me. Her warriors and my paladins, bruising each other on alternate mornings." },
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
        { text = "I'm still learning that myself.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Sitting still while someone dies isn't for me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    squire = {
      big = true,
      lines = {
        { id = "sq_default", text = "Then you've seen the Order at its best and watched it come apart, and I'm sorry. Keep the oath anyway; the Order was only ever the people who kept it." },
      },
      choices = {
        { text = "That's what I'm trying to do.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } },
        { text = "The oath died with the Order, and I've let it go.", next = "BACK", fx = { align = { light = -2 } } },
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
      lines = { { id = "warrior_l", text = "She would say that, and she'd mean it kindly, more or less. A paladin is a warrior who's promised the Light he'll stop when it tells him to, and that promise is the whole difference." } },
      choices = {
        { text = "I'd rather decide for myself when to stop.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's a promise worth making.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    cellar = {
      lines = { { id = "cellar_l", text = "I know, and I look at the door every time I pass, and I don't go in. The kingdom permits them, and the Light hasn't told me to break down a door yet; when it does, I'll know." } },
      choices = {
        { text = "Some doors you break without being told.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "The kingdom's law comes first.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of the Light who teaches paladins behind a smithy. Grander men have had smaller callings." } },
    advice = { { id = "tp_ad", text = "Mercy is harder than courage. Practise it when it's easy, so it's there when it isn't." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Abbey's book, though Rall keeps it now. Ask him, and be ready for homework." } },
    defias = { { id = "tp_defias", text = "Some of them were honest men, once. I pray for those, and I watch the rest." } },
    hogger = { { id = "tp_hogger", text = "I don't pray for Hogger. I have limits, and he found them." } },
    lions_pride = { { id = "tp_inn", text = "Farley pours a fair cup. I've been known to sit in the corner and pretend I'm not listening." } },
    northshire_abbey = { { id = "tp_abbey", text = "Brother Sammuel's floor, worn smooth where every one of us has knelt." } },
    _none = { { id = "tp_none", text = "I'm a trainer behind a smithy, friend. That's beyond my little patch." } },
  },
}
