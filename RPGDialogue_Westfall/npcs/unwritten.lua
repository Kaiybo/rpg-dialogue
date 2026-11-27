-- People's Militia protectors with no conversation yet: Protector Dorana (patrols to Saldean's
-- Farm), Protector Korelor (patrols to the Molsen farm), Protector Deni (by the mill on Sentinel
-- Hill) and Protector Leick (by the lumber pile at the foot of the hill).
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Protector Dorana: patrols the road from Sentinel Hill to Saldean's Farm.
P:NPC {
  key = "wfl_protector_dorana", id = TODO_NPC("Protector Dorana"), name = "Protector Dorana", title = "The People's Militia", gender = "female",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "brisk", "stern" }, values = { "dutiful", "practical" },
  notices = { "watch", "travel" },
  impression = {
    first = "She walks the Saldean road and hates the scarecrows on it.",
    third = "{name} met Protector Dorana of the People's Militia, who patrols the road to Saldean's Farm.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you still standing, {class}. Walk with me a while; the road's shorter beside someone I trust." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Walk your own way, {class}. I'd not trust you at my back on this road." },
    { id = "g_default", text = "Keep walking if you're going my way, {class}. I don't stop on this road, and neither should you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Walk with me a stretch, then, but keep your eyes on the fields." },
  },
  notice = {
    { id = "n_low", cat = "travel", when = { maxLevel = 12 },
      text = "You're a bit green for Westfall. Stay on the road between the farms and leave the Defias camps to the militia." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Protector Dorana, People's Militia. I walk from Sentinel Hill to Saldean's Farm and back, all day long, so the Saldeans know somebody's watching their road.", fx = { learn = { "people_militia" } } } },
      again = {
        { id = "h_again", text = "What else? Talk while we walk." },
        { id = "h_again2", text = "Go on, I'm listening, but I'm not stopping." },
      },
      choices = {
        { text = "A patrol should keep to its route, even when it's dull.", next = "BACK", reply = "That's how the Saldeans sleep at night. I keep my route, every hour of it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cut the route short; nobody checks the far fields.", next = "BACK", reply = "The Defias do, friend. They check every field I skip.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What's the danger on this road?", next = "danger" },
        { text = "How are the Saldeans holding up?", next = "saldeans" },
        { text = "Those scarecrows give me the creeps.", next = "scarecrows" },
        { text = "What happened to your farm?", next = "y_farm" },
        { text = "Do you know any Defias by name?", next = "y_names" },
        { text = "Who else walks your road?", next = "y_road" },
        { text = "Safe patrol, Protector.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Defias footpads, gnolls up from the coast, and the odd hungry coyote, though the coyotes at least don't steal. The Brotherhood likes to hit lone carts on this stretch, which is why I walk it.", fx = { learn = { "defias" } } } },
      choices = {
        { text = "The Defias were farmers once, like you.", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "f_default", text = "Some were, and some I grew up with, and that's the part that stings. They chose the mask, though, and they rob the folk who stayed and kept their hands clean." } },
      choices = {
        { text = "They had no choice when the crown abandoned them.", next = "BACK", reply = "Everyone had a choice. I had the same one, and I picked up a spear instead of a mask.", fx = { align = { order = -1 } } },
        { text = "Then they get no mercy from me.", next = "BACK", reply = "Good, because they'll show you none. Still, try not to enjoy it.", fx = { align = { order = 1 } } },
      },
    },
    saldeans = {
      lines = { { id = "s_default", text = "Farmer Saldean's stubborn as an old mule, and Salma's twice as stubborn, so they're holding. They've lost workers to the Brotherhood and crops to the gnolls, but they've not lost their farm, and they mean to keep it." } },
      choices = { { text = "Stubbornness is a virtue out here. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scarecrows = {
      lines = { { id = "sc_default", text = "They should, because they walk. The Defias put some kind of machinery or magic in them, and they swing their scythes at anyone who gets close, so I knock one down every time I pass and there's always another.", fx = { learn = { "harvest_watchers" } } } },
      choices = { { text = "I'll knock down a few myself. Something else.", next = "BACK" } },
    },
    y_farm = {
      lines = {
        { id = "y_farm_d", text = "The Brotherhood came at night and set the barn alight with my father's mule inside. My father tried to save the mule, and the roof came in. I joined the militia the next morning." },
        { id = "y_farm_hu", when = { race = "Human" }, text = "Burned, at night, with my father inside trying to save the mule. You'll have heard stories like it if you're from these lands. I joined the militia the next morning." },
      },
      choices = { { text = "I'm sorry.", next = "BACK" } },
    },
    y_names = {
      lines = { { id = "y_names_d", text = "One. Jory Harkness, who I danced with at the harvest fair when we were fifteen. He was there the night the barn burned. I've never told Stoutmantle. If I see Jory on this road, I don't know what I'll do." } },
      choices = {
        { text = "Bring him in. Let the law judge him.", next = "y_jory" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_jory = {
      lines = { { id = "y_jory_d", text = "The law out here is a rope on Sentinel Hill. My spear would be quicker. Should a protector bring him in, or settle it herself?" } },
      choices = {
        { text = "Bring him in. That's what you swore.", next = "BACK", reply = "Aye. I'll try to remember that if I see his face.", fx = { align = { order = 1 } } },
        { text = "Settle it. It's your father's blood.", next = "BACK", reply = "That's what I tell myself at night.", fx = { align = { order = -1 } } },
      },
    },
    y_road = {
      lines = { { id = "y_road_d", text = "Merchants who are lost, adventurers who are bored, and the Furlbrow family's dog, which follows me halfway every morning and then goes home. The dog's the only one I trust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I worked a farm south of here till the Brotherhood burned it. Now I guard other people's farms, which is better than nothing." } },
    saldean_farm = { { id = "y_tp_sf", text = "Saldean's farm is the last one on my road still standing. I mean to keep it that way." } },
    gryan_stoutmantle = { { id = "y_tp_gs", text = "Gryan built the militia from nothing. I'd follow him into Moonbrook if he asked." } },
    scarecrows = { { id = "y_tp_sc", text = "The scarecrows walk. Don't let anyone tell you they don't." } },
    _none = { { id = "tp_none", text = "No idea. Ask at the tower; Stoutmantle knows more than I do, or likes to think he does." } },
  },
}

-- Protector Korelor: patrols the road between Sentinel Hill and the Molsen farm.
P:NPC {
  key = "wfl_protector_korelor", id = TODO_NPC("Protector Korelor"), name = "Protector Korelor", title = "The People's Militia", gender = "male",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "gruff", "weary" }, values = { "dutiful" },
  notices = { "watch", "kit" },
  impression = {
    first = "He walks to an empty farm and back, every single day.",
    third = "{name} met Protector Korelor of the People's Militia, who patrols the road to the Molsen farm.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hail, {class}. You've done good work out past the Molsen fence, and I've not forgotten it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Say what you need and move on. I've a long road and no patience left for you." },
    { id = "g_default", text = "Hold up, {class}. This road runs out to the Molsen place, and there's nothing out there but trouble now." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my road, are you? Fine, but don't wander past the Molsen fence without good reason." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.4 } },
      text = "You're bleeding. Get yourself up to the hill and see someone before you fall over in the dust." },
  },
  start = "hello",
  nodes = {
    d6_gryan3 = {
      lines = { { id = "d6_gryan3_a", text = "He was a soldier of Stormwind, and a good one, until he came home and found Westfall starving and the king's men gone. He wrote to the city for help, and when nobody answered, he put on his old armour and started calling the farmers to the hill." } },
      choices = {
        { text = "A soldier who wouldn't stop serving.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    d6_kit = {
      lines = { { id = "d6_kit_a", text = "A spear, a waterskin and a loaf of bread I never eat, in case I find someone at the farm who needs it more. The spear's been used twice, and the bread's been given away a dozen times, which tells you what this road's really like." } },
      choices = {
        { text = "Who did you give the bread to?", next = "d6_kit2" },
        { text = "I could scout the farm ahead of you.", next = "d6_kit2", when = { class = "ROGUE" } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d6_kit2 = {
      lines = {
        { id = "d6_kit2_a", text = "Refugees, mostly, walking east toward the city with everything they own on their backs. Once a Defias lad, no older than fifteen, who'd been left behind by his gang, and I gave it to him and told him to go home, and I've no idea if he listened." },
        { id = "d6_kit2_rogue", when = { class = "ROGUE" }, text = "You could, and you'd be quieter about it than I am. If you see anyone in the barn, look for children before you look for blades, because the refugees hide there too, and I'd not want a frightened family taken for a Defias camp." },
      },
      choices = {
        { text = "You did right by that lad.", next = "BACK" },
        { text = "Something else, Korelor.", next = "BACK" },
      },
    },
    d6_gryan = {
      lines = { { id = "d6_gryan_a", text = "To keep the roads open and the farms watched, with half the men he needs and none of the pay. He doesn't ask anything of us he wouldn't do himself, and I've seen him walk a night patrol after a full day in the tower." } },
      choices = {
        { text = "Do the men follow him willingly?", next = "d6_gryan2" },
        { text = "Stormwind should be paying you.", next = "d6_gryan2" },
        { text = "Let's leave it there.", next = "BACK" },
      },
    },
    d6_gryan2 = {
      lines = { { id = "d6_gryan2_a", text = "Every one of us, because he stayed when the king's men left. Stormwind ought to pay us, aye, but we stopped waiting for Stormwind a long while back, and we'd sooner have Stoutmantle than a purse." } },
      choices = {
        { text = "Then the hill is in good hands.", next = "BACK", fx = { learn = { "people_militia" } } },
        { text = "What did Stoutmantle do before the militia?", next = "d6_gryan3" },
        { text = "Something else I'd ask.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "Protector Korelor, People's Militia. I walk the road out to the Molsen farm and back, and every day I hope I'll find somebody there who belongs." } },
      again = {
        { id = "h_again", text = "Anything else? Ask, then I've got to keep moving." },
        { id = "h_again2", text = "Go on. The road isn't going anywhere." },
      },
      choices = {
        { text = "A protector stands by his oath, even far from Stormwind's eyes.", next = "BACK", reply = "Aye, though some days I wonder who's watching. It doesn't matter; I'm here.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Out here, an oath is only worth what someone enforces.", next = "BACK", reply = "Nobody enforces mine but me, friend. That's rather the point of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What happened to the Molsens?", next = "molsens" },
        { text = "Why walk to an empty farm?", next = "why" },
        { text = "Did you know the Molsens well?", next = "xknew" },
        { text = "Have you ever found anyone at the farm?", next = "xfound" },
        { text = "What do you see on your walks?", next = "xsee" },
        { text = "I'm a hunter. I could track who's out there.", next = "BACK", when = { class = "HUNTER" }, reply = "Would you? Then follow the road out and tell me what you find. I'd sleep better knowing whose tracks those are." },
        { text = "What do you carry with you on the road?", next = "d6_kit" },
        { text = "What does Stoutmantle ask of the militia?", next = "d6_gryan" },
        { text = "Safe walking, Korelor.", next = "END" },
      },
    },
    molsens = {
      lines = { { id = "m_default", text = "They left when the Brotherhood made the farm too dangerous to work, and the Defias moved into the fields after them. Now there's masked men in the barn and harvest golems in the crops, and the Molsens are somewhere in Stormwind, poorer than they ever were." } },
      choices = {
        { text = "Could the militia take it back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "With what, a dozen farmers and a few spears? Stoutmantle's got us stretched thin over half of Westfall, and we hold what we can. If you want to clear the Molsen fields, I'll not stop you, and I'll be glad of it." } },
      choices = {
        { text = "Stormwind should send soldiers to help.", next = "BACK", reply = "Stormwind should do a lot of things, and Stormwind doesn't. That's why there's a militia.", fx = { align = { order = 1 } } },
        { text = "Westfall doesn't need the crown. It has you.", next = "BACK", reply = "Kind words, but a few more spears wouldn't hurt. Still, we'll manage.", fx = { align = { order = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because if the Brotherhood thinks nobody's watching, they'll push their camps right up to the hill. Every time I walk out there, I'm telling them we haven't given up, and they hate that." } },
      choices = { { text = "Then keep walking. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xknew = {
      lines = {
        { id = "xxknew_0", text = "Old Farmer Molsen hired me for the harvest when I was a lad. He paid fair and fed us well. Last I saw him, he was heading for Stormwind with his family and a wagon." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfound = {
      lines = {
        { id = "xxfound_0", text = "Twice. Once a family of refugees sheltering in the barn, and once a Defias scout who ran when he saw me. I let him go. Some say I should've chased him. What would you have done?" },
      },
      choices = {
        { text = "Chase him down. Scouts bring raids.", next = "BACK", reply = "Aye, maybe. Next time I'll have a horse and a friend.", fx = { align = { honor = -1 } } },
        { text = "You did right. Don't throw your life away.", next = "BACK", reply = "That's what I told myself. Glad to hear someone agree.", fx = { align = { honor = 1 } } },
      },
    },
    xsee = {
      lines = {
        { id = "xxsee_0", text = "Dust devils, crows, harvest golems wandering empty fields. Sometimes a candle in a window of an empty farmhouse, which I don't care to think about." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    molsen_farm = { { id = "tp_xmolsen_farm", text = "Empty now, but I walk out there anyway." } },
    defias = { { id = "tp_xdefias", text = "Bandits on our own land. I'll not forget that." } },
    background = { { id = "tp_bg", text = "Farmhand most of my life. Joined the militia when there weren't any farms left to work." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Gryan, up at the tower." } },
  },
}

-- Protector Deni: stands outside the mill on Sentinel Hill.
P:NPC {
  key = "wfl_protector_deni", id = TODO_NPC("Protector Deni"), name = "Protector Deni", title = "The People's Militia", gender = "female",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "warm", "watchful" }, values = { "family", "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "She guards the mill because it feeds the hill.",
    third = "{name} met Protector Deni of the People's Militia, who guards the mill on Sentinel Hill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you again! The mill's turning, the children are fed, and you're back, so it's a good day." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Say what you came to say. I've people behind me to guard, and I'd rather keep my eyes on the road." },
    { id = "g_default", text = "Welcome to Sentinel Hill, {class}. The mill's behind me, and so are the people who depend on it, so mind your manners." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The mill's still turning, which is something to be thankful for out here." },
  },
  start = "hello",
  nodes = {
    d6_grind = {
      lines = { { id = "d6_grind_a", text = "Whatever the farmers can save from the fields, which is mostly barley and a little wheat, and some weeks only acorns. We grind the acorns too, and the bread's bitter, but it's bread, and nobody on this hill has complained of it to my face." } },
      choices = {
        { text = "Does the hill have enough to eat?", next = "d6_grind2" },
        { text = "Do the priests on the hill help the hungry?", next = "d6_grind2", when = { class = "PRIEST" } },
        { text = "On to something else.", next = "BACK" },
      },
    },
    d6_grind2 = {
      lines = {
        { id = "d6_grind2_a", text = "Not enough, not yet, but nobody's starved since the militia started sharing out the flour. Salma Saldean feeds half the hill out of her own kitchen, and she'll feed you too if you look hungry, so don't look hungry unless you mean it." },
        { id = "d6_grind2_priest", when = { class = "PRIEST" }, text = "They pray with us, and they help carry the sacks, which matters more. If you've a blessing to spare, give it to the bread on the morning bake, because there are folk on this hill who'll eat nothing else that day." },
      },
      choices = {
        { text = "Then I'll not take bread I don't need.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Deni.", next = "BACK" },
      },
    },
    d6_return = {
      lines = { { id = "d6_return_a", text = "Every night I say I will, and every morning I look south and see the smoke. The Defias hold Moonbrook now, and they say the old mine under it is where they've built their real home, so the town I knew is only the roof over their heads." } },
      choices = {
        { text = "Then Moonbrook needs taking back.", next = "d6_return2" },
        { text = "What would you go back to?", next = "d6_return2" },
        { text = "Let's not dwell on Moonbrook.", next = "BACK" },
      },
    },
    d6_return2 = {
      lines = { { id = "d6_return2_a", text = "My father's mill, if it's standing, and his grave behind it, which I couldn't tend when we fled. If you ever go down there to drive them out, look for a mill with a blue door, and tell me whether the sails still turn." } },
      choices = {
        { text = "I'll look for the blue door.", next = "BACK", fx = { learn = { "moonbrook" } } },
        { text = "Something else, Protector.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "Protector Deni, People's Militia. I watch the mill, because what little grain Westfall still grows comes through it, and the Brotherhood would love to burn it." } },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on, ask. It's a quiet hour." },
      },
      choices = {
        { text = "A promise made to Westfall's families should never be broken.", next = "BACK", reply = "No, it shouldn't. Half the folk at this mill have been let down by Stormwind once already.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Promise the farmers anything; it keeps them working.", next = "BACK", reply = "They've had enough empty promises, friend. Not from me, and not at this mill.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why would the Defias burn a mill?", next = "burn" },
        { text = "How do the refugees here get by?", next = "refugees" },
        { text = "What was Moonbrook like before?", next = "xmoonbrook" },
        { text = "Has anyone tried to burn the mill?", next = "xtried" },
        { text = "How do you handle the long nights?", next = "xnights" },
        { text = "I'm a paladin. Can I help defend the mill?", next = "BACK", when = { class = "PALADIN" }, reply = "Help would be welcome. Walk the mill with me at dusk, and if you hear anything, give me a shout and a bit of Light." },
        { text = "What does the mill grind these days?", next = "d6_grind" },
        { text = "Would you ever go back to Moonbrook?", next = "d6_return" },
        { text = "Good day, Protector.", next = "END" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Because hungry people are easier to recruit, and Van Cleef knows it. Burn the mill and every family on this hill has to choose between starving and taking up the red mask.", fx = { learn = { "defias" } } } },
      choices = {
        { text = "Then the mill matters more than any wall.", next = "BACK", reply = "Exactly. Stoutmantle understood that before anyone, and that's why I'm here.", fx = { align = { light = 1 } } },
        { text = "Burn their camps first, then. Make them hungry.", next = "BACK", reply = "Some of the militia say that, and maybe they're right. I'll still guard the mill.", fx = { align = { light = -1 } } },
      },
    },
    refugees = {
      lines = { { id = "r_default", text = "Barely, but together, which counts for a lot. Families share their bread, the militia shares its watch, and Gryan Stoutmantle shares every coin he can scrape up, so nobody's left out in the cold." } },
      choices = {
        { text = "Who's in charge of the hill?", next = "gryan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryan = {
      lines = { { id = "gryan_default", text = "Gryan Stoutmantle, in the tower at the top of the hill. He fought for Stormwind once, and when Stormwind forgot Westfall, he didn't." } },
      choices = { { text = "I'll pay him a visit. Something else.", next = "BACK" } },
    },
    xmoonbrook = {
      lines = {
        { id = "xxmoonbrook_0", text = "A bright little town with a mill by the river and a market every week. My father ground flour for half of Westfall. Now it's the Brotherhood's town, and the mill wheel's still." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtried = {
      lines = {
        { id = "xxtried_0", text = "Twice. The first time we caught them with torches by the back door. The second time they came by the river, and we only noticed because the ducks went quiet." },
      },
      choices = {
        { text = "What happened to the ones you caught?", next = "xcaught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaught = {
      lines = {
        { id = "xxcaught_0", text = "Stoutmantle sent them to Stormwind for trial. Some of the militia wanted them hanged on the spot. I'm not sure who was right. What do you think?" },
      },
      choices = {
        { text = "Trial is right. We're not bandits ourselves.", next = "BACK", reply = "That's what Stoutmantle said, and I trust him.", fx = { align = { order = 1 } } },
        { text = "Hang them. Stormwind won't punish them properly.", next = "BACK", reply = "Some days I agree with you. Some days I don't.", fx = { align = { order = -1 } } },
      },
    },
    xnights = {
      lines = {
        { id = "xxnights_0", text = "I count the mill's sails as they turn, and I think of my father. He'd want me to keep it running for him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    moonbrook = { { id = "tp_xmoonbrook", text = "My home, before the Brotherhood came. I'll go back someday." } },
    gryan_stoutmantle = { { id = "tp_xgryan_stoutmantle", text = "The best man in Westfall. Without him, we'd have nothing." } },
    background = { { id = "tp_bg", text = "Grew up a miller's daughter in Moonbrook, before the Brotherhood came. Now I guard someone else's mill." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Try Stoutmantle, or the scouts." } },
  },
}

-- Protector Leick: stands by the lumber at the foot of Sentinel Hill.
P:NPC {
  key = "wfl_protector_leick", id = TODO_NPC("Protector Leick"), name = "Protector Leick", title = "The People's Militia", gender = "male",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "jovial", "wry" }, values = { "practical" },
  notices = { "craft", "watch" },
  impression = {
    first = "He guards a woodpile and jokes about it constantly.",
    third = "{name} met Protector Leick of the People's Militia, who guards the lumber at the foot of Sentinel Hill.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! The woodpile's still here, I'm proud to say, and so are you, which is better." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep away from my woodpile, and keep out of the way of the real soldiers." },
    { id = "g_default", text = "Afternoon, {class}. Welcome to the most important woodpile in all of Westfall, or so they tell me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The wood's still here, I'm proud to report." },
  },
  start = "hello",
  nodes = {
    d6_carp = {
      lines = { { id = "d6_carp_a", text = "Proud, quarrelsome and very good, the lot of us, and we argued about joints the way other folk argue about kings. Our old master could set a door so true it closed with a breath, and he'd tell you so every time you walked past it." } },
      choices = {
        { text = "What became of them?", next = "d6_carp2" },
        { text = "You miss the arguing more than the work.", next = "d6_carp2" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d6_carp2 = {
      lines = { { id = "d6_carp2_a", text = "Scattered, like everyone, to the city or the hill or the hedgerows in red masks. A couple joined the Brotherhood, which is the joke I can't make, because the Defias were stonemasons and carpenters first, cheated by Stormwind's nobles, and I can't say I never felt the same." } },
      choices = {
        { text = "Being cheated doesn't excuse what they've done.", next = "BACK", fx = { learn = { "stonemasons" } } },
        { text = "Something else, Leick.", next = "BACK" },
      },
    },
    d6_build = {
      lines = { { id = "d6_build_a", text = "A cradle, if you want the truth, for my sister's baby, who was born on this hill and sleeps in a crate. After that, a roof for the inn that doesn't leak, and after that I'd sleep for a week." } },
      choices = {
        { text = "A gnome could build you a lumber alarm.", next = "d6_build2", when = { race = "Gnome" } },
        { text = "Why not build the cradle now?", next = "d6_build2" },
        { text = "A cradle's a good first thing.", next = "d6_build2" },
      },
    },
    d6_build2 = {
      lines = {
        { id = "d6_build2_a", text = "Because every plank in this pile is owed to a wall, and Stoutmantle would be right to say so. I've been saving the offcuts, though, a bit at a time, and I think by midwinter I'll have enough for a small one, if nobody burns them first." },
        { id = "d6_build2_gnome", when = { race = "Gnome" }, text = "Would it go off when a Defias touched the wood, or when I did? Because if it's when I did, I'd be deaf by supper. Make it ring a bell instead of exploding, and I'll take it, and I'll stop joking about the woodpile for a week." },
      },
      choices = {
        { text = "I hope that cradle gets built.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "Protector Leick, People's Militia, and guardian of the lumber. Laugh if you like, but every wall and roof on this hill came out of this pile." } },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Ask away. The wood doesn't talk back much." },
      },
      choices = {
        { text = "Guarding wood is still a duty, and it deserves doing right.", next = "BACK", reply = "Thank you! Somebody finally said it. Without this wood, there's no palisade.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'd help myself to a few planks; nobody would notice.", next = "BACK", reply = "Gryan would, friend. He counts them, and I swear he counts them twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why guard lumber?", next = "lumber" },
        { text = "Where does the wood come from?", next = "source" },
        { text = "What's your best woodpile joke?", next = "xjoke" },
        { text = "Do you miss carpentry?", next = "xmiss" },
        { text = "Has the woodpile ever been attacked?", next = "xattack" },
        { text = "A dwarf could teach you a thing about stacking.", next = "BACK", when = { race = "Dwarf" }, reply = "Ha! Then show me. I've been stacking it the Moonbrook way, and Stoutmantle says it leans." },
        { text = "What were the carpenters of Moonbrook like?", next = "d6_carp" },
        { text = "What would you build first, if peace came?", next = "d6_build" },
        { text = "Good luck with the pile.", next = "END" },
      },
    },
    lumber = {
      lines = { { id = "l_default", text = "Because the Defias need wood too, for their ships and their stockades down in the Deadmines. Every plank they steal from us is one less roof over a family's head and one more mast on Van Cleef's boat.", fx = { learn = { "deadmines" } } } },
      choices = {
        { text = "They have a ship?", next = "ship" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship = {
      lines = { { id = "s_default", text = "That's the rumour, a great ship hidden deep in the mines, though nobody who's seen it has come back to describe it properly. Sounds like madness to me, but the Brotherhood's full of stonemasons with grudges and time on their hands." } },
      choices = {
        { text = "The masons were cheated. I'd be angry too.", next = "BACK", reply = "Aye, and so would I, but I wouldn't build a pirate ship about it.", fx = { align = { order = -1 } } },
        { text = "A grudge is no excuse for banditry.", next = "BACK", reply = "Agreed, though try telling that to a man with no pay and a hammer.", fx = { align = { order = 1 } } },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Whatever we can cut down the coast and drag up here without getting robbed on the way. Westfall's never had much forest, so every log's precious, and I count them twice a day." } },
      choices = { { text = "That's dedication. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xjoke = {
      lines = {
        { id = "xxjoke_0", text = "Why is the woodpile the safest place on the hill? Because nothing ever gets past the planks. My wife didn't laugh either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "xxmiss_0", text = "Every day. I made chairs and cradles in Moonbrook. Now I watch planks I'll never carve, and that's a strange sort of grief for a carpenter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xattack = {
      lines = {
        { id = "xxattack_0", text = "Once, a Defias raid at midnight. They took a cartload and left a note thanking us for the timber. The note was well written, which tells you something about who they were." },
      },
      choices = {
        { text = "What does it tell you?", next = "xmasons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmasons = {
      lines = {
        { id = "xxmasons_0", text = "Some of them were Stormwind masons once, cheated of their pay. Some on the hill say we should talk to them, try to bring them home. Others say they're past saving. Which is it?" },
      },
      choices = {
        { text = "Try to bring them home. They're our own.", next = "BACK", reply = "Aye. I'd like to think some could come back.", fx = { align = { light = 1 } } },
        { text = "They chose banditry. They're past saving now.", next = "BACK", reply = "Maybe so. But I'll still hope for a few.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    moonbrook = { { id = "tp_xmoonbrook", text = "My old workshop's there, if it's still standing." } },
    deadmines = { { id = "tp_xdeadmines", text = "Where my timber goes when it gets stolen, they say." } },
    background = { { id = "tp_bg", text = "I was a carpenter in Moonbrook. Now I'm a guard for the wood I'd rather be working." } },
    _none = { { id = "tp_none", text = "No idea, friend. I just watch the wood." } },
  },
}

-- Elder Skychaser: a tauren ancestor-spirit atop Sentinel Tower during the Lunar Festival.
P:NPC {
  key = "wfl_elder_skychaser", id = 15577, name = "Elder Skychaser", gender = "female",
  role = "elder", tier = "quest",
  temper = { "gentle", "curious" }, values = { "memory", "the land" },
  notices = { "race" },
  impression = {
    first = "An old tauren spirit stands at the top of Sentinel Tower, gazing over the empty fields.",
    third = "{name} climbed Sentinel Tower to honour Elder Skychaser at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a visitor. You climbed a long way, little one, and I am glad of it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the tower. The wind is kinder up here than down among the fields." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Skychaser the Elder") }, text = "You seek the elders, I see. Come, the Earth Mother's blessing is yours." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" }, text = "A human, come to honour a tauren spirit. The festival makes strange friends, and good ones." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A shu'halo in the heart of human lands! You walked a dangerous road to find me." },
  },
  start = "hello",
  nodes = {
    d6_sky = {
      lines = { { id = "d6_sky_a", text = "Stars like grass seed scattered over a black field, child, and the moon, Mu'sha, rising over the plains. I counted the nights by her face, and I told my tribe when the herds would move and when the rains would come." } },
      choices = {
        { text = "The Earth Mother's eyes watch over us still.", next = "d6_sky2", when = { race = "Tauren" } },
        { text = "How did the stars tell you that?", next = "d6_sky2" },
        { text = "A star-watcher for her tribe. A fine calling.", next = "d6_sky2" },
      },
    },
    d6_sky2 = {
      lines = {
        { id = "d6_sky2_a", text = "The same way a hunter reads tracks, little one, by watching long enough that the patterns begin to speak. When the brightest star stood above the eastern ridge, the kodo grew restless, and when it sank, they walked, and I walked with them." },
        { id = "d6_sky2_tauren", when = { race = "Tauren" }, text = "They do, child of the herd, and An'she and Mu'sha see you even here, so far from Mulgore. It warms my old spirit to hear you say it in a land of stone towers, for the Earth Mother is not forgotten wherever one of us walks." },
      },
      choices = {
        { text = "Do the stars look the same here?", next = "d6_sky3" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    d6_sky3 = {
      lines = { { id = "d6_sky3_a", text = "Nearly, and that is a comfort to an old spirit far from home. That bright star stands lower here, over the sea, as if it, too, were looking toward Kalimdor and missing the plains." } },
      choices = {
        { text = "Perhaps it guides you home each year.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let us speak of other things.", next = "BACK" },
      },
    },
    d6_golems = {
      lines = { { id = "d6_golems_a", text = "Strange iron scarecrows walking the empty fields, little one, tending crops that no longer grow. They have no spirit that I can feel, and yet they keep working, as if someone forgot to tell them the farmers had gone." } },
      choices = {
        { text = "The Defias have turned them against the farmers.", next = "d6_golems2" },
        { text = "Do you pity them?", next = "d6_golems2" },
        { text = "Let us talk of something else.", next = "BACK" },
      },
    },
    d6_golems2 = {
      lines = { { id = "d6_golems2_a", text = "The soldiers say as much, that the red-masked thieves gave the iron men new orders, and now they strike at anyone who comes near. A tool is only as good as the hand that holds it, and these have been taken from the hands that made them." } },
      choices = {
        { text = "Will the fields heal once they're gone?", next = "d6_golems3" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    d6_golems3 = {
      lines = { { id = "d6_golems3_a", text = "The land is patient, and it will heal if it is given hands that love it. Break the iron men if you must, child, but do it gently with the soil, for these fields have suffered enough." } },
      choices = {
        { text = "I'll remember to tread gently.", next = "BACK", fx = { learn = { "harvest_watchers" } } },
        { text = "On to other things.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "I am Skychaser, and in life I watched the skies over the plains of Kalimdor. At the Lunar Festival my spirit wanders, and this year it brought me to a tower in a land I never knew." } },
      again = {
        { id = "h_again", text = "Ask on, little one. I have time enough." },
        { id = "h_again2", text = "What else stirs in your heart?" },
      },
      choices = {
        { text = "A tauren spirit in human lands is strange.", next = "strange" },
        { text = "What do you see from up here?", next = "fields" },
        { text = "Tell me of the Lunar Festival.", next = "festival" },
        { text = "These are my people's farms, Elder.", next = "farms", when = { race = "Human" } },
        { text = "What did you see in Kalimdor's skies, in life?", next = "d6_sky" },
        { text = "What do you make of the harvest golems below?", next = "d6_golems" },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "The dead are not bound by borders, child. The moon shines on Alliance and Horde alike, and the ancestors go where they are needed." } },
      choices = { { text = "That's a kind way to see it. Something else.", next = "BACK" } },
    },
    fields = {
      lines = { { id = "f_default", text = "Fields gone to weeds and farmhouses standing empty. The land is sad here, and it remembers when it was tended with love." } },
      choices = {
        { text = "What happened to the farmers?", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "fa_default", text = "The soldiers at the foot of this tower speak of thieves in red masks and hungry folk driven from their homes. The People's Militia tries to hold what remains." } },
      choices = {
        { text = "The Defias must be crushed.", next = "BACK", reply = "Perhaps. But remember why they grew so many.", fx = { align = { order = 1 } } },
        { text = "Stormwind failed these people first.", next = "BACK", reply = "Hm. A hard truth, if it is true.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "fe_default", text = "It is when the living remember us and we bless them in turn. The heart of it lies in Moonglade, where the druids keep the old rites." } },
      choices = { { text = "I'll seek the other elders too. Something else.", next = "BACK" } },
    },
    farms = {
      lines = { { id = "fm_default", text = "Then I pray they bloom again. The land wants to give, child; it only needs hands willing to work it." } },
      choices = { { text = "I'll do what I can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A tauren elder who once watched the stars over Kalimdor, and now wanders at the festival." } },
    _none = { { id = "tp_none", text = "I cannot say, child. Ask the soldiers below." } },
  },
}

-- Lumberjack: the woodcutters who work the treeline at the edge of Westfall.
P:NPC {
  key = "wf_lumberjack", id = 842, name = "Lumberjack", gender = "male",
  role = "citizen", tier = "service",
  communities = { "westfall" }, temper = { "weary", "blunt" }, values = { "work", "practical" },
  notices = { "kit" },
  impression = {
    first = "A broad-shouldered woodcutter leans on his axe and wipes sweat out of his eyes.",
    third = "{name} spoke with one of the lumberjacks of Westfall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you. Mind the logs, and stay a moment; a friendly face is rarer than shade out here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Mind the logs, and mind your distance. I've heard enough about you to keep clear." },
    { id = "g_default", text = "Mind the logs, friend, they roll if you look at them crossways. Not much else out here does any rolling, save the dust." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I cut timber for whoever's paying, and these days that's mostly the People's Militia, who need palisades on Sentinel Hill faster than I can fell trees. Used to cut for the farms, but there aren't many farms left to build." } },
      again = { { id = "h_again", text = "Something else? I've a stack to split before dark." } },
      choices = {
        { text = "What happened to the farms?", next = "farms" },
        { text = "Do the Defias bother you?", next = "defias" },
        { text = "Where do you find trees in Westfall?", next = "xtrees" },
        { text = "Do you know Gryan Stoutmantle?", next = "xgryan" },
        { text = "What did you do before this?", next = "xbefore" },
        { text = "I'm from Stormwind. We haven't forgotten you.", next = "BACK", when = { race = "Human" }, reply = "Kind of you to say. I'll believe it when the king sends something besides tax collectors, but kind all the same." },
        { text = "Do you have family out here?", next = "y_family" },
        { text = "Have the Defias ever asked you to join?", next = "y_asked" },
        { text = "Good luck with the work.", next = "END" },
      },
    },
    farms = {
      lines = { { id = "f_default", text = "Drought, taxes, and then the Defias came and burned out half of them, and the harvest golems the bandits stole wander the fields doing the rest. Gryan Stoutmantle and his militia are all that's holding Westfall together now." } },
      choices = { { text = "Hard times. Something else.", next = "BACK" } },
    },
    defias = {
      lines = { { id = "d_default", text = "Not me, not yet, because a man with an axe and nothing worth stealing isn't worth the trouble. But some of the lads I worked with went over to them, and I'll not say I never thought about it." } },
      choices = {
        { text = "Why would you think about it?", next = "tempt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tempt = {
      lines = { { id = "t_default", text = "Because Stormwind took our sons for its wars and our coin for its taxes, and gave nothing back but a king's promise. The Brotherhood at least pays its men, though I'd sooner starve than rob a neighbour." } },
      choices = {
        { text = "Stay honest. The militia needs men like you.", next = "BACK", reply = "Aye, maybe I'll take Stoutmantle my axe one of these days.", fx = { align = { order = 1 } } },
        { text = "Stormwind earned every bit of that anger.", next = "BACK", reply = "Careful who hears you say it, but you're not wrong.", fx = { align = { order = -1 } } },
      },
    },
    xtrees = {
      lines = {
        { id = "xxtrees_0", text = "Down by the coast, and up along the Elwynn border where the oaks still grow thick. It's a long haul, and the gnolls in the hills don't make it any shorter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgryan = {
      lines = {
        { id = "xxgryan_0", text = "Everyone knows Stoutmantle. He came back to Westfall when the king forgot it, and he built the militia out of farmers and fools like me. I'd follow him into the Deadmines." },
      },
      choices = {
        { text = "Would you join the militia?", next = "xjoin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xjoin = {
      lines = {
        { id = "xxjoin_0", text = "I've thought on it. Some say a man's duty is to his family first. Others say Westfall needs every spear now. Which would you choose?" },
      },
      choices = {
        { text = "Join the militia. Westfall needs you.", next = "BACK", reply = "Aye. Maybe I'll swap the axe for a spear one day.", fx = { align = { order = 1 } } },
        { text = "Look after your family first.", next = "BACK", reply = "That's what my wife says, and she's usually right.", fx = { align = { order = -1 } } },
      },
    },
    xbefore = {
      lines = {
        { id = "xxbefore_0", text = "I built barns and fences for the farms near Moonbrook. Nice work, good pay, until there weren't any barns left that the Defias hadn't burned." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_family = {
      lines = {
        { id = "y_family_d", text = "A wife and two girls in a shack near the Jangolode road. The eldest wants to go to Stormwind and be a seamstress. I tell her the city doesn't want Westfall folk, and I hate myself every time I say it." },
        { id = "y_family_hu", when = { race = "Human" }, text = "A wife and two girls near the Jangolode road. You're from the city, maybe. My eldest wants to sew in Stormwind. Tell me true, would they take a Westfall girl?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_asked = {
      lines = { { id = "y_asked_d", text = "Once. A fellow I built a barn for years back, wearing a red bandana now. He said the Brotherhood pays better than the militia and asks fewer questions. I told him to leave before I remembered who he was." } },
      choices = {
        { text = "Should you tell Stoutmantle his name?", next = "y_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tell = {
      lines = { { id = "y_tell_d", text = "He's got a family too, hiding out by Moonbrook. If I name him, the militia hangs him. If I don't, he robs somebody's farm next week. What would you do?" } },
      choices = {
        { text = "Name him. The farms need protecting.", next = "BACK", reply = "Aye. I'll walk up the hill tonight.", fx = { align = { order = 1 } } },
        { text = "Keep quiet. His family needs him.", next = "BACK", reply = "That's how I feel too. Doesn't make it right.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    defias = { { id = "tp_xdefias", text = "Bandits, mostly, though some were decent men once." } },
    sentinel_hill = { { id = "tp_xsentinel_hill", text = "The only safe place left in Westfall, and that's because of my timber." } },
    moonbrook = { { id = "y_tp_mb", text = "Moonbrook was a fine town once. I built half its fences. Now the Defias sleep behind them." } },
    stormwind = { { id = "y_tp_sw", text = "Stormwind's got fine walls. We built some of them, and they never paid the masons." } },
    gnolls = { { id = "y_tp_gnoll", text = "Gnolls come up from the coast for my timber. They can't build anything, so I suspect they eat it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask up at Sentinel Hill, they've got the news out here." } },
  },
}
