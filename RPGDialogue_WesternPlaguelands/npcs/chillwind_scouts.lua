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
    first = "Flint Shadowmore of SI:7 sat with his back to the wall and his eyes on the road, and asked me more questions than I asked him. Three of his agents went east after someone called the Blightcaller and didn't come back.",
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
    hello = {
      lines = {
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
        { id = "h_again2", text = "Go on. Quietly." },
      },
      choices = {
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
        { text = "Their families deserve the truth, whatever it is.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell the families they died heroes, whatever happened.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "Working with the Forsaken against the Scourge is wise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Stormwind's right. The Dawn should pick a side.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Then go without leave. He killed your people.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Wait for orders. A lone hunt gets agents killed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
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
    first = "Alexia Ironknife is a dwarf resting at Chillwind before she heads for Hearthglen, after a rumour about a mage the Scarlet Crusade killed. She didn't have much time to talk and talked anyway.",
    third = "{name} met Alexia Ironknife, a dwarf at Chillwind Camp chasing a rumour about the Scarlet Crusade's murdered mage.",
  },

  greetings = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alexia Ironknife. I've heard that before the Scarlet Crusade went mad, they had a mage workin' for them, makin' bows an' guns better than any soldier had a right tae carry. The Crusade killed him before any of it left the workshop, an' I mean tae find out why." },
      },
      again = { { id = "h_again", text = "Anythin' else? I've a long walk ahead." } },
      choices = {
        { text = "Why would the Crusade kill their own mage?", next = "why" },
        { text = "What do you want with the weapons?", next = "want" },
        { text = "Hearthglen is crawling with Scarlets.", next = "hearthglen" },
        { text = "What do you make of Chillwind Camp?", next = "camp" },
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
        { text = "Fear like that rots an order from inside.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some caution about mages is warranted, after Dalaran's mistakes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    want = {
      big = true,
      lines = { { id = "wa_default", text = "Tae see them, first, because I've an eye for a well-made thing. After that, I'd sooner they were in honest hands than rustin' in some Scarlet vault, or worse, pointed at us." } },
      choices = {
        { text = "Honest hands like yours, I take it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "If you find them, give them to the Dawn.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
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
