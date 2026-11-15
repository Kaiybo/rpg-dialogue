-- Southshore (Alliance). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "redpath", id = TODO_NPC("Marshal Redpath"), name = "Marshal Redpath",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "southshore" }, temper = { "steady" }, values = { "dutiful", "protective" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_hall", text = "Southshore. We're small, we're stubborn, and we're still here. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you're back. Southshore's short of hands that stay." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the bearing of a soldier. Stormwind-trained, maybe, though it doesn't matter; I'll take you either way." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Those ogres up the hill did that, I'll wager. Get it mended at Aebischer's, then go back and return the favour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marshal Redpath. I was headman here when the first boats came from Stormwind, full of people with nothing left. Now I'm marshal, and the town's full of their children." },
        { id = "h_crushridge", tags = { "news" }, when = { questActive = TODO_QUEST("Crushridge Bounty") },
          text = "The Crushridge ogres come down out of Alterac and take whatever's loose, people included. Thin them out, and the hills will breathe easier." },
        { id = "h_farren", when = { heardLine = "farren.h_default" },
          text = "Farren told you how much he hates it here? He tells everyone. I gave him the murlocs, and he gave them to you, I suppose." },
        { id = "h_warmongers", tags = { "news" }, when = { questActive = TODO_QUEST("Crushridge Warmongers") },
          text = "The Warmongers are the ones who lead the raids. Cut down enough of them and the rest will remember where Alliance land starts." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "Another one out of the north, then. Southshore was taking in people with nothing long before you got here, and you're welcome." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night's when the horses go missing, so I keep a lantern lit by the stables, not that the dead need the light." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I walk the line." },
        { id = "h_again2", text = "Go on, I've a minute, though never two." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. The night watch can spare me a moment, and I them." },
      },
      choices = {
        { text = "The first boats from Stormwind?", next = "boats" },
        { text = "What threatens Southshore?", next = "threats" },
        { text = "Tell me about the town.", next = "town" },
        { text = "What do you make of Lieutenant Orinelle?", next = "farren" },
        { text = "I fled the plague. Is there room for me here?", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Did Silver Hand knights ever come to Southshore?", next = "paladin", when = { class = "PALADIN" } },
        { text = "The dead are so close. How do your people bear it?", next = "priest", when = { class = "PRIEST" } },
        { text = "I've seen the ruins of Alterac.", next = "alterac_seen", when = { questDone = TODO_QUEST("Crushridge Warmongers") } },
        { text = "I'm doing Lieutenant Orinelle's murloc work.", next = "errand", when = { questActive = TODO_QUEST("Farren's Proof") } },
        { text = "I'll help.", next = "BUSINESS", fx = { affinity = 2, standing = { southshore = 1 } } },
        { text = "Good day, Marshal.", next = "END" },
      },
    },

    boats = {
      big = true,
      lines = {
        { id = "b_default", key = true,
          text = "Lothar came off the lead ship, with a young mage called Khadgar. I sent Willem, my fastest rider, to King Terenas that hour. He rode like the dead were after him." },
      },
      choices = {
        { text = "You met Lothar?", next = "lothar" },
        { text = "And the mage, Khadgar?", next = "khadgar" },
        { text = "That's a lot of history.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lothar = {
      lines = { { id = "l_default", text = "Only for an hour. He was tired, soaked and grieving, and still the most dangerous man I'd ever seen; I've never forgotten it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    khadgar = {
      lines = {
        { id = "kh_default", text = "A young man with an old man's eyes, even then. He went north with Lothar, and later through the Dark Portal with the expedition. None of them came back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    threats = {
      lines = { { id = "t_default", text = "Murlocs on the coast, naga past them, ogres in the hills. The Syndicate at Durnholde. And the dead in Tarren Mill, who'd like the whole valley." } },
      choices = {
        { text = "Tell me about the ogres.", next = "crushridge" },
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "And Tarren Mill?", next = "tarren" },
      },
    },
    crushridge = {
      lines = {
        { id = "cr_default", text = "Crushridge ogres, dug in in the Alterac Mountains and squatting in the ruins of the old capital. Let them get comfortable, and the foothills are next, then my front door." },
      },
      choices = {
        { text = "Then they won't get comfortable.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "Thieves with old names, out of Alterac. They hold the ruins of Durnholde and take our horses and our shipments, and while the Magistrate keeps their papers, I keep the road." },
      },
      choices = {
        { text = "Durnholde? The old keep?", next = "durnholde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durnholde = {
      lines = {
        { id = "du_default", text = "Where they held the captured orcs after the Second War. One of those orcs came back with an army and pulled the keep down around its lord. Now the Syndicate squat in the rubble." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    tarren = {
      big = true,
      lines = {
        { id = "ta_default", text = "Tarren Mill was a town like this one, until the plague came and the dead took it, and now they want our fields too. Hillsbrad's farms feed Southshore, and they know it." },
      },
      choices = {
        { text = "The Forsaken were people once.", next = "tarren_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren_people = {
      lines = {
        { id = "tpe_default", text = "So were the farmers they've killed. I don't hate them, mind. I just don't let them near the horses." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone should try talking to them.", next = "BACK", fx = { align = { light = 1 }, opinion = { forsaken = "talk" } } },
      },
    },

    town = {
      lines = {
        { id = "to_default", text = "A fishing village before the boats, a seaport in the war, and now one of the last human towns in Lordaeron. We fish, we farm the fields up the valley, and we keep watch." },
      },
      choices = {
        { text = "Who lives here now?", next = "town_people" },
        { text = "Something else.", next = "BACK", fx = { standing = { southshore = 1 } } },
      },
    },
    town_people = {
      lines = {
        { id = "tw_default", text = "Fishermen, mostly. A few old knights of the Silver Hand, a few Kirin Tor mages who never went back north, and refugees who stopped running here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farren = {
      lines = {
        { id = "fa_default", text = "Orinelle? He's a good guardsman in the wrong post. He gets the work done eventually, usually through someone else." },
      },
      choices = {
        { text = "Through me, you mean.", next = "farren_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farren_you = {
      lines = {
        { id = "fy_default", text = "Through you, yes. He thinks I don't know, and I've decided to let him keep thinking it, since it gets the murlocs killed." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    refugee = {
      big = true,
      lines = {
        { id = "rf_default", text = "There's room; there's always room, because that's what this town is for. It was for the Stormwind folk once, so tell Anderson at the inn I said so." },
      },
      choices = {
        { text = "Thank you, Marshal.", next = "BACK", fx = { affinity = 3, standing = { southshore = 2 } } },
        { text = "I won't be a burden. Put me to work.", next = "BUSINESS", fx = { affinity = 2, standing = { southshore = 2 }, trait = { proud = 1 } } },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Some still live here, quieter than they were. When Uther fell, the Hand came apart, and some of the men in it came apart too. Be kind to them." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },
    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "We bury our dead with the old words. Then we watch the grave for a few nights, to be sure. That's what Lordaeron is now." },
      },
      choices = {
        { text = "Then I'll say the words with them.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, standing = { southshore = 1 } } },
        { text = "No one should have to grieve like that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    alterac_seen = {
      lines = {
        { id = "as_default", text = "Have you, now? Then tell me how the old city looks these days. Bad, I'd guess, since ogres don't keep house." },
      },
      choices = {
        { text = "Ruined, and filthy with ogres.", next = "BACK", fx = { affinity = 1 } },
        { text = "There were still books in it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Quieter, now.", next = "BACK", fx = { affinity = 2, standing = { southshore = 1 } } },
      },
    },
    errand = {
      lines = {
        { id = "er_default", text = "Farren's errand-runner, are you? Thank you, then. Southshore needs people who'll do the work, whoever ends up taking the credit." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { southshore = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "First headman, then marshal: the same town and the same people, only a bigger sword.", next = "boats" } },
    advice = { { id = "tp_ad", text = "Stay off the hill roads after dark. Between the ogres, the Syndicate and the dead, somebody up there's always awake." } },
    defias = { { id = "tp_defias", text = "Stormwind's thieves? We've our own here, the Syndicate: the same rot, only with different noble names on the deeds." } },
    seven_kingdoms = { { id = "tp_seven", text = "Alterac was one of the seven, until Lord Perenolde sold the Alliance to the Horde. Its nobles have been thieves ever since, and some of them were before." } },
    _none = { { id = "tp_none", text = "Ask the Magistrate; he's paid to know things, and I'm paid to stand here." } },
  },
}

P:NPC {
  key = "maleb", id = TODO_NPC("Magistrate Henry Maleb"), name = "Magistrate Henry Maleb",
  bible = "bibles/hillsbrad.md", role = "noble", tier = "quest",
  communities = { "southshore" }, temper = { "weary" }, values = { "lawful", "dutiful" },
  notices = { "status" },

  greetings = {
    { id = "g_office", text = "Sit, sit, and don't mind the papers. The Syndicate keep me in reading." },
  },

  notice = {
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "I'll speak plainly, since you look like someone who reads between lines anyway. The Syndicate wear faces like yours. Prove you're not one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Henry Maleb, Magistrate of Southshore. I was thrilled to be given the post so young. Some evenings I wonder if I'd have done better as a clerk in Stormwind." },
        { id = "h_assassins", tags = { "news" }, when = { questActive = TODO_QUEST("Syndicate Assassins") },
          text = "Syndicate assassins, paid killers, in the hills above town. Someone's paying them and I want to know who, so start by finding out what they carry." },
        { id = "h_plans", when = { questActive = TODO_QUEST("Foreboding Plans") },
          text = "These plans name names, and old ones at that. Alterac's nobility never died; it just learned to hire better." },
        { id = "h_council", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Council") },
          text = "Whoever pulls these strings meets somewhere up in the mountains. Break them, and you'll do more for Southshore than ten years of my letters." },
        { id = "h_papers", when = { metBefore = true }, text = "I signed forty documents before breakfast and read most of them... some of them, at least the important ones, I hope." },
        { id = "h_rings", when = { questActive = TODO_QUEST("Noble Deaths") },
          text = "Signet rings. The nobles hide among their cutthroats, but they can't bear to take the rings off. Bring me the rings, and we'll know who's left." },
        { id = "h_contract", tags = { "news" }, when = { questActive = TODO_QUEST("Baron's Demise") },
          text = "Baron Vardus signed my death in red wax, and he's cold, cruel, and an Alterac lord to his boots. Find him in the mountains and bring him to justice." },
        { id = "h_vardus_done", when = { questDone = TODO_QUEST("Baron's Demise") },
          text = "I slept through the night, the whole night, and I'd forgotten what that was like." },
      },
      again = {
        { id = "h_again", text = "What else? The depositions will keep a minute." },
        { id = "h_again2", text = "Go on. I'll pretend this is official business." },
      },
      choices = {
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "What happened to the last magistrate?", next = "predecessor" },
        { text = "Why not go back to Stormwind?", next = "stormwind" },
        { text = "If not the Syndicate, who wrote that letter?", next = "argus", when = { questDone = TODO_QUEST("Further Mysteries") } },
        { text = "I could get inside the Syndicate for you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "My family knew some of the Alterac houses.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Baron Vardus is dead.", next = "vardus", when = { questDone = TODO_QUEST("Baron's Demise") } },
        { text = "Good day, Magistrate.", next = "END" },
      },
    },
    syndicate = {
      big = true,
      lines = {
        { id = "s_default", text = "Alterac's lords, or their heirs, who never forgave the Alliance for taking their kingdom away. They took Durnholde and called it a home. They'd take Southshore too, if we let them." },
      },
      choices = {
        { text = "Who leads them?", next = "nobles" },
        { text = "Then we won't let them.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    nobles = {
      lines = {
        { id = "no_default", text = "Old Alterac names, hiding among the footpads. You can tell a noble by his signet ring; they never take them off. Strahnbrad, up in the mountains, is their den." },
      },
      choices = {
        { text = "What do they want with Southshore?", next = "plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      big = true,
      lines = {
        { id = "pl_default", text = "I've read their supply list too many times. Black masks, lamp oil for burning, paralytic poison, and the stolen uniforms of my own guard. They mean to come for us looking like us." },
      },
      choices = {
        { text = "Then we strike first.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { southshore = 1 } } },
        { text = "Double the watch. Check every uniform.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    predecessor = {
      lines = {
        { id = "pd_default", text = "He was assassinated, and the killers were never found, but everything points to the Syndicate. I took the post knowing that, because I was young enough to think it wouldn't matter." },
      },
      choices = {
        { text = "Aren't you afraid?", next = "afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = {
        { id = "af_default", text = "Every night. I bolt the shutters, I check the guard, I read one more report. Fear's only useful if it makes you careful." },
      },
      choices = {
        { text = "Careful keeps you alive.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Then let me be your guard for a while.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    stormwind = {
      lines = { { id = "st_default", text = "Because someone has to keep the law here, and everyone else who could has already gone. That's how most magistrates are made, I suspect." } },
      choices = {
        { text = "Do you regret coming?", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = {
        { id = "rg_default", text = "Some evenings. Then a fisherman thanks me for settling a quarrel over a net, and I stay. Small justice is still justice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } } },
    },
    argus = {
      big = true,
      lines = {
        { id = "ar_default", text = "Not a thief, nor an Alterac noble. Something calling itself the Argus Wake stands behind the Syndicate, and I don't know what it is. That frightens me more than masks." },
      },
      choices = {
        { text = "We'll find out.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "I'd rather you didn't tell me how. I'm a magistrate; there are things I'd have to write down. Bring me what you find, and I won't ask about the rest." },
      },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } } },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then you'll understand why I check every signet ring twice. Old names don't die out; they hire people." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    vardus = {
      lines = {
        { id = "va_default", text = "Then the last magistrate is paid for, or near enough, and I thank you. I may even open a shutter tonight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { southshore = 2 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A commission young, a predecessor dead, and a desk full of Syndicate. That's my career so far.", next = "predecessor" } },
    advice = { { id = "tp_ad", text = "Read everything twice, especially whatever's been slipped under your door." } },
    defias = { { id = "tp_defias", text = "That's a Stormwind problem, and I've a Syndicate problem; some days I'd gladly trade." } },
    seven_kingdoms = { { id = "tp_seven", text = "Alterac was a kingdom once. Now it's a list of names I keep in a locked drawer." } },
    _none = { { id = "tp_none", text = "Not before the court. Ask Redpath; he knows the ground." } },
  },
}

P:NPC {
  key = "farren", id = TODO_NPC("Lieutenant Farren Orinelle"), name = "Lieutenant Farren Orinelle",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "quest",
  communities = { "southshore" }, temper = { "sulky" }, values = { "ambitious" },
  notices = { "drink" },

  greetings = {
    { id = "g_inn", text = "Pull up a chair... no, not that one, that's mine. They're all mine, actually, I've been here so long." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, a fellow sufferer. Southshore drives everyone to it eventually. You're just ahead of schedule." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lieutenant Farren Orinelle, late of the Stormwind City Guard. Now I'm in charge of murlocs, in a fishing town, at the end of the world. I'm told it builds character." },
        { id = "h_proof", tags = { "news" }, when = { questActive = TODO_QUEST("Farren's Proof") },
          text = "Redpath wants proof the murlocs are being dealt with. Deal with them, bring me proof, and I'll pass it up as if I'd been out there. Everyone wins." },
        { id = "h_stormwind", when = { questActive = TODO_QUEST("Stormwind Ho!") },
          text = "If I can show the city I've cleaned up this coast, they'll have to call me home, so please, I'm begging you, in a dignified way." },
        { id = "h_reassign", when = { questDone = TODO_QUEST("Reassignment") },
          text = "Still waiting on the reply, any day now, any day. I've packed; I've been packed for a month." },
        { id = "h_chair", when = { metBefore = true }, text = "Same chair, same murlocs, same sea. If you've come to tell me I've been recalled to Stormwind, I'll kiss you. If not, sit." },
        { id = "h_coast", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Coast") },
          text = "Torn Fin murlocs, down the Western Strand. Kill a few for me, then a few more for Redpath. Then we'll both have something to talk about." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Another evening in Southshore, and the gulls have gone to bed. I envy the gulls." },
      },
      again = {
        { id = "h_again", text = "Still here? Fine, I wasn't going anywhere; I never am." },
        { id = "h_again2", text = "What else? Quickly, before I remember where I am." },
      },
      choices = {
        { text = "Why do you hate it here?", next = "hate" },
        { text = "What's the trouble with the murlocs?", next = "murlocs" },
        { text = "What was the City Guard like?", next = "guard" },
        { text = "What about the naga?", next = "naga" },
        { text = "I was in Stormwind not long ago.", next = "stormwind_news", when = { visited = "Trade District" } },
        { text = "A soldier shouldn't hide in an inn, Lieutenant.", next = "push", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Major Samuelson read your report.", next = "reassign", when = { questDone = TODO_QUEST("Reassignment") } },
        { text = "Fine, I'll deal with the murlocs.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "I'll leave you to your chair.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "It smells of fish, it rains sideways, and the most exciting thing that happens is the Forsaken trying to kill us. In Stormwind I had a uniform people respected. Here I have gulls." },
      },
      choices = {
        { text = "The people here need you.", next = "need", fx = { trait = { kind = 1 } } },
        { text = "Sounds rough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "...That's a low blow, accurate but low. Go and kill some murlocs before I start feeling guilty." } },
      choices = {
        { text = "Would you really leave them, if Stormwind called?", next = "conscience" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    conscience = {
      lines = {
        { id = "co_default", text = "I'd write them a letter, a long one, with apologies... fine, probably not, but don't tell Redpath." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "Torn Fins, on the Western Strand: fish that grew legs and opinions. I've stopped eating fish, and in Southshore that's close to fasting." },
      },
      choices = {
        { text = "Why not fight them yourself?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "I could clear a Stormwind tavern of drunks one-handed, but murlocs don't drink, don't argue, and don't respect a uniform. It's a different trade entirely." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's an excuse, Lieutenant.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    guard = {
      lines = {
        { id = "gu_default", text = "Clean streets, a uniform people saluted, and Major Samuelson drilling us at dawn. He trained me, and he's the best officer in the city." },
      },
      choices = {
        { text = "Can he get you home?", next = "samuelson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    samuelson = {
      lines = {
        { id = "sa_default", text = "He's captain of the guard in the Keep now, and if anyone can get a man transferred, he can. So I write to him often, and very politely." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    naga = {
      big = true,
      lines = {
        { id = "na_default", text = "Redpath wants them dealt with, and High Command wants them dealt with too, says my old mentor. Which means the man who deals with them gets noticed, by Stormwind." },
      },
      choices = {
        { text = "So you'll fight the naga?", next = "naga_deal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_deal = {
      lines = {
        { id = "nd_default", text = "I will arrange for the naga to be fought by a capable volunteer, who might, by chance, be standing in front of me." },
      },
      choices = {
        { text = "Fine. Point me at them.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Do your own fighting.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    stormwind_news = {
      lines = {
        { id = "sn_default", text = "You were? Then tell me everything... no, wait, just one thing: do the lamps still come on along the canals at dusk?" },
      },
      choices = {
        { text = "Every evening.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I didn't notice.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    push = {
      lines = {
        { id = "pu_default", text = "...You sound like Redpath, or worse, like Samuelson. Fine, fine! I'll go out tomorrow, probably." },
      },
      choices = { { text = "I'll hold you to it.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } } },
    },
    reassign = {
      lines = {
        { id = "ra_default", text = "And? He'll 'take it into account', which is what they say in the Keep when they mean next month. It's always next month." },
      },
      choices = { { text = "Next month, then.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind City Guard, temporarily posted elsewhere. Very temporarily, I'm told.", next = "guard" } },
    advice = { { id = "tp_ad", text = "Never volunteer, because that's how I ended up here." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I've stopped learning things about Southshore, since it only encourages the place." } },
  },
}

P:NPC {
  key = "bilger", id = TODO_NPC("Brewmeister Bilger"), name = "Brewmeister Bilger",
  bible = "bibles/hillsbrad.md", role = "citizen", tier = "quest",
  communities = { "southshore" }, temper = { "rueful" }, values = { "honest" },
  notices = { "paladin", "drink" },

  greetings = {
    { id = "g_cellar", text = "Careful o' the casks, {g:lad|lass}, hic! They're older than you an' better behaved." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin, hic. I was one o' you once, Silver Hand, back when the Hand meant somethin'. Don't look at me like that; I know what I look like." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, ye've been at it too, hic! Good, for I hate drinkin' with sober folk; they count." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bilger, brewmeister, hic. Used to be a knight o' the Silver Hand, strict as a church bell, never touched a drop. Then the Hand broke, an' I found out what I'd been missin'." },
        { id = "h_moonshine", tags = { "news" }, when = { questActive = TODO_QUEST("MacKreel's Moonshine") },
          text = "MacKreel's moonshine! Now that's a brew, hic. Get me a jug an' I'll tell ye a story about Uther that'll curl yer hair." },
        { id = "h_brew", when = { metBefore = true }, text = "New batch, hic, an' smoother than the last. The old Hand would've had me flogged for it, but the old Hand's gone an' the batch is here." },
        { id = "h_paid", when = { questDone = TODO_QUEST("MacKreel's Moonshine") },
          text = "Foggy paid up, hic! In moonshine, which is the only coin he's got, an' the best one." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night shift in the cellar, hic. The casks talk at night, ye know, an' mostly they say 'more'." },
      },
      again = {
        { id = "h_again", text = "Hic. What else, {g:lad|lass}?" },
        { id = "h_again2", text = "Go on, I'm listenin', to you an' the casks both." },
      },
      choices = {
        { text = "What happened to the Silver Hand?", next = "hand" },
        { text = "Maybe ease off the brew?", next = "ease" },
        { text = "Who's this MacKreel?", next = "foggy" },
        { text = "The Light hasn't left you, brother.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I squired for the Silver Hand before it broke.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "The Light forgives, Bilger.", next = "priest", when = { class = "PRIEST" } },
        { text = "A dwarf in the Silver Hand?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Cheers.", next = "END" },
      },
    },
    hand = {
      big = true,
      lines = {
        { id = "h2_default", text = "Uther died, an' it was Arthas did it, hic. The rest of us scattered like rabbits: some kept the faith an' some found a cellar, an' I'm no' proud of which one I am." },
      },
      choices = {
        { text = "It's not too late to go back.", next = "back", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "...Maybe, hic. Ask me again when I'm sober, an' bring breakfast, for it'll be a while." } },
      choices = {
        { text = "I mean it, Bilger.", next = "back_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back_more = {
      lines = {
        { id = "bm_default", text = "I know ye do, an' that's what frightens me, hic. Come back in a month an' ask again, an' maybe I'll have an answer, or maybe a new batch." },
      },
      choices = { { text = "I'll ask.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } } },
    },
    ease = {
      lines = { { id = "e_default", text = "Ease off? I'm a brewmeister! It's research, hic, very serious research." } },
      choices = {
        { text = "Research into what?", next = "brew" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brew = {
      lines = { { id = "bw_default", text = "Barley, hops, an' forgettin'. Two o' the three are goin' very well." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    foggy = {
      lines = {
        { id = "fg_default", text = "Foggy MacKreel, one o' Longbraid's lads, up on the broken Thandol Span. He owes me money an' pays in moonshine when he remembers, which is less often than ye'd hope." },
      },
      choices = {
        { text = "Is his moonshine any good?", next = "moonshine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonshine = {
      lines = { { id = "ms_default", text = "Good, hic? It'd strip the paint off a church door, an' I'd know, for I've tried." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "Has it no', hic? Then it's patient, I'll give it that. Go on, ask me who trained me... no, don't, I'd only miss it more." },
      },
      choices = {
        { text = "You can still come back to it.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "I won't ask.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    squire = {
      lines = {
        { id = "sq_default", text = "A squire, hic. Then ye knew it at its best, or near enough, an' I'm sorry ye saw it end. Sit a minute, but no' on that cask; that one bites." },
      },
      choices = {
        { text = "Tell me about the old days.", next = "squire_days" },
        { text = "Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    squire_days = {
      lines = {
        { id = "sd_default", text = "Up before the sun for prayers, then drill, then prayers again, an' no ale, no cards an' no excuses. Hic, I'd give the whole cellar to have one of those mornings back." },
      },
      choices = { { text = "So would I.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Does it, hic? It's no' the Light I'm worried about, it's me, for I'm the harder judge." },
      },
      choices = {
        { text = "Then go easier on the judge.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Aye, a few of us. The Light never asked our height, hic, but the armourers did, an' ye've no idea what it costs to have plate taken in." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "First a paladin, then no' a paladin, an' now a brewmeister, hic. It's a short story wi' a long middle.", next = "hand" } },
    advice = { { id = "tp_ad", text = "Drink slow, pray quick, an' never trust a dwarf who says he's had enough, hic, because he's lyin'." } },
    _none = { { id = "tp_none", text = "Dunno, hic. Ask me again after the next cask." } },
  },
}

P:NPC {
  key = "dibbs", id = TODO_NPC("Loremaster Dibbs"), name = "Loremaster Dibbs",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "southshore" }, temper = { "dry" }, values = { "curious", "careful" },
  notices = { "lore" },

  greetings = {
    { id = "g_books", text = "If you've come about the books, sit. If you've come about anything else, sit anyway; I'll get to the books." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "The Seven Kingdoms, good! Then you know Alterac was one of them once, and most of its library is now ogre bedding." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dibbs. I collect what's left of the old kingdom's knowledge before the ogres finish using it to start their fires, and it's slow work, for they're quick readers, in their way." },
        { id = "h_milton", when = { heardLine = "milton.h_default" },
          text = "Milton Sheaf sent you? Of course he did, bless him. Tell him I've three crates of Alterac's records waiting, and one of them is mostly soot." },
        { id = "h_preserve", tags = { "news" }, when = { questActive = TODO_QUEST("Preserving Knowledge") },
          text = "Books still lie in the ruins of Alterac, and the ogres have been at them. Bring me whatever you can save, and handle it gently." },
        { id = "h_parchment", when = { questActive = TODO_QUEST("The Ensorcelled Parchment") },
          text = "This parchment has magic woven through it, so don't fold it and don't read it aloud... actually, don't read it at all." },
        { id = "h_page", when = { metBefore = true }, text = "I saved three whole pages from an ogre's cookfire yesterday, and they turned out to be a treatise on beekeeping. Not what I'd hoped, but it's knowledge all the same." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Letter to Stormpike") },
          text = "Stormpike will crow about this cipher for a month, and I'll let him, since he'll read it and that's what matters." },
        { id = "h_milton_done", when = { questDone = TODO_QUEST("Return to Milton") },
          text = "Milton wrote to thank me, three pages of it, and two of them were about the bindings." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, for questions are the only thing I collect faster than books." },
        { id = "h_again2", text = "Go on, I'll mark my place." },
      },
      choices = {
        { text = "What did the ogres do?", next = "ogres" },
        { text = "What are you looking for, exactly?", next = "grilek" },
        { text = "Can you read the Syndicate's letters?", next = "ciphers" },
        { text = "Why not go to the ruins yourself?", next = "climb" },
        { text = "I could help with your enchanted parchments.", next = "mage", when = { class = "MAGE" } },
        { text = "I came out of Lordaeron myself.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Good luck with the books.", next = "END" },
      },
    },
    ogres = {
      lines = { { id = "o_default", text = "Burned some, sat on others, and used a history of the Alterac succession to prop up a table. Honestly, the history deserved it." } },
      choices = {
        { text = "Why do these books matter so much?", next = "why_books" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_books = {
      lines = {
        { id = "wb_default", text = "Alterac kept what the other kingdoms didn't bother to write down. Lose it, and we lose the part of history that embarrassed people, which is usually the useful part." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    grilek = {
      big = true,
      lines = {
        { id = "gr_default", text = "One book above all, the Arm of Gri'lek, which holds old troll lore. The last intact copy anyone knew of sat in Alterac's library." },
      },
      choices = {
        { text = "Why troll lore?", next = "grilek_why" },
        { text = "I'll look for it.", next = "BUSINESS", fx = { affinity = 2 } },
      },
    },
    grilek_why = {
      lines = {
        { id = "gy_default", text = "Because the trolls were in these hills long before Arathor, and nobody ever asked them what they knew. Also, I'm curious, and curiosity is most of scholarship." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    ciphers = {
      lines = {
        { id = "ci_default", text = "The plain ones, yes, but not the clever ones; those go to Prospector Stormpike in Ironforge. I've been sending him a great deal of business lately." },
      },
      choices = {
        { text = "Is he any good?", next = "stormpike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormpike = {
      lines = {
        { id = "sp_default", text = "He's insufferable, and the best reader of ciphers north of Blackrock Spire. He calls me an old bookworm, and he's not wrong." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    climb = {
      lines = {
        { id = "cl_default", text = "Look at me. These bones wouldn't survive the climb, and the ogres would use what's left for a bookmark." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Could you? Then please don't read anything aloud. Their mages weave spells into the very ink, and I'd like to keep my eyebrows." },
      },
      choices = { { text = "No promises.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then tell me, did anyone carry books out of the north? Anyone at all?" },
      },
      choices = {
        { text = "Only what we could carry.", next = "BACK", fx = { affinity = 2 } },
        { text = "We carried children, not books.", next = "refugee_children" },
      },
    },
    refugee_children = {
      lines = {
        { id = "rc_default", text = "...Yes, of course you did. Forgive an old man his priorities; the books can wait, as they always have." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I gather what Alterac left behind, for Milton and the Royal Library. Before that I read, and I still do.", next = "grilek" } },
    advice = { { id = "tp_ad", text = "Wash your hands before you touch a book, and after you touch an ogre. Ideally twice." } },
    seven_kingdoms = { { id = "tp_seven", text = "Seven, until Alterac sold itself to the Horde and stopped being one. The books remember, though the ogres are working on that." } },
    _none = { { id = "tp_none", text = "Not in anything I've saved. Which isn't to say it isn't in something I haven't." } },
  },
}

P:NPC {
  key = "anderson", id = TODO_NPC("Innkeeper Anderson"), name = "Innkeeper Anderson",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "southshore" }, temper = { "steady" }, values = { "practical" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Shut the door, the rain gets in. Is it a bed, food or both? Both, by the look of you." },
    { id = "g_home", when = { homeInn = { "Southshore" } }, text = "Your room's dry, mostly, though the corner leaks. All the corners leak, if I'm honest." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Up against the Syndicate, were you, or the ogres? Sit down and have some fish stew; it's always fish stew, this being a fishing town." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Anderson's the name, and I keep the inn: fishermen, soldiers, and a lieutenant who's been sitting in that chair since last spring." },
        { id = "h_bilger", when = { heardLine = "bilger.h_default" },
          text = "Bilger told you he was a paladin? He was, and a good one, folk here say. I keep the cellar unlocked for him, because somebody should be kind to him." },
        { id = "h_chair", when = { metBefore = true }, text = "The lieutenant asked for his usual, and I didn't have to ask what. That's either a good inn or a sad story, or both, maybe." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Fishermen come in at this hour smelling of the bay, so I keep the windows open, out of habit more than anything." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "Up from the north? There's a bed for you, and you can pay when you can; Redpath would have my hide if I turned you away." },
      },
      again = {
        { id = "h_again", text = "Anything else? The stew's hot and the chairs are dry, mostly." },
        { id = "h_again2", text = "Go on. I'm only wiping the same mug." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "Any news from the road?", next = "news" },
        { text = "Just resting.", next = "END" },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Fishermen, Redpath's guards off duty, the lieutenant in his chair, and Bilger down in the cellar. They all pay, though Bilger pays in brew." },
      },
      choices = {
        { text = "What's the lieutenant's usual?", next = "farren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farren = {
      lines = {
        { id = "fa_default", text = "Ale, and a seat facing the door, in case it's a messenger from Stormwind. It never is, but I bring the ale anyway." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = {
        { id = "nw_default", text = "Horses going missing from the stables again. Some say the Syndicate, some say Tarren Mill, some say lions down from Alterac. Probably all three." },
      },
      choices = {
        { text = "The Forsaken steal horses?", next = "news_horses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_horses = {
      lines = {
        { id = "nh_default", text = "They don't eat, so I can't think what for. Riding, maybe, or just to take something of ours, which would be like them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn. Somebody has to, and the fish stew won't make itself." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots by the bed. In Southshore you never know which night you'll need them in a hurry." } },
    _none = { { id = "tp_none", text = "Ask the Marshal. He knows everyone in town by name and most of their grandparents." } },
  },
}
