-- High Priest Thel'danis, keeper of Uther's Tomb. Voice: bibles/theldanis.md
-- A gentle, unbending priest who tends a hero's grave in the middle of the Plaguelands.
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "theldanis", id = TODO_NPC("High Priest Thel'danis"), name = "High Priest Thel'danis",
  bible = "bibles/theldanis.md", role = "priest", tier = "major",
  communities = { "uthers_tomb" }, temper = { "gentle", "steady" }, values = { "devout", "kind" },
  likesTone = "polite",
  prejudice = { class = "WARLOCK", amount = 10, why = "Keeper of Uther's tomb; will not let anything of the Nether near the Lightbringer's rest." },
  notices = { "light", "weary" },
  impression = {
    first = "He is gentle with travellers and immovable about the tomb.",
    third = "{name} met High Priest Thel'danis, who tends the tomb of Uther the Lightbringer in the Western Plaguelands.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "You will not bring that darkness to the Lightbringer's door. Stand where you are, and speak from there." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I can bless most who climb this hill, but not one who keeps company with demons. Say what you need, and keep your distance from the tomb." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You have come again and left the tomb untroubled, and I have prayed over what that means. You may come a little closer, though not inside." },
    { id = "g_peace", text = "Peace, traveler. Walk softly here; this is a resting place." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the tomb. Few do twice, and fewer still come to pay respects rather than to ask for something." },
    { id = "g_away", when = { away = 14 }, text = "It's been {away} since you last stood here, and the Scourge have walked past the hill a dozen times since. None of them came in." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "The Light sits more surely on you than when we first met, or perhaps you've only learned to carry your burdens better. Either is good to see." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You walk the Plaguelands by night? Then rest a while by the tomb, for the dead here are the quiet kind." },
  },

  notice = {
    { id = "n_paladin", cat = "light", when = { class = "PALADIN" },
      text = "You carry the Silver Hand's Light, and Uther would have been glad to see it still carried. Many who once bore it now wear red, and I pray for them too, though it grieves me." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You've walked back from death recently, I can see it in your step. Sit by the tomb a while; the Light is close here, and it is patient." },
  },

  start = "hello",
  nodes = {
    dd_scarlet = {
      lines = {
        { id = "dd_scarlet_1",
          text = "I do, every evening, in the garden where Uther lies. Some of them served beside him once, before grief and fear made them into what they are now, and I think he would want someone to remember who they were." },
        { id = "dd_scarlet_2",
          text = "That doesn't mean you were wrong to stop them, friend. It only means that somebody should mourn them, and I am the only one on this hill with time to do it." },
      },
      choices = {
        { text = "Mourn them if you like. I won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then pray for them from me as well.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I am Thel'danis, and I keep Uther's tomb. I know what answers when you call, and nothing of the Nether will set foot inside these doors while I breathe." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You come back, and every time the tomb stays quiet. I am still wary of you, but I'll not stand in the doorway quite so firmly." },
        { id = "h_dd_scarlet", when = { killed = { name = "Scarlet", min = 50 } },
          text = "The Crusade's patrols pass my hill a good deal less often than they did. I've heard why, and I pray for the men who fell, as I'd pray for anyone who once knelt to the Light." },
        { id = "h_default", key = true, text = "I am Thel'danis, and I keep this tomb. Uther the Lightbringer lies here, and while I live, nothing that serves the Scourge will set foot inside it." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, at the Lightbringer's tomb. Kneel, if you wish to; he trained the order you serve, and he'd have had a stern word for you about your stance." },
        { id = "h_priest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light. Then you know what it is to pray where the ground is sick, and how the Light seems quieter here, and closer at the same time." },
        { id = "h_dwarf", when = { race = "Dwarf", class = { "PALADIN", "PRIEST" } },
          text = "One of Ironforge's faithful. Uther thought well of the dwarves who took up the Light, and said they prayed the way they forged, without wasting a breath." },
        { id = "h_scholo", tags = { "news" }, when = { cleared = "Scholomance" },
          text = "They say the halls at Caer Darrow are quieter now, and that you had a hand in it. Uther would have counted that among the best of services, for those halls taught the plague its letters." },
      },
      again = {
        { id = "h_again", text = "Is there more on your heart? The tomb is in no hurry." },
        { id = "h_again2", text = "Speak, then. I've nowhere else to be but here." },
      },
      choices = {
        { text = "You pray for the Scarlets I killed?", next = "dd_scarlet", when = { killed = { name = "Scarlet", min = 50 } } },
        { text = "Tell me about Uther.", next = "uther" },
        { text = "Why do you stay here, alone?", next = "stay" },
        { text = "I'm surprised a garden lives up here at all.", next = "garden" },
        { text = "What do you see from this hill?", next = "hill" },
        { text = "Lightbringer. Did he teach you, too?", next = "paladin", when = { class = "PALADIN" } },
        { text = "The Light seems far away out here.", next = "faith", when = { class = "PRIEST" } },
        { text = "The Scarlet Crusade calls itself Uther's heir.", next = "scarlet", when = { faction = "Alliance" } },
        { text = "Peace be on the tomb, High Priest.", next = "END", fx = { affinity = 1 } },
      },
    },

    uther = {
      lines = { { id = "ut_default", key = true, text = "The first of the Silver Hand, and the best of them. He trained the paladins of Lordaeron, and one of them was a prince who later came back with a cursed blade and killed him." } },
      choices = {
        { text = "Arthas killed his own teacher.", next = "uther_arthas" },
        { text = "How did he come to rest here?", next = "uther_rest" },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    uther_arthas = {
      big = true,
      lines = { { id = "ua_default", text = "He did, and Uther knew him from a boy. I've never decided whether that makes his death more terrible or more holy, for he stood against what his pupil had become, and he didn't step aside." } },
      choices = {
        { text = "Holy. He kept faith to the end.", next = "BACK", reply = "I've come to think so too, on the better days. Kneel a moment, if you like, and he'll have one more visitor.", fx = { align = { light = 1 } } },
        { text = "Terrible. Faith didn't save him.", next = "BACK", reply = "It didn't save him, no, but it kept him standing to the last. I think that's what faith was for, in the end.", fx = { align = { light = -1 } } },
        { text = "Which do you believe, High Priest?", next = "uther_arthas2" },
      },
    },
    uther_arthas2 = {
      lines = { { id = "ua2_default", text = "Both are true, I think, and I've had years beside his grave to think it. Grief and faith are not enemies, though the young always seem to think they must pick one." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uther_rest = {
      lines = { { id = "ur_default", text = "Those who loved him built this tomb on Sorrow Hill and set his likeness over the door. I came later, to keep it, when there was no one left who could." } },
      choices = {
        { text = "No one else came to keep it?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },

    stay = {
      lines = { { id = "st_default", text = "The Silver Hand broke, and half of what was left took up the red and went to Hearthglen and the Monastery. Someone had to stay and sweep the floor, and I found the broom fit my hand." } },
      choices = {
        { text = "You must think of leaving sometimes.", next = "stay_leave" },
        { text = "Did the Crusade never ask you to join them?", tag = "Persuade", next = "stay_red",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PALADIN", "PRIEST" } } } } },
          fail = { next = "stay_red_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_leave = {
      lines = { { id = "sl_default", text = "Every winter, when the wind comes off Andorhal and the garden goes grey at the edges. Then spring comes, and the roses come back, and I remember that the tomb needs one stubborn old priest more than I need a warm hearth." } },
      choices = {
        { text = "The tomb is lucky to have you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "A grave doesn't need tending. The living do.", next = "stay_living" },
      },
    },
    stay_red = {
      big = true,
      lines = { { id = "sr_default", text = "They asked, and for a season I nearly said yes, because they were the only ones still fighting and I was tired of praying alone. Then I saw what they did to a family at the bottom of this hill, and I came back up and haven't gone down to them since." } },
      choices = {
        { text = "Thank you for telling me that.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_red_no = {
      lines = { { id = "sn_default", text = "Many people have asked me many things on this hill. Let's speak of the tomb instead, traveler; it's a gentler subject." } },
      choices = {
        { text = "As you wish.", next = "BACK" },
      },
    },
    stay_living = {
      big = true,
      lines = { { id = "sv_default", text = "You're not wrong, and I tend them too, when they come up the hill hungry or hurt. But a people who forget their heroes' graves will soon forget why they had heroes at all, and I'll not be the one to let that happen." } },
      choices = {
        { text = "Then keep the grave. Someone must remember.", next = "BACK", reply = "Then I'll keep it, gladly, and sweep the steps tomorrow as I did today. Thank you for understanding.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the dead go. The living need you more.", next = "BACK", reply = "They do, and I won't turn them away, not ever. But I'll not let Uther be forgotten while I can still lift a broom.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    garden = {
      lines = { { id = "ga_default", text = "With patience, clean water carried up from below the hill, and a prayer every morning. The plague creeps in at the edges, and I pull it out like any other weed." } },
      choices = {
        { text = "Does the Light really keep the plague back?", next = "garden_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden_light = {
      lines = { { id = "gl_default", text = "It keeps me back from despair, which is most of the work. The rest is digging, and I'd not claim a miracle where a good spade did the job." } },
      choices = {
        { text = "Honest of you to say so.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hill = {
      lines = { { id = "hi_default", text = "Andorhal smouldering away to the north, the Scourge walking their rounds, and now and then a pair of red cloaks riding hard for Hearthglen. Travelers come up the hill too, and I give them bread and send them on." } },
      choices = {
        { text = "The Scourge must come near at times.", next = "hill_scourge" },
        { text = "Something else.", next = "BACK", fx = { learn = { "andorhal" } } },
      },
    },
    hill_scourge = {
      lines = { { id = "hs_default", text = "They come to the foot of the hill and stop, as if they've forgotten why they came. I like to think it's the Lightbringer's doing, though it may only be that there's nothing up here they want." } },
      choices = {
        { text = "I'd rather believe it's Uther.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    paladin = {
      lines = { { id = "pa_default", text = "Not as he taught you, no; I'm a priest, and he'd have despaired of my swordwork. But I listened to him preach, once, and he spoke of the Light as a duty you carry rather than a gift you're handed." } },
      choices = {
        { text = "It's a duty, and I'll carry it.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    faith = {
      lines = { { id = "fa_default", text = "Far, and very quiet, as if it were listening rather than speaking. I've come to think that's what it does in sick places: it waits for someone to keep faith without being answered." } },
      choices = {
        { text = "That's a hard sort of faith.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scarlet = {
      lines = { { id = "sc_default", text = "They do, and some of them believe it to the bone. Uther would have stood between them and the innocents they burn, and I pray he'd have found a way to make them listen, because I never have." } },
      choices = {
        { text = "They've forgotten what he stood for.", next = "BACK", fx = { affinity = 1, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You're kind to say so, though the garden does most of the work and I only sweep. It warms an old priest to know that someone noticed." },
        { id = "s2", text = "Lord Uther had a way of making people stand taller with a word, and you've a little of that gift yourself. Thank you, traveler; I shall remember it in my prayers." },
      },
      fail = {
        { id = "f1", text = "I thank you, but there's no need to praise the keeper in order to visit the tomb. Whatever you've come to ask, you may simply ask it." },
        { id = "f2", text = "Fair words are easily spent, and I've heard them from Crusaders at this very door. Sit a while and be honest with me instead, for it will serve you better." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ah, you jest at an old man and his broom, and the Light knows I've earned it. Lord Uther laughed more than the statues let on, so I think he would not mind." },
        { id = "s2", text = "You've a quick tongue, and you're not afraid to use it on holy ground, which takes a certain boldness. I find I'm smiling, and that happens seldom out here." },
      },
      fail = {
        { id = "f1", text = "Mock me if you must, but lower your voice, for this is a resting place. A better man than either of us lies within, and he deserves quiet." },
        { id = "f2", text = "I had hoped for more from you than that, traveler. Unkindness comes cheaply in the Plaguelands, and I had thought you might leave yours at the foot of the hill." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There is great force in you, and I'll not pretend my old heart did not feel it. I ask only that you do not turn it on the tomb, and I will hear you out." },
        { id = "s2", text = "Peace, I beg you. I am one priest with a broom, and I can see plainly that you are not to be trifled with." },
      },
      fail = {
        { id = "f1", text = "The Scourge has ringed this hill many times and never once come into the garden. I do not believe you will frighten me where it could not." },
        { id = "f2", text = "You may raise your voice, but I'll not be moved from this door by you or by anyone. Go in peace, and come back when your temper has cooled." },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I've watched this hill a long while, and travelers bring news with their hunger. Ask, and I'll tell you what I know, and no more than that." } },
    background = { { id = "tp_bg", text = "I'm the one who keeps the tomb. The rest of my story is long and mostly about sweeping, so I'll spare you." } },
    advice = { { id = "tp_ad", text = "Eat when there's bread, sleep when there's a wall at your back, and pray when there's neither." } },
    silver_hand = { { id = "tp_silverhand", text = "The order Uther founded, and the order Uther would grieve to see now. What's left of it is scattered between the Dawn and the Crusade, and only one of them would make him proud." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Zealots who took the Silver Hand's name and forgot its heart. I pray for them, and I bar my door to them, and I see no contradiction in it." } },
    argent_dawn = { { id = "tp_argent", text = "Good people, from what I hear, and they don't care whose hands hold the sword so long as it's raised against the Scourge. Uther would have liked them, I think." } },
    andorhal = { { id = "tp_andorhal", text = "The town where the plague first spread in earnest, now a ruin the Scourge won't give up. I can see its smoke from the tomb on still days." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light is a quiet strength, and it asks only that we serve it with our whole hearts. Uther taught me that, and I've tried to keep his tomb in a way he'd recognize." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You carry the Light as Uther did, and that's a heavy thing to carry in a land like this. Come and sit in the garden whenever you need to, and remember what it's for." },
    },
    arthas = { { id = "tp_arthas", text = "Uther died defending Lordaeron from his own pupil, and the prince he raised put him in the ground. I tend his tomb, and I pray for Arthas too, though I'm not certain the Light will listen." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has never once come into this garden, though it has surrounded it many times. I don't know why, and I don't need to know." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was a kingdom of faith and law, and it fell because one man forgot them both. I keep the garden green so that something of it remains." } },
    stratholme = { { id = "tp_stratholme", text = "Uther's knights stood with the prince at Stratholme until they wouldn't, and Uther left in sorrow. He never spoke of it to me, and I never asked." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken come to the tomb sometimes, quietly, and they stand at the edge of the garden and don't come in. I don't turn them away, and I don't ask what they're remembering." } },
    _none = { { id = "tp_none", text = "That's beyond what an old tomb-keeper hears, I'm afraid. Ask at Chillwind Camp; they get the news before I do." } },
    _gated = {
      { id = "gt1", text = "Forgive me, but that is not a thing I share with those I scarcely know. Come and sit in the garden a few times more, and perhaps I will." },
      { id = "gt2", text = "I would rather not speak of it yet, traveler. Some matters wait upon trust, and trust takes its time." },
    },
  },
}
