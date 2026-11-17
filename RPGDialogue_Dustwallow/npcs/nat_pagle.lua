-- Nat Pagle, on his little landing south of Theramore (0.72.0). Voice: bibles/nat_pagle.md
-- Laconic, folksy, fond of drink; claims not to love fishing and has done it for thirty years.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "nat_pagle", id = TODO_NPC("Nat Pagle"), name = "Nat Pagle",
  bible = "bibles/nat_pagle.md", role = "questgiver", tier = "quest",
  temper = { "easygoing", "dry" }, values = { "patient", "honest" },
  notices = { "craft", "drink" },
  impression = {
    first = "Nat Pagle says he doesn't much enjoy fishing, and then talks about it for an hour without getting up. He likes a slow day, a full bottle and anybody patient enough to sit still beside him.",
    third = "{name} met Nat Pagle, the famous fisherman, on his quiet landing in Dustwallow Marsh.",
  },

  greetings = {
    { id = "g_default", text = "Sit down if you're stayin', and hush if you're sittin'. The fish can hear you." },
    { id = "g_active", when = { questActive = TODO_QUEST("Nat Pagle, Angler Extreme") }, text = "Anything bitin' today? No rush, there never is." },
    { id = "g_done", when = { questDone = TODO_QUEST("Nat Pagle, Angler Extreme") }, text = "Well, if it ain't my best student. Don't tell the others I said so; there ain't any others." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Pull up a crate, there's one with fewer splinters on the left." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've been busy, I can tell by the stitches and the swamp mud to your knees. Me, I've been sittin' right here, and I reckon I'm the happier of us two." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "I see a pole on your back and a squint in your eye. Thought so, you're one of us." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a few, ain't you? Good. Means you're doin' the second half of fishin' right, at least." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Nat Pagle. Folks come a long way to find me, and I've never understood it, since all I do is sit on a dock and wait for somethin' to happen." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Nat Pagle, Angler Extreme") },
          text = "Can't say I really enjoy fishin' much, and I've been at it twenty or thirty years now. If you've got the patience to sit on your duff for hours doin' nothin', I might have a list for you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Nat Pagle, Angler Extreme") },
          text = "Four fish, four waters: the Misty Reed Strand, the Sar'theris Strand, Feralas's Verdantis and the Savage Coast. None of 'em are hard, they just make you wait, and that's the lesson." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Nat Pagle, Angler Extreme"), days = 3 } },
          text = "Now that was a fine catch, and you set those lines like I showed you, I saw. Not bad for somebody who still talks while the bobber's in." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Your lot fish like they mine, all elbows and no waitin', but I've seen a few learn better." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll, and I'd wager you grew up with a line in the water. You'll know the sea doesn't hurry for anybody." },
      },
      again = {
        { id = "h_again", text = "Somethin' else on your mind? Take your time, nothin' here is in a hurry." },
        { id = "h_again2", text = "Go on. I'm listenin', mostly, and the other half of me's listenin' to the bobber." },
      },
      choices = {
        { text = "Why fish, if you don't enjoy it?", next = "why" },
        { text = "Folk must come a long way to see you.", next = "visitors" },
        { text = "Do you ever go to Theramore?", next = "theramore" },
        { text = "There's a bottle in your tackle box, unless I'm mistaken.", next = "drink" },
        { text = "I've fished my whole life. What am I missing?", next = "fisher", when = { profession = "Fishing" } },
        { text = "What do you know about these waters, Nat?", next = "waters", when = { class = { "SHAMAN", "DRUID", "HUNTER" } } },
        { text = "Give me the list, Nat.", next = "BUSINESS" },
        { text = "I'll leave you to it, Nat.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", key = true, text = "If you ask me, the best part about fishin' is how slow it is. It gives a fella time to think over what's been and plan for what's comin', and somewhere in there a fish usually shows up." } },
      choices = {
        { text = "You must do a lot of thinking out here.", next = "why_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_think = {
      lines = { { id = "wt_default", text = "Mostly nothin', and I'm proud of it, because the rest of the world thinks too much and none of it does 'em any good. Sometimes I think about the fish, and sometimes I think about lunch." } },
      choices = {
        { text = "Doing nothing sounds like a waste of a life.", next = "why_stance" },
        { text = "That sounds like wisdom, Nat.", next = "why_stance" },
      },
    },
    why_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Well, everybody's runnin' about savin' the world, and the world keeps needin' it, so I figure somebody ought to sit still and keep an eye on it. That somebody's me." } },
      choices = {
        { text = "The world needs fighters more than watchers, Nat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A quiet life is worth defending. Keep it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = { { id = "v_default", text = "Anglers, mostly, the ones who got everything they can from the trainers in the cities and the book old Heming sells down in Booty Bay. After that, there's nowhere left to learn but here, which tells you how desperate they are." } },
      choices = {
        { text = "What do you teach them?", next = "visitors_teach" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    visitors_teach = {
      lines = { { id = "vt_default", text = "Not a thing they couldn't learn themselves, if they'd sit still long enough. I send 'em off after a few rare fish, and by the time they come back they've learned to wait, and then I show 'em how to set a few lines." } },
      choices = { { text = "Clever, Nat.", next = "BACK", fx = { affinity = 1 } } },
    },
    theramore = {
      lines = { { id = "t_default", text = "Now and then, when the bottle's empty. The Lady's guards are polite enough, and the innkeeper doesn't water her drinks, which is about all I ask of a town." } },
      choices = {
        { text = "And the Horde camp to the north?", next = "theramore_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_horde = {
      lines = { { id = "th_default", text = "The ogres don't come down this far, and the orcs leave me be. A fella with a fishin' pole ain't much of a threat to anybody but the fish, and the fish don't belong to the Horde or the Alliance." } },
      choices = { { text = "Something else, Nat.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "d_default", text = "It might be, and it might be empty, which is a worse question. Fishin' is a fine excuse to drink, and I take my excuses seriously." } },
      choices = {
        { text = "Mind if I join you?", next = "drink_join" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_join = {
      lines = { { id = "dj_default", text = "Bring your own, and I'll find you a crate. That's the only rule on this dock, and I made it myself, so I'm fond of it." } },
      choices = { { text = "Next time, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    fisher = {
      lines = { { id = "f_default", text = "Probably nothin', and that's what you're missin'. Folks who fish all their lives start chasin' the big one and forget to enjoy the little ones." } },
      choices = {
        { text = "I'll slow down, then.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I still want the big one.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    waters = {
      lines = { { id = "wa_default", text = "Brackish by the shore and deep past the reef, and the snapjaws and the turtles get bigger every year. I take it as a compliment to the water, and I don't go botherin' 'em." } },
      choices = { { text = "Wise of you both.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fish, I drink, and I sit. Been doin' all three a good long while, and I'm still not tired of the last one." } },
    advice = { { id = "tp_ad", text = "Don't yank the line the second it twitches, or you'll spend the afternoon fishin' your hook out of the reeds. Let the fish think it's winnin'." } },
    _none = { { id = "tp_none", text = "Can't say I know a thing about that. Ask me about fish, or don't ask me at all." } },
  },
}
