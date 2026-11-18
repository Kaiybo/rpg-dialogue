-- Bloodvenom Post: the Horde's only fire in Felwood, on the cliffs over the poisoned river. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "winna", id = TODO_NPC("Winna Hazzard"), name = "Winna Hazzard",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "manic" }, values = { "curious", "mischievous" },
  notices = { "race", "pet" },

  impression = {
    first = "Winna Hazzard cackles at the end of every other sentence and keeps a kitten she plans to make much larger. Felwood delights her, and that alone ought to worry everyone.",
    third = "{name} met Winna Hazzard, the cackling alchemist of Bloodvenom Post, who finds the corruption of Felwood fascinating.",
  },

  greetings = {
    { id = "g_laugh", text = "*cackles* Oh, a visitor! Mind the kitten, and mind the bottles, and mind everything, really." },
    { id = "g_back", when = { metBefore = true }, text = "*laughs* You came back, and nobody comes back! That's my favourite kind of person." },
    { id = "g_away", when = { away = 14 }, text = "*cackles* You've been gone {away}, and look, you came back again! The kitten's grown, the bottles have multiplied, and nobody else has come back at all." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "*laughs* Oh, look at you, darling, you've grown so much bigger and meaner since you last visited! Felwood didn't do that to you, did it, because I'd love a sample if it did." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "*cackles* I hear you frightened somebody at the post half out of their wits, darling! Do tell me how, because I've been trying for weeks." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you told somebody at the post a lovely big lie and they swallowed it whole, darling! *laughs* I adore a good experiment, and that sounds like a successful one." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of us! Isn't it wonderful, not needing to breathe in a place like this? *cackles* The tauren all cough." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Ooh, a pet! My kitten wants to meet it, but my kitten wants to meet everything, so keep them apart, I think." },
  },

  start = "hello",
  nodes = {
    xpt_winna = {
      big = true,
      lines = { { id = "xpt_winna_default", text = "Research, darling, the very best kind, the kind nobody will pay for until it works! Corruption makes things bigger and meaner, and if I can learn how, my kitten will grow up to be the biggest and meanest cat in Kalimdor." } },
      choices = {
        { text = "That's madness. Some things shouldn't be meddled with.", next = "BACK", reply = "Madness is just research that hasn't paid off yet, darling! Come back in a month and see if you still think so.", fx = { align = { light = 1 } } },
        { text = "Brilliant. Somebody should profit from this mess.", next = "BACK", reply = "Oh, a kindred spirit at last! Somebody should, and it's going to be me and my kitten.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything! The Light ought to burn you and it doesn't, and Felwood ought to kill everything and it doesn't, so you and the forest are cousins of a sort. I'd love a sample, just a small one, of whatever you are." } },
      choices = {
        { text = "No samples. The Light is not a curiosity.", next = "BACK", reply = "Spoilsport! Fine, no samples, but I'm going to stare at you very hard while you're standing there.", fx = { align = { light = 1 } } },
        { text = "Take your sample. The Light can bear a little study.", next = "BACK", reply = "Oh, you darling, you lovely walking contradiction! Hold still, this won't hurt a bit, probably.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As big as a frostsaber, if the moonwell water does what I think it does, and twice as fierce! *cackles* Warriors always want something to fight beside them, and I want to see what Felwood can make out of one little cat." } },
      choices = {
        { text = "Twisting a beast like that is wicked, Winna. Leave the cat be.", next = "BACK", reply = "Wicked is such a strong word, darling, and the cat doesn't seem to mind. Well, it hissed, but it always hisses.", fx = { align = { light = 1 } } },
        { text = "A cat that size at my side? I'd fight beside it gladly.", next = "BACK", reply = "There, you see, a warrior who appreciates progress! I'll save you the first one, if it doesn't eat me.", fx = { align = { light = -1 } } },
        { text = "Something else, Winna.", next = "BACK" },
      },
    },
    warlock_w = {
      big = true,
      lines = {
        { id = "ww_default", text = "Oh, I knew I'd like you! Most people get very twitchy when I mention what's in the water here, but you've got that lovely green smell about you, so you understand: it isn't evil, it's just extremely concentrated." },
      },
      choices = {
        { text = "Exactly. Power is power.", next = "BACK", reply = "Exactly, exactly, and nobody else in this miserable post understands it! We should have tea, warlock, green tea.", fx = { align = { light = -1 }, affinity = 2 } },
        { text = "It's evil, Winna. I just use it anyway.", next = "BACK", reply = "Ha! Honest and wicked, my favourite combination. You'll fit right in here, darling.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Answer? Oh, they shriek all day long, which is much more interesting! The river would melt your totems, and the earth around Jaedenar tastes of fel, which I know because I tasted it. *cackles* If the elements here are sick, I'd like a sample before somebody goes and cures them." } },
      choices = {
        { text = "Bottle what you like, if it helps the Horde.", next = "BACK", reply = "For the Horde, for science, for my kitten, it's all the same thing! I knew a shaman would see sense eventually.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Sick spirits deserve healing, not your bottles.", next = "BACK", reply = "Healing, bottling, it's all a matter of perspective, darling. I'll bottle the sick ones and you heal the rest.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, it could, it could! But a vial on a blade kills one elf, and the right poison in the right well could make a hundred kittens into a hundred weapons, which is the sort of arithmetic the Dark Lady appreciates. *cackles*" } },
      choices = {
        { text = "A quiet blade is cleaner than a poisoned well.", next = "BACK", reply = "Cleaner, yes, and so very small! Think bigger, darling, think wells.", fx = { align = { honor = 1 } } },
        { text = "Whatever works. The Alliance would do the same to us.", next = "BACK", reply = "Precisely, and they'd do it faster if they thought of it first! I'm just being efficient.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll leave the arithmetic to you.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It makes things bigger and angrier, mostly, and one sip doubled my kitten's size before I could stop laughing. The satyrs pour their foulness into it at the Ruins of Constellas, and the well breeds more of them, which a mage like you might call an elegant little engine." } },
      choices = {
        { text = "That well should be destroyed, not studied.", next = "BACK", reply = "Destroyed? Before I've finished? Darling, you wound me, you really do.", fx = { align = { light = 1 } } },
        { text = "An engine like that could be made to work for us.", next = "BACK", reply = "Now you're speaking my language! Bigger, angrier and on our side, it's a perfectly lovely engine.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll keep my hands out of it, thanks.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Nearly all of it, and isn't that the charm? The Shadow Council soaked Jaedenar in fel until the very dirt forgot what it used to be, and no prayer of yours will make it remember, though you're welcome to try while I take notes. *cackles*" } },
      choices = {
        { text = "Some of it can still be mended, and I mean to try.", next = "BACK", reply = "Try, then, and I'll watch, and take notes on how it goes. Failure is wonderful data.", fx = { align = { light = 1 } } },
        { text = "Then let's learn to aim it at the Alliance.", next = "BACK", reply = "Oh, I like you, I really do! Aim and fire, darling, that's all science is.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Well, it is curious! The water glows, the wolves have extra teeth and the mushrooms whisper, and I want to know why. I know you druids want to scrub it all clean, and that's fine, but somebody ought to write down what's here before it's gone." } },
      choices = {
        { text = "This forest is dying. It needs healing, not study.", next = "BACK", reply = "Dying, healing, studying, it all looks the same from where I'm standing! I'll leave you a little of it to heal.", fx = { align = { light = 1 } } },
        { text = "Know the poison first, and the cure can come after.", next = "BACK", reply = "A druid who reads the label first! Darling, you've made my whole week.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Never mind the mushrooms.", next = "BACK" },
      },
    },
    dd_deaths = {
      lines = {
        { id = "ddd_default", text = "Then you and I have something in common, except that you keep coming back warm and I came back cold. Dying is a small thing once you've done it, really. It's what you come back as that matters, and you keep coming back as yourself, which is either lucky or very dull." },
        { id = "ddd_undead", when = { race = "Scourge" }, text = "Oh, but we've both done it properly, you and I, and the second death is never as interesting as the first. Do try not to fall apart out there; I haven't the thread to sew you back together." },
      },
      choices = {
        { text = "Lucky, I'd say.", next = "BACK", reply = "Spoken like someone with a pulse. Mind you keep it, then." },
        { text = "Something else, Winna.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_secrets", when = { questDone = TODO_QUEST("Guarding Secrets") }, text = "Trull says you found what the owlbeasts were guarding for him. I want to know what it was, and he refuses to tell me, which is exactly the sort of thing that makes unlife worth living." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You've died a good many times, haven't you? I can always tell. The living get a sort of crumpled look about them once they've been to the spirit healer often enough, and I find it rather charming." },
        { id = "o_forsaken_pity", tags = { "news" }, when = { opinion = { topic = "forsaken", stance = "pity" } },
          text = "I hear you think the Forsaken are still people inside. How touching! Do hold this flask while you're feeling sympathetic." },
        { id = "h_pt_winna", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you! Oh, that's wonderful, because I need a great many samples from the Bloodvenom and nobody ever volunteers twice." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! Oh, splendid, you look sturdy enough to carry my kitten when it gets much bigger, and it is going to get much bigger. *cackles*" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, do tell me what the fire spirits think of my cauldron, because it bubbles in colours I've never seen and I'd love a second opinion. *cackles*" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, how lovely! You lot always know which bottle not to drink from, and that makes you twice as useful to me as anyone in this post. *cackles*" },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Do you know, I'm almost certain the satyrs' foul moonwell has gone arcane as well as rotten, but I haven't found a mage willing to taste it yet. *cackles*" },
        { id = "h_default", key = true,
          text = "Winna Hazzard, alchemist of a sort, servant of the Dark Lady and keeper of one kitten! Felwood is the most interesting place I've been since I died, because everything in it is wrong in some new way. *cackles*" },
        { id = "h_strange", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange One") },
          text = "Someone told you I was strange, didn't they? *laughs* Then there's hope for you yet, because you came anyway. Are you here to help me?" },
        { id = "h_well", when = { questActive = TODO_QUEST("Well of Corruption") },
          text = "The Jadefire satyrs keep a moonwell at the Ruins of Constellas, south of here, gone all foul and bubbling. Bring me a sample, and don't drink it! *laughs* Well, don't drink much." },
        { id = "h_sabers", when = { questActive = TODO_QUEST("Corrupted Sabers") },
          text = "One sip of that water and my kitten doubled in size, and it's stronger, somehow! Carry it to the moonwell and let it out beside it, and we'll see what it becomes... *cackles* oh, we'll see!" },
        { id = "h_sabers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Corrupted Sabers"), days = 3 } },
          text = "Look at it, look at the size of it! *cackles* If the corrupted water can do that to one little cat, think what a few dozen like it could do to the Alliance." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Oh, lovely, you can tell me whether a blessing works better before or after a sip of the river. *cackles* Nobody here will volunteer to find out." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Oh, you must love Felwood, everything here grows in such interesting ways, and none of them are the way the Earth Mother intended!" },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Oh, that's wonderful, that's wrong in a whole new way, and you know how I love things that are wrong in new ways. *cackles*" },
      },
      again = {
        { id = "h_again", text = "*giggles* More questions? I love questions; they're like experiments that talk back." },
        { id = "h_again2", text = "Yes, yes, what else? Quickly, something's about to bubble over." },
      },
      choices = {
        { text = "I've died more times than I can count, Winna.", next = "dd_deaths", when = { deaths = { min = 10 } } },
        { text = "Do the spirits of this forest still answer anyone, alchemist?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "That kitten must have a name.", next = "kitten" },
        { text = "What are you working on?", next = "work" },
        { text = "Some would call this cruel.", next = "cruel" },
        { text = "You seem to love Felwood more than most.", next = "felwood" },
        { text = "A fellow Forsaken. Who sent you here?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Keep your potions away from my pet.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Moonwells were sacred to someone.", next = "tauren", when = { race = "Tauren" } },
        { text = "Fel is just another reagent to me.", next = "warlock_w", when = { class = "WARLOCK" } },
        { text = "Your work could poison a whole Alliance camp, couldn't it?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The corrupted moonwell must do something strange to the water.", next = "xmage", when = { class = "MAGE" } },
        { text = "Is anything in Felwood beyond mending, Winna?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How big is your kitten going to get, Winna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "You treat Felwood's corruption like a curiosity, Winna.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You seem to find a Forsaken paladin wonderful, Winna.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What are you doing with all those samples, Winna?", next = "xpt_winna", when = { party = { size = 4 } } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },

    kitten = {
      lines = {
        { id = "k_default", text = "A name? It doesn't need a name, because it knows who it is. *cackles* Half the grunts at this post couldn't tell you theirs without checking a boot." },
      },
      choices = {
        { text = "What are you planning for it?", next = "kitten_plans" },
        { text = "Can't argue with that.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    kitten_plans = {
      lines = {
        { id = "kp_default", text = "Bigger, stronger, hungrier! *laughs* The Horde could use a few cats like that, don't you think, and if they're a little bit corrupted, well, so is everything else around here." },
      },
      choices = {
        { text = "That's horrible.", next = "BACK", reply = "Horrible, wonderful, it's all the same word in the right light, darling! Come back when the kitten's bigger.", fx = { align = { light = 1 } } },
        { text = "That's brilliant.", next = "BACK", reply = "I knew you'd see it! Bigger, stronger, hungrier, and all of it ours.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },

    work = {
      lines = {
        { id = "w_default", text = "The moonwell at the Ruins of Constellas, darling! It was the night elves' precious symbol of renewal, and now it's poisoned and the satyrs use it to make more satyrs. *cackles* Isn't that marvellous?" },
      },
      choices = {
        { text = "What do you want with it?", next = "work_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_use = {
      lines = {
        { id = "wu_default", text = "To use it, of course! The corruption is already here and nobody wants it, so we ought to find a way to turn it on our enemies before it's wasted." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cruel = {
      big = true,
      lines = {
        { id = "c_default", text = "Some would, and some do, and I let them. *laughs* Really, all I want is for the Horde to have an advantage over the Alliance, any advantage at all, and is that so terrible?" },
      },
      choices = {
        { text = "It depends on the advantage.", next = "cruel_alliance" },
        { text = "Not if it wins the war.", next = "BACK", reply = "There, you see, it's practically patriotic! I'm doing it for the Horde, darling, mostly.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Some advantages cost more than any war is worth.", next = "BACK", reply = "Oh, pish, that's what the Alliance would say if they'd thought of it first. Still, I'll take it under advisement.", fx = { align = { honor = 1 } } },
      },
    },
    cruel_alliance = {
      lines = {
        { id = "ca_default", text = "Oh, you sound like a tauren. The Forsaken will use whatever means it takes to crush the Alliance, my dear, and we don't get to be fussy about which means are pretty. *cackles*" },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { forsaken_methods = "against" } } } },
    },

    felwood = {
      lines = {
        { id = "f_default", text = "Everything here is poisoned or mad or both, and every poison is different from the last! I could study this forest for a hundred years and still find something new to bottle. *giggles*" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    forsaken = {
      lines = {
        { id = "fo_default", text = "Nobody sent me, I came! *laughs* Well, the Undercity may think it sent me, and I let it think so, because they pay for the bottles." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "*cackles* Oh, I wouldn't dream of it, not without asking first. But if your pet ever looks a little small to you, you know where I am." },
      },
      choices = { { text = "Never.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "To the night elves, and they had ten thousand years to keep it clean, and look! *laughs* It's my turn now, and I'm much less precious about it." },
      },
      choices = {
        { text = "The Earth Mother wouldn't approve.", next = "BACK", reply = "Approve? Darling, the Earth Mother's had ten thousand years to clean this place up herself. I'm just helping.", fx = { align = { light = 1 } } },
        { text = "The land's already poisoned, so somebody may as well use it.", next = "BACK", reply = "Exactly, darling, waste not, want not! You'd make a lovely assistant.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An alchemist, a Forsaken and a cat lover, and two of those are true! *cackles* You decide which." } },
    advice = { { id = "tp_ad", text = "Never let anything in Felwood lick you. *laughs* I mean it, actually, that one's serious." } },
    forsaken = {
      { id = "tp_forsaken", text = "We're the free dead, darling, and we've the Dark Lady to thank for it, and a great many test subjects to thank for the progress! *cackles* You should see the apothecaries' halls in the Undercity." },
      { id = "tp_forsaken2", when = { race = "Scourge" }, text = "Ah, a fellow survivor of the grave! Don't let the living stare at you too long, darling, they always want to know what it's like and never like the answer." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady freed us from the Lich King, and I'd follow her into any swamp she pleased. She doesn't care much for cats, but nobody's perfect." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are what we were before the Dark Lady's gift, mindless and dreary. I won't say I miss it, and I'll thank you not to ask again." } },
    thrall = { { id = "tp_thrall", text = "The Warchief lets us into the Horde, and I'm grateful in my way, which isn't a very warm way. The orcs eye my potions like they might bite, which is fair." } },
    new_plague = { { id = "tp_new_plague", text = "The apothecaries are working on something, darling, and I'm not to talk about it. *cackles* Ask me again when I've had a drink." } },
    _none = { { id = "tp_none", text = "No idea! *laughs* Isn't that exciting? Being dead has made me ever so fond of not knowing things." } },
  },
}

P:NPC {
  key = "trull", id = TODO_NPC("Trull Failbane"), name = "Trull Failbane",
  bible = "bibles/felwood.md", role = "soldier", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "grim" }, values = { "loyal", "practical" },
  notices = { "kit" },

  impression = {
    first = "Trull Failbane wants to know everything Felwood hides, and he'll know if I skip a part of my report. He is grim and careful, and he plainly doesn't trust the alchemist either.",
    third = "{name} met Trull Failbane, the grim orc who serves as Orgrimmar's eyes at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_post", text = "Did Orgrimmar send you, or did you wander up here by mistake? Either way you're useful now, and the last useful one still owes me two silver and hasn't come back from Jaedenar." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and Felwood didn't stop rotting while you were away. Report what you saw, and leave nothing out." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since I last sent you out, and I can use that, because the forest has only grown worse. Orgrimmar wants reports, and I want someone who can come back with them." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone at the post caught you in a lie, and I'll know if you skip a part of your report to me. I've read enough grunts swear they killed nine satyrs before breakfast." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word around the post is you've done right by Bloodvenom, and that's rare enough up here that I'll say so. Keep it up, and keep out of the river." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest had you for lunch, so get fixed up before it comes back for supper." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Orgrimmar tells me to keep an eye on Winna Hazzard, her kitten and her poisons, and to say nothing to her about it. You've seen her work, so you tell me: what do you make of the Forsaken in the Horde?" },
      },
      choices = {
        { text = "They're Horde. They bled in the Barrens like anyone else.", next = "op_r1", fx = { align = { honor = 1 }, opinion = { forsaken = "trust" } } },
        { text = "They're using us, and one day they'll turn on us.", next = "op_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { forsaken = "distrust" } } },
        { text = "Their alchemists frighten me more than their soldiers.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { forsaken = "dangerous", new_plague = "fear" } } },
        { text = "We're the only ones who know what the Scourge really is.", next = "op_r4", fx = { trait = { proud = 1 }, opinion = { forsaken = "proud" } }, when = { race = "Scourge" } },
        { text = "I'll keep my eyes open, same as you.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Some of them did, and I'll give them that. But I've seen what their apothecaries brew, and that worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Say that quietly, and say it to me, not to the Warchief's envoys. I've a feeling you're not wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Same here, and I've met their soldiers. Ask Winna what's in the green barrels and watch how she smiles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "That's the one argument I can't answer, so I'll keep watching you while I think about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Maybe nothing, but folk say every Forsaken paladin keeps an old Silver Hand oath somewhere behind the new one. I'll not ask which you keep, but I'll be watching, the same way I watch the alchemist." } },
      choices = {
        { text = "My oath is to the Horde now. Watch all you like.", next = "BACK", reply = "Then I'll watch all I like, and I'll write down what I see. So far, it reads better than I expected.", fx = { align = { order = 1 } } },
        { text = "My oaths are my own business, Trull.", next = "BACK", reply = "They are, and I'll leave them there, so long as they stay out of my reports. Just keep them pointed at Jaedenar.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, and it never will, because Orgrimmar sends scouts and wants reports while the forest sends satyrs and wants blood. I'd trade every report I've written for a dozen grunts with sense enough to keep out of the river." } },
      choices = {
        { text = "Then I'll hold this post and follow your orders, Trull.", next = "BACK", reply = "Good, and I'll put you where you're needed, which is everywhere. Start with the south road; it's been quiet, and I don't like quiet.", fx = { align = { order = 1 } } },
        { text = "Forget the post. I'll take the fight to Jaedenar myself.", next = "BACK", reply = "Brave, and a fool, and I've buried a few like that. If you go, take a friend and bring back what you see.", fx = { align = { order = -1 } } },
        { text = "Something else, Trull.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wrong enough that the bears turn on their own cubs, and the owlbeasts at the Winterspring border attack anything that walks, as if somebody told them to guard something. That's what I send hunters up there to find out, and I don't like what they bring back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Wrong enough that the bears turn on their own cubs, and the owlbeasts at the Winterspring border attack anything that walks, as if somebody told them to guard something. And keep {pet} out of the river, if you value it. I watched a scout's wolf drink from it once, and he had to put it down himself the next morning." },
      },
      choices = {
        { text = "Then I'll put the sick ones down quickly and spare them pain.", next = "BACK", reply = "Thank you, that's the decent thing. Mind the ones that look tired; they're the ones that bite.", fx = { align = { light = 1 } } },
        { text = "Sick beasts make fierce ones. I'd tame one if I could.", next = "BACK", reply = "Brave, or mad, and I'm not sure which. If you manage it, keep it far from my supplies.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_tr = {
      lines = {
        { id = "rtr_default", text = "Good, because the Deadwood furbolgs post sentries in the dark, and the satyrs at Jadefire Run see better in it than you do. Count their numbers, find their chiefs, and come back alive; dead eyes don't report." },
        { id = "rtr_dst", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A Deathstalker, out of Undercity. Your Dark Lady trains her spies well, but this isn't Silverpine; the trees here watch you back." },
      },
      choices = {
        { text = "I'll count them and come back.", next = "BACK", reply = "Good, and I'll have the parchment ready when you're back. Orgrimmar wants numbers, not stories.", fx = { align = { order = 1 }, standing = { bloodvenom_post = 1 } } },
        { text = "If a chief's alone, I won't just count him.", next = "BACK", reply = "I'd not complain, but I'd want the count all the same. A dead chief and no numbers is half a report.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'm no shaman, but I've watched the river run green and the earth crawl with things that used to be stone, and I write all of it down for Orgrimmar. Whatever the demons did here, the land remembers it, and the Horde must understand what that means before the Alliance does." } },
      choices = {
        { text = "Then I'll report what I sense to Orgrimmar, properly.", next = "BACK", reply = "Good, and I'll make sure it gets to the right ears. My scouts can count satyrs, but they can't hear the earth.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things the spirits show me aren't Orgrimmar's business.", next = "BACK", reply = "Fair enough, shaman, and I'll not pry. Just tell me if they show you something that'll get us killed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Lights in the Jaedenar hollows that burn green without wood, and wards cut into the ground around the Shadow Council's camps. I write them down as best I can, but I'd sooner have someone who knows the arcane read my notes than some clerk in Orgrimmar." } },
      choices = {
        { text = "Burn the wards and ask questions later.", next = "BACK", reply = "Ha! That's a mage's answer, and some days I'd agree. But the questions keep us alive.", fx = { align = { order = -1 } } },
        { text = "You're right to write it all down first.", next = "BACK", reply = "Thank you. Orgrimmar never thanks anyone in words, but the reports get read, and that's something.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep an eye out for the green lights.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "So did the Shadow Council, once, and look at what they made of Jaedenar. I don't say you're one of them, but I've read enough of what fel does to the people who use it to keep my eyes open." } },
      choices = {
        { text = "The Council were traitors. They earned their end.", next = "BACK", reply = "They did, and I'd be glad to see the rest of them follow. You talk like a warlock who's seen what I've seen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Council were fools. I know where the line is.", next = "BACK", reply = "Every one of them said the same, warlock. Keep your line well marked, because I'll be watching it.", fx = { align = { light = -1 } } },
        { text = "Watch all you like, then.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Robed cultists of the Shadow Council, more of them every week, chanting over fires that burn green, and orcs among them who ought to have known better. Whatever they mean to call up, Orgrimmar wants it named before it walks out of those hills." } },
      choices = {
        { text = "Then I'll help you name it, for the Horde's sake.", next = "BACK", reply = "Good, and I'll be glad of the help. Count the fires first; that tells you more than counting robes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Orgrimmar can send its own eyes. I go where I please.", next = "BACK", reply = "You go where you please, and I'll write down what you do. Orgrimmar reads everything, eventually.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_well", when = { questDone = TODO_QUEST("Well of Corruption") }, text = "Winna says you brought her samples from the corrupted wells and didn't drink any of them, which puts you ahead of the last grunt she sent. Felwood's water is the same poison that took my people once, so don't touch it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Good, Bloodvenom needs more of your kind than it gets, because the satyrs and the Deadwood don't wait for a scout to finish counting them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter, good. The beasts of Felwood are wrong down to the last rat, and I want someone who knows what a healthy wolf looks like telling me how far wrong." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. Orgrimmar's shamans see things a scout misses, and in Felwood I'll take every pair of eyes I can get." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Good; I've seen things in this forest I can't name, and you might put names to them before they get to Orgrimmar ahead of my report." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, at Bloodvenom. I'll be watching you as closely as I watch the forest, so don't take it personally when you catch me at it." },
        { id = "h_default", key = true,
          text = "I am Trull Failbane, and Orgrimmar pays me to be its eyes in Felwood. This forest is full of the same fel that once poisoned my people, and the owlbeasts on the Winterspring border are guarding something, so I mean to find out what." },
        { id = "h_guardians", tags = { "news" }, when = { questActive = TODO_QUEST("Wild Guardians") },
          text = "Back with word? Good, then sit and tell me everything, slowly, because I'll know if you skip a part." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Guarding Secrets") },
          text = "Some things in Winterspring are guarded for a reason, and I want to know the reason; then I'll decide if the guards were right." },
        { id = "h_winna", when = { heardLine = "winna.h_default" },
          text = "You've met the alchemist, then. Don't ask me about her, because I don't know what she's doing either, and nobody does; she laughs when you ask." },
        { id = "h_guardians_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wild Guardians"), days = 3 } },
          text = "Hard work is something I respect, and you've done plenty of it in the snow. With those owlbeasts out of the way, we can push further into Winterspring." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, out at the edge of the rot. Keep your prayers short and your eyes open, because the cultists at Jaedenar pray too, and you can see what it's bought them." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I'm paid to find out what Felwood hides, and now I'll have to find out what you hide too." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it worth writing down; the Warchief reads what I send." },
      },
      choices = {
        { text = "What do the elements tell you about this forest, Trull?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's out in Winterspring?", next = "winterspring" },
        { text = "Why does Orgrimmar care about owlbeasts?", next = "why" },
        { text = "What is this post, anyway?", next = "post" },
        { text = "The alchemist seems to be up to something.", next = "winna", when = { heardLine = "winna.h_default" } },
        { text = "That glowing necklace looks like no owlbeast trinket.", next = "nara", when = { questDone = TODO_QUEST("Guarding Secrets") } },
        { text = "The wildkin are kin to one of my forms.", next = "druid", when = { class = "DRUID" } },
        { text = "You want eyes? Mine work in the dark.", next = "rogue_tr", when = { class = "ROGUE" } },
        { text = "You must have seen things out here you can't name.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why watch me? I serve the Horde like you.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What have your eyes seen at Jaedenar, Trull?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does Bloodvenom Post have enough warriors, Trull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How wrong are the beasts of Felwood, Trull?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you think I'm hiding, Trull?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll be your eyes too.", next = "END", fx = { affinity = 1, standing = { bloodvenom_post = 1 } } },
      },
    },

    winterspring = {
      lines = {
        { id = "ws_default", text = "Snow, past the Timbermaw tunnels to the northeast, and owlbeasts, wildkin, crawling all over it. They're guarding something, night elf secrets if I had to guess, and beasts don't guard nothing." },
      },
      choices = {
        { text = "The secrets must be hidden somewhere up there.", next = "winterspring_caves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winterspring_caves = {
      lines = {
        { id = "wc_default", text = "Runners came back with word of small caves in the south of Winterspring, with wildkin thick around them. Those ones have gone mad, berserk, as if whatever they guard has been working on them for too long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because the night elves have had this continent to themselves for ten thousand years, and we've had it for a few. Whatever they've hidden, the Horde should know about it before it surprises us." },
      },
      choices = {
        { text = "And if it's something sacred?", next = "why_sacred" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_sacred = {
      lines = {
        { id = "wsa_default", text = "Then we'll know that too, and Orgrimmar can decide whether to leave it be. Knowing is my job; deciding is somebody else's, which suits me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    post = {
      lines = {
        { id = "p_default", text = "Some tauren raised it on these cliffs above the poisoned river, and their braves still keep the watch. It's the only Horde fire in Felwood, so we keep it small and we keep it lit." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    winna = {
      lines = {
        { id = "wi_default", text = "Bottling corrupted water and feeding it to her cat, as far as I can tell. I don't ask, because she laughs, and I don't like the laugh." },
      },
      choices = {
        { text = "What do you make of the Forsaken in the Horde?", next = "op_ask" },
        { text = "Do you report on her?", next = "winna_report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winna_report = {
      lines = {
        { id = "wr_default", text = "I report on everything, and she's in every report. Whether anyone in Orgrimmar reads that part, I couldn't tell you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    nara = {
      lines = {
        { id = "n_default", text = "That's beyond me; I know owlbeasts, not their magic, which is why it went to Nara Wildmane, the elder druid in Thunder Bluff. If the wildkin were made to guard someone's holy places, then what they're guarding matters more than I thought." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Then you'd know better than me what makes a wildkin angry, and I'd like to hear it. Write it down, slowly, and I'll see it gets to Orgrimmar." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "These are in my reports, so I can speak to them. The rest stays between me and Orgrimmar." },
    },
    cenarion_circle = { { id = "tp_circle", text = "The druids south of here are honest, as far as I can tell. That's rare enough to report." } },
    background = { { id = "tp_ba", text = "I gather what Orgrimmar needs to know and send it home. My own story isn't something anyone's asked for." } },
    advice = { { id = "tp_ad", text = "Take the tunnels through Timbermaw country politely, if the furbolgs let you. The other way round is longer and colder." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief wants to know what's happening in Felwood, so I find out and send it home. He reads every report to the last line, and I can't say that of the clerks in Orgrimmar." },
      { id = "tp_thrall2", when = { faction = "Alliance" }, text = "You're Alliance, and you ask about the Warchief? He's the best thing that's happened to my people, and you'll get nothing else out of me." },
    },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the only furbolgs in Felwood worth talking to, and they don't like me much. I don't take it personally; they don't like anyone." } },
    burning_legion = { { id = "tp_burning_legion", text = "Jaedenar's full of Shadow Council warlocks and their demons. Orgrimmar wants to know what they're doing, and I want to know before they do it." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Forsaken queen is an ally, the Warchief says, and so she's an ally. I read her people's reports twice, all the same." } },
    _none = { { id = "tp_none", text = "Not in my reports. An orc reports what he has seen with his own eyes, and nothing else." } },
  },
}
