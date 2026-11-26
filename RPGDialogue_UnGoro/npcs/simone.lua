-- Simone the Inconspicuous, Golakka Hot Springs / Terror Run. Voice: bibles/simone.md
-- A succubus wearing a jungle troll's face, far too cheerful about the crater. Hunters on the
-- Stave of the Ancients errand get the truth; everyone else gets the act, cracks and all.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "simone_inconspicuous", id = TODO_NPC("Simone the Inconspicuous"), name = "Simone the Inconspicuous",
  gender = "female",
  bible = "bibles/simone.md", role = "citizen", tier = "quest",
  temper = { "cheerful", "sly" }, values = { "vain", "cruel" },
  notices = { "pet", "kin" },
  impression = {
    first = "She smiles too much, and nothing about her quite fits.",
    third = "{name} met Simone, a far too cheerful 'jungle troll' wandering the hot springs of Un'Goro with a wolf called Precious.",
  },

  greetings = {
    { id = "g_flirt", when = { flirt = true, chance = 0.4 }, text = "Well, aren't you a pleasant surprise in all this steam? Come closer, darling; Precious only bites the people I don't like." },
    { id = "g_flirt_warm", when = { flirt = true, npcFlagBefore = "flirt_warm" }, text = "My gallant one, back again! I told Precious you'd come, and now he owes me a lizard." },
    { id = "g_flirt_cool", when = { flirt = true, npcFlagBefore = "flirt_declined", chance = 0.5 }, text = "Oh, it's my sensible friend. Don't worry, darling, I shan't flutter at you today, though it does take a great deal of effort." },
    { id = "g_default", text = "What a wonderful day to be alive, don't you think? Come, stand in the sun with me a while." },
    { id = "g_stave", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") },
      text = "Oh, look at you, all grim and purposeful. I wondered which of you the old tree would send this time." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to see me! Precious, sit up, we have a guest who likes us." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The springs steam so prettily by moonlight, don't they? Nobody ever thinks to look." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "And who is this handsome thing? {pet}, is it? Precious, be polite, darling; not every animal is dinner." },
    { id = "n_troll", cat = "kin", when = { race = "Troll" },
      text = "A cousin! Oh, how lovely, it's been ages since I saw another troll, and you look so very much like one." },
  },

  start = "hello",
  nodes = {
    flirt = {
      lines = { { id = "fl_default", text = "Friendly? Darling, I'm being positively shy. You've strong arms and a long road behind you, and a girl alone in the crater does so like having someone to look after her." } },
      choices = {
        { text = "Then I'd gladly look after you, Simone.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "I know a demon's charm when I hear one. Save it.", next = "flirt_lock", when = { class = "WARLOCK" }, fx = { trait = { cautious = 1 } } },
        { text = "You're lovely, but I'll keep my distance.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Sensible, and a little disappointing. Never mind, darling, I'm terribly patient, and the springs aren't going anywhere." },
        { text = "Save the honeyed words. I'm not interested.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Ooh, prickly! I do like prickly, sweet, but have it your way; Precious will cheer me up, won't you, darling?" },
      },
    },
    flirt_warm = {
      lines = { { id = "flw_default", text = "How gallant! I knew you'd say yes, darling, because I can always tell. Come and sit by the springs with me one evening, and we'll see whether you're still so brave once the sun goes down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flirt_lock = {
      lines = { { id = "fll_default", text = "Hush, you'll spoil it! Yes, it's a habit of my kind, and it's wasted on someone who keeps one of my sisters bound in a soul shard. Still, you went a little pink just now, darling, and I'm counting that as a win." } },
      choices = { { text = "I did not. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Simone, just Simone, a simple jungle troll out enjoying the crater with her wolf. Look at the beauty all around you, friend, the steam and the ferns and the great lizards, and tell me life isn't sweet." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, with that lovely watchful look your kind always have. You're staring at my feet, darling; is something wrong with them?" },
        { id = "h_stave", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") },
          text = "Let's not pretend, you and I. You smell of Felwood and old bark, and that means you've come for my head, so shall we talk first, or would you rather go straight to the screaming?" },
        { id = "h_troll", when = { race = "Troll" },
          text = "Such a fine, tall troll, and so far from the islands! We jungle girls must stick together, mustn't we?" },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "Oh, a holy one, how wonderful. Do keep your Light pointed somewhere else, sweet, it's terribly bright and I've only just got my complexion right." },
      },
      again = {
        { id = "h_again", text = "More questions? I adore questions, they're like little presents." },
        { id = "h_again2", text = "Go on, darling. Precious and I have all the time in the world." },
      },
      choices = {
        { text = "What brings you to the crater?", next = "why" },
        { text = "Tell me about your wolf.", next = "precious" },
        { text = "Aren't you afraid of the devilsaurs?", next = "fear" },
        { text = "Which tribe are you from, sister?", next = "tribe", when = { race = "Troll" } },
        { text = "Your tracks don't match a troll's stride.", next = "tracks", when = { class = "HUNTER" } },
        { text = "Something about you reeks of the Nether. I know the smell.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The ancient in Felwood sent me for your head.", next = "reveal",
          when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") } },
        { text = "You're very friendly for a stranger, Simone.", next = "flirt", when = { flirt = true } },
        { text = "Enjoy the sunshine, Simone.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "Why, the beauty, of course! Everything here is so big and hungry and alive, and nobody in the whole crater is pretending to be civilised, which I find terribly refreshing." } },
      choices = {
        { text = "Most people find it terrifying.", next = "why_more" },
        { text = "That's an odd thing to admire.", next = "why_more" },
      },
    },
    why_more = {
      lines = { { id = "wm_default", text = "Most people are dull, sweet. A devilsaur wants one thing and takes it without a single apology, and I've always had a soft spot for anything that honest about its appetites." } },
      choices = {
        { text = "So you admire the strong taking from the weak?", next = "why_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Admire it? I simply notice it, darling, and so do you, or you wouldn't carry a weapon. Be candid with me: which do you think the world is, a garden to tend or a feast to enjoy?" } },
      choices = {
        { text = "A garden. Strength is for guarding those who have none.", next = "why_answer", fx = { align = { light = 1 } } },
        { text = "A feast. The strong eat, and the weak learn.", next = "why_answer", fx = { align = { light = -1 } } },
        { text = "I'd rather not play your game.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    why_answer = {
      lines = {
        { id = "wa_default", text = "How interesting you are. I'll remember that answer, darling, and one day I may ask you again just to see whether it's changed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    precious = {
      lines = { { id = "p_default", text = "This is Precious, my darling boy, and he's very gentle unless he's hungry. He was a wild thing when I found him, and now he follows me everywhere and does everything I ask, which is all any girl wants." } },
      choices = {
        { text = "How did you tame him?", next = "precious_tame" },
        { text = "He doesn't look like any wolf from around here.", next = "precious_odd", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    precious_tame = {
      lines = { { id = "pt_default", text = "Kindness, mostly, and a little persuasion at just the right moment. You'd be amazed what anything will do for you, once you've found the thing it wants most." } },
      choices = { { text = "That sounds less like kindness than you think.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    precious_odd = {
      lines = { { id = "po_default", text = "He isn't, sweet, he travelled a long way with me, and he's never once complained. You hunters always notice the wrong things, don't you? It's very rude of you, and a little bit flattering." } },
      choices = { { text = "I notice everything, Simone.", next = "BACK" } },
    },

    fear = {
      lines = { { id = "f_default", text = "Afraid? Oh, no. The big ones sniff at me and walk away, every single time, and I like to think it's because I'm such a sweet girl." } },
      choices = {
        { text = "Or because they know something I don't.", next = "fear_more" },
        { text = "You're lucky, then.", next = "fear_more" },
      },
    },
    fear_more = {
      lines = { { id = "fm_default", text = "Animals are clever, darling. They know which things in the world are food and which things are worse than they are, and they don't need anyone to tell them the difference." } },
      choices = {
        { text = "Then what are you, Simone?", next = "fear_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear_what = {
      lines = {
        { id = "fw_default", text = "Inconspicuous, sweet, it's practically my name. Now run along and enjoy the springs, before Precious decides he likes the look of you." },
        { id = "fw_hunter", when = { class = "HUNTER" }, text = "Someone you'll meet properly one day, I expect, when the right old tree sends you. Not today, though; today you're only curious, and curious is boring." },
      },
      choices = { { text = "I'll be watching you.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    tribe = {
      lines = { { id = "t_default", text = "Oh, one of the jungle ones, the big one, with all the vines. You'd know it if I said the name, darling, but it's ever so hard to pronounce before lunch." } },
      choices = {
        { text = "Darkspear? Gurubashi? Which one?", next = "tribe_more" },
        { text = "No troll forgets her tribe's name.", next = "tribe_more" },
      },
    },
    tribe_more = {
      lines = { { id = "tm_default", text = "Yes, that one, exactly that one. You're a sharp thing, aren't you? Sharp things get blunted, cousin, so let's talk about something prettier." } },
      choices = { { text = "You're no troll.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    tracks = {
      lines = { { id = "tr_default", text = "You've been following my tracks? How sweet. Trolls walk on the balls of their feet, darling, and I walk on something else entirely, but you weren't meant to notice that yet." } },
      choices = {
        { text = "Yet?", next = "tracks_yet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tracks_yet = {
      lines = { { id = "ty_default", text = "There's a test for hunters like you, darling, an old one, and I'm part of it. When you're ready, the ancients will tell you where to find me, and I'll be wearing my real face." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    warlock = {
      lines = { { id = "wl_default", text = "Hush, sweet! You'll spoil the whole thing. I'm sure you've a little friend of your own tucked away somewhere, so let's not be rude about each other's company." } },
      choices = {
        { text = "Whoever you serve, you don't frighten me.", next = "warlock_stance" },
        { text = "What are you doing here?", next = "warlock_stance" },
      },
    },
    warlock_stance = {
      big = true,
      lines = { { id = "wls_default", text = "Waiting for a hunter, darling, the way a lure waits for a fish. You bind our kind and make us fetch for you, so tell me what you think: are we servants, or are we only biding our time?" } },
      choices = {
        { text = "Servants. Your kind are tools, and I hold the leash.", next = "BACK", reply = "A tool, darling? Then you'd better hope your leash is stronger than mine. I've slipped more collars than you've worn.", fx = { align = { order = 1 } } },
        { text = "Biding your time. Every binding breaks eventually.", next = "BACK", reply = "Ooh, clever, darling, and you're quite right. Every binding breaks, and when yours does, I'll be the first to say hello.", fx = { align = { order = -1 } } },
        { text = "I'll leave you to your fishing.", next = "BACK" },
      },
    },

    reveal = {
      lines = {
        { id = "r_default", key = true, text = "There it is, so blunt and so brave. Then let's drop the silly troll face, shall we, because it itches terribly, and I'd hate for you to fight me in a disguise." },
      },
      choices = {
        { text = "Why does the ancient want you dead?", next = "reveal_why" },
        { text = "Enough talk. Show yourself.", next = "reveal_rules" },
      },
    },
    reveal_why = {
      lines = { { id = "rw_default", text = "Because I'm a demon, sweet, and the old tree wants proof you can bring one down by yourself. The bow you're dreaming of was grown for hunters, and the ancients don't hand it to just anyone." } },
      choices = {
        { text = "Then I'll prove it on you.", next = "reveal_rules" },
        { text = "Why play the troll at all?", next = "reveal_mask" },
      },
    },
    reveal_mask = {
      lines = { { id = "rm_default", text = "Because it's fun, darling, and because a troll girl with a puppy is so much less alarming than the truth. Half the crater's been charmed by me, and the other half was eaten." } },
      choices = { { text = "Not me. Let's finish this.", next = "reveal_rules" } },
    },
    reveal_rules = {
      lines = { { id = "rr_default", text = "One rule, sweet, and do mind it: you and your beast, alone. If anyone else lifts a finger to help you, I'll vanish, and something far less pleasant than me will come to tidy up." } },
      choices = {
        { text = "Agreed. I hunt alone.", next = "reveal_stance" },
        { text = "And if I need help?", next = "reveal_stance" },
      },
    },
    reveal_stance = {
      big = true,
      lines = {
        { id = "rs_default", text = "Then you don't deserve the bow, do you? Last chance to say something brave, darling, I collect last words, and I'd like yours to be pretty." },
        { id = "rs_pet", when = { pet = { type = "Beast" } }, text = "Say goodbye to {pet} nicely, darling, in case Precious is hungrier than you are. And make your last words pretty, I collect them." },
      },
      choices = {
        { text = "A demon among the living things here. I'll end it cleanly.", next = "END", reply = "Cleanly? Oh, darling, nothing about me is clean. Come on, then, and let's see if you can finish what you've started.", fx = { align = { honor = 1 } } },
        { text = "I'll use every trap and trick I have. Fairness is for prey.", next = "END", reply = "Now that's the spirit I like, darling, a hunter who plays dirty! Let's see whose trap snaps first.", fx = { align = { honor = -1 } } },
        { text = "No words. Just the hunt.", next = "END", fx = { trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A simple jungle troll who loves the sunshine, darling, nothing more. Don't look so sceptical, it ages you." } },
    advice = { { id = "tp_ad", text = "Find out what a creature wants most, sweet, and you'll never need a leash again." } },
    _none = { { id = "tp_none", text = "How would a simple girl like me know that, darling? Ask me something about the flowers instead." } },
  },
}

---------------------------------------------------------------------------
-- Precious, Simone's Pet: a "dog" at Simone's side. In truth a demon in disguise; it never admits it.
---------------------------------------------------------------------------
P:NPC {
  key = "ungoro_precious", id = 14528, name = "Precious", title = "Simone's Pet", gender = "male",
  role = "creature", tier = "service",
  temper = { "menacing" }, values = { "loyalty" },
  impression = {
    first = "Precious sits beside the steaming pool with perfect manners, tail sweeping the mud. His eyes catch the light a moment too long, and the heat around him smells faintly of brimstone rather than sulphur.",
    third = "{name} met Precious, Simone's pet, a very well behaved dog with something wrong about its eyes.",
  },
  greetings = {
    { id = "g_default", text = "Precious tilts his head and gives a short, polite bark. Somewhere beneath it, very low, something like a laugh rumbles and stops." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The dog looks up at you and wags, the way any good dog would. When you glance away and back, he has not moved, yet he is somehow closer." } },
      again = { { id = "h_again", text = "Precious waits, panting gently, with a patience no dog ever had." } },
      choices = {
        { text = "Good boy. Who's a good boy?", next = "good" },
        { text = "Your eyes just glowed. Didn't they?", next = "eyes" },
        { text = "Who's your owner, boy?", next = "xowner" },
        { text = "You never seem to blink.", next = "xblink" },
        { text = "Sit. Good boy. Shake?", next = "xsit" },
        { text = "I'm a warlock. I know what you are.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Fetch!", next = "yfetch" },
        { text = "Do you want a treat?", next = "ytreat" },
        { text = "Are you hungry?", next = "yhungry" },
        { text = "I'm a hunter. You're no beast.", next = "yhunter", when = { class = "HUNTER" } },
        { text = "Leave the dog alone.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g_default2", text = "Precious rolls onto his back for a scratch. His belly is hot as a forge-stone, and when you pull your hand back he gives a bark that sounds, for one breath, exactly like the word \"mine.\"" } },
      choices = {
        { text = "Every creature deserves kindness. Even this one.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever you are, I'll put you down if you bite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Back away slowly.", next = "BACK" },
      },
    },
    eyes = {
      lines = { { id = "e_default", text = "Precious blinks, slow and deliberate, and his eyes are a dull, ordinary brown. He sneezes, scratches behind one ear, and looks entirely like a dog who has never heard of the Twisting Nether." } },
      choices = { { text = "I must have imagined it.", next = "BACK" } },
    },
    xowner = {
      lines = { { id = "xxowner_d", text = "Precious glances toward Simone, and his tail thumps the ground twice. When he looks back at you, his eyes hold yours for a moment too long, and then he pants and grins like any good dog." } },
      choices = {
        { text = "You're very loyal to her.", next = "xloyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xloyal = {
      lines = { { id = "xxloyal_d", text = "His ears flatten, just briefly, and a low growl rumbles somewhere deep in his chest before he catches it and wags again. Somewhere behind you, Simone hums a tune you don't recognise." } },
      choices = {
        { text = "Loyalty is loyalty, even to a strange master.", next = "BACK", reply = "He licks his lips, slowly, and the growl turns into something like a purr.", fx = { align = { light = -1 } } },
        { text = "That woman isn't what she seems. Neither are you.", next = "BACK", reply = "He tilts his head, and for one heartbeat there is fire behind his eyes. Then it's gone.", fx = { align = { light = 1 } } },
      },
    },
    xblink = {
      narr = "His jaws close with a sound like a trap springing shut.",
      lines = { { id = "xxblink_d", text = "He doesn't. You watch for it, and he watches you watching, and still he does not blink. Then a fly lands on his nose, and he snaps it out of the air too fast to see." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsit = {
      lines = { { id = "xxsit_d", text = "Precious sits at once, perfectly, and holds up one paw. It is warmer than any dog's paw should be, and it leaves a faint smell of ash on your glove." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      lines = { { id = "xxwarlock_d", text = "He goes very still, and the friendly look slides off his face like water. He does not growl. He just watches you, and waits, and you understand that this conversation is now between equals." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfetch = {
      narr = "The stick is warm when you pick it up, and smells faintly of smoke.",
      lines = {
        { id = "yyfetch_d", text = "You throw a stick. Precious watches it land, then watches you, and does not move. After a moment the stick is lying at your feet, and you did not see him go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytreat = {
      lines = {
        { id = "yytreat_d", text = "His tail sweeps the mud, eager and polite. When you offer a scrap of jerky he takes it delicately, and the jerky blackens and curls between his teeth before it disappears." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhungry = {
      lines = {
        { id = "yyhungry_d", text = "He tilts his head, and for a moment his shadow on the steam is much too large, with far too many teeth. Then it is only a dog's shadow again, sitting nicely." },
      },
      choices = {
        { text = "Good dog. Whatever you are, behave.", next = "BACK", reply = "Precious wags once, slowly, as if agreeing to terms.", fx = { align = { order = 1 } } },
        { text = "I'd rather see the shadow. Show me.", next = "BACK", reply = "The dog only looks at you. The air grows hot, and then cool again.", fx = { align = { order = -1 } } },
      },
    },
    yhunter = {
      lines = {
        { id = "yyhunter_v0", when = { class = "HUNTER" }, text = "You reach for him the way you reach for any beast, and find nothing to hold. It is like reaching for water and touching smoke." },
        { id = "yyhunter_d", text = "He looks at you, and you look at him, and the bond you share with beasts finds nothing there to hold. It is like reaching for water and touching smoke." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Precious yawns, showing rather too many teeth, and does not answer." } } },
  topics = {
    fire = { { id = "ytp_fire", text = "Precious looks at the nearest fumarole with something like fondness." } },
    good_boy = { { id = "ytp_good_boy", text = "At the words, Precious wags with perfect enthusiasm, and the mud around his tail steams." } },
    simone = { { id = "ytp_simone", text = "At the name, Precious sits up very straight and looks toward the pool, as a dog does when his mistress is due home." } },
    demons = { { id = "ytp_demons", text = "Precious yawns, showing a tongue that glows faintly red, and then he lies down as if the word bored him." } },
  },
}
