-- Guard Roberts, wounded on the lakeshore east of Goldshire. Voice: bibles/guard_roberts.md
-- Proud, embarrassed and in pain; Goldshire's young priests are sent to heal him.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "guard_roberts", id = TODO_NPC("Guard Roberts"), name = "Guard Roberts",
  bible = "bibles/guard_roberts.md", role = "guard", tier = "quest",
  communities = { "goldshire" }, temper = { "gruff" }, values = { "duty", "proud" },
  notices = { "priest", "kit" },

  impression = {
    first = "Guard Roberts lies wounded by the lake east of Goldshire and insists he is only resting. He is proud enough to refuse help and sore enough to need it.",
    third = "{name} met Guard Roberts, a wounded Stormwind guard lying by the lake east of Goldshire who would rather not discuss how it happened.",
  },

  greetings = {
    { id = "g_lake", text = "Don't mind me. I'm only resting my eyes, and my leg, and most of my ribs." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Come to see if I've got up yet? I haven't." },
    { id = "g_healed", when = { questDone = TODO_QUEST("Garments of the Light") }, text = "Still a bit stiff, but I'm standing my post again, thanks to you. Well, sitting it, mostly." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've counted every duck on this lake while you were away. There are eleven, if you were wondering." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you last found me lying here. I've not moved much, as you can see." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk walking past say you've been doing good turns around Goldshire. That's the sort of news a man lying in the grass likes to hear." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear somebody in Goldshire's sore at you. I'd get up and keep the peace, but you can see how that'd go." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest! Did Josetta send you? Don't answer that; just tell me it won't sting." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look nearly as battered as I do. Sit down a minute before you fall down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Guard Roberts, Stormwind Guard, on patrol. Lying-down patrol, for the moment, but I've a fine view of the lake and nobody's got past me yet." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Garments of the Light") },
          text = "Josetta sent you, didn't she? Somebody from Goldshire told her I was out here. Go on, then, do your healing and your fortifying, and try not to look so pleased about it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Garments of the Light"), days = 3 } },
          text = "I can breathe without wincing, and I'd forgotten what that was like. You've a gift, and I'll say so to Josetta if she asks." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, and here's me flat on my back like a turtle. Don't tell the Cathedral you saw me like this." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "It gets cold by the water at night, and the wolves come down to drink. I keep very still and hope they think I'm a log." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere." },
        { id = "h_again2", text = "Ask away. It takes my mind off the leg." },
      },
      choices = {
        { text = "What happened to you?", next = "hurt" },
        { text = "Why hasn't anyone carried you to Goldshire?", next = "carried" },
        { text = "What's there to watch out here?", next = "watch" },
        { text = "Hold still. Let me heal you.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Rest easy, Roberts.", next = "END" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "I was jumped on patrol, three of them, maybe four, and I gave a good account of myself. That's all I'll say about it." },
      },
      choices = {
        { text = "Three or four what?", next = "hurt_who" },
        { text = "I believe you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hurt_who = {
      lines = { { id = "hw_default", text = "Red bandanas, I think, though it was getting dark. Or it might have been the bank giving way under my boots, and me landing on a rock. It was one or the other." },
      },
      choices = {
        { text = "Which was it, Roberts?", next = "hurt_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt_truth = {
      big = true,
      lines = { { id = "ht_default", text = "If I tell Marshal Dughan it was the Defias, he sends men to look for them. If I tell him I fell in the lake, the barracks never let me forget it. What would you tell him?" },
      },
      choices = {
        { text = "The truth. Don't send men chasing ghosts.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Say it was the Defias. Pride's worth a small lie.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather not get involved.", next = "BACK" },
      },
    },
    carried = {
      lines = { { id = "c_default", text = "Because I told them not to, and they listened, which is the first time that's ever happened. I'll walk back into Goldshire on my own legs, or not at all." },
      },
      choices = {
        { text = "That's stubborn, not brave.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "The road between Goldshire and the farms to the east, mostly. With half the army away, every guard has twice the road, and I'm doing mine from the grass." },
      },
      choices = {
        { text = "Half the army is away?", next = "watch_army" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_army = {
      lines = { { id = "wa_default", text = "Off in Lordaeron and wherever else the kingdom's sent them, and the rest of us hold Elwynn with what's left. Ask Dughan if you want the full grumble; he does it better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heal = {
      lines = {
        { id = "he_default", text = "Go gently, then. Josetta's apprentices always say it won't hurt, and they're always wrong." },
        { id = "he_shaman", when = { class = "SHAMAN" }, text = "Spirits, is it? I've never been healed by a spirit. Well, go on, I'm too sore to be particular." },
      },
      choices = {
        { text = "The Light asks nothing of you. Just breathe.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "It'll hurt. Pain means you're still alive.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind Guard, posted to Elwynn. Normally I do it standing up." } },
    advice = { { id = "tp_ad", text = "Mind the lakeshore after dark. The bank's softer than it looks, whatever I told the marshal." } },
    defias = { { id = "tp_defias", text = "They're on every road these days, and I'll swear one of them was on mine.", next = "hurt" } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I've been lying here a while, and news comes slowly to the grass." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "I can see the island from where I lie, and the stone ring where the wizards walk at night. They light fires that burn the wrong colour, and I report it, and nobody comes." } },
    holy_light = { { id = "tp_holy_light", text = "Priestess Josetta sends young priests to pray over my leg, and I'll say this much: it hurts less after. Whether that's the Light or the company, I couldn't tell you." } },
    the_stockade = { { id = "tp_the_stockade", text = "I've walked a good few Defias to the Stockade in my time, and every one of them swore he was innocent. One of them might have been, I suppose." } },
    varian = { { id = "tp_varian", text = "A guard doesn't ask where the king's gone; a guard stands where he's put. It's harder than it sounds, lying here with nothing to stand on." } },
  },
}
