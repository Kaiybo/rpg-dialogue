-- Chillwind Camp's quiet visitors: Flint Shadowmore of SI:7, hunting the man who killed his agents, and
-- Alexia Ironknife, resting on her way to Hearthglen to chase a dead mage's secret. Voice: bibles/chillwind_scouts.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "flint", id = TODO_NPC("Flint Shadowmore"), name = "Flint Shadowmore", title = "SI:7",
  bible = "bibles/chillwind_scouts.md", role = "soldier", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "sharp", "dry" }, values = { "loyal", "careful" },
  notices = { "class", "stealth", "race" },

  impression = {
    first = "Three of his agents went after the Blightcaller and never returned.",
    third = "{name} met Flint Shadowmore, an SI:7 agent at Chillwind Camp hunting the one who killed his operatives.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice down and your back to the camp, if you would. I'd rather the whole of Chillwind didn't know my business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; I remember faces, and yours is one of the few I don't mind seeing twice." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Eastern Plagues") }, text = "Marris Stead, in the Eastern Plaguelands, west of the road. Bring me what's left of my people, and watch the treeline." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from your own lines, and I'm not the one you want to be seen talking to. Make it quick." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE", faction = "Alliance" },
      text = "One of ours, or near enough, by the way you walk. Don't bother with the shadows here; I saw you coming from the gate." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You can come out. The shadow by the tent post is mine, and I'm not sharing it." },
  },

  start = "hello",
  nodes = {
    dd_araj = {
      lines = {
        { id = "dd_araj_1",
          text = "We have a file on everyone, {class}, and his was a long one. He ran things at Andorhal for the Cult of the Damned, and a good deal of what my missing agents were chasing went through his hands first." },
        { id = "dd_araj_2",
          text = "With him gone, the Blightcaller's friends lose a link in the chain. It won't bring my people back, but it'll make the next ones safer, and that's the only kind of justice this job offers." },
      },
      choices = {
        { text = "Then put my name in his file, too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Leave me out of SI:7's files, please.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Flint.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_araj", tags = { "news" }, when = { killed = { name = "Araj" } },
          text = "So Araj the Summoner is dust, and I'm told you were there when he went. SI:7 has a file on that lich three fingers thick, and I'll enjoy writing the last page of it." },
        { id = "h_default", key = true,
          text = "Flint Shadowmore, SI:7, here at the King's pleasure, or the regent's, anyway. Somebody out in these lands has been killing my agents, and they call him the Blightcaller, and that's all I know about him so far." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("Flint Shadowmore"), metBefore = false },
          text = "So they sent you to me. Good; I need someone the Blightcaller hasn't seen yet, and I'd wager he hasn't seen you." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Eastern Plagues") },
          text = "Three of mine, Rutger, Fredo and Turyen, went east to the Marris Stead after word of the Blightcaller, and none of them reported back. I need to know what happened to them, and I need someone who can come back and tell me." },
        { id = "h_back", tags = { "news" }, when = { questDone = TODO_QUEST("The Eastern Plagues") },
          text = "You've brought their insignias, all three. Then they're gone, and the Blightcaller is Nathanos Marris, the old ranger lord, and Stormwind needs to hear it from someone who's been to that farm." },
        { id = "h_after", when = { questDone = TODO_QUEST("The Blightcaller Cometh") },
          text = "Lord Bolvar has the report, and now the name's in the right ledgers. It doesn't bring my three back, but it means they died for something." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A Forsaken in an Alliance camp. Either you're very brave or very lost, and either way I'll be watching your hands." },
      },
      again = {
        { id = "h_again", text = "Anything else? Talk while I watch the road." },
        { id = "h_again2", text = "Go on, but keep your voice down." },
      },
      choices = {
        { text = "You had a file on Araj?", next = "dd_araj", when = { killed = { name = "Araj" } } },
        { text = "Who is the Blightcaller?", next = "blight" },
        { text = "Tell me about your missing agents.", next = "agents" },
        { text = "What's SI:7 doing this far north?", next = "si7" },
        { text = "What do you make of Chillwind Camp?", next = "camp" },
        { text = "What did you learn about Nathanos Marris?", next = "nathanos", when = { questDone = TODO_QUEST("The Eastern Plagues") } },
        { text = "Is there work for one of ours?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    blight = {
      lines = { { id = "bl_default", text = "A Forsaken, by all accounts, and a deadly archer, with dogs that run with him through the Eastern Plaguelands. He kills Scourge, which is fine, and he kills Alliance, which isn't, and he seems to enjoy the second more." } },
      choices = {
        { text = "Why does he hate the Alliance so much?", next = "blight_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blight_why = {
      lines = { { id = "bw_default", text = "That's what I want to know. Somebody who hates that personally usually has a reason, and the reason is usually a name, and once I have a name I have a man." } },
      choices = {
        { text = "Then I'll help you find that name.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    agents = {
      lines = { { id = "ag_default", text = "Rutger was the best tracker I ever trained, Fredo could talk his way past a dreadlord, and Turyen was new and keen and should never have gone. I sent them, so it's on my ledger, not theirs." } },
      choices = {
        { text = "Do you think they're dead?", next = "agents_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    agents_dead = {
      big = true,
      lines = { { id = "ad_default", text = "In this place, after this long, yes. What I want now is their insignias, so their families get something more than silence, and so the Blightcaller knows we came looking." } },
      choices = {
        { text = "Their families deserve the truth, whatever it is.", next = "BACK", reply = "They do, and I'll give it to them plainly, however it reads. Bring me those insignias and I'll write the letters myself.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell the families they died heroes, whatever happened.", next = "BACK", reply = "That's kind, and it's what most commanders do. But I've read too many of those letters to send another lie.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    si7 = {
      lines = { { id = "si_default", text = "Stormwind likes to know what's moving on its borders, and in the Plaguelands everything's moving. The Scourge, the Crusade, the Forsaken: somebody has to keep count, and the Dawn's too busy fighting to write it all down." } },
      choices = {
        { text = "Does Stormwind trust the Argent Dawn?", next = "si7_dawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    si7_dawn = {
      big = true,
      lines = { { id = "sd_default", text = "Stormwind trusts nobody who sits down with the Forsaken, and the Dawn does, at the Bulwark, every day. Personally, I think they're the only sensible people in these lands, but I'm not paid for my opinions." } },
      choices = {
        { text = "Working with the Forsaken against the Scourge is wise.", next = "BACK", reply = "It is, and I'll thank you not to repeat that in Stormwind. Bolvar has enough people telling him what he wants to hear.", fx = { align = { order = -1 } } },
        { text = "Stormwind's right. The Dawn should pick a side.", next = "BACK", reply = "Stormwind would agree with you, and the Scourge would thank you both. The Dawn's the only thing holding this country together.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },

    camp = {
      lines = { { id = "cp_default", text = "Valorfist runs a tight camp, Weldon Barov's an odd one to have around, and the High Priestess is the only one who doesn't ask what I'm writing. It's as safe as anywhere in the Plaguelands, which is to say not very." } },
      choices = {
        { text = "What's odd about Weldon Barov?", next = "camp_barov" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_barov = {
      lines = { { id = "cb_default", text = "His family sold Caer Darrow out from under everyone, and he's here asking the Alliance to help him kill his own brother for the estate. I keep a page on him, and it's getting long." } },
      choices = {
        { text = "Noted. I'll watch him too.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nathanos = {
      lines = { { id = "na_default", text = "Nathanos Marris was a human of Lordaeron, trained as a ranger by the high elves, and they made him a ranger lord, which they'd never done for a human before. He died in the plague and came back serving the Banshee Queen, and now he hunts us from his family's farm." } },
      choices = {
        { text = "What will Stormwind do about him?", next = "nathanos_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nathanos_do = {
      big = true,
      lines = { { id = "nd_default", text = "Write it down, argue about it, and do nothing until he kills someone important. I'd go after him myself tonight if Bolvar gave me leave, and he won't." } },
      choices = {
        { text = "Then go without leave. He killed your people.", next = "BACK", reply = "Don't tempt me, {class}, because I've thought about it every night this week. I'll go when the orders come, and not a day before.", fx = { align = { order = -1 } } },
        { text = "Wait for orders. A lone hunt gets agents killed.", next = "BACK", reply = "That's the sensible answer, and I hate it. Keep saying it, so I keep listening.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = { { id = "xr_default", text = "Always, but SI:7 doesn't hand out work to whoever asks nicely, {class}. Do what I ask at the Marris Stead, come back alive, and we'll see who in Stormwind wants to know your name." } },
      choices = {
        { text = "I'll come back alive. Count on it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind born, SI:7 trained, and sent north because I'm good at finding people. Nobody said anything about finding them dead." } },
    argent_dawn = { { id = "tp_ad", text = "Honest, stubborn, and willing to sit at the same fire as the Forsaken. I respect two of those three." } },
    advice = { { id = "tp_adv", text = "Never take the road twice the same way in the Plaguelands, because something's always watching it." } },
    _none = { { id = "tp_none", text = "Not my department. Ask Valorfist; he likes to be asked things." } },
  },
}

P:NPC {
  key = "alexia_ironknife", id = TODO_NPC("Alexia Ironknife"), name = "Alexia Ironknife",
  bible = "bibles/chillwind_scouts.md", role = "citizen", tier = "service",
  communities = { "chillwind_camp" }, temper = { "brisk", "wry" }, values = { "curious", "practical" },
  notices = { "class", "craft" },

  impression = {
    first = "She had no time to talk and talked anyway.",
    third = "{name} met Alexia Ironknife, a dwarf at Chillwind Camp chasing a rumour about the Scarlet Crusade's murdered mage.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Och, it's yerself! I'll take a wee bit longer off my feet if it means a chat wi' ye before Hearthglen." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Ye again. I'm only restin' my feet, and I'd rather they did it in peace, so make it short." },
    { id = "g_default", text = "Haven't got long, {class}; I'm only here tae rest my feet before Hearthglen. Still, sit if ye like." },
    { id = "g_back", when = { metBefore = true }, text = "Still here, aye. My feet had more complaints than I thought." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, wi' a bow that's seen use. Ye'll want tae hear what I'm after, then." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! If ye ever see a Scarlet gun that looks too good for them, I'd like tae hear about it." },
  },

  start = "hello",
  nodes = {

    ai_rumour = {
      lines = { { id = "air_1", text = "A Scarlet deserter in a Southshore taproom, three ales in an' weepin' about the things he'd seen at Hearthglen. He said the mage's workshop was locked an' sealed the day they hanged him, an' nobody's been let in since." } },
      choices = {
        { text = "A deserter's word isn't worth much.", next = "ai_rumour2" },
        { text = "I'm a mage. Enchanting a bow isn't simple work.", next = "ai_magecraft", when = { class = "MAGE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ai_rumour2 = {
      lines = { { id = "air2_1", text = "Normally I'd agree wi' ye, but he drew me the workshop on a napkin, door an' window an' all, an' a liar doesnae draw that steady. Besides, Weldon Barov in the camp here says his family heard the same tale years back." } },
      choices = {
        { text = "Weldon Barov trades in rumours, I hear.", next = "BACK", reply = "Aye, an' in deeds an' land an' anythin' else wi' a Barov name on it. Mind him, an' mind his brother at the Bulwark more." },
        { text = "Then the workshop's worth a look.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ai_magecraft = {
      lines = { { id = "aim_1", text = "So I'm told, an' that's half why the tale caught me. A mage who could put a charm in a bowstring that holds through a winter's damp would be worth more than a dozen Scarlet captains, an' they hanged him like a horse thief." } },
      choices = {
        { text = "If the charms held, his notes will be there too.", next = "BACK", reply = "That's my hope, {class}. I cannae read them, but I know folk in Ironforge who'd pay tae try." },
        { text = "Something else.", next = "BACK" },
      },
    },
    ai_trade = {
      lines = { { id = "ait_1", text = "Ha! Ye've a sharp eye. I'm no' a soldier, I'm a dealer in fine things, bows an' blades an' the odd clockwork toy, an' I go where the rumours of good craft take me." } },
      choices = {
        { text = "Does Valorfist mind a trader in his camp?", next = "ai_trade2" },
        { text = "Dealers usually stay where it's safe.", next = "ai_trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ai_trade2 = {
      lines = { { id = "ait2_1", text = "Valorfist minds anybody who isnae holdin' a sword the right way round, so I keep out o' his sight. The gryphon master, Bibilfaz, is better company, an' he'll fly ye tae Ironforge if yer boots give out like mine." } },
      choices = {
        { text = "I'll keep Bibilfaz in mind.", next = "BACK" },
        { text = "Your boots will carry you. Dwarves don't quit.", next = "BACK", reply = "No' often, an' never wi' a prize at the end o' the road.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_scarlet = {
      lines = {
        { id = "dd_scarlet_1",
          text = "Aye, and the Crusade will notice, too, so mind yer back on the road home. They hang their dead men's names on the chapel door at Hearthglen and swear on every one of them." },
        { id = "dd_scarlet_2",
          text = "Did ye see anythin' of a workshop while ye were at it, or a smithy with fancy bows on the rack? That's what I'm after, an' I'd buy ye a drink for a straight answer." },
      },
      choices = {
        { text = "Nothing like that, sorry. Just soldiers.", next = "BACK" },
        { text = "They're madmen. Every one of them deserved it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "They were Lordaeron's people once. I took no joy in it.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_scarlet", when = { killed = { name = "Scarlet", min = 25 } },
          text = "Word at the fire is ye've been thinnin' out the Scarlets round Hearthglen. That's a road I've got to walk soon, lass or lad, so I'll not complain about fewer crusaders on it." },
        { id = "h_default", key = true,
          text = "Alexia Ironknife. I've heard that before the Scarlet Crusade went mad, they had a mage workin' for them, makin' bows an' guns better than any soldier had a right tae carry. The Crusade killed him before any of it left the workshop, an' I mean tae find out why." },
      },
      again = { { id = "h_again", text = "Anythin' else? I've a long walk ahead." } },
      choices = {
        { text = "I've cut a path through the Scarlets near Hearthglen.", next = "dd_scarlet", when = { killed = { name = "Scarlet", min = 25 } } },
        { text = "Why would the Crusade kill their own mage?", next = "why" },
        { text = "What do you want with the weapons?", next = "want" },
        { text = "Hearthglen is crawling with Scarlets.", next = "hearthglen" },
        { text = "What do you make of Chillwind Camp?", next = "camp" },
        { text = "Who told you about this murdered mage?", next = "ai_rumour" },
        { text = "You don't walk like a soldier.", next = "ai_trade" },
        { text = "Safe travels, Alexia.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wy_default", text = "Maybe tae keep the secret, or maybe because they trust the arcane about as far as they can throw it, which these days isnae far. Either way, they'd sooner have a dead mage than a living one." } },
      choices = {
        { text = "Which do you think it was?", next = "why_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Fear, I'd say. The Crusade's afraid of everythin' they cannae burn, an' a man who can make a better bow wi' a few words is a man they cannae control." } },
      choices = {
        { text = "Fear like that rots an order from inside.", next = "BACK", reply = "Aye, it does, an' I've watched it happen tae better orders than theirs. Next they'll be burnin' their own cooks for stirrin' the pot wrong.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some caution about mages is warranted, after Dalaran's mistakes.", next = "BACK", reply = "Mebbe so, after what Dalaran let loose. But there's caution an' there's burnin' folk, an' the Crusade forgot the difference.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    want = {
      big = true,
      lines = { { id = "wa_default", text = "Tae see them, first, because I've an eye for a well-made thing. After that, I'd sooner they were in honest hands than rustin' in some Scarlet vault, or worse, pointed at us." } },
      choices = {
        { text = "Honest hands like yours, I take it.", next = "BACK", reply = "Ha! Aye, honest enough, an' I'd treat them better than any Scarlet ever did. But I'll not argue if the Dawn wants them.", fx = { align = { honor = -1 } } },
        { text = "If you find them, give them to the Dawn.", next = "BACK", reply = "Fair enough, an' it's the proper thing. Just let me have a wee look first, eh?", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hearthglen = {
      lines = { { id = "hg_default", text = "Aye, it is, an' I'll be quiet an' careful an' mostly in the hedges. If I'm no' back in a fortnight, ye might ask Valorfist tae send someone, though I doubt he'll bother." } },
      choices = {
        { text = "Take care. I'll ask after you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = { { id = "cp_default", text = "A good wall, a hot meal, an' a lot o' folk who look at the north road the way ye'd look at a sleepin' bear. Valorfist barely noticed me, which suits me fine." } },
      choices = {
        { text = "Quiet suits a hunter of rumours.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge born, an' never could leave a rumour alone. My mother said it'd get me killed, an' it hasnae yet." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots wi' good steel an' bad sense. I'd like tae take the one off them an' leave them the other." } },
    _none = { { id = "tp_none", text = "No' my concern, an' I've enough of those. Ask somebody wi' more time." } },
  },
}
