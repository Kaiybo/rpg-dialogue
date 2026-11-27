-- Elwynn folk a roster scan found missing, part two: Eastvale Logging Camp (Eldrin the tailor and the
-- camp's children Eric, Jay, Kevin, Kyle and Solomon), Morley Eberlein in the Tower of Azora, and the
-- three merchants in Westbrook Garrison's store room (Quartermaster Hicks, Quartermaster Hudson,
-- Veldan Lightfoot). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Eric: an Eastvale child who watches the loggers and wants an axe of his own.
P:NPC {
  key = "eric_eastvale", id = TODO_NPC("Eric"), name = "Eric", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "eager" }, values = { "strong" }, notices = { "kit" },
  impression = {
    first = "Eric hangs about the Eastvale Logging Camp with a stick over his shoulder like a woodsman's axe. He knows which tree every logger is cutting and how long it ought to take.",
    third = "{name} met Eric, a boy at the Eastvale Logging Camp who means to be a logger.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! I told everyone you'd come back and fight the wolves, and they didn't believe me!" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. I don't like you, and I'm going to get my own axe so I don't need you." },
    { id = "g_default", text = "Hello! Are you here to help with the wolves? Everybody who comes with a sword is here about the wolves." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you get any wolves? How many?" },
  },
  notice = {
    { id = "n_axe", cat = "kit", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "Is that a real axe? The loggers won't let me hold theirs, not even the little one for kindling." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Eric. I'm going to be a logger when I'm big, and I already know how to tell which way a tree's going to fall, mostly." } },
      again = {
        { id = "h_again", text = "What else? I know loads about the camp." },
        { id = "h_again2", text = "Ask me another one!" },
      },
      choices = {
        { text = "How do you tell which way it falls?", next = "fall" },
        { text = "Tell me about the wolves.", next = "wolves" },
        { text = "Who else plays around the camp?", next = "others" },
        { text = "Who in the camp is your family?", next = "yfamily" },
        { text = "What's the biggest tree ever cut here?", next = "ybig" },
        { text = "I'm a dwarf. We know about axes.", next = "ydwarf", when = { race = "Dwarf" } },
        { text = "Keep clear of the saws, Eric.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "You look where the heavy branches are, and where they cut the notch, and then you stand on the other side. I only got it wrong once, and Supervisor Raelen shouted so loud the horses jumped." } },
      choices = {
        { text = "What did the Supervisor say?", next = "raelen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raelen = {
      lines = { { id = "r_default", text = "That I'm to stay behind the woodpile till I'm taller than it. I measure myself against it every morning, and I've only got about two logs to go." } },
      choices = { { text = "Two logs isn't long. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wolves = {
      lines = { { id = "w_default", text = "They come right up to the edge of the cutting now, the big grey ones, and the bears as well. The men won't go out to the far trees without a guard, so there's less chopping to watch, and it's boring." } },
      choices = { { text = "I'll see what I can do. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "There's Jay, who's my friend, and Solomon, who's older and thinks he's in charge of us. Kevin and Kyle have to stay in the house, so we shout to them through the window." } },
      choices = { { text = "A good crew. Something else.", next = "BACK" } },
    },
    yfamily = {
      lines = { { id = "yf_default", text = "My dad's a feller, the best one in the camp, and he can put a tree down so straight you could lay a ruler on it. Mum cooks for all the loggers, so I eat with forty men every night, and they all tell me off for the same things." } },
      choices = {
        { text = "Is your father worried about the wolves?", next = "ywolfdad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywolfdad = {
      narr = "He scuffs a wood chip with his boot and doesn't look up.",
      lines = { { id = "ywd_default", text = "He won't say, but he sharpens his axe twice now, once for trees and once for something else. Some of the men want to burn back the woods so the wolves have nowhere to hide. Dad says the forest was here first. Who's right?" } },
      choices = {
        { text = "Burn it back. The camp must be safe.", next = "BACK", reply = "That's what Mister Fenwick says. He's very loud about it.", fx = { align = { light = -1 } } },
        { text = "Your dad. Don't burn the forest.", next = "BACK", reply = "I'll tell him you said so. He'll like that.", fx = { align = { light = 1 } } },
      },
    },
    ybig = {
      lines = { { id = "yb_default", text = "An oak so old it had a hollow you could stand up in, and when it came down the whole camp shook and the birds went up all at once. They sent it to Stormwind for the cathedral roof, the Supervisor said, so a bit of Eastvale is holding up the Light." } },
      choices = {
        { text = "That's a proud thing for a camp.", next = "yproud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yproud = {
      lines = { { id = "yp_default", text = "It is! When I'm grown I'm going to cut one even bigger, and they'll put it in the King's own keep, and I'll go and knock on it and say, that one's mine." } },
      choices = { { text = "I believe you will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ydwarf = {
      lines = {
        { id = "ydw_default", text = "Dwarves use axes for fighting, though, don't they, not trees? Dad says a fighting axe is the wrong shape for felling, too thin in the bit, but I'd still like to hold one, just for a moment." },
        { id = "ydw_warrior", when = { class = "WARRIOR" }, text = "And you're a warrior too! Dad says a fighting axe is the wrong shape for felling, too thin in the bit, but I'd still like to hold yours, just for a moment, with both hands." },
      },
      choices = { { text = "Maybe when you're older. Something else.", next = "BACK" } },
    },
  },
  topics = {
    raelen = { { id = "yt_raelen", text = "Supervisor Raelen shouts a lot, but he knows the name of every tree in the cutting." } },
    wolves = { { id = "yt_wolves", text = "The grey wolves come right up to the woodpile now. The men carry axes even to the privy." } },
    background = { { id = "tp_bg", text = "I live at the logging camp. It's the best place, because there's always something falling over." } },
    _none = { { id = "tp_none", text = "I don't know. Is it to do with trees? I only really know trees." } },
  },
}

-- Jay: an Eastvale child who would rather be at the stables than the woodpile.
P:NPC {
  key = "jay_eastvale", id = TODO_NPC("Jay"), name = "Jay", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "gentle" }, values = { "kind" }, notices = { "mount" },
  impression = {
    first = "Jay drifts from the woodpile to the stable fence at the Eastvale Logging Camp whenever nobody is watching him. He knows the horses by name and spoke of them more warmly than of most people.",
    third = "{name} met Jay, a boy at the Eastvale Logging Camp who loves the stable horses.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! I found a horseshoe by the stables, and I'll show you, but it's a secret." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. The horses don't like you, and I don't either." },
    { id = "g_default", text = "Hello. Did you come on a horse? I didn't hear one, and I always listen for them." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The chestnut mare had her shoes done since you were here, and she didn't like it one bit." },
  },
  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Oh, you've brought one! May I stroke his nose? I'll go slowly, so he knows I'm coming." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Jay. Eric likes watching the trees come down, but I'd sooner be over at the Hunters' stables, because the horses don't shout and they remember you." } },
      again = {
        { id = "h_again", text = "Was there anything else? I don't mind." },
        { id = "h_again2", text = "You can ask me about the horses, if you like." },
      },
      choices = {
        { text = "Which horse is your favourite?", next = "favourite" },
        { text = "Do the Hunters let you help?", next = "help" },
        { text = "You're a quiet one for a logging camp.", next = "quiet" },
        { text = "Do you ever ride the horses?", next = "yride" },
        { text = "What worries you about the camp?", next = "yworry" },
        { text = "I'm a hunter. My pet's a beast too.", next = "ypet", when = { class = "HUNTER" } },
        { text = "Goodbye, Jay.", next = "END" },
      },
    },
    favourite = {
      lines = { { id = "f_default", text = "The chestnut mare, because she puts her whole head over the fence when she sees me. Katie says she does that to everybody with an apple, but I haven't always got an apple, and she still does it." } },
      choices = {
        { text = "Then she likes you for yourself.", next = "herself" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herself = {
      lines = { { id = "hs_default", text = "That's what I think as well. I'm going to buy her when I'm grown, if nobody else has, and I count the people who come to look at her and hope they all choose the pinto." } },
      choices = { { text = "I'll choose the pinto, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    help = {
      lines = { { id = "hp_default", text = "Randal lets me carry the water and fill the hay nets, as long as I stay out from behind them. He says a horse can't see what's behind it, so that's where it kicks, and I've never forgotten." } },
      choices = { { text = "Good sense. Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It's loud enough here without me adding to it, with the saws and Supervisor Raelen and Eric. If you're quiet the animals come nearer, and I saw a fawn at the edge of the trees once, before the wolves got so many." } },
      choices = { { text = "That's worth being quiet for. Something else.", next = "BACK" } },
    },
    yride = {
      lines = { { id = "yr_default", text = "Only once, round the paddock on the old grey, with Randal holding the rope. I sat up so straight he said I looked like a knight, and I didn't fall off, though I wanted to when she trotted." } },
      choices = {
        { text = "Would you like to be a knight?", next = "yknight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yknight = {
      lines = { { id = "yk_default", text = "No, I don't think so, because knights ride horses into fighting, and the horses don't get asked. I'd rather be the one who looks after them afterwards, and brushes the mud out, and tells them they were brave." } },
      choices = { { text = "That's a kind ambition. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yworry = {
      narr = "He glances toward the stable fence, where a horse stamps restlessly.",
      lines = { { id = "ywo_default", text = "That the wolves will get one of the horses one night. Katie says if they do, the guards will go out and kill every wolf in the woods, mothers and cubs and all. Is that right, do you think, or just angry?" } },
      choices = {
        { text = "Protect the horses. The wolves must go.", next = "yworry2", reply = "I suppose so. I just wish they'd stay in the hills.", fx = { align = { light = -1 } } },
        { text = "Just angry. Take only the ones that hunt.", next = "yworry2", reply = "That's what I'd do too, if I was a guard.", fx = { align = { light = 1 } } },
      },
    },
    yworry2 = {
      lines = { { id = "yw2_default", text = "Randal says the wolves are only hungry, because the logging pushed the deer back into the hills. So it's sort of our fault, but we still need the wood, and that's a knot I can't untie." } },
      choices = { { text = "Grown-ups can't untie it either. Something else.", next = "BACK" } },
    },
    ypet = {
      lines = {
        { id = "yp_default", text = "Oh, look at {pet}! May I say hello? I'll hold my hand flat, the way Randal taught me, so {pet} can smell me first and decide." },
        { id = "yp_tauren", when = { race = "NightElf" }, text = "Oh, look at {pet}! Do the elves really talk to their animals? I'll hold my hand flat the way Randal taught me, so {pet} can smell me first and decide." },
      },
      choices = { { text = "{pet} likes you. Something else.", next = "BACK", reply = "I knew it! Animals always know.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    katie = { { id = "yt_katie", text = "Katie Hunter talks to every traveller who comes through, and she always knows the gossip from Goldshire first." } },
    horses = { { id = "yt_horses", text = "The chestnut mare, the old grey and the pinto. The pinto bites, but only people she doesn't like." } },
    background = { { id = "tp_bg", text = "I live at the camp, and I go to the stables every day I'm let." } },
    _none = { { id = "tp_none", text = "I don't know about that, sorry. Katie Hunter might, since she talks to all the travellers." } },
  },
}

-- Kevin: one of two boys kept indoors at Eastvale; restless, and the plotter of the pair.
P:NPC {
  key = "kevin_eastvale", id = TODO_NPC("Kevin"), name = "Kevin", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "restless" }, values = { "daring" }, notices = { "kit" },
  impression = {
    first = "Kevin paces the floor of a house at the Eastvale Logging Camp like a small prisoner planning his escape. He is kept in because of the wolves, and he has worked out several ways around that.",
    third = "{name} met Kevin, a restless boy kept indoors at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! Come here, I've got a plan for sneaking out, and you're in it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Mum says I'm not to talk to you, and for once I'll do as she says." },
    { id = "g_default", text = "Did you come in from outside? What's it like out there today? We aren't allowed." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! Are the wolves gone yet? Please say the wolves are gone." },
  },
  notice = {
    { id = "n_rogue", cat = "kit", when = { class = "ROGUE" },
      text = "You walk ever so quietly. Could you show me how, for getting past doors and things?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Kevin, and that's Kyle. We have to stay in the house till the wolves stop coming up to the camp, and it's been days and days, and I've counted every board in this floor." } },
      again = {
        { id = "h_again", text = "What else? I've got all day, and so has Kyle." },
        { id = "h_again2", text = "Ask me something, anything, it's so dull in here." },
      },
      choices = {
        { text = "How many boards are there?", next = "boards" },
        { text = "Have you tried to slip out?", next = "slip" },
        { text = "The wolves are real enough, Kevin.", next = "real" },
        { text = "What will you do when you're let out?", next = "yout" },
        { text = "Where are your parents now?", next = "yparents" },
        { text = "I could teach you to hide in shadows.", next = "yshadow", when = { class = "ROGUE" } },
        { text = "Hold fast in there, Kevin.", next = "END" },
      },
    },
    boards = {
      lines = { { id = "b_default", text = "A hundred and twelve downstairs, and the fourth one from the door squeaks. Kyle says it's a hundred and thirteen, but he counted the doorstep, and a doorstep isn't a board." } },
      choices = { { text = "I side with you on doorsteps. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    slip = {
      lines = { { id = "s_default", text = "Twice by the door and once by the window, and I got as far as the woodpile the second time. Eric saw me and waved, which gave it all away, so now I've a new plan that doesn't have Eric in it." } },
      choices = {
        { text = "What's the new plan?", next = "plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan = {
      lines = { { id = "p_default", text = "I can't tell you all of it, but it's got a blanket and the squeaky board in it, and Kyle has to cough at the right time. He keeps coughing too early, so we're still practising." } },
      choices = { { text = "Practice makes perfect. Something else.", next = "BACK" } },
    },
    real = {
      lines = { { id = "r_default", text = "I know they are, because I heard them last night, right up by the horses. I'm not scared, I only want to see one from a long way off, with somebody big standing next to me." } },
      choices = { { text = "That's the right way to see one. Something else.", next = "BACK" } },
    },
    yout = {
      lines = { { id = "yo_default", text = "Run all the way to the river and back without stopping, and then climb the woodpile, and then go and look at the sawmill blade, which I'm not allowed near. Then I'll probably come back in for supper, if I'm honest." } },
      choices = {
        { text = "Why aren't you allowed near the blade?", next = "yblade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yblade = {
      lines = { { id = "ybl_default", text = "Because it took two fingers off a man called Old Wendel, years ago, before I was born. He shows them to us, or the gap where they were, and Kyle goes white every single time, which is half the fun." } },
      choices = { { text = "Listen to Old Wendel. Something else.", next = "BACK" } },
    },
    yparents = {
      narr = "He sits down on the squeaky board, which squeaks.",
      lines = { { id = "ypa_default", text = "Father's out at the far cutting with the guards, and Mother sews sacks for the mill. They come in at dark and lock the door and talk in low voices, and once I heard Mother say we should go to Stormwind, where there are walls." } },
      choices = {
        { text = "Would you like to go?", next = "ygo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygo = {
      lines = { { id = "yg_default", text = "No! Stormwind's all stone and nobody would know us. Father says you don't leave your home for a few wolves. Mother says you leave it for your children. What would you do?" } },
      choices = {
        { text = "Stay and hold your home.", next = "BACK", reply = "That's what Father says! I'm on his side.", fx = { align = { order = 1 } } },
        { text = "Go somewhere safe. Homes can be rebuilt.", next = "BACK", reply = "I suppose Mother is right sometimes. Don't tell Father.", fx = { align = { order = -1 } } },
      },
    },
    yshadow = {
      lines = {
        { id = "ysh_default", text = "Would you really? Then I'd go past the window and Kyle wouldn't even see me, and that would show him. Only you'd better not, actually, because Mother would know it was you and she'd give you such a look." },
        { id = "ysh_halfling", when = { race = "Gnome" }, text = "Would you really? You're small enough to hide anywhere! Only better not, because Mother would know it was you and she'd give you such a look, the kind that goes right through walls." },
      },
      choices = { { text = "Another day, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    kyle = { { id = "yt_kyle", text = "Kyle's my cousin. He's careful about everything, which is useful, but he never ever wants to have any fun." } },
    wolves = { { id = "yt_wolves", text = "I've heard them howling at night by the horses. I want to see one, just once, from very far away." } },
    background = { { id = "tp_bg", text = "I live here at the camp, in this house, and lately only in this house." } },
    _none = { { id = "tp_none", text = "I don't know. I haven't been outside in ages, so I don't know anything new." } },
  },
}

-- Kyle: the other boy kept indoors at Eastvale; the careful one, who has made his peace with it.
P:NPC {
  key = "kyle_eastvale", id = TODO_NPC("Kyle"), name = "Kyle", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "careful" }, values = { "sensible" }, notices = { "wonder" },
  impression = {
    first = "Kyle walks the same slow circuit of a house at the Eastvale Logging Camp and seems to have made a game of it. He is the careful one of the two boys shut in there, and keeps an eye on the other.",
    third = "{name} met Kyle, a careful boy kept indoors at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hi! I've been practising being brave about staying inside, like you're brave outside." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're mean, and I'm telling, and you still have to wipe your feet." },
    { id = "g_default", text = "Hello. Wipe your feet, please, because we get the blame for the mud whoever brings it in." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. Kevin's still here, in case you wondered, and so that's one more day I've managed." },
  },
  notice = {
    { id = "n_healer", cat = "wonder", when = { class = { "PRIEST", "PALADIN" } },
      text = "Are you one of the ones who can mend people with the Light? One of the loggers got bitten, and a brother came from the abbey and did that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Kyle. I walk round and round the house, since there's nowhere else to walk, and I make sure Kevin doesn't climb out of anything while I'm at it." } },
      again = {
        { id = "h_again", text = "Did you want to know something else? I'll keep walking, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Don't you mind being shut in?", next = "mind" },
        { text = "Kevin tells me there's a plan.", next = "plan" },
        { text = "What do you see from the window?", next = "window" },
        { text = "What do you want to be one day?", next = "ybe" },
        { text = "How did Kevin come to live with you?", next = "ycousin" },
        { text = "I'm a healer. Do you need anything?", next = "yheal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Look after him, Kyle.", next = "END" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "A bit, but I'd mind being eaten more. I saw what a wolf did to one of the cart horses' legs, and after that I thought the house was a very good house." } },
      choices = { { text = "Sensible lad. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    plan = {
      lines = { { id = "p_default", text = "There's always a plan, and my part is to cough. I cough too early on purpose, every time, and he hasn't worked that out yet." } },
      choices = {
        { text = "That's rather clever of you.", next = "clever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clever = {
      lines = { { id = "c_default", text = "Please don't tell him, because he'd only think of a plan without coughing in it. When the wolves are gone I'll cough at the right time and he can have his adventure, as far as the woodpile." } },
      choices = { { text = "Not a word. Something else.", next = "BACK" } },
    },
    window = {
      lines = { { id = "w_default", text = "The sawmill and the stable fence, and Marshal Haggard's porch if you lean. Eric and Jay come and shout up what's happening, and Jay tells it properly but Eric makes every wolf twice as big." } },
      choices = { { text = "Trust Jay's count, then. Something else.", next = "BACK" } },
    },
    ybe = {
      lines = { { id = "yb_default", text = "A brother at Northshire Abbey, like the one who came and mended the logger. He didn't shout or hurry, he just put his hands on the bite and spoke very quietly, and it closed. I want to be that kind of person." } },
      choices = {
        { text = "The abbey would welcome you.", next = "yabbey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yabbey = {
      lines = { { id = "yab_default", text = "Father says the Light is for people with patience, and I've got lots, from minding Kevin. I've been practising the quiet voice on him, but it only makes him suspicious." } },
      choices = { { text = "Keep practising. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ycousin = {
      narr = "He stops walking his circuit and looks at the floor.",
      lines = { { id = "yc_default", text = "His mother is my aunt, and they lived on a farm near the Brackwell pumpkin patch till the Defias burned the barn. They came here with only one cart. Kevin doesn't remember much, and nobody tells him, and I'm not sure if I should." } },
      choices = {
        { text = "Tell him. He deserves the truth.", next = "ycousin2", reply = "Maybe when he's older. When he stops climbing things.", fx = { align = { honor = 1 } } },
        { text = "Let him be. Some truths can wait.", next = "ycousin2", reply = "That's what Aunt says. I'll keep it, then.", fx = { align = { honor = -1 } } },
      },
    },
    ycousin2 = {
      lines = { { id = "yc2_default", text = "Either way, that's why I watch him so close. He's already lost one house, and I don't want him to lose anything else, even if it's only his fingers to the sawmill blade." } },
      choices = { { text = "He's lucky to have you. Something else.", next = "BACK" } },
    },
    yheal = {
      lines = {
        { id = "yh_default", text = "No, thank you, I'm well, only bored. But could you tell me the quiet words the brother used, the ones that close a wound? I'd only use them on Kevin, and only when he's really hurt himself." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "No thank you, I'm well. Do dwarves pray to the Light too? I thought you only prayed to stone, but the brother says the Light goes everywhere, even under mountains." },
      },
      choices = { { text = "They're learned at the abbey. Something else.", next = "BACK" } },
    },
  },
  topics = {
    abbey = { { id = "yt_abbey", text = "Northshire Abbey is where the brothers learn the Light. One day I'm going to walk there and ask to join." } },
    haggard = { { id = "yt_haggard", text = "Marshal Haggard lives in the house with the porch. He says we're the best-behaved prisoners he's ever had." } },
    background = { { id = "tp_bg", text = "I live at the logging camp, and for now I live indoors. It isn't so bad once you've got a route." } },
    _none = { { id = "tp_none", text = "I don't know that. You'd do better to ask a grown-up outside." } },
  },
}

-- Solomon: the eldest of the Eastvale children, self-appointed watchman of the camp.
P:NPC {
  key = "solomon_eastvale", id = TODO_NPC("Solomon"), name = "Solomon", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "solemn" }, values = { "dutiful" }, notices = { "soldier" },
  impression = {
    first = "Solomon stands about the Eastvale Logging Camp with his arms folded, as near to Marshal Haggard's manner as a boy can get. He considers himself responsible for the younger ones, and for me too while I was in sight.",
    third = "{name} met Solomon, the eldest of the children at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back. I've been keeping watch, and I've a secret about the camp I'll only tell you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're not welcome in my camp, and I'm telling Marshal Haggard." },
    { id = "g_default", text = "Good day. If you've business in the camp, Marshal Haggard's house is the one with the porch, and I can show you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, then. Nothing's got past me since you left, if you were wondering." },
  },
  notice = {
    { id = "n_guard", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're a proper fighter. Guard Thomas says a watchman's first duty is to notice things, and I noticed you from the bridge road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Solomon, and I keep watch here. Nobody asked me to, but the guards are stretched thin and somebody has to mind the little ones." } },
      again = {
        { id = "h_again", text = "Is there anything else? I'm on watch, but I can spare a moment." },
        { id = "h_again2", text = "Go on, I'm listening, and watching the tree line too." },
      },
      choices = {
        { text = "What does your watch cover?", next = "watch" },
        { text = "Who are the little ones?", next = "little" },
        { text = "You sound like the Marshal.", next = "marshal" },
        { text = "Why did no one ask you to watch?", next = "ywhy" },
        { text = "Have you ever been beyond Eastvale?", next = "ybeyond" },
        { text = "I serve in the Alliance's army.", next = "yarmy", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Carry on, watchman.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "From the sawmill to the stable fence, and the road as far as I can see it. If a wolf comes out of the trees I'm to shout for a guard and not do anything brave, and I've promised that." } },
      choices = {
        { text = "Have you had to shout yet?", next = "shout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shout = {
      lines = { { id = "s_default", text = "Once, at dusk, when a grey one came for the horses. The guard was there before I'd finished shouting, and afterwards Marshal Haggard nodded at me, which he doesn't do for anybody." } },
      choices = { { text = "You earned that nod. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    little = {
      lines = { { id = "l_default", text = "Eric and Jay, who never stay where they're put, and Kevin and Kyle, who are shut in the house and oughtn't to get out. Kevin tries most days, so I check the window on every round." } },
      choices = { { text = "They're in good hands. Something else.", next = "BACK" } },
    },
    marshal = {
      lines = { { id = "m_default", text = "Do I? I've been practising. I'm going to join the Stormwind guard as soon as they'll have me, and I'd like to be posted here, since I already know where everything is." } },
      choices = { { text = "They'd be wise to take you. Something else.", next = "BACK" } },
    },
    ywhy = {
      lines = { { id = "ywy_default", text = "Because the guards here are all needed at the far cutting, where the wolves are thickest, and the camp's left with three men and a dog. I asked the Marshal if I could help, and he said I could look, so I look, very hard." } },
      choices = {
        { text = "Is three men really enough?", next = "yenough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yenough = {
      narr = "He shifts his grip on the stick he's been carrying like a spear.",
      lines = { { id = "yen_default", text = "No, and everybody knows it. Stormwind sends its soldiers to the borders, and Elwynn gets whatever's left. Some say the King's regent should bring them home, and some say the borders matter more. I don't know which is right." } },
      choices = {
        { text = "The kingdom's borders must come first.", next = "BACK", reply = "I suppose that's why I'm out here with a stick.", fx = { align = { order = 1 } } },
        { text = "Protect the people at home first.", next = "BACK", reply = "That's what the loggers say, every night, loudly.", fx = { align = { order = -1 } } },
      },
    },
    ybeyond = {
      lines = { { id = "ybe_default", text = "As far as the Redridge border once, with my father, to sell a load of planks at Three Corners. The hills there are red as rust, and the guards said the orcs come right down to the lake now. I'd like to see Lakeshire, one day." } },
      choices = {
        { text = "What would you do there?", next = "ylake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylake = {
      lines = { { id = "yla_default", text = "Join the watch on the bridge, maybe, because Redridge needs guards worse than we do. But I'd never go while the little ones are still small enough to get out of windows, so it'll keep." } },
      choices = { { text = "A good watchman thinks like that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yarmy = {
      lines = {
        { id = "yar_default", text = "Then you've done the thing I want to do. Is it true the drill sergeants in Stormwind make you march the whole length of the canals in full mail? I've been carrying the woodpile logs to practise." },
        { id = "yar_dwarf", when = { race = "Dwarf" }, text = "A dwarf soldier! Is it true Ironforge's guards drill in the Great Forge, in all that heat? I've been carrying logs from the woodpile to practise, but that sounds worse." },
      },
      choices = { { text = "Keep carrying logs. Something else.", next = "BACK" } },
    },
  },
  topics = {
    thomas = { { id = "yt_thomas", text = "Guard Thomas on the east bridge taught me what a watch is for. You notice, and then you tell." } },
    wolves = { { id = "yt_wolves", text = "The grey wolves hunt in threes near the cutting. I've marked where they come out on a bit of bark." } },
    background = { { id = "tp_bg", text = "I've lived at the logging camp all my life. I'm the eldest of us, so I look out for the rest." } },
    _none = { { id = "tp_none", text = "I can't say. You should ask the Marshal, and I can take you to him." } },
  },
}

-- Morley Eberlein: clothier on the fourth floor of the Tower of Azora.
P:NPC {
  key = "morley_eberlein", id = TODO_NPC("Morley Eberlein"), name = "Morley Eberlein", title = "Clothier", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service", communities = {},
  temper = { "fussy", "proud" }, values = { "craft", "appearances" }, notices = { "kit" },
  impression = {
    first = "Morley Eberlein keeps a clothier's shop four floors up the Tower of Azora, among mages who notice nothing and gnomes who singe everything. He dresses Theocritus and takes it as a personal wound when the old mage spills something.",
    third = "{name} met Morley Eberlein, the clothier in the Tower of Azora.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite customer, and wearing something tolerable at last! Do come in; I've a bolt I think suits you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need, and please don't touch the grey bolt on your way out." },
    { id = "g_default", text = "You've climbed four flights for a clothier, so you must be in earnest. Do come in, and don't touch the grey bolt." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned, and wearing the same thing, I see. We must talk about that." },
  },
  notice = {
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Now, here's someone who lives in cloth and ought to know better. That hem has been dragged through three counties." },
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank, friend, and I sell nothing that clanks. Mind the mannequin on your way round." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Morley Eberlein, clothier to the Tower of Azora. I keep Theocritus and his household decently covered, which is harder than guarding the place, because a robe has more enemies here than the tower does." } },
      again = {
        { id = "h_again", text = "Was there something further? I've a cuff to finish." },
        { id = "h_again2", text = "Do go on. I can pin and listen." },
      },
      choices = {
        { text = "Fine cloth should be priced by its quality, not its customer.", next = "BACK", reply = "Quite so. I charge the Archmage's servants the same as anyone, even when they spill tea on it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charge the rich ones more; they'll think it's better.", next = "BACK", reply = "They often do think that, which is rather sad. I'd still rather not take advantage of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What enemies does a robe have here?", next = "enemies" },
        { text = "What's it like dressing Theocritus?", next = "theo" },
        { text = "What do you sell?", next = "sell" },
        { text = "He called my robes dreadful.", next = "dreadful", when = { class = "MAGE" } },
        { text = "Where did you learn your trade?", next = "ylearn" },
        { text = "What's the grey bolt you warned me off?", next = "ygrey" },
        { text = "Good day, Master Eberlein.", next = "END" },
      },
    },
    enemies = {
      lines = { { id = "e_default", text = "Ink, candle wax, whatever the gnomes are brewing downstairs, and sparks from experiments nobody admits to. I've mended a burn the exact shape of a gnome's hand, and I've never had a satisfactory account of it." } },
      choices = {
        { text = "The gnomes don't own up?", next = "gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "They apologise at great length and with diagrams, and then they do it again. I'm fond of them, you understand, but I have begun cutting their sleeves an inch short, purely to keep the cloth out of the flames." } },
      choices = { { text = "A tailor's revenge. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    theo = {
      lines = { { id = "t_default", text = "He stands still for a fitting about as well as a cat, and he has opinions about everyone's dress but his own. Still, he keeps a clothier in his tower when most mages keep only dust, and I shan't hear a word against him." } },
      choices = { { text = "Loyal to a fault. Something else.", next = "BACK" } },
    },
    sell = {
      lines = { { id = "s_default", text = "Knitted goods, plain and sound: tunics, trousers, gloves, belts and sandals, such as an apprentice can afford and a master needn't be ashamed of. The finer work I keep for the household, since they ruin it faster than I can make it." } },
      choices = { { text = "Sound and plain suits me. Something else.", next = "BACK" } },
    },
    dreadful = {
      lines = { { id = "d_default", text = "He was being kind, I fear. The cut is passable, but that colour was a mistake before it faded, and no robe should be asked to survive what yours has plainly survived." } },
      choices = { { text = "It has been a hard season. Something else.", next = "BACK" } },
    },
    ylearn = {
      lines = { { id = "yle_default", text = "In the Mage Quarter of Stormwind, under a tailor who dressed half the Kirin Tor's visitors before the war. He used to say a mage judges a robe by its pockets and a noble by its buttons, and he was right on both counts." } },
      choices = {
        { text = "Why leave the city for a tower?", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = { { id = "ylv_default", text = "Because Theocritus offered a steady wage and silence, and the city offered neither. Some of my old guild think it a waste, a master clothier hemming robes in the woods. I think honest quiet work beats flattering lords. What say you?" } },
      choices = {
        { text = "Quiet honest work. You chose well.", next = "BACK", reply = "Thank you. I'll tell my guild a stranger approves.", fx = { align = { honor = 1 } } },
        { text = "A master should go where the money is.", next = "BACK", reply = "Spoken like my old master, and he died rich and miserable.", fx = { align = { honor = -1 } } },
      },
    },
    ygrey = {
      narr = "He glances at the grey bolt as though it might hear him.",
      lines = {
        { id = "yg_default", text = "Cloth Theocritus brought back from somewhere he won't name, and it doesn't take dye, doesn't take a needle, and is faintly cold to the touch. He wants it made into a cloak. I've been putting it off for four months and counting." },
        { id = "yg_mage", when = { class = "MAGE" }, text = "Cloth the archmage brought from somewhere he won't name. It's cold to the touch and refuses every needle, and you'll feel the hum off it from there, I expect. He wants a cloak of it. I've stalled four months." },
      },
      choices = { { text = "Wise to be wary. Something else.", next = "BACK" } },
    },
  },
  topics = {
    theocritus = { { id = "yt_theo", text = "The archmage stands for a fitting like a cat stands for a bath, and pays like a lord. I forgive the first for the second." } },
    tailoring = { { id = "yt_tail", text = "A good seam is invisible, and a bad one is all anyone sees. That's the whole of tailoring, really." } },
    background = { { id = "tp_bg", text = "I'm a clothier by trade, and the tower's by appointment. I came up these stairs years ago and have seldom seen cause to go down them." } },
    _none = { { id = "tp_none", text = "I measure and I cut, friend, and beyond that I know little. Ask Theocritus, on the days he's answering questions." } },
  },
}
