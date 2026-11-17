-- Tharg, old Stonemaul ogre in Brackenwall Village (0.72.0). Voice: bibles/tharg.md
-- Grieving, stubborn, homesick for the south; wants the black dragons to pay.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tharg", id = TODO_NPC("Tharg"), name = "Tharg",
  bible = "bibles/tharg.md", role = "questgiver", tier = "quest",
  communities = { "brackenwall" }, temper = { "gruff", "sad" }, values = { "loyal", "brave" },
  notices = { "trophy", "weary" },
  impression = {
    first = "Tharg is an old ogre with bad knees and a dead wife, and he talks about the Stonemaul village in the south as if he could still smell it. He wants the black dragons to pay, and he wants to go home.",
    third = "{name} met Tharg, an old Stonemaul ogre in Brackenwall who lost his wife to the black dragons.",
  },

  greetings = {
    { id = "g_default", text = "Tharg see you, and Tharg not get up, because Tharg's knees are older than Tharg is." },
    { id = "g_active", when = { questActive = TODO_QUEST("Army of the Black Dragon") }, text = "The Firemane still walk in Tharg's old village, so you go and make fewer of them." },
    { id = "g_done", when = { questDone = TODO_QUEST("Army of the Black Dragon") }, text = "The brave one comes back! Sit by Tharg, because Tharg likes you better than most of Brackenwall." },
    { id = "g_away", when = { away = 14 }, text = "You gone {away}, and Tharg counted the days, because there is nothing else to do in this wet place." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You bigger now than when Tharg first sent you south, and harder to kill, Tharg thinks. That is good, because the dragons are bigger too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The ogres say you help Brackenwall, and Tharg is glad, because most outsiders only help themselves." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in the village is angry with you, and Tharg does not ask why. Fix it, because Brackenwall is small and ogres remember." },
  },

  notice = {
    { id = "n_trophy", cat = "trophy", when = { killed = { name = "Firemane", min = 20 } },
      text = "You smell of dragon blood, little one, and it is the best smell Tharg has smelled in a long time." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look how Tharg feels in the morning, so sit down a while before you go anywhere near the Wyrmbog." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Tharg is Stonemaul, from the village in the south, before the black dragons came. Now Tharg sits in Brackenwall and waits, and Tharg hates waiting." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Army of the Black Dragon") },
          text = "You look strong, so Tharg asks you straight. The black dragon's army sits in Tharg's home, and Tharg wants them to bleed for it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Army of the Black Dragon") },
          text = "Scouts, ash tails and the big scalebanes, all of them wearing the Firemane mark. Go south past the ruins and kill them, and do not stop to look at the bones." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Army of the Black Dragon"), days = 3 } },
          text = "You kill many of the black dragon army, and Tharg slept all night for the first time since the fire. Tharg's wife would have liked you." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Army of the Black Dragon"), days = 7 } },
          text = "The Firemane came back, because they always come back, but there are fewer of them now. Tharg thinks maybe one day the ogres go home after all." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, good. It was an orc and an ogre together who made the Stonemaul strong, and Tharg was there to see it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A big one, nearly as big as an ogre! Tharg likes the bull people, because they do not run either." },
      },
      again = {
        { id = "h_again", text = "Tharg is still listening, so talk." },
        { id = "h_again2", text = "What else? Tharg has nowhere to be, which is the whole trouble, and the roof still leaks on Tharg's good side." },
      },
      choices = {
        { text = "What happened to the Stonemaul village?", next = "village" },
        { text = "You lost someone to the dragons.", next = "wife" },
        { text = "You don't seem to think much of Mok'Morokk.", next = "overlord" },
        { text = "You were there when Rexxar came?", next = "rexxar" },
        { text = "I hunt beasts too. Tell me about Rexxar's way.", next = "rexxar_hunt", when = { class = "HUNTER" } },
        { text = "Could the spirits carry a word to your wife?", next = "spirits", when = { class = "SHAMAN" } },
        { text = "The Firemane are fewer now, Tharg.", next = "after", when = { questDone = TODO_QUEST("Army of the Black Dragon") } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Farewell, Tharg.", next = "END" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "Stonemaul village sat in the south, with dry stone and good hunting and ogres who were proud. Then the black dragons came down out of the bog, and fire came with them, and now Tharg's home is ruins full of dragon whelps." } },
      choices = {
        { text = "Somebody must have driven you out.", next = "village_who" },
        { text = "Something else, Tharg.", next = "BACK" },
      },
    },
    village_who = {
      lines = { { id = "vw_default", text = "The Firemane, they call themselves, and they serve the black dragonflight's lady in the Wyrmbog. Tharg does not say her name, because saying it makes Tharg's hands shake, and old ogres should not shake." } },
      choices = {
        { text = "Will the Stonemaul ever go back?", next = "village_back" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    village_back = {
      big = true,
      lines = { { id = "vb_default", text = "Tharg says yes, every day, and the young ones laugh at Tharg. Brackenwall is not home, it is a wet place where ogres hide, and ogres are not good at hiding." } },
      choices = {
        { text = "Then go back and take it. Hiding shames you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Home is where your people live now. Let it go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife = {
      lines = { { id = "w_default", text = "Tharg's wife was killed when the dragons came, and Tharg was not fast enough, because Tharg was never fast. She was the strong one, and she laughed louder than any ogre in the village." } },
      choices = {
        { text = "I'm sorry, Tharg.", next = "wife_sorry", fx = { affinity = 1 } },
        { text = "Is that why you want revenge?", next = "wife_revenge" },
      },
    },
    wife_sorry = {
      lines = { { id = "ws_default", text = "Sorry is a small word, but you say it like you mean it, so Tharg takes it. Most here only tell Tharg to stop talking about her." } },
      choices = { { text = "Talk about her as much as you like.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    wife_revenge = {
      big = true,
      lines = { { id = "wr_default", text = "Tharg wants revenge, yes, and Tharg wants to go home, and Tharg does not know any more which one Tharg wants more. Maybe they are the same thing, for an old ogre." } },
      choices = {
        { text = "Revenge is fair. The dragons earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Go home for her, Tharg, not for hate.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    overlord = {
      lines = { { id = "o_default", text = "Mok'Morokk was made Overlord by Rexxar, and Mok'Morokk cares more for being Overlord than for ogres. When the dragons came, Mok'Morokk told the Stonemaul to run, and so we ran, and Tharg is still ashamed." } },
      choices = {
        { text = "You can't be the only one who feels that way.", next = "overlord_who" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    overlord_who = {
      big = true,
      lines = { { id = "ow_default", text = "Draz'Zilb watches the Overlord with sharp eyes, and Draz'Zilb is clever, cleverer than Tharg. Tharg does not know what Draz'Zilb thinks, but Tharg sees him thinking it." } },
      choices = {
        { text = "Mok'Morokk kept your people alive. That counts.", next = "overlord_end", fx = { align = { order = 1 } } },
        { text = "A chief who runs should be pulled down.", next = "overlord_end", fx = { align = { order = -1 } } },
        { text = "What would you do as Overlord?", next = "overlord_end" },
      },
    },
    overlord_end = {
      lines = { { id = "oe_default", text = "Tharg is old and slow and his leg is bad, so nobody will make Tharg Overlord. But if Tharg was Overlord, the ogres would fight, because ogres should fight and ogres are not good at running." } },
      choices = { { text = "Something else, Tharg.", next = "BACK" } },
    },
    rexxar = {
      lines = { { id = "r_default", text = "Tharg was there, yes, when the half-ogre came with his bear and asked the Stonemaul to help the Horde. Kor'gall was chief then, and Kor'gall said no, so Rexxar fought him, and Kor'gall did not get up." } },
      choices = {
        { text = "What was Rexxar like?", next = "rexxar_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rexxar_like = {
      lines = { { id = "rl_default", text = "Quiet, and big in the shoulders, and his eyes looked past you at something far away. He made Mok'Morokk Overlord and went off into the wild, and Tharg thinks he did not choose well, but Tharg would not say so to Rexxar's face." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    rexxar_hunt = {
      lines = { { id = "rh_default", text = "Rexxar fights beside his beast like it is his brother, and the bear fights like Rexxar is its cub. Tharg sees you have that look too, a little, so maybe the beasts listen to you also." } },
      choices = {
        { text = "My companion is family. That's the whole of it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "You would do that for an old ogre? Tharg does not know if spirits listen to ogres, but if they do, tell her Tharg is still angry, and Tharg is still waiting, and Tharg did not forget." } },
      choices = { { text = "I'll ask them, Tharg.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some words are best kept for yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "Fewer, yes, and Tharg can feel it in his chest like a stone taken off. Tell Tharg, did the ruins still stand when you were there?" } },
      choices = {
        { text = "The walls still stand. Your home is waiting.", next = "after_end", fx = { affinity = 1 } },
        { text = "It's mostly rubble, Tharg. I'm sorry.", next = "after_end" },
      },
    },
    after_end = {
      lines = { { id = "ae_default", text = "Then Tharg will see it again, whole or broken, before Tharg dies. You helped make that true, little one, and Tharg will not forget." } },
      choices = { { text = "Something else, Tharg.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Tharg is Stonemaul. Tharg had a home and a wife, and the black dragons took both, so now Tharg is old and angry in a wet village." } },
    advice = { { id = "tp_ad", text = "Do not run from what hurts you, because the running never stops after that. Tharg knows." } },
    black_dragonflight = { { id = "tp_black", text = "They burned Tharg's village and took Tharg's wife, and they sit in the south like they own it. Tharg has nothing good to say about black dragons, so Tharg says nothing else." } },
    onyxia = { { id = "tp_onyxia", text = "Onyxia's whelps burned Tharg's village, and Tharg's wife was inside. Tharg would kill the big black dragon himself if Tharg's knees were young again, and if Tharg had an army." } },
    thrall = { { id = "tp_thrall", text = "The orc chief let the Stonemaul who lived come to Brackenwall, and Tharg is grateful for it. Tharg's people had nowhere else to go." } },
    theramore = { { id = "tp_theramore", text = "The humans have big boats and big walls, and they do not come to the south of the marsh where the dragons are. Tharg does not blame them for that." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "Tharg hears the black dragons have a mountain far away, where the dragon's brother sits on top. Too many black dragons in the world, Tharg thinks, far too many." } },
    _none = { { id = "tp_none", text = "Tharg does not know about that. Ask Draz'Zilb, because Draz'Zilb knows everything and says half of it." } },
  },
}
