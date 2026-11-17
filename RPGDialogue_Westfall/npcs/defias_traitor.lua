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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because they'd have hanged me sooner or later, and the Militia pays better for what I know. Don't look at me like that; your spirits can judge me if they want." } },
      choices = {
        { text = "You did right to come forward. Now see it through.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A man who sells one crew will sell the next.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In threes, with one in front to keep you busy and two coming round the side with knives. They'll pick off the one who stops to help a friend, so keep moving and don't look back, whatever you hear." } },
      choices = {
        { text = "I'll protect anyone who falls, knives or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll keep moving and let the slow ones fall.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where the road narrows by the old farms, and the hedges are thickest. They'll have a man up a tree and two in the ditch, and they'll let you pass, then take me from behind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} smells them before we see them, I hope. If its hackles go up, trust it more than me." },
      },
      choices = {
        { text = "I'll get you to Moonbrook alive, traitor or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll get you there, but my beast comes first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Pillagers, they call them, and they throw fire about like it costs nothing, which to them it doesn't. Where they learned it I never asked, but they've no love for Stormwind's towers, I'll tell you that for free." } },
      choices = {
        { text = "Then they've betrayed the craft as well as the kingdom.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stormwind threw away a lot of good people. That's on the city.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where is VanCleef now?", next = "vancleef" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "You've a whiff of sulphur about you, friend, and that frightens me some, I don't mind saying. But the Brotherhood know my face and my name, and you only know my price, so I'll take my chances with you." } },
      choices = {
        { text = "Talk straight with me and you've nothing to fear.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell me out and you'll learn what I keep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why did you turn on them?", next = "why" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Peace? If VanCleef's lot catch me on that road, they won't wait while I make it. Say something over me if it pleases you, but say it walking." } },
      choices = {
        { text = "There's forgiveness for men who turn from wrong. Even you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forgiveness is wasted on a turncoat. Just walk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Never mind. Let's go over the road again.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "You shouldn't, not all the way, and I'd think less of you if you did. I sold them out because they stopped being masons with a grudge and started being killers, and I'd sooner hang a turncoat than live a murderer." } },
      choices = {
        { text = "You turned from murder. I'll guard you with my life for that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man who betrays once betrays twice. I'll be watching you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, before we go.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If you can do that, then you'll spot the lookouts VanCleef keeps in the Moonbrook houses before they spot me. Only don't leave me alone on the road while you're prowling, because I'm the one they want." } },
      choices = {
        { text = "I'll stay at your side, as I promised Stoutmantle.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they catch you, that's the price of your choices.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Stoutmantle says you're the one taking me to Moonbrook. I'll show you where the Brotherhood hides, but you keep me alive on the road, because they'll be watching for me." },
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
      lines = { { id = "wf_default", text = "Burned the house with the old man still arguing inside it, over a cart of turnips. I held the torches, and I've not slept right since." } },
      choices = {
        { text = "Then what's your price for the truth?", next = "why_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_price = {
      lines = { { id = "wp_default", text = "A pardon from Stoutmantle and a road out of Westfall, that's all. He's promised me both, though I've learned not to trust promises much." } },
      choices = {
        { text = "You held the torches. You deserve the gallows.", next = "BACK", fx = { align = { order = 1 }, affinity = -2 } },
        { text = "A man who turns from evil deserves a second chance.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook = {
      lines = { { id = "m_default", text = "An old smithy that looks empty and isn't, and under it a tunnel down into the mines. That's where VanCleef keeps the whole operation, ships and all, if you'll believe it." } },
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
    defias = { { id = "tp_defias", text = "Good men turned bad, and bad men who never needed turning. I was somewhere in between." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, can we just go?" } },
  },
}
