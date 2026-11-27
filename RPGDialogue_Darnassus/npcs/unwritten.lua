-- Darnassus folk with no conversation until now: the three battlemasters of the Warrior's Terrace
-- (Aethalas, Brogun Stoneshield, Keras Wolfheart), Huntress Leafrunner on the walkways,
-- Master Sergeant Moonshadow of the war effort, and Dawnwatcher Selgorm of the Argent Dawn.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Aethalas (Warsong Gulch battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_aethalas", id = TODO_NPC("Aethalas"), name = "Aethalas",
  role = "soldier", tier = "service",
  communities = { "darnassus" }, temper = { "fierce", "proud" }, values = { "duty", "vengeance" },
  impression = {
    first = "She speaks of Warsong Gulch the way others speak of a wound.",
    third = "{name} met Aethalas, the Silverwing Sentinel who sends volunteers from Darnassus to fight in Warsong Gulch.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. The forest is safer with you defending it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Defend the forest, or leave." },
    { id = "g_default", text = "Ishnu-alah. If you've come to defend the forest, you've come to the right Sentinel." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, {name}. The orcs are still cutting in Warsong Gulch, so there is still work for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aethalas of the Silverwing Sentinels. I gather those willing to stand against the Warsong orcs in the gulch, where they fell our trees and call it lumber." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "You are kaldorei, so you already know what Ashenvale is to us. The Warsong know only that it burns well." },
      },
      again = { { id = "h_again_x", text = "Speak, {name}. The gulch is waiting." },
        { id = "h_again", text = "Something more? Ask it quickly; the Sentinels in the gulch can't wait on us." },
        { id = "h_again2", text = "Go on, {name}. I am listening." },
      },
      choices = {
        { text = "The forest must be defended.", next = "BACK", reply = "It must. Join us.", fx = { align = { order = 1 } } },
        { text = "The forest can defend itself.", next = "BACK", reply = "It cannot.", fx = { align = { order = -1 } } },
        { text = "What happens in Warsong Gulch?", next = "gulch" },
        { text = "You sound like you've lost friends there.", next = "lost" },
        { text = "Send me to the gulch.", next = "BUSINESS" },
        { text = "Who commands the Silverwing Sentinels?", next = "x_ld" },
        { text = "What should I know before I go?", next = "x_adv" },
        { text = "I'm kaldorei, and I'll defend Ashenvale.", next = "x_ne", when = { race = "NightElf" } },
        { text = "What use is a hunter in the gulch?", next = "x_hu", when = { class = "HUNTER" } },
        { text = "How do you choose who goes to the gulch?", next = "w_choose" },
        { text = "Farewell, Aethalas.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gu_default", text = "The Warsong Outriders cut their way into the forest, and we cut them back out. Each side tries to carry off the other's banner, and each banner carried home buys the trees another day." } },
      choices = {
        { text = "Why fight over banners instead of the trees themselves?", next = "banner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    banner = {
      lines = { { id = "ba_default", text = "Because a banner taken shames a warband, and the Warsong care for shame more than they care for timber. Make them ashamed often enough, and fewer of them come back." } },
      choices = {
        { text = "The forest is worth any price we pay.", next = "BACK", reply = "Then you'll do well in the gulch. Remember that when the arrows fly.", fx = { align = { honor = 1 } } },
        { text = "Fighting for flags seems a waste of good soldiers.", next = "BACK", reply = "Perhaps it is. But a waste that keeps the axes back is better than none.", fx = { align = { honor = -1 } } },
        { text = "I see. Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Every Sentinel has lost someone there. I don't talk about mine, and you shouldn't ask anyone else about theirs either; just stand where they stood." } },
      choices = {
        { text = "I'll stand there, then.", next = "BACK", reply = "Good. That is all any of us asks.", fx = { affinity = 1 } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    x_ld = {
      lines = {
        { id = "xl1", text = "The Silverwing outposts answer to their own captains, and through them to the High Priestess. Our captains are harder than Ashenvale's winters, and every Sentinel who serves under them is glad of it." },
      },
      choices = {
        { text = "And who leads the Warsong?", next = "x_ld2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ld2 = {
      lines = {
        { id = "xl2", text = "The orcs of the Warsong clan, Grom Hellscream's people, who cut Ashenvale long before the gulch had a name. They fight as though their dead chieftain were watching, and perhaps in their minds he is." },
      },
      choices = {
        { text = "Hellscream slew Cenarius, didn't he?", next = "x_ld3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ld3 = {
      lines = {
        { id = "xl3", text = "He did, with demon blood in his veins, and the forest has not forgiven him for it. The orcs say he died to free them. We say he died, and that is enough for us." },
      },
      choices = {
        { text = "A long grudge. Something else.", next = "BACK" },
      },
    },
    x_adv = {
      lines = {
        { id = "xa1", text = "Guard the flag carrier above all, and never chase an orc into the open fields. The Warsong want you to follow them away from our base, and they are very patient about it." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Then you understand what we are fighting for, and you will not need speeches from me. Go to the gulch, {name}, and bring back their flag for the trees that cannot carry their own." },
      },
      choices = {
        { text = "For the trees. Something else.", next = "BACK" },
      },
    },
    x_hu = {
      lines = {
        { id = "xh1", text = "A great deal. Your eyes and your pet can see a flag carrier long before a warrior can reach him. Slow the orc, and let the Sentinels behind you do the rest." },
      },
      choices = {
        { text = "I'll do that. Something else.", next = "BACK" },
      },
    },
    w_choose = {
      lines = {
        { id = "w_choose_default", text = "I watch how they listen. The ones who ask how many orcs there are I send to train longer, and the ones who ask where the healers stand I send to Silverwing Grove with a letter in my own hand." },
      },
      choices = {
        { text = "Why the healers?", next = "w_choose2" },
        { text = "That's a strange test.", next = "w_choose2" },
      },
    },
    w_choose2 = {
      lines = {
        { id = "w_choose2_default", text = "Because the gulch is not won by the bravest, but by those who keep the others standing. A flag runner who knows where her priestess is will run further than one who only knows where the enemy is." },
        { id = "w_choose2_w1", when = { class = "PRIEST" }, text = "You are a healer, so you will be asked for more than you can give in there. Give it anyway, and let the Sentinels guard your back." },
      },
      choices = {
        { text = "I'll remember where the healers stand.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else, Aethalas.", next = "BACK" },
      },
    },
  },
  topics = {
    warsong = { { id = "tp_ws", text = "The Warsong cut our trees and call it lumber. We call it murder, and we answer it in the gulch." } },
    _none = { { id = "tp_none", text = "I know the gulch and little else these days, {name}. Ask a priestess about anything gentler." } },
  },
}

---------------------------------------------------------------------------
-- Brogun Stoneshield (Alterac Valley battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_brogun", id = TODO_NPC("Brogun Stoneshield"), name = "Brogun Stoneshield",
  role = "soldier", tier = "service", race = "Dwarf",
  communities = { "darnassus" }, temper = { "gruff", "cheerful" }, values = { "duty", "kin" },
  impression = {
    first = "A Stormpike dwarf, very far from his snow and grumbling about it.",
    third = "{name} met Brogun Stoneshield, the Stormpike dwarf in Darnassus who sends recruits to fight in Alterac Valley.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ho there, friend! Ye've held bridges before. Come, join the Guard!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ho there. Ye look like ye might hold a bridge. Maybe." },
    { id = "g_default", text = "Ho there! Ye look like ye could hold a bridge. The Stormpike Guard could use ye in Alterac." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A proper dwarf! Thank the Titans, I was startin' to forget what one looked like among all these trees." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brogun Stoneshield, of the Stormpike Guard. Vanndar sent me all the way to this tree to find folk willin' to fight the Frostwolf clan in Alterac Valley, and I'll not go home empty-handed." },
      },
      again = { { id = "h_again_x", text = "Aye, what else? I've nowhere to be but this tree." },
        { id = "h_again", text = "Aye, what else? I've nothin' but time and leaves here." },
        { id = "h_again2", text = "Go on, lad, speak up." },
      },
      choices = {
        { text = "The Stormpike Guard fights for Ironforge.", next = "BACK", reply = "Aye, we do! Join us!", fx = { align = { order = 1 } } },
        { text = "Alterac Valley isn't worth fighting for.", next = "BACK", reply = "It is to us, and to every dwarf buried in that snow.", fx = { align = { order = -1 } } },
        { text = "Why are the Stormpike fighting the Frostwolves?", next = "why" },
        { text = "You don't look happy among the trees.", next = "trees" },
        { text = "Send me to Alterac Valley.", next = "BUSINESS" },
        { text = "How did you end up in Darnassus?", next = "x_how" },
        { text = "I'm a Stormpike dwarf myself.", next = "x_dw", when = { race = "Dwarf" } },
        { text = "Gnomes stand with the Stormpike too.", next = "x_gn", when = { race = "Gnome" } },
        { text = "What's the worst of the Frostwolves?", next = "x_fw" },
        { text = "What do ye drink up here, then?", next = "w_ale" },
        { text = "Farewell, Brogun.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "We came to dig the valley for ore and old relics, and the Frostwolves say it's their home and always was. Now there's blood on the snow every day, and neither side will give an inch of it." } },
      choices = {
        { text = "The valley belongs to whoever can hold it.", next = "why2", fx = { align = { order = -1 } } },
        { text = "If it was their home first, they have a fair claim.", next = "why2", fx = { align = { order = 1 } } },
        { text = "Who leads the Stormpike?", next = "vanndar" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Hmph. Say that loud in Dun Baldar and see who buys yer ale. Either way, there's fighting to be done, and talkin' won't end it." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    vanndar = {
      lines = { { id = "va_default", text = "General Vanndar Stormpike, and a harder old dwarf ye'll never meet. He holds Dun Baldar like it was Ironforge itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trees = {
      lines = { { id = "tr_default", text = "The elves are kind enough, but they've no forge worth the name and their ale tastes like moonlight. I miss a good roof of stone over my head." } },
      choices = {
        { text = "The forge in the Craftsmen's Terrace isn't bad.", next = "BACK", reply = "Aye, I'll give it a look. Can't be worse than nothin'." },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how = {
      lines = {
        { id = "xh1", text = "On a ship from Menethil, sick as a hound the whole way, and then up a tree the size of Ironforge on a lift made of leaves. Vanndar wants every ally, and the elves have keen eyes for a fight." },
      },
      choices = {
        { text = "Have any elves joined you?", next = "x_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how2 = {
      lines = {
        { id = "xh2", text = "A fair few, aye, more than I'd have bet. The Sentinels fight like wildcats in the snow, though they complain of the cold worse than a gnome in a bathtub." },
      },
      choices = {
        { text = "And the dwarves complain of the trees.", next = "x_how3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how3 = {
      lines = {
        { id = "xh3", text = "Ha! Fair hit, lad. Aye, I'll stop grumbling about the trees once they stop dropping leaves in me ale. I don't expect that'll be soon." },
      },
      choices = {
        { text = "Probably not. Something else.", next = "BACK" },
      },
    },
    x_dw = {
      lines = {
        { id = "xd1", text = "Then you'll know Dun Baldar, and the wind off the glacier, and why we'll never give the valley up. Go and stand with your clan, and tell Vanndar Brogun sent ye." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
    x_gn = {
      lines = {
        { id = "xg1", text = "Aye, and glad of it, though your lot keep building things that blow up the wrong way. Still, a gnome with a rifle on a wall is worth three on the ground. Tinker away, I say." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    x_fw = {
      lines = {
        { id = "xf1", text = "Their wolves, and Drek'Thar's spells, and the way they come out of the snow at ye like they were born in it. Which they were, I suppose. I'll give them that much." },
      },
      choices = {
        { text = "Grudging respect. Something else.", next = "BACK" },
      },
    },
    w_ale = {
      lines = {
        { id = "w_ale_default", text = "Moonberry wine, mostly, and it tastes like a flower's been crushed in a cup and told to apologise. I've a wee cask of Thunderbrew stashed under the inn stairs, and if ye tell the innkeeper I'll deny it till my beard's white." },
      },
      choices = {
        { text = "Your beard's already going white.", next = "w_ale2" },
        { text = "Where'd you get a cask of Thunderbrew?", next = "w_ale2" },
      },
    },
    w_ale2 = {
      lines = {
        { id = "w_ale2_default", text = "Cheek! But aye, fair enough. A gnome off the Menethil boat sold it me at a robber's price, and I paid it gladly, for a dwarf without his ale is like a ram without its horns. I've rationed it to a mug a week, and I'm counting." },
        { id = "w_ale2_w1", when = { race = "Dwarf" }, text = "Ye'll know the feeling, {g:lad|lass}. Come by after the evening watch, and I might share a finger of it with a fellow mountain dwarf, if ye bring news from Ironforge." },
      },
      choices = {
        { text = "A mug a week is real discipline.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Brogun.", next = "BACK" },
      },
    },
  },
  topics = {
    magni = { { id = "tp_mag", text = "King Magni's a good king, and he lets Vanndar fight his own war. That's the best kind o' king." } },
    _none = { { id = "tp_none", text = "Ach, no idea, lad. I'm a soldier, not an encyclopedia with a beard." } },
  },
}

---------------------------------------------------------------------------
-- Keras Wolfheart (Arathi Basin battlemaster)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_keras", id = TODO_NPC("Keras Wolfheart"), name = "Keras Wolfheart",
  role = "soldier", tier = "service", race = "Human",
  communities = { "darnassus" }, temper = { "earnest", "brisk" }, values = { "duty", "homeland" },
  impression = {
    first = "A soldier of the League of Arathor, recruiting for a war over farmland.",
    third = "{name} met Keras Wolfheart, the League of Arathor's battlemaster in Darnassus.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Well met, friend! The League needs you, more than ever." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met. The League needs swords. Not yours, maybe." },
    { id = "g_default", text = "Well met. The League of Arathor needs every sword it can find for Arathi Basin." },
    { id = "g_human", when = { race = "Human" }, text = "Another human, out here among the trees! It's good to see a face that doesn't make me feel short." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Keras Wolfheart of the League of Arathor. We're fighting the Forsaken's Defilers for Arathi Basin, the farms, the mines and the mill that once fed all of Stromgarde." },
      },
      again = { { id = "h_again_x", text = "Go on, then. The trail will wait a little longer for me." },
        { id = "h_again", text = "Something else, hunter? My cat grows restless when I talk too long." },
        { id = "h_again2", text = "Go ahead. I've time for one more question." },
      },
      choices = {
        { text = "The League fights for Arathor's honor.", next = "BACK", reply = "We do! Join us!", fx = { align = { honor = 1 } } },
        { text = "Arathi Basin isn't worth the blood.", next = "BACK", reply = "It is to us. Those are our fathers' fields.", fx = { align = { honor = -1 } } },
        { text = "Who are the Defilers?", next = "defilers" },
        { text = "Why recruit in Darnassus, so far from Arathi?", next = "far" },
        { text = "Send me to Arathi Basin.", next = "BUSINESS" },
        { text = "What's at stake in Arathi Basin?", next = "x_st2" },
        { text = "You've a long way from home.", next = "x_home" },
        { text = "I'm from Stormwind. Why should I care?", next = "x_hm", when = { race = "Human" } },
        { text = "Ironforge remembers Stromgarde.", next = "x_ne", when = { race = "Dwarf" } },
        { text = "What did you do before the League?", next = "w_before" },
        { text = "Farewell, Keras.", next = "END" },
      },
    },
    defilers = {
      lines = { { id = "de_default", text = "Forsaken, mostly, sent by their Dark Lady to take the basin for the Horde. They don't eat, so I can't fathom what they want with farms, unless it's to make sure no one else does." } },
      choices = {
        { text = "Then we take the basin back for the living.", next = "def2", fx = { align = { light = 1 } } },
        { text = "Land is land. Whoever holds the mines gets rich.", next = "def2", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    def2 = {
      lines = { { id = "d2_default", text = "However you look at it, the basin needs holding, and the League will pay in honor for every flag you raise there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "fa_default", text = "Because the kaldorei know what it is to lose land to the Horde, and because Stromgarde can't win this alone. Every ally counts, no matter how far they live." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_st2 = {
      lines = {
        { id = "xs1", text = "The farms that fed Stromgarde, the mines, the lumber mill and the blacksmith's forge, all of it in the basin. Whoever holds it holds the bread and iron of the whole highlands." },
      },
      choices = {
        { text = "Who held it before the war?", next = "x_st3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_st3 = {
      lines = {
        { id = "xs3", text = "The people of Stromgarde, under King Thoras Trollbane, until the Scourge and the trolls and the ogres broke them. Now the League of Arathor fights to reclaim what was theirs." },
      },
      choices = {
        { text = "And the Defilers want it for the Forsaken.", next = "x_st4" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_st4 = {
      lines = {
        { id = "xs4", text = "For their apothecaries, I'd guess, and their plague. I don't mean to find out. I mean to see wheat growing there again, under living hands." },
      },
      choices = {
        { text = "Then I hope you see it. Something else.", next = "BACK" },
      },
    },
    x_home = {
      lines = {
        { id = "xh1", text = "I am. The elves here are kind enough, but they look at me like a lost child who'll grow old and die before they finish a conversation. I suppose they're right." },
      },
      choices = {
        { text = "They mean no harm. Something else.", next = "BACK" },
      },
    },
    x_hm = {
      lines = {
        { id = "xm1", text = "Because Arathor was humanity's first kingdom, friend, before Stormwind was even a fortress. If the Forsaken take the basin, they'll be at Stromgarde's walls next, and Menethil after that." },
      },
      choices = {
        { text = "I'll think on it. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Aye, and Stromgarde remembers Ironforge. Trollbane's men and your clans held the line together in the Second War, and I'd say that's a debt worth paying in the basin." },
      },
      choices = {
        { text = "Perhaps it is. Something else.", next = "BACK" },
      },
    },
    w_before = {
      lines = {
        { id = "w_before_default", text = "I farmed barley outside Refuge Pointe, and my father before me, back when it was only a crossroads and not a fortress. When the Syndicate burned our fields and the Forsaken came behind them, I traded the scythe for a sword and haven't put it down since." },
      },
      choices = {
        { text = "Do you mean to go back to farming?", next = "w_before2" },
        { text = "That's a hard road from a farm.", next = "w_before2" },
      },
    },
    w_before2 = {
      lines = {
        { id = "w_before2_default", text = "If there's a field left to go back to, aye, and that's the whole reason I'm here. The basin's farms are the best soil in Arathi, and the League means to hand them back to the folk who worked them. I'd like my hands in dirt again before I die." },
        { id = "w_before2_w1", when = { race = "Human" }, text = "You're from the Eastern Kingdoms too, so you'll know what it is to see the old farms empty. Come and help us fill them again." },
      },
      choices = {
        { text = "Land should go back to its people.", next = "BACK", fx = { align = { honor = 1 } }, reply = "That's the whole of what we fight for, friend. Say it to the next one who doubts us." },
        { text = "Soldiers shouldn't dream of farms.", next = "BACK", fx = { align = { honor = -1 } }, reply = "Then you've never stood in a burnt field. Every soldier dreams of something." },
        { text = "Something else, Keras.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "The Forsaken were our neighbours once. Now they're the Defilers, and they mean to keep the basin." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I'm a soldier, and soldiers mostly know where the enemy is." } },
  },
}

---------------------------------------------------------------------------
-- Huntress Leafrunner (patrols the walkways)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_leafrunner", id = TODO_NPC("Huntress Leafrunner"), name = "Huntress Leafrunner",
  role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "watchful", "dry" }, values = { "duty", "nature" },
  impression = {
    first = "She walks the same paths every day and notices everything on them.",
    third = "{name} met Huntress Leafrunner, who patrols the walkways of Darnassus.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Walk where you like; the city knows you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Keep to the paths." },
    { id = "g_default", text = "Ishnu-alah. Keep to the paths, traveler, and the city will keep you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'd say you're lost, but you walk like you know exactly where you are going." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Huntress Leafrunner. I walk the paths of Darnassus from the Cenarion Enclave to the Temple Gardens and back, and I see who comes and goes." },
        { id = "h_outsider", when = { race = { "Human", "Dwarf", "Gnome" } }, text = "Outsiders are more common here than they once were. Most of them stare up at the branches and walk into the lake." },
      },
      again = { { id = "h_again_x", text = "What else have you noticed, {name}?" },
        { id = "h_again", text = "Anything more? I have a long round to finish." },
        { id = "h_again2", text = "Ask, then, while I'm standing still." },
      },
      choices = {
        { text = "The paths keep the city safe.", next = "BACK", reply = "They do, and only because someone walks them every night. Paths left unwatched soon belong to someone else.", fx = { align = { order = 1 } } },
        { text = "Paths are just suggestions.", next = "BACK", reply = "Not in Darnassus.", fx = { align = { order = -1 } } },
        { text = "What do you see on your rounds?", next = "rounds" },
        { text = "Darnassus seems too peaceful to need guarding.", next = "peace" },
        { text = "Who walks the paths at night?", next = "x_night" },
        { text = "You've seen many strangers here lately.", next = "x_str" },
        { text = "I'm a druid of the Enclave.", next = "x_dr", when = { class = "DRUID" } },
        { text = "I'm new to Darnassus.", next = "x_new", when = { race = "Human" } },
        { text = "What's the most common thing you find on the paths?", next = "w_find" },
        { text = "Farewell, huntress.", next = "END" },
      },
    },
    rounds = {
      lines = { { id = "ro_default", text = "Druids arguing in the Enclave, priestesses walking to the temple, and newcomers asking where the bank is. Lately, also druids muttering about the Arch Druid's new tree, though never loudly." } },
      choices = {
        { text = "What about the new tree?", next = "tree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree = {
      lines = { { id = "tr_default", text = "Teldrassil was Fandral Staghelm's work, and not every druid wanted it, since we were promised no more World Trees. It is not my place to judge, so I walk my rounds and keep my opinions to myself." } },
      choices = {
        { text = "Fandral has given our people a home.", next = "BACK", reply = "He has. I sleep under its leaves gladly enough.", fx = { align = { order = 1 } } },
        { text = "A promise broken is still broken, whatever came of it.", next = "BACK", reply = "Careful, {name}. Some of the Enclave would agree, and some would report you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "pe_default", text = "It seems so, and that is the point of guarding it. A quiet city is one whose guards are doing their work." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    x_night = {
      lines = {
        { id = "xn1", text = "Priestesses going to the Temple, druids returning from the Enclave, and young lovers who think the Huntresses cannot see them. We can always see them, and we pretend we cannot." },
      },
      choices = {
        { text = "Anyone stranger than that?", next = "x_night2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_night2 = {
      lines = {
        { id = "xn2", text = "Once, a gnome asleep in the Temple Gardens with a lantern still burning beside him. I put out the flame before I woke him, and he apologised to me in three languages." },
      },
      choices = {
        { text = "What did you do with him?", next = "x_night3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_night3 = {
      lines = {
        { id = "xn3", text = "I walked him to the inn and told the keeper to hide his lantern. Fire is the one thing in Darnassus I will not forgive, however polite the one who carries it." },
      },
      choices = {
        { text = "Wise. Something else.", next = "BACK" },
      },
    },
    x_str = {
      lines = {
        { id = "xs1", text = "Many, yes. Humans, dwarves, and gnomes who get lost on the walkways and ask me the way to the bank three times in an hour. I do not mind, though some of the Sentinels do." },
      },
      choices = {
        { text = "The world is coming to Darnassus.", next = "BACK", reply = "It is, and it does not take its boots off.", fx = { align = { order = -1 } } },
        { text = "Too many strangers weaken a city.", next = "BACK", reply = "Perhaps, though not yet. Not while we watch.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "Then you know the Archdruid better than I do. Tell him the paths are quiet, if he asks, and tell him I am glad of the shade, even if the elders whisper." },
      },
      choices = {
        { text = "I'll tell him. Something else.", next = "BACK" },
      },
    },
    x_new = {
      lines = {
        { id = "xw1", text = "Then welcome, and remember that the bank is in the Tradesmen's Terrace, the Temple is to the west, and the Enclave is to the east. Nobody believes me the first time, but it is true." },
      },
      choices = {
        { text = "I'll remember. Something else.", next = "BACK" },
      },
    },
    w_find = {
      lines = {
        { id = "w_find_default", text = "Lost things, every morning. A glove, a letter, a child's carved wooden saber, and once a whole bag of moonberries that had been left on a bench and very nearly eaten by an owl from Shylenai's stall." },
      },
      choices = {
        { text = "What do you do with them?", next = "w_find2" },
        { text = "You must have quite a collection.", next = "w_find2" },
      },
    },
    w_find2 = {
      lines = {
        { id = "w_find2_default", text = "I take them to Ellandrieth at the terrace, who knows everyone's business and finds the owner within a day, most of the time. The ones she cannot place go to the Temple, and the priestesses give them where they are needed." },
        { id = "w_find2_w1", when = { race = "Gnome" }, text = "Your people lose more than anyone, if I may say it kindly. A gnome left a whole small machine on the Temple steps last month, and it was still ticking." },
      },
      choices = {
        { text = "A city with honest finders is a good city.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, huntress.", next = "BACK" },
      },
    },
  },
  topics = {
    teldrassil = { { id = "tp_tel", text = "Teldrassil was grown without the dragons' blessing. I sleep under it all the same, and it has not let me fall." } },
    _none = { { id = "tp_none", text = "I do not know, {name}. I only walk the paths and watch them." } },
  },
}

---------------------------------------------------------------------------
-- Master Sergeant Moonshadow (war effort recruiter)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_moonshadow", id = TODO_NPC("Master Sergeant Moonshadow"), name = "Master Sergeant Moonshadow",
  role = "soldier", tier = "quest",
  communities = { "darnassus" }, temper = { "brisk", "stern" }, values = { "duty", "order" },
  impression = {
    first = "He counts supplies the way other elves count stars.",
    third = "{name} met Master Sergeant Moonshadow, who gathers supplies in Darnassus for the Alliance war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there! Do you have anything to give for the war effort? Every bandage and bar of copper counts." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Alliance Needs Your Help!") }, text = "The Alliance needs your help, {name}. Have you brought anything for the stockpiles?" },
  },
  start = "hello",
  nodes = {
    yafter = {
      lines = {
        { id = "ybdarmoonshadow1", text = "Return to Ashenvale, and walk the forest with my sister, and not count a single thing for a hundred years. That is my dream. I suspect the Sentinels will find more for me to count." },
        { id = "ybdarmoonshadow2", when = { race = "NightElf" }, text = "You will know the feeling, sister. The watch never truly ends for our people." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yserved = {
      lines = {
        { id = "ydarmoonshadow1", text = "Nearly two thousand years, under three captains. I patrolled the borders of Ashenvale when the orcs first came, and I lost good sisters at Hyjal. Now I count bandages and copper bars, and I tell myself this is still service." },
      },
      choices = {
        { text = "Do you miss the field?", next = "yfield" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfield = {
      lines = {
        { id = "ydarmoonshadow2", text = "Every day. But someone must make sure the army that marches has food and bandages. A battle can be lost in a supply line long before the first arrow flies." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "ydarmoonshadow3", text = "A sister, a Sentinel in Ashenvale at Astranaar, who writes me every season. She says the orcs at Splintertree cut more trees every year, and that she would like to see a few of them hanged. I tell her to be patient." },
      },
      choices = {
        { text = "Be patient. Fighting the Horde now weakens the war effort.", next = "BACK", reply = "That is what I tell her. The qiraji are the greater threat.", fx = { align = { order = 1 } } },
        { text = "Your sister is right. The Horde must answer for the trees.", next = "BACK", reply = "Perhaps. But not until the hive is sealed again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Master Sergeant Moonshadow. Something stirs in the south of Silithus, and the Alliance is gathering supplies for whatever war comes of it. Darnassus will give its share, and more." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Alliance Needs Your Help!") }, text = "Your name is on my lists, {name}, among those who've given. There are few enough names on it to make yours stand out." },
      },
      again = {
        { id = "h_again", text = "What else? I've stockpiles to count." },
        { id = "h_again2", text = "Speak, {name}. The lists won't wait long." },
      },
      choices = {
        { text = "What's happening in Silithus?", next = "silithus" },
        { text = "What does the war effort need?", next = "needs" },
        { text = "Who decides where the supplies go?", next = "who" },
        { text = "I've brought something to give.", next = "BUSINESS" },
        { text = "A druid should be healing the land, not stockpiling for war.", next = "druid", when = { class = "DRUID" } },
        { text = "How long have you served the Sentinels?", next = "yserved" },
        { text = "Do you have family in Darnassus?", next = "yfamily" },
        { text = "What do the priestesses think of this war?", next = "BACK", when = { race = "NightElf" }, reply = "They support it, mostly. High Priestess Tyrande remembers the War of the Shifting Sands, and she would not see it fought again unprepared." },
        { text = "What will you do when the war is over?", next = "yafter" },
        { text = "How do you keep count of so much?", next = "w_count" },
        { text = "Farewell, sergeant.", next = "END" },
      },
    },
    silithus = {
      lines = { { id = "si_default", text = "The Cenarion Circle sends word of insects swarming from the desert, more than anyone has seen in a thousand years. Some of the eldest among us remember another war in that sand, and they do not sleep easily." } },
      choices = {
        { text = "Another war in Silithus?", next = "silithus2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithus2 = {
      lines = { { id = "s2_default", text = "The War of the Shifting Sands, against the qiraji. Fandral's own son died in it, and the bugs were only sealed away, not destroyed. Now the seal grows weak, or so the Circle believes." } },
      choices = {
        { text = "Then we'd better be ready this time.", next = "BACK", reply = "Exactly so. That is why I count copper bars.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs = {
      lines = { { id = "ne_default", text = "Bandages, metal, leather, herbs and food, in amounts you would not believe. The army that marches into Silithus will need to be fed, clothed and mended for a long time." } },
      choices = {
        { text = "Every city should give equally.", next = "needs2", fx = { align = { order = 1 } } },
        { text = "Let those who want to give, give. No one should be forced.", next = "needs2", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs2 = {
      lines = { { id = "n2_default", text = "Ironforge has given a great deal already, and Stormwind somewhat less. I won't have Darnassus come last on that list." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "wh_default", text = "The commanders in Ironforge keep the final tally, and the supplies go south when the stockpiles are full. My work is to fill ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The Circle itself asked for this, druid. If the qiraji come out of their hive, there will be no land left to heal." } },
      choices = { { text = "Then I'll give what I can.", next = "BACK" } },
    },
    w_count = {
      lines = {
        { id = "w_count_default", text = "A ledger for each kind, and a stone tally for each ledger, and I check one against the other at every dawn. The dwarves in Ironforge laugh at the stones, but they have never lost a stone in a fire, and I have known them lose a ledger." },
      },
      choices = {
        { text = "Has the count ever come up short?", next = "w_count2" },
        { text = "Stones and ledgers both. Thorough.", next = "w_count2" },
      },
    },
    w_count2 = {
      lines = {
        { id = "w_count2_default", text = "Once, by forty bandages, and I found them three days later under a novice who had been sleeping on the crate. She thought it was a bench. I gave her a cot and moved the crate, and wrote both down." },
      },
      choices = {
        { text = "A good sergeant knows where everything is.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else, sergeant.", next = "BACK" },
      },
    },
  },
  topics = {
    fandral = { { id = "ydarmoonshadow4", text = "Arch Druid Fandral Staghelm. His son died in the last war in Silithus." } },
    sister = { { id = "ydarmoonshadow5", text = "She guards Astranaar, and she would like to hang a few orcs." } },
    qiraji = { { id = "ydarmoonshadow6", text = "The insects of Silithus. They nearly broke us once." } },
  },
}

---------------------------------------------------------------------------
-- Dawnwatcher Selgorm (Argent Dawn)
---------------------------------------------------------------------------
P:NPC {
  key = "dar_selgorm", id = TODO_NPC("Dawnwatcher Selgorm"), name = "Dawnwatcher Selgorm",
  role = "questgiver", tier = "quest", race = "Human",
  communities = { "darnassus", "argent_dawn" }, temper = { "earnest", "patient" }, values = { "vigilance", "faith" },
  impression = {
    first = "A human of the Argent Dawn, watching for the Scourge from a city that has never seen one.",
    third = "{name} met Dawnwatcher Selgorm, the Argent Dawn's representative in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you, friend. The Argent Dawn keeps watch here, even this far from the plague." },
    { id = "g_bfd", when = { questActive = TODO_QUEST("Blackfathom Villainy") }, text = "You've come from Blackfathom Deeps? Then you have something to show me, I hope." },
  },
  start = "hello",
  nodes = {
    yhardest = {
      lines = {
        { id = "ybdarselgorm1", text = "The quiet. Andorhal was always loud, with bells and carts and children. Here, the city whispers. I sleep badly in it, and I wake in the night thinking I've heard the dead walking. It's only the wind in the leaves." },
        { id = "ybdarselgorm2", when = { race = "Human" }, text = "You'll know what I mean, coming from our kingdoms. A human city never sleeps. This one never wakes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yjoin = {
      lines = {
        { id = "ydarselgorm1", text = "I was a priest in Andorhal before the plague. I watched my congregation die and rise again, and I swore that day I'd never stop fighting the thing that did it. The Dawn found me in a refugee camp in Hillsbrad." },
      },
      choices = {
        { text = "Do you miss Lordaeron?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = {
        { id = "ydarselgorm2", text = "Every day, and I hate it. I miss the fields, and the chapel, and the bells on feast days. But the land I miss is gone. What's there now isn't Lordaeron. It's a grave that walks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ykalimdor = {
      lines = {
        { id = "ydarselgorm3", text = "Beautiful, and strange, and very old. The trees here are older than my kingdom. I've learned more about the darkness in a year here than in ten in Lordaeron, because the kaldorei have fought it for ten thousand years." },
      },
      choices = {
        { text = "What darkness?", next = "ydarkness" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydarkness = {
      lines = {
        { id = "ydarselgorm4", text = "The Twilight's Hammer, the satyrs, the corrupted furbolgs. Some say the Dawn should stay in Lordaeron and fight only the Scourge. Some say darkness anywhere is our concern." },
      },
      choices = {
        { text = "Darkness anywhere is our concern. Stay vigilant.", next = "BACK", reply = "That's why I'm here. Thank you for understanding.", fx = { align = { light = 1 } } },
        { text = "The Scourge is enough. Focus your strength.", next = "BACK", reply = "Perhaps. But the Scourge didn't come from nowhere.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dawnwatcher Selgorm of the Argent Dawn. We fight the Scourge in Lordaeron, but we watch for every cult and darkness that would serve it, and some of them have crept into Kalimdor." },
        { id = "h_bfd_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackfathom Villainy"), days = 3 } }, text = "Kelris is dead, then, and the Twilight's Hammer in Blackfathom Deeps has lost its voice. The Dawn thanks you, {name}." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask before the dawn watch begins?" },
        { id = "h_again2", text = "Ask, friend. Vigilance starts with questions." },
      },
      choices = {
        { text = "What darkness has crept into Kalimdor?", next = "bfd" },
        { text = "What is the Argent Dawn?", next = "dawn" },
        { text = "A human in Darnassus must stand out.", next = "human" },
        { text = "The Light has no place among the kaldorei.", next = "light", when = { race = "NightElf" } },
        { text = "How did you come to join the Argent Dawn?", next = "yjoin" },
        { text = "What do you think of Kalimdor?", next = "ykalimdor" },
        { text = "The Light is with you, Dawnwatcher.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, reply = "And with you, friend. It's good to hear those words in this city. The kaldorei are kind, but they pray to the moon." },
        { text = "What's the hardest thing about Darnassus?", next = "yhardest" },
        { text = "How do the priestesses treat you?", next = "w_priest" },
        { text = "Farewell, Dawnwatcher.", next = "END" },
      },
    },
    bfd = {
      lines = { { id = "bf_default", text = "In Blackfathom Deeps, on the coast of Ashenvale, a cult called the Twilight's Hammer worships something that sleeps in the deep. Their leader is a night elf named Twilight Lord Kelris, and our agents want him stopped." } },
      choices = {
        { text = "A night elf, leading a cult?", next = "kelris" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kelris = {
      lines = { { id = "ke_default", text = "Even the kaldorei are not proof against whispers in the dark. Argent Guard Thaelrid is in the Deeps already, and he could use help. Bring me Kelris's head, and the Dawn will remember you." } },
      choices = {
        { text = "Darkness must be destroyed wherever it hides.", next = "BACK", reply = "Spoken like a friend of the Dawn.", fx = { align = { light = 1 } } },
        { text = "I'll do it for the reward, not the cause.", next = "BACK", reply = "The Dawn pays either way. Perhaps the cause will find you later.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "da_default", text = "An order of all races, sworn to fight the Scourge and the darkness behind it. Priests, soldiers, scholars, even some of your Cenarion druids. Where the Scourge spreads, we stand against it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "hu_default", text = "I do, a head shorter than everyone and twice as loud on these wooden floors. But the kaldorei have been kind, and the Dawn goes where it is needed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "Perhaps not, and I'd never preach it here. But Elune's priestesses and my own share an enemy, and that is enough to stand together." } },
      choices = { { text = "That I can accept.", next = "BACK" } },
    },
    w_priest = {
      lines = {
        { id = "w_priest_default", text = "With great courtesy and very little warmth, at first. Then one of them came to me after a service and asked about the Light, not to argue but because she wanted to understand, and now we take tea in the Temple Gardens once a week." },
      },
      choices = {
        { text = "What does she ask about?", next = "w_priest2" },
        { text = "Courtesy is a start.", next = "w_priest2" },
      },
    },
    w_priest2 = {
      lines = {
        { id = "w_priest2_default", text = "Whether the Light ever answers, and how it feels when it does. I told her it feels like being remembered by someone you thought had forgotten you, and she was quiet for a long while and said that Elune feels much the same." },
        { id = "w_priest2_w1", when = { class = "PRIEST" }, text = "You walk this path too, so perhaps you know what I mean. The Light and the moon may not be one thing, but I have stopped thinking they are strangers." },
      },
      choices = {
        { text = "Faith speaks the same in any tongue.", next = "BACK", fx = { align = { light = 1 } }, reply = "That's what I've begun to believe, friend, and I believed it least of anyone when I arrived." },
        { text = "Their goddess isn't your Light.", next = "BACK", fx = { align = { light = -1 } }, reply = "Perhaps not. But I'll keep drinking her tea, all the same." },
        { text = "Something else, Dawnwatcher.", next = "BACK" },
      },
    },
  },
  topics = {
    andorhal = { { id = "ydarselgorm5", text = "I was a priest there. My congregation died and rose again." } },
    twilights_hammer = { { id = "ydarselgorm6", text = "A cult that worships something that sleeps. They are in Blackfathom Deeps." } },
    kelris = { { id = "ydarselgorm7", text = "Lord Kelris. A night elf who leads the cult in the Deeps." } },
  },
}

-- Elder Bladeswift: an ancestor spirit honoured during the Lunar Festival. He stands in Darnassus, near the Cenarion Enclave.
P:NPC {
  key = "darn_elder_bladeswift", id = 15598, name = "Elder Bladeswift", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A spirit in old Kaldorei war-harness, standing as if still on watch.",
    third = "{name} paid respects to Elder Bladeswift, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. The moon is full and the year has turned, and an old warden walks again among his people." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has called me home again. Walk with me a moment, and honour the Sentinels who kept this land." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and I am still at my post. Old habits outlast even death." },
    { id = "g_done", when = { questDone = TODO_QUEST("Bladeswift the Elder") }, text = "My coin is yours already. Guard it as you would guard the borders of Ashenvale." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "NightElf" }, text = "A daughter or son of the Kaldorei. You stand straighter than most of the young ones I see." },
  },
  start = "hello",
  nodes = {
    yazshara = {
      lines = {
        { id = "ydarnelderbladeswift1", text = "I saw her once, from far away, on the steps of her palace. She was the most beautiful thing in the world, and I would have died for her. Many of us would have. That is the danger of beauty, {class}." },
        { id = "ydarnelderbladeswift2", when = { race = "NightElf" }, text = "You carry her people's blood, as all kaldorei do. Remember what we were, and what we chose to become." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yyoung = {
      lines = {
        { id = "ydarnelderbladeswift3", text = "That the watch never ends. That the forest does not remember your name, but it remembers what you guarded. And that a Sentinel who fights for glory will die young, and a Sentinel who fights for others will die old." },
      },
      choices = {
        { text = "Do you have regrets?", next = "yregrets" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yregrets = {
      lines = {
        { id = "ydarnelderbladeswift4", text = "One. I did not stand with Malfurion when he first spoke against the Highborne. I waited, and watched, until I was sure. My brother did not wait, and he died for it. I have wondered since whether my caution was wisdom." },
      },
      choices = {
        { text = "Your caution was wise. Rash action costs lives.", next = "BACK", reply = "Perhaps. My brother would say otherwise, if he could speak.", fx = { align = { order = 1 } } },
        { text = "You should have stood with him. Courage cannot wait.", next = "BACK", reply = "Yes. That is what I have told myself every Lunar Festival since.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      narr = "His hand drifts to a glaive that is no longer there.",
      lines = { { id = "h_default", text = "I am Elder Bladeswift, and I stood watch beside the Sentinels long before Teldrassil was planted. Each year at the Lunar Festival my people honour me, and I come back to see that Darnassus is well watched." } },
      again = { { id = "h_again", text = "Speak, {class}. An old warden listens even while he watches." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "I fight with the blade too, Elder.", next = "kin", when = { class = "WARRIOR" } },
        { text = "Do you remember Azshara?", next = "yazshara" },
        { text = "What would you say to the young Sentinels?", next = "yyoung" },
        { text = "What do you see, when you look at Darnassus now?", next = "w_see" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I fought in the War of the Ancients beside the Priestess, and I guarded the forests through ten thousand quiet years after. My blade was swift, my eyes were sharp, and my name came honestly." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "Duty holds me, and the people who remember what it cost. Every Sentinel on the walls of Darnassus carries a little of my watch with her." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "You speak like a Sentinel, {class}. The old vigil is what keeps the Kaldorei alive.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "The living do make their own way, but they make it behind walls the dead once held. Do not forget that.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "The Lunar Festival is the turning of the year, when the Kaldorei and our allies honour the elders who came before. Elune smiles on it, and for a few nights her light lets us walk among our descendants." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is the sacred home of the druids, and Elune's light is strongest there when the year turns. Valadar Starsong keeps the festival there, and the elders are drawn to it like moths to a lantern." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "I accept your respect, {class}, and give you the coin of my line. Spend it at the festival, and stand your own watch well." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then fight as a Sentinel does: swift, silent, and only when you must. A blade drawn in anger is a blade drawn too soon." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    w_see = {
      lines = {
        { id = "w_see_default", text = "A city where there should be a forest, and a forest that has learned to be a city, which I would not have believed possible when I was alive. The Sentinels stand their posts as we did, and their glaives are better made, and their faces are just as young." },
      },
      choices = {
        { text = "Does it trouble you?", next = "w_see2" },
        { text = "The Sentinels honour you still.", next = "w_see2" },
      },
    },
    w_see2 = {
      lines = {
        { id = "w_see2_default", text = "It troubles me that they still have to stand there. I hoped, when I fell, that the watch might one day be ended. Instead it has been handed down, daughter to daughter, for ten thousand years, and I am proud of them and sorry for them in the same breath." },
        { id = "w_see2_w1", when = { race = "NightElf" }, text = "You are kaldorei, so it was handed to you as well, in some measure. Carry it lightly when you can, {class}; there will be days when you cannot." },
      },
      choices = {
        { text = "The watch is worth keeping.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Rest easy, Elder.", next = "BACK" },
      },
    },
  },
  topics = {
    azshara = { { id = "ydarnelderbladeswift5", text = "The Queen. I would have died for her. That is the danger of beauty." } },
    sentinels = { { id = "ydarnelderbladeswift6", text = "The watchers of the forest. I stood with them before Teldrassil was planted." } },
    _none = { { id = "tp_none", text = "That lies outside my watch, {class}. Ask the living about it." } },
  },
}

-- Lunar Festival Harbinger: a tauren herald at the moonwell who sends travellers to Moonglade for the Lunar Festival.
P:NPC {
  key = "darn_lunar_festival_harbinger", id = 15895, name = "Lunar Festival Harbinger", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "serene", "welcoming" }, values = { "ancestors", "tradition" },
  notices = { "race", "class" },
  impression = {
    first = "A tauren in festival colours, oddly at home among the night elves.",
    third = "{name} met a Lunar Festival Harbinger in Darnassus, who called the faithful to Moonglade.",
  },
  greetings = {
    { id = "g_default", text = "The year turns, friend, and the moon is full over Teldrassil. Have you heard the call of the Lunar Festival?" },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has begun! The lanterns are lit in Moonglade, and the elders are waiting to be honoured." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Valadar Starsong waits for you in Moonglade. Go when you are ready, and go with a light heart." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "A druid! You need no directions to Moonglade, I think; your own wings will carry you there." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The harbinger bows, horns low, and the lantern at his belt sways.",
      lines = { { id = "h_default", text = "I am a harbinger of the Lunar Festival, and I come to the great cities to remind their people that the elders are waiting. The druids of the Cenarion Circle keep the festival in Moonglade, and all who come in peace are welcome there." } },
      again = { { id = "h_again_x", text = "The moon is patient, and so am I. Ask, friend." }, { id = "h_again", text = "Ask, friend. The moon will not set while we talk." } },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Why does a tauren herald serve in Darnassus?", next = "tauren" },
        { text = "How do I reach Moonglade?", next = "travel" },
        { text = "What tribe are you from?", next = "x_tribe" },
        { text = "Tell me about Omen.", next = "x_omen" },
        { text = "I'm tauren too, far from Mulgore.", next = "x_ta", when = { race = "Tauren" } },
        { text = "Which elders should a kaldorei seek?", next = "x_ne", when = { race = "NightElf" } },
        { text = "What will you do when the festival ends?", next = "w_after" },
        { text = "Moonlight on your path, harbinger.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year beneath the full moon, when every people honours its ancestors. The spirits of the elders return to the places they loved, and those who seek them out receive the blessing of their line." } },
      choices = {
        { text = "Where can the elders be found?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "Everywhere, friend: in the cities, on the plains, in the deep places under the mountains and even in the burnt lands. Elder Bladeswift stands here in Darnassus, and many more wait for those willing to walk far." } },
      choices = {
        { text = "Honouring the dead is a sacred duty.", next = "BACK", reply = "It is, and the elders feel it when it is done with a true heart.", fx = { align = { light = 1 } } },
        { text = "I'll go for the coins and the fireworks.", next = "BACK", reply = "Ha! Then you will still go, and the elders are not proud. Perhaps you will find more than coins.", fx = { align = { light = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "The Cenarion Circle has tauren druids as well as Kaldorei, and in Moonglade we keep the peace together. The festival belongs to no single people, so its heralds come from many." } },
      choices = {
        { text = "The night elves don't mind?", next = "mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "Some do, and they watch my horns as if I might trample their gardens. But the Priestess allows the festival heralds in the city, and the moon shines on everyone alike, so I bear the looks gladly." } },
      choices = { { text = "That's generous of you. Something else.", next = "BACK" } },
    },
    travel = {
      lines = { { id = "tr_default", text = "Moonglade lies in the mountains between Felwood and Winterspring, and the road there is long and dangerous. During the festival, though, the moonwells carry those who stand in them and ask for Elune's blessing, so you need not walk at all." } },
      choices = {
        { text = "I'll go to Moonglade, then.", next = "END", reply = "Then seek out Valadar Starsong when you arrive. He will show you the way of the festival." },
        { text = "I will take the druid's road myself.", next = "BACK", when = { class = "DRUID" }, reply = "Of course you will. Fly or teleport as you like; the festival waits." },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tribe = {
      lines = {
        { id = "xt1", text = "The Runetotem, the druids' tribe, who have studied with the kaldorei in Moonglade for longer than most of my people remember. Hamuul Runetotem is my teacher's teacher." },
      },
      choices = {
        { text = "What did the kaldorei teach you?", next = "x_tribe2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tribe2 = {
      lines = {
        { id = "xt2", text = "That the Earth Mother and the moon goddess are not so different, and that a green field and a great tree are tended in the same way. They taught us patience, and we taught them to laugh a little." },
      },
      choices = {
        { text = "Did the elves need teaching?", next = "x_tribe3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tribe3 = {
      lines = {
        { id = "xt3", text = "Ha! A little, my friend, only a little. They have lived so long that they forget how short a joke is, but Moonglade has softened even the sternest druid during the festival." },
      },
      choices = {
        { text = "It sounds wonderful. Something else.", next = "BACK" },
      },
    },
    x_omen = {
      lines = {
        { id = "xo1", text = "An ancient of war, driven mad by the demons long ago, who sleeps in Lake Elune'ara. Once a year he wakes, and the druids light the sky with fireworks to drive him back to sleep." },
      },
      choices = {
        { text = "A strange custom. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xa1", text = "Then you know the Earth Mother is everywhere, even in this great tree. Go to the elders of Mulgore and Thunder Bluff as well, and they will be glad to see a child of the plains honour them." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Your own, in Ashenvale and Teldrassil, and the old ones in Feralas and Winterspring. They wait under stones and among trees, and each has a blessing and a little coin for those who remember." },
      },
      choices = {
        { text = "I'll find them. Something else.", next = "BACK" },
      },
    },
    w_after = {
      lines = {
        { id = "w_after_default", text = "Walk home to Thunder Bluff the long way, through the Stonetalon Mountains, and listen to the wind for a few weeks before anyone asks me to speak again. A harbinger uses up a great many words in a season." },
      },
      choices = {
        { text = "Is the walk safe, alone?", next = "w_after2" },
        { text = "That sounds like a peaceful road.", next = "w_after2" },
      },
    },
    w_after2 = {
      lines = {
        { id = "w_after2_default", text = "Safe enough for a tauren who walks slowly and carries a staff. The Venture Company are loud in Stonetalon these days, and their machines frighten the deer, but they do not trouble an old herald. I think they are afraid I might try to convert them." },
        { id = "w_after2_w1", when = { race = "Tauren" }, text = "You know that road, then, and the smell of the high passes after rain. May the Earth Mother keep you on it as she keeps me." },
      },
      choices = {
        { text = "Walk with the Earth Mother.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, harbinger.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Cenarion Circle keeps Moonglade, and they open its gates for the festival. Tauren and kaldorei sit there together, as they should." } },
    _none = { { id = "tp_none", text = "That is not my message to carry, friend. Mine is only the moon and the festival." } },
  },
}

---------------------------------------------------------------------------
-- Ancient of Lore: an ancient who keeps the old memories of the kaldorei.
-- Treant voice like dar_protector: slow, Hmmm/Hroom, patient.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_ancient_lore", id = 3468, name = "Ancient of Lore",
  role = "citizen", tier = "service",
  communities = { "darnassus" }, temper = { "patient", "slow" }, values = { "memory", "knowledge" },
  notices = { "race" },
  impression = {
    first = "A great ancient stands rooted among the trees, bark carved with runes so old the moss has grown into their grooves.",
    third = "{name} listened to an Ancient of Lore speak of the kaldorei's long memory.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hroom. A friend. Hmm. Come closer, little one; I remember you fondly." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hroom. A visitor. Hmm. Speak, and go." },
    { id = "g_default", text = "Hroom. A visitor. Hmmm. Come closer, little one; my hearing is very old, and so is everything else about me." },
    { id = "g_back", when = { metBefore = true }, text = "Hmmm. You again, and so soon. It feels like a heartbeat since you left. It was probably a season." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "Hroom. A child of the kaldorei. I remember your grandmother's grandmother, I think. Or a tree that looked like her." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hroom. I am an Ancient of Lore. I keep the old stories, the ones the kaldorei wrote before they wrote in ink. Ask, and I will remember, slowly." },
      },
      again = { { id = "h_again_x", text = "Hmmm. More questions. Good. Ask, little one." }, { id = "h_again", text = "Hmmm. Another question? Good. Questions are like rain; they keep an old tree from drying out." } },
      choices = {
        { text = "Lore must be preserved.", next = "BACK", reply = "Hroom. Yes. It must.", fx = { align = { order = 1 } } },
        { text = "Old lore is useless now.", next = "BACK", reply = "Hroom. You will regret that.", fx = { align = { order = -1 } } },
        { text = "What do you remember of the Well of Eternity?", next = "well" },
        { text = "What do you think of Teldrassil?", next = "teldrassil" },
        { text = "What do you remember of the Highborne?", next = "x_hb" },
        { text = "Do you remember Cenarius?", next = "x_cen" },
        { text = "I am a druid. What should I learn?", next = "x_dr", when = { class = "DRUID" } },
        { text = "Teach a kaldorei some old story.", next = "x_ne", when = { race = "NightElf" } },
        { text = "Is there a story you've forgotten?", next = "w_forget" },
        { text = "Thank you, Ancient.", next = "END" },
      },
    },
    well = {
      lines = { { id = "we_default", text = "Hmmm. A lake of light, and the Highborne drinking from it until they were drunk on power. Then the Legion came through, and the lake swallowed the land. Hroom. A sad story, and an old one. The young ones should learn it better." } },
      choices = {
        { text = "The Highborne doomed everyone with their pride.", next = "BACK", reply = "Hmmm. Pride, yes. And hunger. Both grow quickly in the dark.", fx = { align = { order = 1 } } },
        { text = "Magic itself wasn't to blame, only its misuse.", next = "BACK", reply = "Hroom. A dangerous thing to say near the druids. A true one, perhaps.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teldrassil = {
      lines = { { id = "te_default", text = "Hroom. She is young, and she grew very fast. The Archdruid did not ask the dragons' blessing. I feel something in her roots that is not quite right. Hmmm. But I am old, and old trees worry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_hb = {
      lines = {
        { id = "xh1", text = "Hroom. Fine robes, fine towers, and a queen who looked into the Well and saw only herself. They called the demons into the world, and the world has not yet forgotten." },
      },
      choices = {
        { text = "Are any Highborne left?", next = "x_hb2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hb2 = {
      lines = {
        { id = "xh2", text = "Hmmm. Some fled across the sea long ago, and some drowned with Zin-Azshari, and some... I do not know. The sea keeps its secrets better than I keep mine. Hroom." },
      },
      choices = {
        { text = "Do the kaldorei still fear them?", next = "x_hb3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hb3 = {
      lines = {
        { id = "xh3", text = "Hmmm. They fear the magic more than the people. That is why the druids forbid it, and why Darnassus has few mages. Wise, perhaps. Lonely, also. Hroom." },
      },
      choices = {
        { text = "A hard choice. Something else.", next = "BACK" },
      },
    },
    x_cen = {
      lines = {
        { id = "xc1", text = "Hroooom. Yes. Cenarius walked these forests as a god, son of Malorne, and the ancients were his friends. The orcs slew him in Ashenvale. The trees still weep there, if you listen." },
      },
      choices = {
        { text = "I'll listen. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "Hmmm. Learn patience, little druid. Learn to sleep without dreaming too long. Malfurion dreams, and the Emerald Dream is beautiful, but even beautiful things can be a trap. Hroom." },
      },
      choices = {
        { text = "I'll be careful. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Hroom. Long ago, before the Well, the kaldorei sang to the moon every night, and Elune answered. She still does. You only forgot to sing loud enough. Hmmm." },
      },
      choices = {
        { text = "I'll try. Something else.", next = "BACK" },
      },
    },
    w_forget = {
      lines = {
        { id = "w_forget_default", text = "Hroom. Hmmm. Yes, little one, one. A song the kaldorei sang at the first planting of every grove, and I remember only that it began with the word for rain. The singers are gone, and the words fell from me like leaves." },
      },
      choices = {
        { text = "Could anyone still know it?", next = "w_forget2" },
        { text = "Even an ancient forgets.", next = "w_forget2" },
      },
    },
    w_forget2 = {
      lines = {
        { id = "w_forget2_default", text = "Hmmm. Perhaps the oldest priestesses, or the druids who slept long in the Dream. I have asked, slowly, for many years. If you ever hear an old song that begins with rain, little one, come and sing it to me, even badly." },
        { id = "w_forget2_w1", when = { class = "DRUID" }, text = "Hroom. You walk in the Dream, little druid. Listen there for it. Things that are lost here sometimes wait there." },
      },
      choices = {
        { text = "I'll listen for the rain song.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Ancient.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarius = { { id = "tp_cen", text = "Hroom. Cenarius was a friend. The orcs killed him. The forest remembers both of those things." } },
    _none = { { id = "tp_none", text = "Hmmm. I do not know that one. Perhaps I knew it once, and the moss grew over it. Hroom." } },
  },
}

---------------------------------------------------------------------------
-- Darnassus Sentinel: the guards of the city.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_sentinel_guard", id = 4262, name = "Darnassus Sentinel",
  role = "guard", tier = "service",
  communities = { "darnassus" }, temper = { "cool", "watchful" }, values = { "duty", "Elune" },
  impression = {
    first = "A tall Sentinel in purple and silver, glaive at rest, watching the walkways with unhurried care.",
    third = "{name} spoke with a Darnassus Sentinel on watch in the city.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Walk in peace; the Sentinels know you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Walk in peace. Keep your voice low." },
    { id = "g_default", text = "Ishnu-alah. Walk in peace in Darnassus, and keep your voice low near the Temple." },
    { id = "g_human", when = { race = "Human" }, text = "Welcome, human. The city is larger than it looks, so ask if you lose your way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The city treats you well, I hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am of the Sentinels, sworn to Priestess Tyrande Whisperwind. We keep the peace in Darnassus, and we keep it quietly." },
      },
      again = { { id = "h_again_x", text = "Ask your question, traveller." }, { id = "h_again", text = "Anything more? I am on watch, but I can spare a moment." } },
      choices = {
        { text = "The Sentinels keep Darnassus safe.", next = "BACK", reply = "We do, every hour of every night. It is kind of you to notice.", fx = { align = { order = 1 } } },
        { text = "Darnassus is safe enough without guards.", next = "BACK", reply = "It is not. It is safe because we stand here.", fx = { align = { order = -1 } } },
        { text = "Who leads the kaldorei?", next = "leaders" },
        { text = "Why are the Sentinels all women?", next = "women" },
        { text = "How does one become a Sentinel?", next = "x_bec" },
        { text = "Where is the Cenarion Enclave?", next = "x_enc" },
        { text = "I'm kaldorei. Should I join?", next = "x_ne", when = { race = "NightElf" } },
        { text = "I'm a stranger here. What should I avoid?", next = "x_out", when = { faction = "Alliance" } },
        { text = "What's the hardest part of guarding a peaceful city?", next = "w_peace" },
        { text = "Farewell, Sentinel.", next = "END" },
      },
    },
    leaders = {
      lines = { { id = "le_default", text = "High Priestess Tyrande leads us from the Temple of the Moon. Archdruid Fandral Staghelm leads the druids from the Cenarion Enclave. The two do not always agree, and the city feels it." } },
      choices = {
        { text = "The priestess should have the final word.", next = "BACK", reply = "Elune guides her. Most of us believe that.", fx = { align = { order = 1 } } },
        { text = "Perhaps two voices are better than one.", next = "BACK", reply = "Perhaps. It certainly makes for long councils.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    women = {
      lines = { { id = "wo_default", text = "For ten thousand years our men slept in the Dream as druids, and we kept watch while they did. Now the druids wake, but the watch is still ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_bec = {
      lines = {
        { id = "xb1", text = "A long apprenticeship on the Warrior's Terrace, followed by an oath to the High Priestess. We learn the glaive, the bow, and patience, and patience is the hardest of the three." },
      },
      choices = {
        { text = "Why is patience hardest?", next = "x_bec2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bec2 = {
      lines = {
        { id = "xb2", text = "Because a Sentinel may stand a hundred years without drawing her blade, and must still be ready on the hundred and first. Many leave before then. Those who remain are the ones the city trusts." },
      },
      choices = {
        { text = "Have you drawn your blade?", next = "x_bec3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bec3 = {
      lines = {
        { id = "xb3", text = "In Ashenvale, against the orcs, and in the gardens once against a satyr who should not have been there. I do not speak of either at length. A Sentinel guards her silence as well as her city." },
      },
      choices = {
        { text = "I understand. Something else.", next = "BACK" },
      },
    },
    x_enc = {
      lines = {
        { id = "xe1", text = "To the east, past the lake, where the druids keep their lodges. Ask for Mathrengyl Bearwalker if you have business there." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Only if you would give your whole heart to it. The Sentinels do not need the half-hearted. Speak to the captains on the Warrior's Terrace, and tell them what your heart tells you." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
    x_out = {
      lines = {
        { id = "xo1", text = "Fire, axes, and loud voices in the Temple of the Moon. Otherwise you are welcome, as long as you remember whose city this is." },
      },
      choices = {
        { text = "I'll remember. Something else.", next = "BACK" },
      },
    },
    w_peace = {
      lines = {
        { id = "w_peace_default", text = "Staying sharp when nothing happens for a hundred nights in a row. The ones who grow careless are the ones who believe the peace is a gift, and not something they make each night by standing here." },
      },
      choices = {
        { text = "How do you stay sharp?", next = "w_peace2" },
        { text = "That's a grim way to see peace.", next = "w_peace2" },
      },
    },
    w_peace2 = {
      lines = {
        { id = "w_peace2_default", text = "I count the faces that pass and look for the one who does not belong. Most nights there is none. On the night there is one, I want to see it before it sees me, and that is the only thing I need from the other hundred nights." },
        { id = "w_peace2_w1", when = { class = "ROGUE" }, text = "You would be that one face, perhaps, on the wrong night. I say it without offence; I simply notice how you stand." },
      },
      choices = {
        { text = "Vigilance is its own reward.", next = "BACK", fx = { align = { order = 1 } }, reply = "It is, though it is a quiet one. Most rewards in this city are." },
        { text = "Sometimes peace really is a gift.", next = "BACK", fx = { align = { order = -1 } }, reply = "Perhaps, from Elune. From the rest of the world, I prefer to stay awake." },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
  },
  topics = {
    sentinels = { { id = "tp_sen", text = "We guard Darnassus, Ashenvale and the High Priestess. We guard them quietly, but we guard them all." } },
    _none = { { id = "tp_none", text = "I do not know, traveller. Ask at the Temple or the Enclave." } },
  },
}

---------------------------------------------------------------------------
-- Lunar Festival Emissary: sends folk to Moonglade during the Lunar Festival.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_lunar_emissary", id = 15892, name = "Lunar Festival Emissary",
  role = "questgiver", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "festive" }, values = { "tradition", "the ancestors" },
  impression = {
    first = "A cheerful druid in festival red and gold, a lantern of moonlight hanging from her staff.",
    third = "{name} met a Lunar Festival Emissary inviting travellers to Moonglade.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Greetings, friend! Moonglade is waiting, and so am I." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Greetings. Moonglade waits. Go, if you like." },
    { id = "g_default", text = "Greetings, friend. The moon is turning, and Moonglade is waiting for you." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival is upon us! Have you been to Moonglade yet? You must, you simply must." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am an emissary of the Cenarion Circle. Each year, at the Lunar Festival, we call all peoples to Moonglade to honour their elders and remember the defeat of Omen." },
        { id = "h_q", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Go to the moonlight at the city's edge and it will carry you to Moonglade. Find Valadar Starsong there; he'll tell you the rest." },
      },
      again = { { id = "h_again_x", text = "More questions? Good. The festival loves the curious." }, { id = "h_again", text = "Anything else about the festival? I could talk about it all night." } },
      choices = {
        { text = "The Lunar Festival honors our ancestors.", next = "BACK", reply = "It does! Join us!", fx = { align = { light = 1 } } },
        { text = "Festivals are a waste of time.", next = "BACK", reply = "Then miss it.", fx = { align = { light = -1 } } },
        { text = "Who was Omen?", next = "omen" },
        { text = "Why honour the elders?", next = "elders" },
        { text = "How do I reach Moonglade?", next = "x_how" },
        { text = "What happens at the festival?", next = "x_fest" },
        { text = "I'm a druid. Should I go?", next = "x_dr", when = { class = "DRUID" } },
        { text = "Do tauren come to the festival?", next = "x_ta", when = { faction = "Alliance" } },
        { text = "Who gave you that moonlight lantern?", next = "w_lantern" },
        { text = "I'll go to Moonglade.", next = "END" },
      },
    },
    omen = {
      lines = { { id = "om_default", text = "A great demon beast who served the Legion in the War of the Ancients. He came to Moonglade, years later, and was driven into Elune's lake, where he sleeps still. Each year we light the sky so he does not wake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elders = {
      lines = { { id = "el_default", text = "Because their wisdom kept our peoples alive. Their spirits wait in cities and wild places across Azeroth, and those who seek them out are given coins of ancestry." } },
      choices = {
        { text = "The old ways deserve honour.", next = "BACK", reply = "They do, and the elders will thank you.", fx = { align = { order = 1 } } },
        { text = "The young should make their own way.", next = "BACK", reply = "They will. But no tree grows without roots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how = {
      lines = {
        { id = "xh1", text = "Through the Timbermaw tunnels from Felwood, or by the druid's road if you are one of us. Some travellers simply follow the lights in the sky, which is less advisable but very pretty." },
      },
      choices = {
        { text = "Are the Timbermaw friendly?", next = "x_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how2 = {
      lines = {
        { id = "xh2", text = "To those who earn it, and they do not ask much, only that you stop killing their cousins. The festival brings many through their tunnels, and they grumble, but they let us pass." },
      },
      choices = {
        { text = "And if they don't trust me?", next = "x_how3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how3 = {
      lines = {
        { id = "xh3", text = "Then go carefully, and say Elune's name and Cenarius's if they stop you. The Timbermaw remember both, and they are kinder to the old names than to new faces." },
      },
      choices = {
        { text = "I'll remember that. Something else.", next = "BACK" },
      },
    },
    x_fest = {
      lines = {
        { id = "xf1", text = "Feasts, fireworks, gifts, and the honouring of elders. Everyone gathers at Nighthaven, Alliance and Horde both, and for those days we remember we were all children of the same world once." },
      },
      choices = {
        { text = "A fine thought. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "You must! Keeper Remulos will be there, and the druids of the Circle open their homes. And you can fly, which saves you a long walk through Felwood. Lucky." },
      },
      choices = {
        { text = "I'll go. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "They do, and many! The Runetotem have been friends of the Cenarion Circle for years. At the festival, we put down our swords and eat together, whatever the generals say." },
      },
      choices = {
        { text = "I'm glad. Something else.", next = "BACK" },
      },
    },
    w_lantern = {
      lines = {
        { id = "w_lantern_default", text = "Keeper Remulos himself, my first year as an emissary, and he lit it with a word I could not hear. It has not gone out once since, not in rain, not in wind, not even when I dropped it in the lake at Nighthaven." },
      },
      choices = {
        { text = "You dropped it in the lake?", next = "w_lantern2" },
        { text = "Remulos must trust you.", next = "w_lantern2" },
      },
    },
    w_lantern2 = {
      lines = {
        { id = "w_lantern2_default", text = "I did, and it lay on the bottom glowing like a fallen star until a tauren druid swam down for it. He laughed so hard he nearly drowned, and now every year at the festival he asks if I have brought my lake lantern, and I always have." },
        { id = "w_lantern2_w1", when = { class = "DRUID" }, text = "You are of the Circle, so you may meet him in Nighthaven, a big Runetotem with braids. Tell him the lantern says hello." },
      },
      choices = {
        { text = "I'll pass that on.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, emissary.", next = "BACK" },
      },
    },
  },
  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Circle keeps the festival, and the festival keeps us all a little kinder." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. Ask me about the festival, though, and I'll talk all night." } },
  },
}

---------------------------------------------------------------------------
-- Lunar Festival Vendor: sells fireworks, lanterns and festive goods.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_lunar_vendor", id = 15898, name = "Lunar Festival Vendor",
  role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "bright", "chatty" }, values = { "celebration", "trade" },
  impression = {
    first = "A vendor surrounded by paper lanterns, firework rockets and little red envelopes, all smelling faintly of gunpowder.",
    third = "{name} browsed the wares of a Lunar Festival Vendor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Fireworks, friend! The best ones are for you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Fireworks, lanterns. Buy, please." },
    { id = "g_default", text = "Fireworks, lanterns and festive dress! Everything a soul needs to light the sky." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "It's the Lunar Festival! Buy a rocket, buy a lantern, and send the old year off with a bang." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I sell for the festival: rockets, clusters of fireworks, lanterns and festive clothing. You pay in coins of ancestry for the good things, and coin of the realm for the rest." },
      },
      again = { { id = "h_again_x", text = "Back for more? I've plenty of rockets left." }, { id = "h_again", text = "See anything you like? The rockets are very popular this year." } },
      choices = {
        { text = "Fireworks light the sky for everyone.", next = "BACK", reply = "They do! Elder or child, everyone looks up when the rockets go.", fx = { align = { light = 1 } } },
        { text = "Fireworks are dangerous.", next = "BACK", reply = "Only if you light them facing the wrong way. Point them at the moon, please, not at the moonwell.", fx = { align = { light = -1 } } },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Why fireworks, of all things?", next = "why" },
        { text = "What are the little red envelopes for?", next = "envelopes" },
        { text = "What's your best firework?", next = "x_best" },
        { text = "Isn't fire forbidden in Darnassus?", next = "x_fire" },
        { text = "Got anything a gnome would love?", next = "x_gn", when = { race = "Gnome" } },
        { text = "Fireworks? I'm an engineer.", next = "x_en", when = { profession = "Engineering" } },
        { text = "What do the Darnassians buy from you?", next = "w_buy" },
        { text = "Goodbye.", next = "END" },
      },
    },
    envelopes = {
      lines = { { id = "en_default", text = "Those are for giving, friend, not keeping. You tuck a gift inside and hand it to someone you're glad of, and the luck of the new year goes with it. I sell a great many to Sentinels, oddly enough." } },
      choices = {
        { text = "Where do the coins of ancestry come from?", next = "coins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coins = {
      lines = { { id = "co_default", text = "From the elders, of course! Find their spirits across the world, honour them, and each one gives you a coin. Bring those to me and you'll find I have very fine things indeed." } },
      choices = { { text = "Then I'd better start looking.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wh_default", text = "The druids say the lights keep Omen asleep under the lake. Personally, I think people simply like explosions." } },
      choices = {
        { text = "It's a sacred tradition. Respect it.", next = "BACK", reply = "Of course, of course. Sacred explosions, then.", fx = { align = { order = 1 } } },
        { text = "You're right. Explosions are the best part.", next = "BACK", reply = "Finally, someone who understands! Here, look at this one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_best = {
      lines = {
        { id = "xb1", text = "The cluster rocket, without a doubt. It goes up, it splits, it bursts in colours, and then everyone below says ooh, and I sell three more. It's the best kind of business." },
      },
      choices = {
        { text = "Where do you get them?", next = "x_best2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_best2 = {
      lines = {
        { id = "xb2", text = "From a dwarf in Ironforge who makes them in the winter, and he gets the powder from a goblin, and the goblin gets it from somewhere I'd rather not ask about. It all works out." },
      },
      choices = {
        { text = "Sounds a little dangerous.", next = "x_best3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_best3 = {
      lines = {
        { id = "xb3", text = "Only a little! I've lost an eyebrow, a hat, and a very good scarf, but never a customer. That's my rule, and I keep it." },
      },
      choices = {
        { text = "A good rule. Something else.", next = "BACK" },
      },
    },
    x_fire = {
      lines = {
        { id = "xf1", text = "It's frowned on, and that's why I sell them only in Moonglade and only to light the sky. The Sentinels watch me closely, and I watch my rockets even more closely." },
      },
      choices = {
        { text = "Wise of you. Something else.", next = "BACK" },
      },
    },
    x_gn = {
      lines = {
        { id = "xg1", text = "The festive rocket pack, which I'm told your people take apart to see how it works. Please don't do that in the shop. The last gnome who tried did set off half my stock." },
      },
      choices = {
        { text = "I'll be careful. Something else.", next = "BACK" },
      },
    },
    x_en = {
      lines = {
        { id = "xe1", text = "An engineer! Then you'll appreciate the craftsmanship, and maybe you'll stop pointing out the flaws. Everyone with a wrench tells me what's wrong with my rockets." },
      },
      choices = {
        { text = "No promises. Something else.", next = "BACK" },
      },
    },
    w_buy = {
      lines = {
        { id = "w_buy_default", text = "Lanterns, mostly, and they look at the rockets the way a cat looks at a bath. A priestess bought one cluster rocket last year, very solemnly, and told me it was for a lesson on humility, and she would not tell me who was going to be humbled." },
      },
      choices = {
        { text = "Did you ever find out?", next = "w_buy2" },
        { text = "Lanterns are a safer choice.", next = "w_buy2" },
      },
    },
    w_buy2 = {
      lines = {
        { id = "w_buy2_default", text = "A novice told me later that she set it off over the lake for her students, and when they had finished gasping she said that was how small they were next to the stars. It's the best use anyone's ever found for my stock, if you ask me." },
        { id = "w_buy2_w1", when = { race = "Gnome" }, text = "Your folk would have taken it apart first, I know. I sold one to a gnome in Moonglade, and he came back with three rockets made out of it." },
      },
      choices = {
        { text = "A lesson with a bang.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_dmf", text = "The Darkmoon Faire's got better fireworks than me, I'll admit, but they don't do the Lunar Festival, do they?" } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about rockets." } },
  },
}

---------------------------------------------------------------------------
-- Treant Ally: a young treant called up to fight beside the kaldorei.
---------------------------------------------------------------------------
P:NPC {
  key = "dar_treant_ally", id = 5806, name = "Treant Ally",
  role = "soldier", tier = "service",
  communities = { "darnassus" }, temper = { "young", "earnest" }, values = { "the forest", "loyalty" },
  impression = {
    first = "A small treant, its bark still green and soft, shuffles beside you with the eagerness of a sapling.",
    third = "{name} walked for a time with a young Treant Ally.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Hroom! Friend! I am so glad to help you! Point me at something!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hroom. I am here to help. Point me at something. Not you." },
    { id = "g_default", text = "Hroom! Hello! I am here to help. Point me at something, and I will help it fall down." },
    { id = "g_back", when = { metBefore = true }, text = "Hmmm! You again. I am pleased. I am still learning what pleased feels like, but I think this is it." },
  },
  start = "hello",
  nodes = {
    ysafe = {
      lines = {
        { id = "ybdartreantally1", text = "Hroom. Stand in a sunny place, and grow very slowly, and let the birds live in my hair. That sounds very nice. But the druids say the forest is never all safe, so I will keep helping. Hroom." },
        { id = "ybdartreantally2", when = { class = "DRUID" }, text = "Maybe you will stand beside me, when you are old. We could grow together. Hroom." },
      },
      choices = {
        { text = "Treants are good allies.", next = "BACK", reply = "Hroom! Yes! Thank you!", fx = { align = { order = 1 } } },
        { text = "Treants are too slow to help.", next = "BACK", reply = "Hroom. Slow, but strong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydarn = {
      lines = {
        { id = "ydartreantally1", text = "Hroom! It is a city in a tree, and the tree is very big and very old. I asked it how it feels, and it said it feels heavy. I think it means the people. I told it they are light, but it did not believe me." },
        { id = "ydartreantally2", when = { race = "NightElf" }, text = "Hmmm. Your tree is tired, I think. Be kind to it. It holds you all up." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hmmm. I was called up from the wood not long ago. The druids say I am an ally, so I am being one. Hroom. It is my first job." },
      },
      again = { { id = "h_again_x", text = "Hroom! More talking! I like this part." }, { id = "h_again", text = "Hmmm? Is there more to talk about? I like talking. It is like rustling, but with meaning." } },
      choices = {
        { text = "What is it like, being newly woken?", next = "woken" },
        { text = "Who should we fight?", next = "fight" },
        { text = "Who woke you?", next = "x_who" },
        { text = "What do you think of me?", next = "x_me" },
        { text = "I'm a druid too.", next = "x_dr", when = { class = "DRUID" } },
        { text = "Do you like night elves?", next = "x_ne", when = { race = "NightElf" } },
        { text = "Do you like Darnassus?", next = "ydarn" },
        { text = "What will you do when the forest is safe?", next = "ysafe" },
        { text = "What's the most surprising thing you've seen?", next = "w_surprise" },
        { text = "Come on, little friend.", next = "END" },
      },
    },
    woken = {
      lines = { { id = "wo_default", text = "Hroom. Everything is very loud and very fast. The birds are much bigger than I thought. The older trees tell me I will grow used to it in a few hundred years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fight = {
      lines = { { id = "fi_default", text = "Hmmm. The druids say anything that hurts the forest. The furbolgs who went mad, the creatures of the corruption, the ones with axes. I do not like the ones with axes." } },
      choices = {
        { text = "Then we'll protect every tree we can.", next = "BACK", reply = "Hroom! Yes! Every tree!", fx = { align = { light = 1 } } },
        { text = "Some trees have to fall so people can live.", next = "BACK", reply = "Hmmm. I do not like that. I will think about it for a century.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "Hmmm. A druid, with leaves in her hair and a soft voice. She sang to the old oak I was part of, and then I was standing, and then I was walking. Hroom. Very surprising." },
      },
      choices = {
        { text = "Do you remember being an oak?", next = "x_who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who2 = {
      lines = {
        { id = "xw2", text = "Hmmm. A little. It was slow and warm, and rain felt very nice. Now rain feels nice too, but I have to stand still to enjoy it, and you keep walking. Hroom." },
      },
      choices = {
        { text = "Would you go back?", next = "x_who3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_who3 = {
      lines = {
        { id = "xw3", text = "Hmmm... not yet. I want to see more things first. Maybe in a thousand years I will be an oak again, and I will remember walking. Hroom. That would be a good memory." },
      },
      choices = {
        { text = "It would. Something else.", next = "BACK" },
      },
    },
    x_me = {
      lines = {
        { id = "xm1", text = "Hroom! You are short, and fast, and you have very good boots. I like you. You are not cutting any trees, which is good, and you talk to me, which is better." },
      },
      choices = {
        { text = "Thank you, I think. Something else.", next = "BACK" },
      },
    },
    x_dr = {
      lines = {
        { id = "xd1", text = "Hmmm! Then you are like the one who woke me. Do you sing to trees too? Maybe you will wake one someday, and then I will have a little friend." },
      },
      choices = {
        { text = "Maybe I will. Something else.", next = "BACK" },
      },
    },
    x_ne = {
      lines = {
        { id = "xn1", text = "Hroom. Yes, very much. They are quiet, and they do not shout. The druids are the best ones. They talk to trees on purpose, and nobody laughs at them." },
      },
      choices = {
        { text = "That's kind. Something else.", next = "BACK" },
      },
    },
    w_surprise = {
      lines = {
        { id = "w_surprise_default", text = "Hroom! A squirrel. It ran up my leg and sat on my head, and I did not know what to do, so I stood very still for the whole afternoon. The druid said it was making a nest. Hmmm. I am a little proud." },
      },
      choices = {
        { text = "Is the squirrel still there?", next = "w_surprise2" },
        { text = "You make a fine tree to nest in.", next = "w_surprise2" },
      },
    },
    w_surprise2 = {
      lines = {
        { id = "w_surprise2_default", text = "Hroom, no, it moved to a proper tree, which hurt my feelings a little. But it comes back sometimes, and sits on my shoulder, and tells me things very quickly that I do not understand. I think we are friends. Hmmm. I think that is what friends are." },
        { id = "w_surprise2_w1", when = { class = "HUNTER" }, text = "Hmmm! You have a friend that follows you too. Does it talk to you very quickly as well, or only slowly, like me?" },
      },
      choices = {
        { text = "That's exactly what friends are.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Come on, little friend.", next = "BACK" },
      },
    },
  },
  topics = {
    teldrassil = { { id = "ydartreantally3", text = "The very big tree. It feels heavy, it says. Hroom." } },
    cenarion_circle = { { id = "tp_cc", text = "Hroom. The Circle druids are my friends. They woke me, and they tell me who to help." } },
    _none = { { id = "tp_none", text = "Hmmm. I do not know that. I am very new. Ask an old tree. Hroom." } },
  },
}
