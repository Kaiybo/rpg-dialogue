-- Among the Gordok ogres of Dire Maul, two an earlier pass missed: Knot Thimblejack, the goblin they keep in
-- chains in the Halls of Destruction, and Mizzle the Crafty, who announces the new king at Gordok's Seat.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.shendralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Knot Thimblejack: goblin prisoner of the Gordok, Halls of Destruction; the Gordok Ogre Suit.
P:NPC {
  key = "knot_thimblejack", id = TODO_NPC("Knot Thimblejack"), name = "Knot Thimblejack", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "gordok" }, temper = { "chatty", "shrewd" }, values = { "cunning", "craft" },
  notices = { "craft" },
  impression = {
    first = "The Gordok ogres keep a goblin tailor named Knot Thimblejack chained to the floor in the Halls of Destruction, and he has clearly been there long enough to learn everything about them. He offered to make me an ogre suit before he asked to be freed, which says something about his priorities.",
    third = "{name} met Knot Thimblejack, a goblin tailor held prisoner by the Gordok ogres in Dire Maul.",
  },
  greetings = {
    { id = "g_default", text = "Psst, over here, and keep it down! You ain't an ogre, which makes you my new best friend, pal, so listen up, because I got a proposition." },
    { id = "g_suit", when = { questActive = TODO_QUEST("The Gordok Ogre Suit") }, text = "You got my materials? Hand 'em over, and don't forget the tannin, because without the tannin all I can make ya is a real big sack." },
    { id = "g_free", when = { questDone = TODO_QUEST("Free Knot!") }, text = "My hero! I'm out of here the second those lugs look the other way, and I ain't never sewin' anything bigger than a vest again." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and you ain't been flattened! See, I told ya, stick with Knot and you'll go far." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "Hold on, those are stitcher's calluses! Listen, a fellow professional oughta know how the suit goes together, so watch my hands when I cut it, and I won't even bill ya for the lesson." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin, by my last copper! Tell me the Cartel sent ya with a ransom, and if it didn't, tell me anyway, because I could use the laugh." },
  },
  start = "hello",
  nodes = {
    gt_stitch = {
      lines = { { id = "gt_stitch_l", text = "Good work? It's the finest disguise ever sewn in a dungeon, pal, and I did it with a rusty needle and one hand chained. The seams are ugly on purpose, because an ogre would never trust anything neat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_cartel = {
      lines = { { id = "gt_cartel_l", text = "Pay? They'd sooner write me off as a bad debt and sell my shop. That's why I'm doin' business with you instead, because a rescuer costs less than a ransom." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Knot Thimblejack, master tailor, currently between premises. I came here to sell the Gordok some formal wear, and it turns out ogres don't pay invoices, they just chain the supplier to the floor and call it a standing order." },
        { id = "h_free", when = { questDone = TODO_QUEST("Free Knot!") }, text = "Knot Thimblejack, free goblin, on account of you. I'm only waitin' for a quiet moment to slip out, so if there's anything you still want to know about these lugs, ask it quick." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I ain't goin' anywhere, obviously." },
        { id = "h_again2", text = "Keep talkin', but watch the door for me." },
      },
      choices = {
        { text = "What's this about an ogre suit?", next = "suit" },
        { text = "How do I get you out of those chains?", next = "chains" },
        { text = "What have you learned about the Gordok?", next = "gordok" },
        { text = "How did a tailor end up here?", next = "tailor" },
        { text = "I'm a tailor myself. Is the ogre suit good work?", next = "gt_stitch", when = { profession = "Tailoring" } },
        { text = "Will the Cartel even pay to get you back?", next = "gt_cartel", when = { race = "Goblin" } },
        { text = "Sit tight, Knot.", next = "END" },
      },
    },
    suit = {
      hub = true,
      lines = { { id = "s_default", text = "Here's the pitch. I stitch you a suit that makes you look like one of these lumps from the neck down and smell like one all over, and you stroll past their guards like you're late for supper. It ain't my prettiest work, but I guarantee the fit." } },
      again = { { id = "s_again", text = "Anything else about the suit, boss?" } },
      choices = {
        { text = "What do you need to make it?", next = "materials" },
        { text = "Who is it meant to fool?", next = "fool" },
        { text = "Enough about the suit.", next = "hello" },
      },
    },
    materials = {
      lines = { { id = "m_default", text = "Runecloth by the bolt, a stack of rugged leather, some rune thread to hold it all, and ogre tannin for the smell. The cloth and leather you bring yourself, but the tannin's right here in the compound, in a basket upstairs where the ogres do their curing." } },
      choices = {
        { text = "What exactly is ogre tannin?", next = "tannin" },
        { text = "Back to the suit.", next = "BACK" },
      },
    },
    tannin = {
      lines = { { id = "t_default", text = "Friend, I've been here for months and I've made a point of not finding out. It cures a hide and it stinks like the inside of an ogre's boot, and that second part is the whole reason the disguise works." } },
      choices = { { text = "Back to the suit.", next = "BACK" } },
    },
    fool = {
      lines = { { id = "f_default", text = "Captain Kromcrush, mostly, the big lug who guards the way to the king. Walk up to him in the suit and tell him his boys are bein' roughed up somewhere else, and he'll go stompin' off to see about it and leave the door wide open." } },
      choices = { { text = "Back to the suit.", next = "BACK" } },
    },
    chains = {
      lines = { { id = "c_default", text = "There's a shackle key, and one of the guards carries it, though I couldn't tell ya which one this week because they pass it around like a head cold. You find it, you turn it, and Knot Thimblejack becomes a very grateful former prisoner." } },
      choices = { { text = "I'll keep an eye out. Something else.", next = "BACK" } },
    },
    gordok = {
      lines = { { id = "gordok_default", text = "Plenty, since they talk in front of me like I'm furniture. The big thing is, whoever kills the king is the king, no paperwork, no appeals, and the rest of 'em line up to pay tribute to the new boss like nothin' happened." } },
      choices = {
        { text = "So the guards I leave alive would serve me?", next = "tribute" },
        { text = "How do I deal with a guard without killing him?", next = "slipkik" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribute = {
      lines = { { id = "tr_default", text = "That's the beauty of it, pal. Every lieutenant still breathin' when the old king drops owes the new king his share, so the smart operator walks around 'em, not through 'em, and I say that as a goblin who knows a margin when he sees one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    slipkik = {
      lines = { { id = "sl_default", text = "Take Guard Slip'kik, who walks the same hall all day. There's a busted old trap in the floor on his route, and if somebody handy fixed it up with a little frost and a widget, he'd step in it and stand there froze solid while you waltzed by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "ta_default", text = "I heard there was a king out here with no royal wardrobe, and I figured an ogre-sized commission meant an ogre-sized fee. That's the last time I travel on a sales lead without checkin' whether the customer eats people." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Finest tailor the Cartel ever licensed, pal, and right now the only one with a ball and chain." } },
    gordok = { { id = "tp_gk", text = "Kill the king and you're the king. Leave his boys standin' and they pay you tribute." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, friend. My view's been the same four walls for a long while." } },
  },
}

-- Mizzle the Crafty: ogre at Gordok's Seat, who comes when the king falls and names the new one.
P:NPC {
  key = "mizzle_the_crafty", id = TODO_NPC("Mizzle the Crafty"), name = "Mizzle the Crafty", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "gordok" }, temper = { "smooth", "cheerful" }, values = { "cunning", "practical" },
  notices = { "race" },
  impression = {
    first = "When King Gordok fell, a small sharp-eyed ogre called Mizzle the Crafty came trotting in, checked that the king was dead, and named me king of the Gordok on the spot. He has plainly said the same words to other kings, and expects to say them again.",
    third = "{name} met Mizzle the Crafty, the Gordok ogre who proclaims each new king in Dire Maul.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Boss is back, and still king! Mizzle is very pleased, because Mizzle does not like learning a new king's name every week." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Mizzle bows, because Mizzle bows to every king, but the ogres are muttering about you, boss, and Mizzle is listening." },
    { id = "g_default", text = "The old king is dead, and Mizzle looked twice to be sure! That means you are the new king, boss, so long live you, for as long as it lasts." },
    { id = "g_back", when = { metBefore = true }, text = "Mizzle is still here, king. Mizzle is always here, whoever is sitting in the big chair." },
  },
  notice = {
    { id = "n_small", cat = "race", when = { race = { "Gnome", "Dwarf", "Goblin" } },
      text = "Mizzle has served big kings and bigger kings, but never one this small. It is no problem, boss, the Gordok only count who is still standing, not how tall." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Oho, a king with horns! The boys will like that, because horns are nearly as good as two heads." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "This is Mizzle, called the Crafty, because Mizzle is the only Gordok who never wanted to be king. Kings come and kings get smashed, but somebody must remember the rules and count the tribute, and that somebody keeps his head." } },
      again = {
        { id = "h_again", text = "What else does the king want to know?" },
        { id = "h_again2", text = "Ask Mizzle, king. Mizzle knows everything in this place." },
      },
      choices = {
        { text = "How can I be king? I'm not an ogre.", next = "king" },
        { text = "What does a king of the Gordok get?", next = "tribute" },
        { text = "How many kings have you served?", next = "many" },
        { text = "Why didn't you ever want to be king?", next = "ynever" },
        { text = "What happens to old kings?", next = "yold" },
        { text = "A rogue appreciates a crafty ogre.", next = "BACK", when = { class = "ROGUE" }, reply = "Mizzle sees you, sneaky one. Mizzle likes sneaky. Sneaky lives longer than smashy." },
        { text = "Carry on, Mizzle.", next = "END" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "The rule is very old and very simple, which is why ogres can remember it. Whoever kills the king is the king, and the rule never said anything about being an ogre, so Mizzle does not ask." } },
      choices = {
        { text = "And the other ogres accept that?", next = "accept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accept = {
      lines = { { id = "a_default", text = "They accept whoever smashed the last one, because nobody wants to be next. The captains you left alive will bow and bring gifts, and the ones you killed do not complain at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tribute = {
      lines = { { id = "t_default", text = "Tribute, boss! Every Gordok chief still breathing sends the king his share, and Mizzle piles it up by the throne. A king who smashed all his chiefs on the way in gets a very small pile, and Mizzle has seen some sad faces about that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    many = {
      lines = { { id = "m_default", text = "Mizzle stopped counting after he ran out of fingers. They all say they will rule forever, and then somebody stronger walks in, and Mizzle says the words again and sweeps up." } },
      choices = {
        { text = "So you expect me to be replaced too.", next = "replaced" },
        { text = "Something else.", next = "BACK" },
      },
    },
    replaced = {
      lines = { { id = "r_default", text = "Mizzle expects nothing and is surprised by nothing, king. But you are not staying to sit in the chair, Mizzle can see that, so most likely you just walk away, which is the only way a Gordok king ever got old." } },
      choices = { { text = "You are crafty. Something else.", next = "BACK" } },
    },
  
    ynever = {
      lines = {
        { id = "ythecra_ynever_d", text = "Because kings get smashed, boss! Every one. Mizzle watched his own father become king and get smashed in one moon. Mizzle decided to be the one who says 'you are king now' instead. Nobody smashes the one who says it." },
        { id = "ythecra_ynever_v0", when = { race = { "Orc", "Troll" } }, text = "Because kings get smashed, boss! You are Horde, you know how it goes with chiefs. Mizzle decided to be the one who names the king, not the one who sits." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yold = {
      lines = {
        { id = "ythecra_yold_d", text = "They get smashed, mostly, and the new king takes their stuff. Some kings, Mizzle hides. One old king lives in a back room and counts rocks. He thinks he is still king. Mizzle lets him think so." },
      },
      choices = {
        { text = "Why hide him?", next = "yhide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhide = {
      lines = {
        { id = "ythecra_yhide_d", text = "Because he was nice to Mizzle once, a long time ago. Gordok law says smash the old king, always. But Mizzle thinks law is for ogres who cannot think. Is Mizzle wrong, boss?" },
      },
      choices = {
        { text = "The law is the law. Old kings must go.", next = "BACK", reply = "Hmm. Maybe the king is right. Mizzle will think about it. Slowly.", fx = { align = { order = 1 } } },
        { text = "You did right. Kindness is crafty too.", next = "BACK", reply = "Mizzle thinks so too! Do not tell the captains, boss.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    eldre_thalas = { { id = "ythecra_tp_eldre_thalas", text = "Eldre'Thalas is old elf city. Ogres live in it now. Mizzle thinks the elves are angry, but they are mostly dead." } },
    tribute = { { id = "ythecra_tp_tribute", text = "Tribute is the best part of being king. Mizzle keeps it safe, mostly." } },

    background = { { id = "tp_bg", text = "Mizzle keeps the rules of the Gordok and counts the tribute. It is safer work than being king." } },
    gordok = { { id = "tp_gk", text = "Whoever kills the king is the king. That is the whole law, and Mizzle keeps it." } },
    _none = { { id = "tp_none", text = "Mizzle does not know that one, and Mizzle is not too proud to say so." } },
  },
}
