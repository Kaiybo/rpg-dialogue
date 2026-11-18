-- The farms and hills of the Western Plaguelands: the ghosts, the dying and the hidden. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "janice", id = TODO_NPC("Janice Felstone"), name = "Janice Felstone",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "felstone_field" }, temper = { "cowardly" }, values = { "loving" },
  notices = { "stealth" },

  impression = {
    first = "She doesn't know what she is, and I couldn't tell her.",
    third = "{name} met Janice Felstone, a lost and fretful spirit still waiting for her husband at Felstone Field.",
  },

  greetings = {
    { id = "g_john", text = "John, is that you? Oh, no, you're someone else, aren't you, but have you seen him anywhere?" },
    { id = "g_cold", text = "It's so cold in the house, and I'm sure I lit the fire, didn't I, so why is it still so cold?" },
    { id = "g_free", when = { questDone = TODO_QUEST("Two Halves Become One") }, text = "You came back, and I remember you now, I remember everything. It's so much quieter, remembering." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Someone's there, I know it, even though I can't see you. I can't see anything clearly anymore." } },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Left to the wild? But it's our farm, and John says we'll plant again in spring, once the sickness passes. Oh, but the sickness doesn't pass, does it? I keep forgetting that." } },
      choices = {
        { text = "Let the wild have it, Janice. It's time to rest.", next = "BACK", reply = "Rest? But there's the wheat to bring in, and John's not back yet. Perhaps a little rest, once the package comes.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your family's farm should stay yours, even now.", next = "BACK", reply = "That's what Pa says, and he's always right about the farm. You're very kind to say so, {class}.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Men from Andorhal, John said, coming to march the families south before the sickness reached the fields. They should have been here days ago, and I can't think why the horse is so quiet." } },
      choices = {
        { text = "I'll stand guard here, Janice, for as long as you need.", next = "BACK", reply = "Would you? That's ever so kind, and I'll feel much safer with you at the door. They'll be along any moment now.", fx = { align = { light = 1 } } },
        { text = "No army is coming, Janice. Andorhal fell long ago.", next = "BACK", reply = "Fell? No, that can't be right, because John went to Andorhal only this morning. You must be thinking of somewhere else.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They come right up to the door in broad daylight and stare, and they don't run when John shouts, and their eyes have all gone cloudy. I'm sure it's only the cold, it's been terribly cold, but I do wish John would take his bow out and see them off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They come right up to the door in broad daylight and stare, and they don't run when John shouts, and their eyes have all gone cloudy. I'm sure it's only the cold, it's been terribly cold, but I do wish John would take his bow out and see them off. Your {pet} won't come any closer, will it?" },
      },
      choices = {
        { text = "I'll see the foxes off for you, Janice. Rest easy.", next = "BACK", reply = "Thank you, and I'll tell John you did it, when he comes in. They give me such a turn, those eyes.", fx = { align = { light = 1 } } },
        { text = "The foxes are plagued, Janice, like everything here. Like you.", next = "BACK", reply = "Like me? What a strange thing to say, {class}. I'm only cold, that's all, only very, very cold.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "For me? Oh, but I'm not the one travelling, it's the package and the cart and John, and I've just got to wait here until they come back. Only it's been such a long wait, and I'm so cold, and I can't remember the last time I slept." } },
      choices = {
        { text = "Rest now, Janice. The Light will keep you warm.", next = "BACK", reply = "Warm? I'd like that more than anything. I'll just close my eyes for a moment, while I wait.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You must face what happened before the Light can help.", next = "BACK", reply = "Face what, {class}? I don't understand, and I don't like the way you're looking at me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something terrible, I think, because the knights stopped coming and the bells in Andorhal rang and rang one night and then never again. You've such a kind face for someone in all that steel, so maybe you can tell me, gently, if John's not coming home." } },
      choices = {
        { text = "I'll bring John back to you, Janice. Rest easy.", next = "BACK", reply = "Would you? Tell him to hurry, and tell him I've kept his supper warm, or I've tried to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Hand is gone, Janice. You should know the truth.", next = "BACK", reply = "Gone? But the knights were here only last spring, I remember the banners. Please don't say such things, it frightens me.", fx = { align = { light = -1 } } },
        { text = "Something else, Janice.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "He kept it in the barn, by the horse, with the package, or was it the other way round? Everything's muddled, and things keep moving when I'm not looking, and I'd be grateful if you'd look for me, since you seem the sort who finds things." } },
      choices = {
        { text = "I'll find your package, Janice, and the knife too.", next = "BACK", reply = "Oh, would you? Thank you, and do check under the hay, because things keep wandering off.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead farm's things belong to whoever finds them.", next = "BACK", reply = "Dead farm? This is our farm, {class}, and those are our things, and I'll thank you to leave them where they are.", fx = { align = { honor = -1 } } },
        { text = "Something else, Janice.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It's cold, always cold, and the ground hums at night like a kettle about to boil. The fields used to smell of wheat, and now they smell of something else, and I can't think what, only that it makes the horse kick the stall all night." } },
      choices = {
        { text = "The land can heal. I'll speak for it, Janice.", next = "BACK", reply = "Would you? I'd like to smell the wheat again, just once, before the winter. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land's poisoned through, Janice. It won't come back.", next = "BACK", reply = "Won't come back? But Pa says it always comes back in spring. I'd rather believe Pa, if you don't mind.", fx = { align = { light = -1 } } },
        { text = "Something else, Janice.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "She went to Stormwind instead, to work for some family there, and she writes when she can, or she did, I think. I keep meaning to write back, and the letter's half done on the table, and every time I sit down to finish it, it's somehow gone back to the beginning." } },
      choices = {
        { text = "I'll carry word to Emma for you, Janice.", next = "BACK", reply = "Would you? Tell her I'm sorry about the letter, and that I think of her every evening.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some letters are best left unfinished, Janice.", next = "BACK", reply = "Perhaps you're right, though it seems a pity to leave it lying there. I'll just look at it a while longer.", fx = { align = { light = -1 } } },
        { text = "Something else, Janice.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, and I don't want to, but they come up out of the wheat at dusk and walk the fences, and one of them wears John's coat. Please keep your little shadow close, because I couldn't bear it if anything else came into this house." } },
      choices = {
        { text = "It stays close, Janice. Nothing will harm you here.", next = "BACK", reply = "Thank you, and do keep it away from the window. John's coat is out there, and I can't bear to look.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demon has seen worse than your ghouls, Janice.", next = "BACK", reply = "I'm sure it has, and I'm sure you mean to comfort me, but please, keep it close all the same.", fx = { align = { light = -1 } } },
        { text = "Something else, Janice.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Oh, a dwarf, and with lightning crackling at your fingers! John always said the dwarves were miners and smiths, but you seem something else entirely, and you've a kind face, so I won't be frightened." },
        { id = "h_default", key = true,
          text = "The package has to go before the plague comes, it must, and it's by the horse in the barn, I'm sure it is. Oh, am I too late?" },
        { id = "h_charm", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Good Luck Charm") }, { questActive = TODO_QUEST("Two Halves Become One") } } },
          text = "John has the other half of our charm, and if you bring it, we'll be together and nothing can touch us, not the ghouls and not the cold. Hurry, John, please hurry." },
        { id = "h_ghoul", when = { questActive = TODO_QUEST("Two Halves Become One") },
          text = "There's something out in the fields that keeps on calling, and it sounds a little like John, if John had forgotten all of his words." },
        { id = "h_free", when = { questDone = TODO_QUEST("Two Halves Become One") },
          text = "I can see you properly now, and I know what's in the fields, and what I am. It's all right, because soon I'll rest, and I have you to thank for it, stranger." },
        { id = "h_cold", when = { metBefore = true },
          text = "There's so much to do, the cart to pack and the horse to feed and a letter to Emma in Stormwind, and did I write to Emma? Someone should tell her I'm sorry." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "Oh, a priest, how lovely, you've come about the blessing for the cart, haven't you? John said we should have one before the long road, but I can't think where he's put the coin." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Oh, you're a soldier! Has the army come at last? John said they'd send someone to see the farms safe, and I've been keeping the kettle warm for days." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "Are you a hunter? John used to go after the foxes that came for our hens, though lately the foxes have been ever so strange, and the hens won't lay at all." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid? Oh, the farm's gone so quiet, there aren't any animals left, not even the barn cats. Can you hear them? I can't hear them anymore." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Oh, a knight of the Silver Hand! Have you come from Uther? John said the Hand would ride through before the sickness spread, and I've been watching the road for days." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! You came in so softly, like the tinker who sold John his pocket knife, and he was a rascal, John said, but a friendly one. Are you a friendly one?" },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "Oh, goodness, you're not from Lordaeron, are you? John said there were orcs in camps in the south, and I used to worry, but you seem quite gentle, and you've a kind way about you." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Are you from Dalaran? Emma always wanted to go to Dalaran, to see the towers, but Father said a farm girl had no business with spells." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Oh, there's something behind you, the little shadow with the eyes. It isn't one of the things from the fields, is it? John says to bar the door against those." },
      },
      again = {
        { id = "h_again", text = "You're still here, aren't you, and I'm glad of it, the house is so quiet when nobody talks." },
        { id = "h_again2", text = "What was I saying? You'll have to remind me, I lose things so easily now." },
      },
      choices = {
        { text = "Janice, do you know what happened to the Silver Hand?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What became of John's pocket knife, Janice?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you feel the land around the farm, Janice?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd guess Emma went on to Dalaran, Janice.", next = "xmage", when = { class = "MAGE" } },
        { text = "What are the things in the fields, Janice?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll find your package.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Who is John?", next = "john", when = { questBefore = TODO_QUEST("Two Halves Become One") } },
        { text = "That package seems very important to you.", next = "package" },
        { text = "It's terribly cold in here.", next = "cold" },
        { text = "I met your sister Emma, in Stormwind.", next = "emma", when = { questDone = TODO_QUEST("Good Natured Emma") } },
        { text = "Rest now.", next = "END", reply = "Rest? Yes, I think I could, now that the package is home. Thank you, {class}, and mind the cold on your way out.", when = { questDone = TODO_QUEST("Two Halves Become One") }, fx = { affinity = 1, align = { light = 1 } } },
        { text = "Janice, would you like me to say a blessing for you?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Spare me the thanks, because I've ghouls enough to deal with.", next = "END", reply = "Oh, I'm sorry, I didn't mean to keep you. Go on, then, and do be careful of the ghouls by the fence.", when = { questDone = TODO_QUEST("Two Halves Become One") }, fx = { align = { light = -1 } } },
        { text = "Janice, do you know what I am?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "Janice, which soldiers were you expecting?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The foxes out here seem wrong somehow, Janice.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should the farm be left to the wild now, Janice?", next = "xdruid", when = { class = "DRUID" } },
      },
    },
    john = {
      lines = {
        { id = "j_default", text = "My John went out to see about the noise in the field, and he hasn't come back in yet. He has the other half of our charm, so tell him to come inside now, it's getting dark." },
      },
      choices = {
        { text = "I'll look for him.", next = "BACK", fx = { affinity = 2 } },
        { text = "(Say nothing.)", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something's out in that field, Janice.", next = "john_field" },
      },
    },
    john_field = {
      lines = {
        { id = "jf_default", text = "Something, yes, I hear it every night, but John's out there too, and he'll see it off, he always does. You'll tell him I'm waiting, won't you, when you find him?" },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "(Let her hope a little longer.)", next = "BACK", reply = "You will tell him? Oh, thank you. I'll keep the lamp lit in the window, so he can find his way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "John's gone, Janice, and that thing in the fields isn't him.", next = "BACK", reply = "Not him? But it wears his coat, and it walks his fence. No, no, I won't believe it, I won't.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    package = {
      lines = {
        { id = "pk_default", text = "It's for my family, and I wrapped it myself, so it has to get there before the plague takes everything. I meant to take it myself on the horse, only the horse wouldn't come, or I couldn't find the road." },
      },
      choices = {
        { text = "It must be meant for someone dear.", next = "package_emma" },
        { text = "Something else.", next = "BACK" },
      },
    },
    package_emma = {
      lines = {
        { id = "pe_default", text = "My sister Emma, in Stormwind. She'll think we're all gone, and she mustn't think that, not while I'm still here to send it." },
      },
      choices = {
        { text = "I'll see it gets to her.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = {
        { id = "co_default", text = "I don't know why, I keep the fire going all day and still I can't get warm, and the light through the window looks wrong somehow. Perhaps it's only the weather turning." },
      },
      choices = {
        { text = "Perhaps it is.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Janice, you're a ghost.", next = "BACK", fx = { trait = { blunt = 1 } } },
      },
    },
    emma = {
      lines = {
        { id = "em_default", text = "You saw Emma, my Emma, and she had my parcel in her hands? Then she knows I didn't forget her, and that's one thing done right, at least." },
      },
      choices = {
        { text = "She knows.", next = "BACK", reply = "Then I can stop worrying about that, at least. I've kept her waiting long enough.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "She knows you're gone, Janice, and it's time to let go.", next = "BACK", reply = "Let go? I think, perhaps, I've been holding on very tightly. I'll try, {class}, if you'll stay a moment.", fx = { align = { honor = 1 } } },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "You're not John, though your hands are as cold as his were the last time he came in from the field. Have you come about the harvest, then, from over Brill way? Nobody comes about the harvest anymore." },
        { id = "xf_brill", when = { origin = "forsaken_brill_farmer" }, text = "Brill! I knew it, you've the look of a Brill farmer, and we used to trade seed with your lot every spring, before the sickness came through." },
      },
      choices = {
        { text = "The harvest is over, Janice. Rest now.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "This is our farm, John's and mine, and we're leaving soon, as soon as the package is sent and the cart is packed." } },
    advice = { { id = "tp_ad", text = "Keep away from the fields after dark. Something walks there, and it doesn't stop to say hello." } },
    lordaeron = { { id = "tp_lordaeron", text = "I don't know what you mean about Lordaeron, dear, it's right where it always was. John will be home soon, and then we'll go to Stormwind to see my sister." } },
    scourge = { { id = "tp_scourge", text = "There's been sickness in the villages, John says, but it won't come here. I'm sure it won't come here." } },
    stratholme = { { id = "tp_stratholme", text = "John's cousin lives in Stratholme, and we were going to visit before the harvest. I hope he's well." } },
    _none = { { id = "tp_none", text = "I can't think about that now, not with the plague coming. Can't you smell it on the wind?" } },
  },
}

P:NPC {
  key = "mulgris", id = TODO_NPC("Mulgris Deepriver"), name = "Mulgris Deepriver",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "writhing_haunt", "cenarion_circle" }, temper = { "steady" }, values = { "compassionate", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Dying, he asked mercy for the sick beasts and none for himself.",
    third = "{name} met Mulgris Deepriver, a dying tauren druid of the Cenarion Circle at the Writhing Haunt.",
  },

  greetings = {
    { id = "g_dying", text = "Come closer, little one, for my voice doesn't carry the way it did, and neither do my legs." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and I'm still here, though not for long, so let's not waste the time the Earth Mother has left me." },
    { id = "g_dead", when = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
      text = "(The tauren lies still. Whatever he was holding onto, he has let it go.)" },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "Yes, I speak your tongue, and no, we are not beasts, whatever your soldiers say of us. Put that aside, for the land is dying, and it doesn't care whose flag you fly." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, so you feel it too, the land crying out under the plague. I came to quiet it and I failed, but perhaps you won't." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, for the plague has left them nothing but pain, and a clean blow is a mercy. What grieves me is how few who swing the blade ever stop to think of the wolf it was before the Scourge came." } },
      choices = {
        { text = "Then I'll strike cleanly and remember what they were.", next = "BACK", reply = "Thank you. That is all the hunter's way asks, and it is more than most give.", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. I can't mourn every wolf I kill.", next = "BACK", reply = "No, and I would not ask you to mourn them all. But think of one, now and then, as you walk on.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not these, for the sickness has gone into their bones and their minds both. All a hunter can give them now is a quick end, and it should come from one who knows how to give it gently." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is healthy, and I thank Cenarius for every clean beast I still see. Keep it away from the Writhing Haunt, {class}, for the sick ones will call to it, and it may answer." },
      },
      choices = {
        { text = "I'll give them a gentle end, as you'd wish.", next = "BACK", reply = "Then the Earth Mother will see it, and so will I. Go gently, young hunter.", fx = { align = { light = 1 } } },
        { text = "Sick or not, they're prey now. I'll hunt them as I please.", next = "BACK", reply = "Prey you call them, and so they are now. I only ask that you are quick, as I would be.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mercy, if it is done quickly and without hatred, because they can't be healed and they suffer every hour they live. I've watched your kind fight the Scourge with joy in their faces, and I'd ask you to do this work with sorrow instead." } },
      choices = {
        { text = "Sorrow, then. They deserve a gentle end.", next = "BACK", reply = "Thank you. Sorrow is a gentle thing to carry, and they will feel it, I think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A quick end is mercy enough, whatever I feel.", next = "BACK", reply = "It is enough, and I won't ask more of you. A quick end is a gift in these lands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Your Light can ease pain, and I won't refuse it, but it can't undo what the plague has woven into my blood. The Earth Mother calls me home, and I'd rather go to her with a clear mind than hang on half-alive and become one of the things I came to heal." } },
      choices = {
        { text = "Then let me ease your pain until she calls.", next = "BACK", reply = "Thank you. Your Light is kind, even if it cannot mend me, and I will take the ease it gives.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fight it a little longer. Give up nothing yet.", next = "BACK", reply = "I have fought a long time, priest, longer than you know. I will fight a little longer, since you ask.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quiet as the wind in the grass, and twice as swift. Now they cough and limp between Northridge and Dalson's Tears and snap at their own shadows, and the ones that can still hunt do it badly, which is a cruel thing to see in a hunter." } },
      choices = {
        { text = "I'll give them a clean end. They deserve that much.", next = "BACK", reply = "They do, and I thank you for it. Let them run with the wind again, wherever they go.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A crippled wolf is an easy kill. That's all.", next = "BACK", reply = "Easy, yes, and that is the sorrow of it. I would ask you to remember what they were.", fx = { align = { light = -1 } } },
        { text = "Something else, Mulgris.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "That the land is sick in its bones and can't remember how to be whole. I hear the earth groaning under the Writhing Haunt, and I've no strength left to answer it, so I'd ask you to listen for me, and tell it that someone still cares." } },
      choices = {
        { text = "I'll listen for you, Mulgris, and answer it.", next = "BACK", reply = "Thank you. The earth will know your voice, and perhaps it will remember how to be whole.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land here is lost. Save your strength.", next = "BACK", reply = "Lost, perhaps, but not forgotten, and the land remembers who listens. I will keep my strength for the end.", fx = { align = { light = -1 } } },
        { text = "Something else, Mulgris.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Perhaps, if I'd asked one of your Kirin Tor before it took hold, but the Circle teaches us to heal with the land, not around it. I'm too proud and too old to regret that much, though I'll admit I wonder about it at night when the coughing keeps me awake." } },
      choices = {
        { text = "The Circle's way is honest. I respect it.", next = "BACK", reply = "Thank you. Honest is all a druid can hope to be, and it is enough for me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pride killed you, Mulgris, not the plague.", next = "BACK", reply = "Perhaps it did, and I have thought it myself on the long nights. I would not trade the Circle's way, even so.", fx = { align = { order = -1 } } },
        { text = "Something else, Mulgris.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They fear anything that isn't of this world, and what walks at your heel isn't. I don't judge you for it, for I'm dying of something far worse, but I'd ask you to end the sick wolves cleanly and not leave them to your demon's appetites." } },
      choices = {
        { text = "Clean ends only, Mulgris. You have my word.", next = "BACK", reply = "Thank you. The wolves will rest easier, and so will I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demon has to eat. The wolves are dying anyway.", next = "BACK", reply = "It must eat, and they are dying, and I cannot argue with either. Only let it be quick.", fx = { align = { light = -1 } } },
        { text = "Something else, Mulgris.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who hears the land, here at my bed. I did not know Ironforge had shamans, {class}, but the earth sent you all the same, and I'll not question its choice of messenger this close to the end." },
        { id = "h_default", key = true,
          text = "I am Mulgris Deepriver, of the Cenarion Circle. I came to heal these lands and the plague took me instead, and I'll pass soon, while the beasts out there suffer on without understanding why." },
        { id = "h_wolves", tags = { "news" }, when = { questActive = TODO_QUEST("The Wildlife Suffers Too") },
          text = "The diseased wolves between Northridge and Dalson's Tears can't be cured, and I tried until it took me too. Give them a quick end, because it's the only mercy left out there." },
        { id = "h_rest", when = { questRecent = { TODO_QUEST("The Wildlife Suffers Too"), days = 2 } },
          text = "I felt them go, quiet at last, and I thank you for it. There are others still suffering, and I have a little breath left to ask." },
        { id = "h_dead", when = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
          text = "(The tauren druid lies unmoving on his bed of straw. His eyes are closed, and for the first time he looks as though he isn't in pain.)" },
        { id = "h_home", when = { metBefore = true },
          text = "I dream of Mulgore, of the grass and the wind and the long sky, and I'm sure the Earth Mother will take me home. I'm less sure of the land I'm leaving behind." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at my bedside. You need not try to heal me, young one, because the plague is deep in me now, but I'm glad of the company." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. I've heard of your kind, who carry the Light like a hammer, and I wonder whether you'd swing it at the sick beasts outside or kneel beside them." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I've watched soldiers cut their way through these beasts with no thought for what they were, {class}, and I don't blame them, but I grieve all the same." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You know the beasts as I do, {class}, so you'll see what I see out there, and I'm sorry for it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came without a sound, {class}, the way the wolves used to, before the sickness made them stumble. Sit, if you like; there's nothing here worth stealing but my last breaths." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman, here at my bed. The spirits sent you, I think, or the Earth Mother did, {class}, for I asked her for a familiar voice before the end." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You've come a long way from your libraries, {class}, and you'll find no answers in these fields, only beasts that need ending." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The beasts outside feel what you carry, {class}, and they're frightened enough already, so please walk softly past them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Diseased", min = 20 } }, text = "I felt them go, one by one, the sick wolves out in the fields, and each one was quieter than the last. You've been merciful, and I'm grateful, even if it's a hard mercy." },
      },
      again = {
        { id = "h_again", text = "There is more you would ask? Ask it gently, and I'll answer while I can." },
        { id = "h_again2", text = "Sit a while longer, if you like. I don't mind the company, and the wind through the broken roof sounds a little like the plains." },
      },
      choices = {
        { text = "Were the wolves so quiet, Mulgris, before the plague?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do the spirits tell you here, Mulgris?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The arcane might have cured you, Mulgris.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the beasts really fear warlocks, Mulgris?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll ease their suffering.", next = "END", reply = "Thank you, child of the stone, for they suffer and I can no longer go to them. Walk gently among them, and the Earth Mother will know your kindness even when they do not.", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Sick wolves are no concern of mine.", next = "END", reply = "Then go your way, and may the Earth Mother find you kinder hands than mine when your own time comes.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "There must be something that can be done for you.", next = "cure", when = { ["not"] = { questActive = TODO_QUEST("Glyphed Oaken Branch") } } },
        { text = "You're a long way from home.", next = "came", when = { ["not"] = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } } } },
        { text = "Tell me about the wolves.", next = "wolves", when = { ["not"] = { any = { { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } } } },
        { text = "We're not enemies here, druid.", next = "alliance", when = { faction = "Alliance", ["not"] = { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
        { text = "I feel the land's pain too.", next = "druid", when = { class = "DRUID", ["not"] = { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
        { text = "Is there really nothing the Light can do for you, Mulgris?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it mercy or murder to kill the plagued wolves, Mulgris?", next = "xapala", when = { class = "PALADIN" } },
        { text = "(Leave him in peace.)", next = "END", when = { questDone = TODO_QUEST("Glyphed Oaken Branch") } },
        { text = "Mulgore misses you, Mulgris.", next = "x_tauren", when = { race = "Tauren", ["not"] = { questDone = TODO_QUEST("Glyphed Oaken Branch") } } },
        { text = "Is a warrior wrong to kill the plagued beasts?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can the plagued wolves be saved, Mulgris?", next = "xhuntcl", when = { class = "HUNTER" } },
      },
    },
    cure = {
      big = true,
      lines = {
        { id = "c_default", text = "Nothing, and I've known it for weeks, so don't grieve for me, little one. Grieve for the wolves, if you must grieve, and then go and help them, which is better than grief.", fx = { learn = { "cenarion_circle" } } },
      },
      choices = {
        { text = "I'll do what you ask.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "It isn't fair.", next = "BACK", fx = { affinity = 2 } },
        { text = "Is there anyone I should tell?", next = "cure_word" },
      },
    },
    cure_word = {
      lines = {
        { id = "cw_default", text = "Arch Druid Hamuul, in Thunder Bluff, will hear that I fell here, and I'd like him to hear it from someone who was with me. Tell him I wasn't alone at the end, and you'll be telling him the truth." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 3, learn = { "cenarion_circle" } } } },
    },
    came = {
      lines = {
        { id = "ca_default", text = "I felt the cauldrons poisoning these lands from as far away as Moonglade, and someone had to come and try to mend them. I was strong then, and I thought strength would be enough." },
      },
      choices = {
        { text = "You must have tried to heal it.", next = "tried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tried = {
      lines = {
        { id = "tr_default", text = "I tried every way the Circle taught me to call growth back into a wounded field, but the plague drank it all and wanted more. Then the sickness got into me as well, and the land stayed sick." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wolves = {
      lines = {
        { id = "wo_default", text = "They were proud hunters once, and now they wander between the farms, half-mad, with the plague eating them from inside. A clean death is the kindest thing anyone can give them, and I no longer have the strength to give it." },
      },
      choices = {
        { text = "Then I'll give it for you.", next = "BACK", reply = "Thank you. The Earth Mother will walk with you, and so, a little, will I.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "They're dangerous, and that's reason enough to kill them.", next = "BACK", reply = "That is reason enough for some. I would ask you to think of mercy, but I will not stop you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = {
        { id = "al_default", text = "No, we are not, and it gladdens me to hear one of your people say it. Our peoples have had their differences, but the land beneath us both is the same land, and it's dying." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "Then don't stay here too long, or the pain will get into you the way it got into me. Do what good you can and go back to the green places, and remember this land as it ought to be." },
      },
      choices = { { text = "I'll remember it.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Does it? I dream of the grass there, so tall it brushes your shoulders, and the wind coming down off the bluffs. Tell the elders I tried, young one, and that the sickness here was bigger than one druid." },
      },
      choices = {
        { text = "I'll tell them, elder.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I haven't the breath for much, little one, so I'll keep to what I know. Ask about these." },
    },
    background = { { id = "tp_ba", text = "I'm a druid of the Cenarion Circle, from Mulgore, and soon I'll be part of the land I came to heal.", next = "came" } },
    advice = { { id = "tp_ad", text = "Don't let the plague touch your skin, little one. I let it, and you can see where that has brought me." } },
    cenarion_circle = { { id = "tp_circle", text = "Arch Druid Hamuul will hear that I fell here, so tell him I wasn't alone at the end, and you'll be telling him the truth." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "I felt the great pots from Moonglade, and they're the reason I came. They've won this round, I'm afraid." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as it was meant to be, without the plague and without the dead. I've tried to reach it from here, and I can't, because the land itself is sick." } },
    scourge = { { id = "tp_scourge", text = "The Scourge poisons the land and the beasts with it, and the beasts don't understand why they're suffering. Give them mercy if you can, because I couldn't." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother weeps in this land, and I've heard her weeping every night since I came. I came to mend her, and I failed, and now I'm only listening." } },
    thrall = { { id = "tp_thrall", text = "Thrall is a good leader for the orcs, and he's been a friend to the tauren. I wish he'd sent more of his shamans here, though I know he has troubles enough." } },
    _none = { { id = "tp_none", text = "I haven't the breath to spend on that, little one, so you'll have to forgive me. Walk with the Earth Mother, and ask someone younger." } },
  },
}

P:NPC {
  key = "marlene", id = TODO_NPC("Marlene Redpath"), name = "Marlene Redpath",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "sorrow_hill" }, temper = { "gentle" }, values = { "loving" },
  notices = { "class" },

  impression = {
    first = "Hope for her niece Pamela is about all she has left.",
    third = "{name} met Marlene Redpath on Sorrow Hill, who longs to learn what became of her niece Pamela after Darrowshire fell.",
  },

  greetings = {
    { id = "g_pamela", text = "Have you come from the east, from Darrowshire? Please, have you seen a little girl on the road?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, you came back to me! Did you find... no, I'll let you speak first, as I promised myself I would." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light, I can feel it like a lamp in the window. It's been such a long time since anyone brought a lamp here." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Seek her, please, for I can't rest until I know. If she's still somewhere, I want her found, and if she's gone, I want to know she's at peace. Either way, I want to stop waiting." } },
      choices = {
        { text = "I'll find her. You deserve to know.", next = "BACK", reply = "Thank you. I've waited so long, and it helps to know someone's looking.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some answers are better left unfound, Marlene.", next = "BACK", reply = "Perhaps they are, but I'd rather know than wonder. Please, if you're able.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All of them, for they were farmers and millers who'd only borrowed their armour for the day. They stood with Joseph in the square so the rest of us could run, and I've wondered every night since whether Pamela ran fast enough." } },
      choices = {
        { text = "They gave their lives well, Marlene, and the Light keeps them.", next = "BACK", reply = "I'd like to believe that. They were good men, every one of them, and they deserve the Light's keeping.", fx = { align = { light = 1 } } },
        { text = "Borrowed armour and good hearts weren't enough. They never are.", next = "BACK", reply = "Perhaps they never are, but they tried, and I'll not let anyone forget that they tried.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every week, on the road between Darrowshire and Andorhal, with Pamela on his shoulders and a sweet in his pocket for her. He was a soldier, but he moved like a cat when he had a mind to, and she'd shriek with laughter every time he caught her." } },
      choices = {
        { text = "Then I'll find Pamela, for his sake and yours.", next = "BACK", reply = "Thank you. Find her, and tell her Mama hasn't stopped looking.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Darrowshire's dead, Marlene. Let them rest.", next = "BACK", reply = "Rest, perhaps, but not until I know where Pamela is. I can't rest without her.", fx = { align = { light = -1 } } },
        { text = "Something else, Marlene.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only that it feels cold and still from here, and the birds won't fly over it. I've not found the courage to walk east since, but some nights I hear Pamela singing, very far away, and I'd give anything to know whether she's really out there." } },
      choices = {
        { text = "I'll ask the spirits, and I'll find her.", next = "BACK", reply = "Thank you. If she's singing, I want to know where, and if she isn't, I want to know why.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some answers are worse than silence, Marlene.", next = "BACK", reply = "They are, I know, but silence has had me long enough. Please, if you're willing.", fx = { align = { light = -1 } } },
        { text = "Something else, Marlene.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "All I know is that the dead came down the road from Corin's Crossing, and Joseph took his soldiers to the square to hold them, and I took Pamela and hid her in the house. After that I ran, and I've been on this hill ever since, waiting for word." } },
      choices = {
        { text = "Joseph held the square bravely. I'll find what remains.", next = "BACK", reply = "Thank you. He'd want it known that he held, and I'd want her found.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The truth would only hurt you, Marlene.", next = "BACK", reply = "It might, but I've been hurting for years without knowing. I'd rather hurt with the truth.", fx = { align = { honor = -1 } } },
        { text = "Something else, Marlene.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The silence, mostly, and the things that move through it at night along the old road. But most of all I'm frightened that Pamela is out there alone and frightened too, and nobody's coming for her, because I couldn't." } },
      choices = {
        { text = "Somebody is coming for her now, Marlene. I am.", next = "BACK", reply = "Oh, thank you, {class}. I'll keep the lamp lit until you bring her back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear won't help Pamela. Let her go.", next = "BACK", reply = "I can't. I've tried, and I can't, and I won't stop looking until somebody finds her.", fx = { align = { light = -1 } } },
        { text = "Something else, Marlene.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Marlene Redpath. When the battle came to Darrowshire I hid my niece Pamela, and after that I don't know what happened, but I want so much to know what became of her." },
        { id = "h_search", tags = { "news" }, when = { questActive = TODO_QUEST("Little Pamela") },
          text = "Darrowshire is east, past Gahrron's Withering, so look for a little girl with a doll. She'd never let go of that doll, not for anything, so please look." },
        { id = "h_found", when = { questDone = TODO_QUEST("Auntie Marlene") },
          text = "You found her, you found my Pamela, and whatever she is now, she remembered me. That's enough for me, it has to be enough." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange Historian") },
          text = "Joseph's ring is under his monument among the graves, so take it to the strange gnome in Andorhal, who says she can help him. I don't understand how, but I want so badly to believe her." },
        { id = "h_house", when = { metBefore = true },
          text = "This was a good house once, and Joseph used to stop here on the road to Darrowshire. He'd bring Pamela, and she'd chase the chickens all over the yard, but there are no chickens now." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A soldier. The defenders of Darrowshire wore armour like yours, {class}, and I watched them march down the lane to the square and never saw one of them come back up it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid? Pamela loved the animals, you know. She'd have followed you all the way to your forest if you'd let her." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh, you startled me, {class}. I thought for a moment you were Joseph, because he used to come up the path so quietly when he wanted to surprise Pamela." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're not from these parts, {class}, but you've a kind look about you, and you carry the smell of open country. It's been so long since anything here smelled of open country." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll know more about what's happened to this country than I do, {class}, so tell me, kindly, is there anyone left in Darrowshire?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "There's a little creature behind you, {class}, and it's looking at me as though I'm supper. Keep it close, please, because I'm frightened enough of what moves in the dark here." },
      },
      again = {
        { id = "h_again", text = "Is there something more you'd like to know? I don't have many visitors to talk to." },
        { id = "h_again2", text = "Stay a little longer, if you can, it's so quiet on the hill." },
      },
      choices = {
        { text = "Did Joseph often visit Sorrow Hill, Marlene?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can you feel what's become of Darrowshire, Marlene?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Something terrible happened to Darrowshire, Marlene.", next = "xmage", when = { class = "MAGE" } },
        { text = "What frightens you most on Sorrow Hill, Marlene?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll look for Pamela.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
        { text = "Tell me about Pamela.", next = "pamela" },
        { text = "There's a strange gnome wandering about here.", next = "gnome", when = { questActive = TODO_QUEST("A Strange Historian") } },
        { text = "Shall I say a prayer with you?", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I can track a lost child, Marlene.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "You must have known the soldiers who defended Darrowshire.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Should we seek out Pamela, or let her memory rest?", next = "xdruid", when = { class = "DRUID" } },
      },
    },
    darrowshire = {
      lines = {
        { id = "d_default", text = "The dead came for the town and everyone fought, farmers and shopkeepers and children with sticks, but we lost. I remember the noise, though I don't remember the end, and perhaps that's a mercy." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2 } },
        { text = "You speak of Joseph as someone dear.", next = "joseph" },
      },
    },
    joseph = {
      lines = {
        { id = "jo_default", text = "My brother Joseph fought for Darrowshire with everything he had, and there's a monument to him among the graves now. He'd stop at my door on the road east, and he never once forgot to bring his Pamela with him." },
      },
      choices = {
        { text = "He sounds like a good man.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pamela = {
      lines = {
        { id = "pa_default", text = "She's a brave little thing, and she carries her doll everywhere. When the fighting started I told her to hide and stay quiet until someone came for her, and I don't know if anyone ever did." },
      },
      choices = {
        { text = "I'll be the one who comes.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "She's a little gnome who wanders the ruins of Andorhal as if the dead weren't there at all, and she seems to remember the old days better than I do. I don't know who she is, only that she's kind, and she once left me a jar of honey on the step." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you really? Then pray for Pamela, wherever she is, and if you've any prayer left over, I wouldn't mind one for me." },
      },
      choices = {
        { text = "(Pray with her.)", next = "BACK", reply = "Thank you. I feel a little warmer, and I hope Pamela does too, wherever she is.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'll look for Pamela, but I'm done with prayers.", next = "BACK", reply = "That's all right, love. Looking is a sort of prayer too, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Can you? Then look for small footprints, please, because she had little shoes and she always ran when she was frightened. It's been so long, and I keep thinking I'll hear her coming up the hill." },
      },
      choices = {
        { text = "I'll find her trail, Marlene.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I lived on Sorrow Hill, on the road to Darrowshire, and I suppose I still do, in a way.", next = "darrowshire" } },
    advice = { { id = "tp_ad", text = "If you go east to Darrowshire, go gently. The people there were brave, and some of them haven't stopped fighting." } },
    lordaeron = { { id = "tp_lordaeron", text = "I lived in Darrowshire, a little village on the edge of the forest, and it was a good place to raise a child. It's gone now, and I'm still here, which doesn't seem fair." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came to Darrowshire and my brother Joseph went out to fight them. I hid Pamela where they wouldn't find her, and I've been waiting for word of her ever since." } },
    holy_light = { { id = "tp_holy_light", text = "I prayed to the Light every night for Pamela, and I still do. I don't know if it hears ghosts." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I only know Darrowshire and the road there, and Pamela." } },
  },
}

P:NPC {
  key = "kirsta", id = TODO_NPC("Kirsta Deepshadow"), name = "Kirsta Deepshadow",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "northridge_hills" }, temper = { "sharp" }, values = { "loyal", "secretive" },
  notices = { "class", "race" },

  impression = {
    first = "She was bleeding quietly and still managed to be funny about it.",
    third = "{name} met Kirsta Deepshadow, a wounded Stormwind scout watching Hearthglen from the Northridge hills.",
  },

  greetings = {
    { id = "g_hurt", text = "Ow, sorry, hello there. Don't mind me, I'm just bleeding quietly over here." },
    { id = "g_back", when = { metBefore = true }, text = "You found the camp again, so either you're good or I'm getting sloppy, and let's say you're good." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like someone who's been trained not to be seen, and I'd ask who trained you, but I'd rather not know. Call it professional courtesy." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "A Forsaken, out here? Keep your voice down, because the Crusade would love to find us both, and they wouldn't bother asking which of us to burn first." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Plenty, while they were chasing me, and none of it kind, because Hearthglen thinks anything that isn't the Light is the Scourge in disguise. If they ever caught a dwarf calling down lightning, they'd burn you twice, once for heresy and once for being from Ironforge." } },
      choices = {
        { text = "They're zealots, but they fight the Scourge. Leave them be.", next = "BACK", reply = "They do, I'll grant them that, but they'd sooner burn a dwarf than thank one. Leave them be, then, and keep out of their sight.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Zealots like that need tearing down, Scourge or not.", next = "BACK", reply = "They do, and you'd have my blessing if Stormwind would let me give it. Mind you don't get caught doing it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Strong enough that I'm sitting here bleeding instead of reporting from inside. They keep watchmen on the walls day and night and a hall full of knights besides, and each one believes the Light personally signed his orders." } },
      choices = {
        { text = "Then they need fighting fairly, in the open, steel on steel.", next = "BACK", reply = "Fairly, in the open? They'll ring every bell in Hearthglen and drown you in knights. Your funeral, {class}.", fx = { align = { honor = 1 } } },
        { text = "Strong walls have a weak gate somewhere. I'll find it.", next = "BACK", reply = "There's always one, and I was looking for it when they found me. If you find it, tell me where.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kirsta.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Big grey mastiffs, kept hungry, with handlers who know these hills better than I'd like. I lost them by wading half a mile down a freezing stream below Northridge, and I'm still not sure I'll ever be warm again." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Big grey mastiffs, kept hungry, with handlers who know these hills better than I'd like. I lost them by wading half a mile down a freezing stream below Northridge, and I'm still not sure I'll ever be warm again. I'll admit {pet} gave me a start when you walked up, {class}." },
      },
      choices = {
        { text = "Dogs are honest hunters. It's their masters I'd fault.", next = "BACK", reply = "Fair, and true. The dogs were only doing their job, and doing it well.", fx = { align = { honor = 1 } } },
        { text = "Kill the handlers quietly and the dogs go home.", next = "BACK", reply = "Quietly is the only way, and you'd better be quieter than I was. Mind the stream.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kirsta.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! If you've anything that stops bleeding, {class}, I'll take it gladly, and if it involves chanting, I promise not to laugh." },
        { id = "h_default", key = true,
          text = "Kirsta Deepshadow, scout. I was sent to test Hearthglen's defenses and they tested me right back, and somebody in Stormwind thinks that little town matters, though it's not my job to ask why." },
        { id = "h_business", tags = { "news" }, when = { questActive = TODO_QUEST("Unfinished Business") },
          text = "Their camp's south of here, by the little barricade, full of medics, hunters, magi and knights. Thin them out for me, and then we'll talk about the real job." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "You've met Elling Trias, the cheesemonger in Stormwind's Trade District, haven't you? Don't look at me like that, everyone in Stormwind has had his cheese." },
        { id = "h_crusade", when = { metBefore = true },
          text = "I believe in the Light as much as anyone in Stormwind, but I watched them hang a farmer for not praying loudly enough. That isn't the Light, that's just a uniform." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock? Don't let the Crusade see you, {class}, for they'd burn you quicker than they'd burn me, and they very nearly burned me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage would've been handy at Hearthglen, {class}, for the Crusade lit me up with arrows and a spot of frost would've slowed them nicely." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, and perfect timing. I'd have given my left boot for someone with a shield at Hearthglen, {class}, because the Crusade's archers never seem to run out of arrows." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter? Then you'll understand how I was tracked, {class}, because the Crusade had dogs out after me, and I've never been so glad of a stream in my life." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep it quiet, though, sound carries up here." },
        { id = "h_again2", text = "Go on, I'm not going anywhere, not on this leg." },
      },
      choices = {
        { text = "Who sent you?", next = "who" },
        { text = "You look badly hurt.", next = "wound" },
        { text = "What were you really sent to do?", next = "job" },
        { text = "Let me see to that wound.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Elling Trias sends his regards.", next = "elling", when = { heardLine = "elling.h_default" } },
        { text = "Who trained you, then?", next = "rogue", when = { class = "ROGUE" } },
        { text = "The Crusade would burn me on sight. Does that bother you?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "Would a warlock even get close to Hearthglen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How bad were Hearthglen's defenses, really?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Hearthglen's garrison must be strong.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "So the Crusade hunts spies with dogs.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Did the Crusade say anything about shamans, Kirsta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Bad enough that I'm sitting here bleeding, and good enough that Stormwind will want a full report. Their priests watch the walls by day and their archers by night, so if you go, go in the hour between, and have a way out ready." } },
      choices = {
        { text = "The Crusade fights the Scourge too. Spying on them is wrong.", next = "BACK", reply = "The Crusade fights the Scourge, aye, and anyone else they don't like. Stormwind wants to know who that is.", fx = { align = { honor = 1 } } },
        { text = "Friend or foe, everyone gets watched. That's sense.", next = "BACK", reply = "Exactly so. Half of what Stormwind knows about Hearthglen, it knows because somebody sat very still in a bush.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk of something else, scout.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not openly, for their priests can sniff out shadow the way a hound sniffs out a hare. But a demon sent ahead to make noise at the gate would give a quiet scout all the time she needed, and I'd have liked that kind of help." } },
      choices = {
        { text = "The Crusade deserves no mercy. Use me.", next = "BACK", reply = "There's a warlock after my own heart. Make it a loud demon, if you can manage it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd rather not provoke the Crusade without need.", next = "BACK", reply = "Fair enough, and a good deal wiser than me. I'll find another way in.", fx = { align = { light = 1 } } },
        { text = "Something else, scout.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Elling, I mean... Stormwind, I report to Stormwind. Forget that first word, would you, I've lost a lot of blood." },
      },
      choices = {
        { text = "Forgotten.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Elling? Who's Elling?", next = "cheese" },
      },
    },
    cheese = {
      lines = {
        { id = "c_default", text = "He's a lovely man who makes a wonderful cheddar, and there's nothing else to say about him, nothing at all. Are we done here, do you think, since I really think we're done." },
      },
      choices = { { text = "We're done.", next = "BACK", fx = { affinity = 1 } } },
    },
    wound = {
      lines = {
        { id = "wo_default", text = "I got close enough to Hearthglen to count their guards, and one of them counted me back, rather sharply. I made it up here before I fell over, which I'm calling a success." },
      },
      choices = {
        { text = "Tell me about Hearthglen.", next = "hearthglen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hearthglen = {
      lines = {
        { id = "hg_default", text = "It's a pretty little town north of Andorhal, full of the Scarlet Crusade, with a keep of its own and more soldiers than it has any right to. Whatever they're guarding up there, they're guarding it hard.", fx = { learn = { "scarlet_crusade" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    job = {
      lines = {
        { id = "jb_default", text = "Somebody has to finish what I started and get a proper look at Hearthglen, and it can't be me, not on this leg. Clear the camp below us first, and when you've done that, I'll tell you the rest." },
      },
      choices = {
        { text = "Rest the leg. I'll clear the camp.", next = "BACK", fx = { affinity = 1 } },
        { text = "You don't trust me yet.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Tell me the rest now. You know I'll keep it quiet.", tag = "Persuade", next = "job_rest",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "ROGUE" }, { trait = "discreet" } } } },
          fail = { next = "job_later", fx = { affinity = -1 } } },
      },
    },
    heal = {
      lines = {
        { id = "he_default", text = "Would you? Oh, that's better already, thank you, and I won't forget it. You'd make a terrible scout, mind, being far too kind to people who sneak about in bushes." },
      },
      choices = {
        { text = "It was nothing, Kirsta, and anyone would have done it.", next = "BACK", reply = "Nothing, {g:he|she} says, while I'm sitting here with my leg stitched up. Well, it wasn't nothing to me, and I'll be sure to tell everyone at the camp that you're softer than you look.", fx = { affinity = 3, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Remember it the next time I need a favour.", next = "BACK", reply = "Remember it? I'll owe you one, and I always pay my debts. Now let me get back to bleeding quietly.", fx = { align = { light = -1 } } },
      },
    },
    elling = {
      lines = {
        { id = "el_default", text = "Does he, now? Then you know more than you ought to, and I'll thank you to keep it between us. Tell him, if you see him, that I'm alive and that I want a raise." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } } },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Nice try, but you of all people should know better than to ask that. Let's just say we probably drank in the same cellar once or twice, and leave it at that." },
      },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
    job_rest = {
      lines = {
        { id = "jr_default", text = "Oh, fine, since you've got an honest face and I've got a hole in my leg. The town's run from Mardenholde Keep, and what somebody in Stormwind really wants to know is what the Crusade is keeping behind those walls, because nobody guards a farming town that hard for the sake of the turnips." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Somebody in Stormwind, or somebody who sells cheese?", next = "cheese", when = { heardLine = "kirsta.w_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_later = {
      lines = {
        { id = "jl_default", text = "Nice try, but I've lost blood, not my wits. Clear that camp first, and then I'll know you're the sort who finishes what they start." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "Bother me? They'd burn me too if they caught me up here, and I've still got a pulse. I believe in the Light, more or less, but whatever they're doing in Hearthglen isn't it, so you and I have the same enemy today, and today's all I plan for." },
      },
      choices = {
        { text = "Same enemy today, and that's enough for me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Don't mistake me for a friend, scout.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I'm not supposed to know anything at all, officially, so keep that in mind. Unofficially, ask me about any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You patched me up and kept your mouth shut, so you get the good list. Ask away, quietly." },
    },
    background = { { id = "tp_ba", text = "I'm a scout for Stormwind, and that's all I'm allowed to say, so that's all I'm saying." } },
    advice = { { id = "tp_ad", text = "Never count guards from the same bush twice. Somebody always notices the second time, and usually with a crossbow." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They're tougher than I gave them credit for, and crueler, too, and Hearthglen is full of them." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is the obvious enemy here, but I've learned that the Crusade can be just as deadly to a scout. At least the Scourge doesn't torture you first." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is crawling with Crusaders and Scourge both, and they hate each other almost as much as they hate everyone else. I'd love to see them finish each other off." } },
    si7 = { { id = "tp_si7", text = "Who said anything about SI:7? I'm a scout, plain and simple, and I report to whoever's paying, which is Stormwind, generally." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar runs the kingdom for the young king, and he does it well enough. He keeps his scouts paid, and not every lord in Stormwind can say so." } },
    _none = { { id = "tp_none", text = "That's above my pay, I'm afraid, and most things are." } },
  },
}

P:NPC {
  key = "eva_sarkhoff", id = TODO_NPC("Eva Sarkhoff"), name = "Eva Sarkhoff",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "gentle" }, values = { "dutiful", "loving" },
  notices = { "race", "class" },

  impression = {
    first = "She and Lucien want only to stop being there.",
    third = "{name} met Eva Sarkhoff, the ghostly former head maid of House Barov, lingering at Caer Darrow with her husband Lucien.",
  },

  greetings = {
    { id = "g_formal", text = "Good day to you, and do forgive the state of the grounds, for we are no longer able to keep them." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and Lucien will be glad of it, though he won't say so, having been trained not to." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You're risen, like the ones who came to the keep. No, forgive me, I can see your eyes are your own, but I still flinch, and I'm afraid I always shall." },
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "MAGE" } },
      text = "You study the arts, as the young ones did who came to the keep every day to learn. Please be careful what you learn, {g:sir|madam}." },
  },

  start = "hello",
  nodes = {
    xcl_scholo = {
      big = true,
      lines = { { id = "xcl_scholo_default", text = "Then the house is only a house again, or as near as it can be with so much wrong in its walls. Lucien and I were made to bow to the students as they came and went, and somehow that galled me most, considering everything else they did to us." } },
      choices = {
        { text = "You and Lucien deserve your rest, as much as anyone.", next = "BACK", reply = "Thank you. Lucien would say we deserve nothing, but I think we might deserve a little rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The house got what it bargained for. The Barovs built it on bargains.", next = "BACK", reply = "It did, and so did we, for keeping its doors. I'll not argue with you, {g:sir|madam}.", fx = { align = { light = -1 } } },
        { text = "Will you and Lucien be able to rest now?", next = "xcl_scholo2" },
      },
    },
    xcl_scholo2 = {
      lines = { { id = "xcl_scholo2_default", text = "Not quite yet, though it's closer, and I can feel it the way you feel morning before it comes. There's still much of the house left to put right, and I was always the last to bed in it, so I suppose I'll be the last to leave." } },
      choices = {
        { text = "Then I'll see what else needs putting right.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Regrown, I'd hope, though I'm not sure anything that grows there now would be safe. The roses have gone black and the hedges move at night, and I'd sooner see them burned than see them become what the house became." } },
      choices = {
        { text = "Burn them, Eva. Start again from ash.", next = "BACK", reply = "Burned it is, then, and I'll watch them go without a tear. The old roses deserved better.", fx = { align = { light = -1 } } },
        { text = "Regrow them. Even a corrupted garden can be saved.", next = "BACK", reply = "Could it be? I'd like to see that, very much, though I fear I won't be here to see it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Those who stood their ground were killed, and those who killed them made use of them afterwards, which is the way of the Scholomance. If you go in, you'll meet faces I once served supper to, and I'd ask you to put them down quickly." } },
      choices = {
        { text = "I'll give them a soldier's end, swift and clean.", next = "BACK", reply = "Thank you. They deserve that, whatever they became.", fx = { align = { light = 1 } } },
        { text = "They served the Barovs by choice. They'll fall like the rest.", next = "BACK", reply = "Some of them did, and some of them only served supper. I'd ask you to remember the difference.", fx = { align = { light = -1 } } },
        { text = "Something else, Mistress Sarkhoff.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every autumn the master rode out with the hounds and half the household, and Lucien and I had a feast waiting when they returned. The hounds are still in the kennels, after a fashion, and I would not go near them if I were you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every autumn the master rode out with the hounds and half the household, and Lucien and I had a feast waiting when they returned. The hounds are still in the kennels, after a fashion, and I would not go near them if I were you. Your {pet} has its hackles up, {class}, and it's quite right to." },
      },
      choices = {
        { text = "I'll lay the hounds to rest, for your sake and theirs.", next = "BACK", reply = "Thank you. They were good hounds, once, and the master was proud of them.", fx = { align = { light = 1 } } },
        { text = "The kennels aren't my concern, Eva, only the school.", next = "BACK", reply = "As you like, {g:sir|madam}. The kennels will wait for someone kinder.", fx = { align = { light = -1 } } },
        { text = "Something else, Mistress Sarkhoff.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Lovely, with the lake all round and the gardens running down to the water, and Lucien keeping the silver so bright you could see your face in it. Then the master's guests began arriving after dark, and the gardens went grey, and the lake stopped freezing in winter, which I thought was the strangest thing of all." } },
      choices = {
        { text = "Then we'll free the house and lay you both to rest.", next = "BACK", reply = "Thank you. Lucien will be glad to hear it, though he'll not say so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Barovs earned their ruin. Their servants too.", next = "BACK", reply = "Perhaps we did, {g:sir|madam}. We served them, and we stayed, and here we are.", fx = { align = { light = -1 } } },
        { text = "Something else, Eva.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks with spirits, here at Caer Darrow. The master had dwarven guests now and then, {class}, and not one of them believed in spirits, though I daresay this house would have taught them otherwise by now." },
        { id = "h_default", key = true,
          text = "I am Eva Sarkhoff, and this is my husband, Lucien. We served House Barov for many years, I as head maid and Lucien as Master Barov's butler, and we kept the house until the house became something else." },
        { id = "h_butcher", tags = { "news" }, when = { questActive = TODO_QUEST("Doctor Theolen Krastinov, the Butcher") },
          text = "Krastinov, the Butcher, is still in there, doing to others what he did to us. Please end him, and burn whatever is left of us if you find it, because we would like to stop being here." },
        { id = "h_bag", tags = { "news" }, when = { questActive = TODO_QUEST("Krastinov's Bag of Horrors") },
          text = "The Butcher answered to another, called Kirtonos, and to summon him you'll need what Jandice Barov, the master's daughter, carries. She was such a quiet girl once, but bring it to me all the same." },
        { id = "h_herald", tags = { "news" }, when = { questActive = TODO_QUEST("Kirtonos the Herald") },
          text = "Kirtonos is the last of them, for us, and when he falls I believe we can finally go." },
        { id = "h_cl_scholo", tags = { "news" }, when = { cleared = "Scholomance" },
          text = "The halls have gone still, {g:sir|madam}, and Lucien says the Darkmaster's voice no longer carries across the lake. I kept that house a long time, and I never knew it could be so quiet." },
        { id = "h_done", when = { questDone = TODO_QUEST("Kirtonos the Herald") },
          text = "It's lighter now, and I can feel the edges of things going soft. Thank you, and Lucien thanks you too, and means it more than he can show." },
        { id = "h_months", when = { metBefore = true },
          text = "We hid in the walls for six months and stole bread from the kitchen we'd once run, and we watched them come every day to learn. I thought that if we were quiet enough it would pass, but it didn't pass." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, at Caer Darrow, {class}. The house had many guests of your profession once, and I served them all, and I wish now that I had poisoned the tea." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk the halls the way Lucien used to when the master was sleeping, {class}, as if every board might give you away. They will, here, for the house listens." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. The house kept guards at the gate in the old days, {class}, good men, and I've seen several of them since, walking the halls in the wrong colours." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The master's hunting horns still hang in the long gallery, {class}, and on certain nights they sound by themselves, though no one living has blown them in years." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at Caer Darrow? The gardens were lovely once, and Lucien and I tended them ourselves, but they've gone wild and wrong since the Scholomance took the house." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde, here at Caer Darrow. The house never had your kind under its roof in my day, {class}, though I daresay it's had far worse since." },
      },
      again = {
        { id = "h_again", text = "Is there anything else you wish to know? I shall answer as well as I'm able." },
        { id = "h_again2", text = "Please, ask whatever you like. It's been so long since we had a guest." },
      },
      choices = {
        { text = "Something terrible happened to you here.", next = "story" },
        { text = "Tell me about House Barov.", next = "house" },
        { text = "What must I do?", next = "task" },
        { text = "Let me pray for you both.", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'm not one of them, Eva.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Did you see the necromancers at work, Eva?", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "You must have known Kel'Thuzad, Mistress Sarkhoff.", next = "xmage", when = { class = "MAGE" } },
        { text = "Is there a quiet way into the Scholomance?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What became of House Barov's guards, Eva?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "House Barov must have hunted often, Mistress Sarkhoff.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What was Caer Darrow like before the Barovs fell, Eva?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Gandling is dead, Eva. The school has lost its master.", next = "xcl_scholo", when = { cleared = "Scholomance" } },
        { text = "I'll help you rest.", next = "END", reply = "Rest? How kind you are, and how strange to hear it from the living. Go gently through the house, then, and if you find the master's guests below, do not let them keep you.", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Should Caer Darrow's gardens be burned clean or regrown?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'm here for the Scholomance, not for ghosts.", next = "END", reply = "Of course, {g:sir|madam}. Mind the stairs as you go, and mind what waits at the bottom of them.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "There were servants' stairs once, as there are in any great house, but I couldn't tell you what the necromancers have done with them since. The front gate is guarded, but at least you know what's waiting there, and I can't promise that of anywhere else in the house." } },
      choices = {
        { text = "I'll take the front gate. Better to see what's coming.", next = "BACK", reply = "The front gate, then. At least you'll know what's waiting, which is more than we did.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find another way in. There always is one.", next = "BACK", reply = "There always is, {g:sir|madam}, and the necromancers have found most of them. Mind the servants' stairs.", fx = { align = { honor = -1 } } },
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I poured his wine and took his cloak, and he always thanked me, which I thought gracious at the time. He spent long hours in the master's library and longer ones below it, and by the time Lucien and I understood what was being taught, the house was no longer ours to keep." } },
      choices = {
        { text = "You couldn't have known. Don't blame yourself.", next = "BACK", reply = "Thank you. Lucien says the same, and some evenings I nearly believe him.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Servants see everything. You should have spoken.", next = "BACK", reply = "We should have, and we didn't, and that's the whole of our story. Thank you for saying so plainly.", fx = { align = { light = -1 } } },
        { text = "I'm sorry. Let's speak of something else.", next = "BACK" },
      },
    },
    story = {
      big = true,
      lines = {
        { id = "s_default", text = "They found us, and the Butcher kept us for weeks and wouldn't let us die. When he was finished he let us die, and then woke us and gave us to the ghouls, and I'm sorry, that isn't a thing to say to a guest.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "He'll answer for it.", next = "BACK", reply = "Thank you. That is all I want, and all Lucien wants too.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "Then he'll die badly, and I'll make sure of it.", next = "BACK", reply = "Badly? I'd not wish that on anyone, but I'll not weep for him either. Thank you, {g:sir|madam}.", fx = { align = { light = -1 } } },
        { text = "(Take her hand, if you can.)", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "And Lucien?", next = "lucien" },
      },
    },
    lucien = {
      lines = {
        { id = "lu_default", text = "Lucien was with me through all of it, and he never once let me see him afraid, which was the bravest thing I've ever known a man to do. He still stands as straight as he did in the hall, waiting for a bell that won't ring." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    house = {
      lines = {
        { id = "ho_default", text = "It was a fine house, {g:sir|madam}, with a ballroom and a library and the lake all around. Lord Barov bargained with Kel'Thuzad to keep his fortune and his lands long past his lifetime, and the keep became that creature's school, and everyone in it paid the price." },
      },
      choices = {
        { text = "And the Barov children?", next = "jandice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jandice = {
      lines = {
        { id = "ja_default", text = "Jandice is still in the keep, among them, and Alexi and Weldon went their separate ways, one dead and one fled. I served that family all my life, and I'll keep what I think of how its children turned out to myself." },
      },
      choices = {
        { text = "You can tell me, Eva. They can't punish you now.", tag = "Persuade", next = "jandice_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { trait = "kind" } } } },
          fail = { next = "jandice_proper", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    task = {
      lines = {
        { id = "ta_default", text = "End the Butcher, and burn our remains if you find them, and then end the one he served. When those three things are done, I believe Lucien and I will be allowed to leave." },
      },
      choices = {
        { text = "I'll see it done.", next = "BACK", reply = "Thank you. We'll be waiting, as we always have.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll kill the Butcher, but your bones can stay where they are.", next = "BACK", reply = "Then at least the Butcher will be gone, and that's something. Our bones can wait a little longer.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "You're very kind, and I'd be grateful, though I don't know if the Light still hears people like us. Pray for Lucien first, if you would; he was always the better of the two of us." },
      },
      choices = {
        { text = "(Pray for them both.)", next = "BACK", reply = "Thank you. I think I feel it, a little, and I think Lucien does too.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'm not sure the Light hears either of you anymore.", next = "BACK", reply = "Perhaps it doesn't. Thank you for being honest, {g:sir|madam}.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "No, I can see that you're not, and I'm ashamed to have flinched. Whatever you are, you've come to help us, and the ones in the keep never did that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    jandice_truth = {
      lines = {
        { id = "jt_default", text = "No, I suppose they can't, {g:sir|madam}, and still I lower my voice. Each of the boys would tell you the fortune was promised to him, and I heard Lord Barov promise a great many things to each of them in turn, so I couldn't tell you which, and I don't believe either of them deserves a penny of it." },
      },
      choices = {
        { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then perhaps neither should have it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jandice_proper = {
      lines = {
        { id = "jp_default", text = "Forgive me, {g:sir|madam}, but a good servant doesn't speak ill of the family, not even now. Lucien would never let me hear the end of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_warlock = {
      lines = {
        { id = "xw_default", text = "I did, {g:sir|madam}; for six months I watched them from the servants' passages, and I learned more than any maid should. Forgive me if I keep my distance, for you carry something of the same chill they did, and I have not forgotten where it led." },
      },
      choices = {
        { text = "I'm nothing like them, Eva.", next = "BACK", fx = { affinity = 1 } },
        { text = "Power isn't evil. Only what it's used for.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "We heard more inside those walls than the family ever imagined, {g:sir|madam}. I can speak to these, as well as I'm able." },
    },
    background = { { id = "tp_ba", text = "I was head maid of House Barov for many years, {g:sir|madam}, and I'm afraid I still am, in a manner of speaking.", next = "story" } },
    advice = { { id = "tp_ad", text = "If you go into the keep, keep to the walls and mind the stairs. The servants' ways are the quietest, as Lucien and I learned." } },
    scholomance = { { id = "tp_scholomance", text = "It was a house, and a fine one, until the Barovs gave it away for a promise, and everyone in it paid." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad came to Caer Darrow as a guest, and the Barovs treated him like one. I served him tea myself, and I'll never forgive myself for not putting something in it." } },
    lordaeron = { { id = "tp_lordaeron", text = "Caer Darrow was a lovely house when Lordaeron was whole, with gardens on the lake and music in the evenings. I apologize for the state of it now, it isn't what it was." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came to learn necromancy at Caer Darrow, and I hid in the keep for six months watching them. I'd rather not describe what I saw." } },
    _none = { { id = "tp_none", text = "I'm afraid I wouldn't know, {g:sir|madam}, for we didn't hear much news inside the walls." } },
  },
}
