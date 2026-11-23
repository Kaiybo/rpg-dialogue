-- Zul'Farrak: the sandfury troll city in Tanaris. Sergeant Bly and Weegli Blastfuse, captives
-- waiting in the cages atop the pyramid, who join the fight on the steps once freed.
-- Voices: bibles/dg_bly.md, bibles/dg_weegli.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sergeant Bly: leader of a band of treasure hunters, caged by the Sandfury.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_bly", id = TODO_NPC("Sergeant Bly"), name = "Sergeant Bly", title = "Captive",
  bible = "bibles/dg_bly.md", role = "questgiver", tier = "quest",
  temper = { "brash", "shifty" }, values = { "greedy", "practical" },
  notices = { "class" },
  impression = {
    first = "Grateful, loud and already counting the angles. You'd not turn your back on him.",
    third = "{name} freed Sergeant Bly from the Sandfury cages atop Zul'Farrak's pyramid.",
  },
  greetings = {
    { id = "g_default", text = "Well, look at that! Somebody actually made it up here with a sword and all their limbs." },
    { id = "g_rod", when = { questActive = TODO_QUEST("Divino-matic Rod") }, text = "Gadgetzan sent you for the rod, didn't they? Funny thing about that rod. Let's talk once these trolls stop trying to sacrifice us." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "A professional, I see. You and I could do business, friend, once we're out of this oven." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sergeant Bly, at your service, and I mean that very sincerely right now. Me and my crew came for troll gold and got a cage and a sunburn instead. Get us off this pyramid and we'll fight alongside you." },
      },
      again = { { id = "h_again", text = "Still here? The trolls aren't getting any friendlier, pal." } },
      choices = {
        { text = "Who are your friends here?", next = "crew" },
        { text = "What were you doing in Zul'Farrak?", next = "why" },
        { text = "Do you have the Divino-matic Rod?", next = "rod" },
        { text = "Fight with us down the steps.", next = "fight" },
        { text = "I'll be back for you.", next = "END" },
      },
    },
    crew = {
      lines = { { id = "c_default", text = "Weegli's our goblin, handy with explosives and not much else. Raven, Oro Eyegouge and Murta Grimgut round it out. We're not heroes, but we're not dead yet, which is better than most who come here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Treasure, obviously. These trolls have been piling up gold since before Gadgetzan was a sandbar, and somebody's got to liberate it. We just underestimated how much they like throwing people into the pit." } },
      choices = {
        { text = "Robbing tombs is honest work, I suppose.", next = "BACK", reply = "Ha! You get it. The trolls stole it all first anyway, so really we're returning it to circulation.", fx = { align = { light = -1 } } },
        { text = "You got what grave-robbers deserve.", next = "BACK", reply = "Hey, harsh. True, maybe, but harsh. Save the sermon for after the trolls.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rod = {
      lines = { { id = "r_default", text = "The rod? Oh, I've got it. Thing is, I've grown attached to it, and you've grown attached to staying alive, so let's see how the next few minutes go before we talk ownership." } },
      choices = {
        { text = "That sounds like a threat, Sergeant.", next = "BACK", reply = "A threat? Me? I'm a captive in a cage, pal. I'm just saying the desert's a long walk and a man has to look after his interests." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Now you're talking! Weegli, get ready to blow those doors when we're down. Everybody else, grab something sharp and stay behind the big one." } },
      choices = { { text = "Let's go.", next = "END" } },
    },
  },
  topics = {
    zulfarrak = { { id = "tp_zf", text = "Troll city, lots of sand, lots of gold, lots of very angry priests." } },
    _none = { { id = "tp_none", text = "No clue, pal. Ask me about treasure." } },
  },
}

---------------------------------------------------------------------------
-- Weegli Blastfuse: Bly's goblin demolitionist.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_weegli", id = TODO_NPC("Weegli Blastfuse"), name = "Weegli Blastfuse", title = "Captive",
  bible = "bibles/dg_weegli.md", role = "event", tier = "quest",
  temper = { "excitable", "cheerful" }, values = { "practical", "curious" },
  notices = { "race" },
  impression = {
    first = "Happiest goblin you've ever met, provided something is about to explode.",
    third = "{name} met Weegli Blastfuse, the goblin demolitionist caged with Sergeant Bly's crew in Zul'Farrak.",
  },
  greetings = {
    { id = "g_default", text = "Ooh, rescuers! Did you bring any blasting powder? No? That's fine, I've got plenty hidden in my boot." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "A gnome! Do you have any of those fancy timer fuses? Mine are mostly just string and hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Weegli Blastfuse, demolitions expert! Well, expert-ish. The trolls took my good charges, but I can still blow the door at the bottom of the steps if you keep them off me for a minute." },
      },
      again = { { id = "h_again", text = "Need something blown up? It's always yes." } },
      choices = {
        { text = "Which door do you mean?", next = "door" },
        { text = "How did a goblin end up with Bly?", next = "bly" },
        { text = "Isn't all this dynamite dangerous?", next = "danger" },
        { text = "Get ready, Weegli.", next = "END" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "The big one into the inner city, where Chief Ukorz Sandscalp sits. Trolls lock it tight, but no lock ever made can argue with a good bundle of powder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bly = {
      lines = { { id = "b_default", text = "Sarge pays in shares, and I like shares! Also he lets me blow things up without filling out any forms. In Gadgetzan you need a permit just to light a candle." } },
      choices = {
        { text = "Can Bly be trusted?", next = "BACK", reply = "Sarge? Sure! Mostly. He's never left me behind, anyway, except that one time, and the time after that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Dangerous? Only if you're standing in the wrong place, and I'll yell first. Usually. Probably." } },
      choices = {
        { text = "Rules exist for good reasons.", next = "BACK", reply = "Oh, sure, rules are lovely! I just think they look better from a safe distance after the boom.", fx = { align = { order = 1 } } },
        { text = "Ha! Blow it all sky-high.", next = "BACK", reply = "Now there's a friend! You and me are going to get along just fine.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Dunno! Is it flammable? If not, I didn't pay attention." } },
  },
}
