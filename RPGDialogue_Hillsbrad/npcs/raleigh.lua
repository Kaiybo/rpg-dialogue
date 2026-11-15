-- Raleigh the Devout, upstairs at the Southshore Inn. Voice: bibles/raleigh.md
-- The Scarlet Path throughline (RPGDialogue_World/threads.lua, scarlet_path).
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Two Classic quests share the title "Down the Scarlet Path" (wiki 261, Anton's; 1052, the
-- letter to Raleigh). Here, active means the second one: the first is handed in to Anton.
-- "In the Name of the Light" is wiki 1053.

P:NPC {
  key = "raleigh", id = TODO_NPC("Raleigh the Devout"), name = "Raleigh the Devout",
  bible = "bibles/raleigh.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "grave", "guarded" }, values = { "honest", "devout" },
  notices = { "light", "scarlet" },

  greetings = {
    { id = "g_door", text = "Close the door behind you. Then tell me who sent you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit. I've had worse company than people who listen." },
    { id = "g_after", when = { questDone = TODO_QUEST("In the Name of the Light") }, text = "Come in. You're one of the few I don't have to explain myself to." },
  },

  notice = {
    { id = "n_light", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the faithful. They'll want you most of all, up north. They wanted me." },
    { id = "n_scarlet", cat = "scarlet", when = { questActive = TODO_QUEST("Down the Scarlet Path") },
      text = "That seal. Red wax, a burning sword. I used to press it myself." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Raleigh. They call me the Devout, which is kind of them. I wore the Crusade's red once. Now I keep a room above an inn and watch the north road." },
        { id = "h_letter", tags = { "news" }, key = true, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "Anton's letter. Give it here. Light help us, he still thinks I'm one of them. There's something you need to hear before you go anywhere near Tirisfal." },
        { id = "h_monastery", tags = { "news" }, when = { questActive = TODO_QUEST("In the Name of the Light") },
          text = "The Monastery's in Tirisfal. The Houndmaster, Herod, Mograine, Whitemane. Until they fall, anyone who crosses the Crusade's path is in danger." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("In the Name of the Light"), days = 3 } },
          text = "It's done, then. I won't celebrate, and neither should you. But there are people in Tirisfal tonight who'll live to see morning." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask. I've stopped keeping secrets for them." },
        { id = "h_again2", text = "Go on. The road's quiet tonight." },
      },
      choices = {
        { text = "Why did you leave the Crusade?", next = "left" },
        { text = "What's at the Monastery?", next = "monastery" },
        { text = "Brother Anton sent me.", next = "anton", when = { any = { { questActive = TODO_QUEST("Down the Scarlet Path") }, { thread = { id = "scarlet_path", beat = "b2_anton" } } } } },
        { text = "Were you a paladin before the Crusade?", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I came out of Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Was it right, what I did there?", next = "after", when = { questDone = TODO_QUEST("In the Name of the Light") } },
        { text = "I'll leave you to your window.", next = "END" },
      },
    },
    left = {
      big = true,
      lines = { { id = "l_default", key = true, text = "I joined to fight the plague, and left when I understood that to them, the plague is anyone without the tabard. They tortured innocent people for being 'plagued'. I don't sleep much." } },
      choices = {
        { text = "Why didn't you stop them?", next = "left_stop", fx = { trait = { stern = 1 } } },
        { text = "You did the right thing.", next = "left_right", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left_stop = {
      lines = { { id = "ls_default", text = "One man against the Monastery? I'd have been the next one asked if he was plagued. So I ran, and sat here waiting for someone who could do what I couldn't." } },
      choices = {
        { text = "Then I'm that someone.", next = "monastery", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Running isn't nothing.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    left_right = {
      lines = { { id = "lr_default", text = "Leaving was right. Staying quiet afterward wasn't. That's why I tell everyone Anton sends me. Most go home. Some go north with a different reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    monastery = {
      big = true,
      lines = {
        { id = "m_default", text = "A fortress with prayers painted on it, in Tirisfal. The Houndmaster and his dogs keep the library, Herod the armoury. Mograine commands. Whitemane questions." },
        { id = "m_done", when = { questDone = TODO_QUEST("In the Name of the Light") }, text = "You've seen it now. You know what's painted on the walls, and what's under the paint." },
      },
      choices = {
        { text = "Whitemane questions?", next = "monastery_white" },
        { text = "Why not send soldiers?", next = "monastery_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monastery_white = {
      lines = { { id = "mw_default", text = "The High Inquisitor. People were taken to her suspected of the plague, and what was done to them is why I left. The rest you can see for yourself." } },
      choices = {
        { text = "I'll go.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    monastery_why = {
      lines = { { id = "my_default", text = "Whose soldiers? Stormwind's are spread thin, and nobody marches north against men in red who say they fight the Scourge. So it falls to people like you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    anton = {
      lines = {
        { id = "a_default", text = "Anton is a good man in the wrong colours. He's been in Desolace so long he thinks the Crusade is still what it was when he left. I can't bring myself to write and tell him." },
      },
      choices = {
        { text = "Someone should tell him.", next = "anton_tell", fx = { align = { honor = 1 } } },
        { text = "Let him keep his cause.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    anton_tell = {
      lines = { { id = "at_default", text = "Then you tell him. He'll believe it from someone who's walked the path he sent them down. From me it would only sound like a deserter's excuse." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2, flag = { set = "scarlet_tell_anton" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = { { id = "p_default", text = "Before, yes: the Light and a hammer, like any paladin of Lordaeron. The Crusade took both and pointed them at whoever it liked. I still pray, but I've had to learn how again." } },
      choices = {
        { text = "How do you pray now?", next = "paladin_pray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_pray = {
      lines = { { id = "pp_default", text = "Quietly. With my eyes open. The Crusade prayed loud and closed its eyes to everything else. I'd rather see what I'm asking the Light to bless." } },
      choices = { { text = "That's a good way.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } } },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then you know how it was, at the start. Everyone afraid of everyone. The Crusade made a faith of that fear. Don't let anyone make one of yours." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },
    after = {
      lines = { { id = "af_default", text = "No servant of the Light should be glad of a death. Some are still needed. Carry it, don't wear it. That's the difference between you and them." } },
      choices = {
        { text = "I'll carry it.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'd do it again.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A paladin who believed the wrong men. I know exactly when I stopped. I don't know when I started.", next = "left" } },
    advice = { { id = "tp_ad", text = "If a man in red asks whether you're plagued, the right answer is to be somewhere else." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They started out against the plague and ended up against everyone. I was there for both halves.", next = "left" } },
    scarlet_monastery = { { id = "tp_monastery", text = "The heart of the Crusade, in Tirisfal. I can tell you who sits in it, if you mean to go.", next = "monastery" } },
    argent_dawn = { { id = "tp_dawn", text = "Men who left the Hand before the rot set in. Wiser than me, or quicker." } },
    _none = { { id = "tp_none", text = "Not something I know. Ask downstairs; they hear more than I do." } },
  },
}
