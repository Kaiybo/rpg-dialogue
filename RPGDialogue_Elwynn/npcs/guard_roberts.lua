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
    first = "He is too proud to take help and too sore to refuse.",
    third = "{name} met Guard Roberts, a wounded Stormwind guard lying by the lake east of Goldshire who would rather not discuss how it happened.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, good to see you. Pull up a rock; I'd stand, but my leg's still not on speaking terms with me." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm resting, and I'd rest better if you moved along." },
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
      text = "A priest! Did Priestess Josetta in Goldshire send you? Don't answer that; just tell me it won't sting." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look nearly as battered as I do. Sit down a minute before you fall down." },
  },

  start = "hello",
  nodes = {
    d6_gold = {
      lines = { { id = "d6_gold_a", text = "Busy, which is the trouble. Marshal Dughan has more bills posted on his board than he's got men to answer them, and every adventurer who passes through the Lion's Pride wants to be paid in coin and glory both." } },
      choices = {
        { text = "In Ironforge we'd have carried you home by now.", next = "d6_gold2", when = { race = "Dwarf" } },
        { text = "What's the Marshal like to serve under?", next = "d6_gold2" },
        { text = "I'll let you rest. Something else.", next = "BACK" },
      },
    },
    d6_gold2 = {
      lines = {
        { id = "d6_gold2_a", text = "Fair and tired, and he's been tired since the army sailed north. He'll give you a straight answer and a hard job, and he'll remember your name after, which is more than most officers bother with." },
        { id = "d6_gold2_dwarf", when = { race = "Dwarf" }, text = "Aye, I've heard dwarves carry their wounded whether they like it or not, and then sit on them till they heal. We do things differently in Stormwind; we lie in the grass and complain, and it works about as well." },
      },
      choices = {
        { text = "Dughan sounds like a good man to know.", next = "BACK" },
        { text = "Ask you something else, then.", next = "BACK" },
      },
    },
    d6_lake = {
      lines = { { id = "d6_lake_a", text = "Murlocs, on the east shore, more of them every month and louder with it. You can hear them at night if the wind's right, gurgling at each other like a kettle with opinions, and the fishermen won't set nets past the middle anymore." } },
      choices = {
        { text = "What do the murlocs want?", next = "d6_lake2" },
        { text = "A kettle with opinions. That's apt.", next = "d6_lake2" },
        { text = "Let's leave the murlocs.", next = "BACK" },
      },
    },
    d6_lake2 = {
      lines = { { id = "d6_lake2_a", text = "Fish, and nets, and the shore, and I don't think they'd say no to a guard who couldn't run. Jason Mathers on the pier will tell you all about it, at length, if you buy a fish first." } },
      choices = {
        { text = "I'll see Jason Mathers, then.", next = "BACK", fx = { learn = { "murlocs_east" } } },
        { text = "Something else, Roberts.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Guard Roberts, Stormwind Guard, on patrol. Lying-down patrol, for the moment, but I've a fine view of the lake and nobody's got past me yet." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Garments of the Light") },
          text = "Priestess Josetta sent you, didn't she? Somebody must have told her in Goldshire that I was lying out here. Go on, then, do your healing and your fortifying, and try not to look so pleased about it." },
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
        { text = "You look like you've taken a beating.", next = "hurt" },
        { text = "Why hasn't anyone carried you to Goldshire?", next = "carried" },
        { text = "What's there to watch out here?", next = "watch" },
        { text = "Hold still. Let me heal you.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "How are things in Goldshire these days?", next = "d6_gold" },
        { text = "What's on the far side of the lake?", next = "d6_lake" },
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
        { text = "The truth. Don't send men chasing ghosts.", next = "BACK", reply = "The truth, then, and I'll take the barracks' jokes on the chin. Better they laugh at me than some poor lads go tramping round the hills after bandits who were never there.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Say it was the Defias. Pride's worth a small lie.", next = "BACK", reply = "That's what I was hoping you'd say, and I'll thank you not to tell Dughan otherwise. A man's got to keep some dignity when he's been beaten by a lake.", fx = { align = { honor = -1 } } },
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
      lines = { { id = "w_default", text = "The road between Goldshire and the farms to the east, mostly. With so much of the army away, every guard has twice the road, and I'm doing mine from the grass." },
      },
      choices = {
        { text = "Where has the army gone?", next = "watch_army" },
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
        { text = "The Light asks nothing of you. Just breathe.", next = "BACK", reply = "Breathing I can manage, mostly, though the ribs have opinions about it. Go on, then, and I'll try not to flinch where you can see.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "It'll hurt. Pain means you're still alive.", next = "BACK", reply = "Then I must be very much alive right now, thank you kindly. Get on with it before I lose my nerve and my breakfast both.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Maybe later.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're decent, and the Guard could use a few more like you. Don't tell my sergeant I said so." },
    },
    grievance = {
      { id = "dp_gv", text = "You've given me cause to doubt you, and I've not got the ribs for a fight, so keep it civil." },
    },
    background = { { id = "tp_bg", text = "Stormwind Guard, posted to Elwynn. Normally I do it standing up." } },
    advice = { { id = "tp_ad", text = "Mind the lakeshore after dark. The bank's softer than it looks, whatever I told the marshal." } },
    defias = { { id = "tp_defias", text = "They're on every road these days, and I'll swear one of them was on mine.", next = "hurt" } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I've been lying here a while, and news comes slowly to the grass." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "I can see the island from where I lie, and the stone ring on it where the wizards walk at night. They light fires that burn the wrong colour, and I report it, and nobody comes." } },
    holy_light = { { id = "tp_holy_light", text = "Priestess Josetta sends young priests to pray over my leg, and I'll say this much: it hurts less after. Whether that's the Light or the company, I couldn't tell you." } },
    the_stockade = { { id = "tp_the_stockade", text = "I've walked a good few Defias to the Stockade in my time, and each one swore on his mother he was innocent. One of them might have been, I suppose." } },
    varian = { { id = "tp_varian", text = "A guard doesn't ask where the king's gone; a guard stands where he's put. It's harder than it sounds, lying here with nothing to stand on." } },
  },
}
