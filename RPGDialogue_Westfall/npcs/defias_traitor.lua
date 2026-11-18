-- The Defias Traitor: turncoat who leads the way to Moonbrook. Voice: bibles/defias_traitor.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "defias_traitor", id = TODO_NPC("Defias Traitor"), name = "Defias Traitor", title = nil,
  bible = "bibles/defias_traitor.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "nervous" }, values = { "survival" },
  impression = {
    first = "The Defias Traitor talks fast and looks over his shoulder while he does it, a man who has sold out his old crew and knows exactly what they'd do to him for it.",
    third = "{name} met the Defias Traitor, a jumpy turncoat who knows the way to the Brotherhood's hideout.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down, will you? If any of my old mates see me talking to you, I'm a dead man." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Are we going or not? Every hour I sit here is another hour for them to find me." },
  },
  start = "hello",
  nodes = {
    dd_traitor_k = {
      lines = {
        { id = "dd_traitor_k_a", text = "Friends is a strong word, but I knew their names, and their wives, and which of them could still lay a straight wall before the Brotherhood got hold of them. They chose their road, and I chose mine, and now I'm the one walking with you." },
      },
      choices = {
        { text = "They chose to rob and burn. They earned their end.", next = "dd_traitor_k2", fx = { align = { light = -1 } } },
        { text = "Stormwind wronged them first. I take no joy in it.", next = "dd_traitor_k2", fx = { align = { light = 1 } } },
      },
    },
    dd_traitor_k2 = {
      lines = {
        { id = "dd_traitor_k2a", text = "Aye, well, that's the argument every man in Moonbrook has had with himself, and I've had it more than most. Let's get this done before I change my mind about which side I'm on." },
      },
      choices = { { text = "Let's get it done, then. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because they'd have hanged me sooner or later, and the Militia pays better for what I know. Don't look at me like that; your spirits can judge me if they want." } },
      choices = {
        { text = "You did right to come forward. Now see it through.", next = "BACK", reply = "I mean to, if my nerve holds and my neck does too. Just walk close, will you, because every hedge looks like a Defias to me now.", fx = { align = { honor = 1 } } },
        { text = "A man who sells one crew will sell the next.", next = "BACK", reply = "Maybe so, and you'd be fool not to think it. But the Brotherhood's the only crew I've ever sold, and they'd sooner kill me than pay me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In threes, with one in front to keep you busy and two coming round the side with knives. They'll pick off the one who stops to help a friend, so keep moving and don't look back, whatever you hear." } },
      choices = {
        { text = "I'll protect anyone who falls, knives or not.", next = "BACK", reply = "Then you're a better friend than any I had in the Brotherhood. Just don't stop for me, because I'll be running too fast to fall.", fx = { align = { honor = 1 } } },
        { text = "Then I'll keep moving and let the slow ones fall.", next = "BACK", reply = "Cold, but it's the only way through, and I'll not be the slow one, I promise you that. My legs have been practising.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where the road narrows by the old farms, and the hedges are thickest. They'll have a man up a tree and two in the ditch, and they'll let you pass, then take me from behind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Where the road narrows by the old farms and the hedges are thickest, with a man up a tree and two in the ditch. Your {pet} will smell them before we see them, I hope, so if its hackles go up, trust it more than me." },
      },
      choices = {
        { text = "I'll get you to Moonbrook alive, traitor or not.", next = "BACK", reply = "Traitor or not, {g:he|she} says, and I'll take it gladly. Get me there breathing, and you can call me anything you like.", fx = { align = { honor = 1 } } },
        { text = "I'll get you there, but my beast comes first.", next = "BACK", reply = "Wonderful, I'm second to a beast, and I suppose that's fair. Tell it to bite the man in the tree first, will you?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "They do: Pillagers, they call them, and they throw fire about like it costs nothing, which to them it doesn't. Where they learned it I never asked, but they've no love for Stormwind's towers, I'll tell you that for free." } },
      choices = {
        { text = "Then they've betrayed the craft as well as the kingdom.", next = "BACK", reply = "Betrayed it gladly, I'd say, and they'll tell you they had reasons. Most of them were turned away from the towers same as the masons were from their wages.", fx = { align = { order = 1 } } },
        { text = "Stormwind threw away a lot of good people. That's on the city.", next = "BACK", reply = "It is, and I'll not pretend otherwise, though it doesn't make me sleep any easier. The city left us, and then we left ourselves.", fx = { align = { order = -1 } } },
        { text = "Where is VanCleef now?", next = "vancleef" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "You've a whiff of sulphur about you, friend, and that frightens me some, I don't mind saying. But the Brotherhood know my face and my name, and you only know my price, so I'll take my chances with you." } },
      choices = {
        { text = "Talk straight with me and you've nothing to fear.", next = "BACK", reply = "Straight is all I've got left, friend, so you'll have it. I'd only ask you keep that whiff to yourself on the road.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell me out and you'll learn what I keep.", next = "BACK", reply = "I'll not sell you, I swear it on what's left of my good name. Not that it's worth much, and not that I'd dare.", fx = { align = { honor = -1 } } },
        { text = "Why did you turn on them?", next = "why" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Peace? If VanCleef's lot catch me on that road, they won't wait while I make it. Say something over me if it pleases you, but say it walking." } },
      choices = {
        { text = "There's forgiveness for men who turn from wrong. Even you.", next = "BACK", reply = "That's a kind thing to say to a man like me, and I'll hold on to it. Walk faster, though, and say the rest when we're through.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forgiveness is wasted on a turncoat. Just walk.", next = "BACK", reply = "Walking, aye, I've been walking since the day I ran. You don't have to forgive me, just get me past the farms.", fx = { align = { light = -1 } } },
        { text = "Never mind. Let's go over the road again.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "You shouldn't, not all the way, and I'd think less of you if you did. I sold them out because they stopped being masons with a grudge and started being killers, and I'd sooner hang a turncoat than live a murderer." } },
      choices = {
        { text = "You turned from murder. I'll guard you with my life for that.", next = "BACK", reply = "Light's mercy, I didn't expect that from a paladin. I'll walk straight and keep my hands where you can see them, all the way to Moonbrook.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man who betrays once betrays twice. I'll be watching you.", next = "BACK", reply = "Watch me all you like, then, and I'll watch the hedges. Between us, we might both live to Moonbrook.", fx = { align = { honor = -1 } } },
        { text = "Something else, before we go.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If you can do that, then you'll spot the lookouts VanCleef keeps in the Moonbrook houses before they spot me. Only don't leave me alone on the road while you're prowling, because I'm the one they want." } },
      choices = {
        { text = "I'll stay at your side, as I promised Stoutmantle.", next = "BACK", reply = "Then I'll stop jumping at shadows, mostly. Stoutmantle was right to trust you, and I'm glad of it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they catch you, that's the price of your choices.", next = "BACK", reply = "And a heavy price it'd be, so I'll thank you to stay close anyway. Prowl if you must, but don't prowl far.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "dd_defias_traitor", when = { killed = { name = "Defias", min = 40 } },
          text = "I've heard about you, you know, because the lads talk about the one in the bandana country who keeps putting them down. Some of those were men I drank with, so forgive me if I don't look you in the eye." },

        { id = "h_default", text = "Gryan Stoutmantle says you're the one taking me to Moonbrook. I'll show you where the Brotherhood hides, but you keep me alive on the road, because they'll be watching for me." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "Right, we're doing this, then. Stay close, keep your blade out and don't stop for anything, not even if they call my name." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You've the look of someone who'd have done well with us, you know. Don't take that wrong, it's meant kindly, more or less." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior escorting me. Good, because the Brotherhood's lot fight dirty, and you look like you can take a knife in the back and keep walking." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. That beast of yours had better have a nose for an ambush, because the Brotherhood will have one waiting." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? Save your prayers for the road, because if the Brotherhood catch us, we'll both be needing them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in all that shining plate. They'll see you coming a mile off, but maybe that'll make them think twice." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid, out here? The Brotherhood won't know what to make of you, and that suits me fine." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman? Keep your voice down. If your spirits can see who's following me, I want to know before they reach me." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I don't like standing still." },
        { id = "h_again2", text = "Go on, ask, but keep one eye on the road while you do." },
      },
      choices = {
        { text = "Some of those men you drank with were friends of yours?", next = "dd_traitor_k", when = { killed = { name = "Defias", min = 40 } } },

        { text = "Why did you turn on them?", next = "why" },
        { text = "Something must be waiting for us in Moonbrook.", next = "moonbrook" },
        { text = "Tell me about Edwin VanCleef.", next = "vancleef" },
        { text = "I ran with the Brotherhood too, once.", next = "kin", when = { class = "ROGUE" } },
        { text = "The Brotherhood have spellcasters of their own, don't they?", next = "xmage", when = { class = "MAGE" } },
        { text = "You fear your old crew more than you fear me.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How do the Defias fight, if they fight dirty?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where would the Brotherhood set an ambush on our road?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you want to make your peace before we walk, friend?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I can't trust a man who betrayed his own crew.", next = "xapala", when = { class = "PALADIN" } },
        { text = "I could prowl ahead as a cat and find their lookouts.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why did you turn on the Defias?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My father was a Stonemason. He never went west in a mask.", next = "xorig_mason", when = { origin = "human_stonemason_child" } },
        { text = "Let's go.", next = "END" },
      },
    },
    xorig_mason = {
      lines = {
        { id = "xom_default", text = "Then he was smarter than me, or luckier, or both. The masons who came west first really did believe we'd get what the nobles owed us, but what they built out here isn't a guild anymore, it's a gang with a grudge, and I'd sooner your father never saw it." },
      },
      choices = {
        { text = "He was angry enough to understand them.", next = "xorig_mason2", fx = { align = { order = -1 } } },
        { text = "Anger's no excuse for what the Brotherhood does now.", next = "xorig_mason2", fx = { align = { order = 1 } } },
        { text = "Did you know any of the old masons?", next = "xorig_mason2" },
      },
    },
    xorig_mason2 = {
      lines = {
        { id = "xom2_default", text = "A few, and most of them are dead or deep in the mine by now, swinging a pick for VanCleef's ship instead of a hammer for Stormwind's walls. Tell your father to stay angry in Stormwind, where it's safe, because out here anger gets you a mask and an early grave." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I joined for the pay and the pay stopped coming, and because I saw what they did to the Furlbrows' neighbours. I'm no hero, mind, I just want to live long enough to be a farmer again." } },
      choices = {
        { text = "What did they do?", next = "why_farm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_farm = {
      lines = { { id = "wf_default", text = "They burned the house with the old man still arguing inside it, over a cart of turnips. I held the torches, and I've not slept right since." } },
      choices = {
        { text = "What do you want in return for helping us?", next = "why_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_price = {
      lines = { { id = "wp_default", text = "A pardon from Stoutmantle and a road out of Westfall, that's all. He's promised me both, though I've learned not to trust promises much." } },
      choices = {
        { text = "You held the torches. You deserve the gallows.", next = "BACK", reply = "Maybe I do, and I've thought about it every night since I ran. But I'll be worth more to Westfall alive than swinging.", fx = { align = { order = 1 }, affinity = -2 } },
        { text = "A man who turns from evil deserves a second chance.", next = "BACK", reply = "That's all I'm asking for, though I've no right to it. If I get out of Westfall, I'll not waste it.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook = {
      lines = { { id = "m_default", text = "There's an old smithy that looks empty and isn't, and under it a tunnel down into the mines. That's where VanCleef keeps the whole operation, ships and all, if you'll believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vancleef = {
      lines = { { id = "v_default", text = "He was a stonemason once, a master of his guild, until Stormwind's nobles cheated him and his men of their pay. Now he wears a mask and nobody's seen his face in years." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Did you now? Then you know what they do to deserters, so you'll understand why I'm sweating. Don't tell me which crew you were with; I'd rather not know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Deadmines are under Moonbrook, and if I lead you there, you'll find more of my old friends than you'll want to count. VanCleef's at the bottom of it all, and he'd skin me slow if he knew I was talking." } },
    stonemasons = { { id = "tp_stonemasons", text = "I was a mason before I was a thief, and I was a good one, and the nobles never paid us for building their fine city. That's how it started, and I'm not sorry for the beginning, only for the end." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's full of Defias who got caught, and the ones inside are running the place now, I've heard. I'd sooner die out here than end up in a cell next to someone who knows what I've done." } },
    syndicate = { { id = "tp_syndicate", text = "VanCleef did business with the Syndicate up north, or tried to, and they're worse than us, believe it or not. At least we started honest." } },
    si7 = { { id = "tp_si7", text = "SI:7's had eyes on the Brotherhood since the beginning, and I'd bet my last copper one of us is theirs already. That's why I sleep with my back to a wall and my boots on." } },
    defias = { { id = "tp_defias", text = "They're good men turned bad, and bad men who never needed turning, and I was somewhere in between." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, can we just go?" } },
  },
}
