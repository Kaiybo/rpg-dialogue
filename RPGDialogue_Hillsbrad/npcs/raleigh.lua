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
  prejudice = { class = "WARLOCK", amount = 8, why = "Six years of Crusade sermons he is trying to unlearn." },
  notices = { "light", "scarlet" },

  impression = {
    first = "Raleigh the Devout asked me to close the door before anything else and wanted to know who'd sent me. He wore the Crusade's red once, and he still watches the north road.",
    third = "{name} called on Raleigh the Devout, a former Scarlet Crusader who keeps a room above the Southshore inn.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A warlock. I'll ask you to keep your hands where I can see them, and I'm sorry for asking, because six years of Crusade sermons don't wash out in one winter." },
    { id = "g_prej2", when = { prejudiced = true }, text = "Close the door, and forgive me if I sit nearer the candle than you. Part of me still counts the steps to the pyre whenever a warlock walks in, and I hate that part of me." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Come in, and sit wherever you like. I caught myself defending a warlock to the innkeeper last night, and I think the warlock was you." },
    { id = "g_door", text = "Close the door behind you, and then tell me who sent you." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Sit down, then; I've had worse company than people who listen." },
    { id = "g_xsquire", when = { origin = "human_paladin_squire" }, text = "That's a squire's stance if ever I saw one. The Order broke, but by the look of you the oaths didn't, so close the door and sit, because you're among friends up here." },
    { id = "g_after", when = { questDone = TODO_QUEST("In the Name of the Light") }, text = "Come in, come in. You're one of the few I don't have to explain myself to." },
  },

  notice = {
    { id = "n_light", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "One of the faithful, I see. They'll want you most of all up north, just as they wanted me." },
    { id = "n_scarlet", cat = "scarlet", when = { questActive = TODO_QUEST("Down the Scarlet Path") },
      text = "That letter bears the Crusade's seal, red wax and a burning sword, and I used to press it myself." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "I do, and I know it. The Crusade taught me that every warlock is a door the Scourge can walk through, and I've unlearned most of what they taught me, but that lesson sits deeper than the rest." } },
      choices = {
        { text = "I'm no more the Scourge's than you are. Unlearn it.", next = "BACK", reply = "I'm trying, and I'll keep trying, though you'll forgive me if my hand still twitches when your shadow falls across the floor.", fx = { align = { light = 1 } } },
        { text = "Keep flinching. What I wield deserves a little fear.", next = "BACK", reply = "Then we're both honest, at least. I'll keep my distance and my prayers, and you'll keep whatever it is that whispers to you.", fx = { align = { light = -1 } } },
        { text = "I'll sit by the door. Take whatever time you need.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Where did they teach you that?", next = "prej_why" },
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "In the Monastery's yard, with a straw man in a black robe and a torch in every recruit's hand. We practised on the straw man for a month, and then one day it wasn't straw, and nobody ever told us whether he'd been a warlock at all." } },
      choices = {
        { text = "You followed orders. The blame belongs to the men who gave them.", next = "BACK", reply = "That's kind, and I've told myself the same a hundred nights running. It hasn't helped yet, but perhaps it sounds truer coming from someone else.", fx = { align = { order = 1 } } },
        { text = "You held the torch. Some of that blame is yours to carry.", next = "BACK", reply = "I know it, and I carry it every day. You're the first who's said it to my face, and I think I'm grateful for that.", fx = { align = { order = -1 } } },
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "That's kind, and it's more patience than I ever showed anyone while I wore the red. Give me a few more visits, and maybe I'll stop counting the steps between us." } },
      choices = {
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    opn_crusade = {
      lines = {
        { id = "opn_crusade_q", text = "I ask myself that every night, and I get a different answer depending on whose face I remember first. There are men like Anton in it still, good men who think they're fighting the plague. You've seen them in red; what do you think should be done with them?" },
      },
      choices = {
        { text = "Break the Crusade. The good ones will find their way out.", next = "opn_crusade_r_hate", fx = { align = { light = -1 }, opinion = { scarlet_crusade = "hate" } } },
        { text = "Reach the good ones first, the way you're doing.", next = "opn_crusade_r_pity", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 }, opinion = { scarlet_crusade = "pity" } } },
        { text = "They hold back the Scourge. That counts for something.", next = "opn_crusade_r_necessary", fx = { affinity = -1, opinion = { scarlet_crusade = "necessary" } } },
        { text = "They'd burn me for what I am. I can't forgive that.", next = "opn_crusade_r_hate", when = { class = { "SHAMAN", "WARLOCK", "DRUID" } }, fx = { opinion = { scarlet_crusade = "hate" } } },
        { text = "I can't judge them, Raleigh.", next = "BACK" },
      },
    },
    opn_crusade_r = {
      lines = {
        { id = "opn_crusade_r_default", text = "Nor can I, most days, and I was one of them." },
      },
      choices = {
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    opn_crusade_r_hate = {
      lines = {
        { id = "opn_crusade_r_hate", text = "Some of the good ones will find their way out, and some will die in the breaking, and those are the ones I'd have to name in my prayers. I don't say you're wrong; I only say it'll cost." },
      },
      choices = {
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    opn_crusade_r_pity = {
      lines = {
        { id = "opn_crusade_r_pity", text = "Slowly, one Anton at a time. It's not much, but it's what one deserter with a confession can do, and it helps to hear someone call it worth doing." },
      },
      choices = {
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    opn_crusade_r_necessary = {
      lines = {
        { id = "opn_crusade_r_necessary", text = "It counts, the way a wall counts even when it's built of bones. I said that once, too, and then I watched what they did in the Monastery's cellars." },
      },
      choices = {
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    xpt_priest = {
      big = true,
      lines = { { id = "xpt_priest_default", text = "Tell them to sleep when they can and eat before they pray, because a healer who falls in the road heals nobody, and I've watched good priests burn out in a single season at Hillsbrad. And tell them that the ones they couldn't save were never theirs to save; I wish someone had told me that sooner." } },
      choices = {
        { text = "Wise words. A healer must look after themselves too.", next = "BACK", reply = "Yes, and it's the hardest lesson of all for the young ones, who think exhaustion is a kind of devotion.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A healer's duty doesn't stop for sleep while people bleed.", next = "BACK", reply = "Then you'll learn it the way I did, at the bottom of a ditch with your hands shaking. I hope someone's there to pick you up when you do.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_cath = {
      big = true,
      lines = { { id = "xcl_cath_default", text = "Then the High Inquisitor has met the judgement she handed out so freely, and I'll not pretend I'm sorry. She raised the fallen in the drill yard more than once, and the brothers called it a miracle, but I always wondered what answered her so quickly." } },
      choices = {
        { text = "The Light judged her, and I was only its instrument.", next = "BACK", reply = "Be careful with that, friend, because the Crusade said exactly the same about every pyre they ever lit. Still, I'll not mourn her.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light had nothing to do with it. She was a murderer.", next = "BACK", reply = "Yes, she was, and it's a relief to hear someone say it plainly. The Light is not a word you put on a slaughter to make it holy.", fx = { align = { light = -1 } } },
        { text = "Will the Crusade break, now its leaders are gone?", next = "xcl_cath2" },
      },
    },
    xcl_cath2 = {
      lines = { { id = "xcl_cath2_default", text = "Not while Hearthglen and Tyr's Hand still stand, for the Monastery was only one of the Crusade's hearts. But the young ones in the pews will hear what happened, and some of them will start asking questions, as I did." } },
      choices = {
        { text = "Then I hope they find a door, as you did.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Without a moment's hesitation, because they decided long ago that anything not of the Light was of the Scourge, and they've grown no wiser since. I still believe the Light is the truest thing in this world, but I've learned it doesn't need me to hate everything else on its behalf." } },
      choices = {
        { text = "The Crusade wasn't wrong to be careful. Faith needs walls.", next = "BACK", reply = "Walls, yes, but the Crusade built so many walls they forgot what they were guarding. I'd rather keep a door open and pray I choose well.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Faith that fears everything else isn't faith, Raleigh.", next = "BACK", reply = "No, it isn't, and it took me years and a good deal of blood to learn that. You learned it faster, by the look of you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Very likely, and I'd have carried the torch, once. The Crusade calls anything it doesn't understand a corruption, and it understands less every year. I left because I couldn't tell the difference anymore between cleansing a village and burning it." } },
      choices = {
        { text = "You left. That took more courage than staying.", next = "BACK", reply = "Courage, or only a bad stomach, I've never been sure. Thank you all the same; it's a kind thing to say to a man who still dreams of smoke.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who carried torches should answer for them.", next = "BACK", reply = "I know it, and I answer for them every night on my knees. If the Light has a sterner court than that, I'll stand before it too.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too well, and for the wrong war. They teach you to hold a line against the Scourge, then they teach you the line runs through every village that won't wear the tabard, and by then you're too disciplined to ask why." } },
      choices = {
        { text = "Discipline is no sin. It depends who's giving the orders.", next = "BACK", reply = "Perhaps, but I gave myself to men who'd long since stopped deserving it, and discipline didn't save a single village from us.", fx = { align = { order = 1 } } },
        { text = "A soldier who can't refuse an order is only a weapon.", next = "BACK", reply = "That's what I became, and I'm still learning how to be a man again. Some days it goes better than others.", fx = { align = { order = -1 } } },
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With trackers and hounds both, the Houndmaster's best, bred in the kennels at the Monastery. I've seen those dogs run down a man who'd only been accused, and I've wondered since whether the dogs knew more about mercy than their masters did." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "With trackers and the Houndmaster's dogs, and your {pet} hasn't growled at me once, which those dogs never managed for anyone not wearing red. I take that as a kindness, and I've had few enough of those lately." },
      },
      choices = {
        { text = "A deserter is still a deserter, and the hunt is lawful.", next = "BACK", reply = "Lawful by whose law? The Crusade writes its own, and I've seen it signed in other men's blood.", fx = { align = { order = 1 } } },
        { text = "No one should be hunted for leaving a cause gone rotten.", next = "BACK", reply = "I'd like to believe that, and most days I do, though the dogs in my dreams don't seem to agree with you.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not openly, but they remember every face that turned away, and they don't take kindly to it. I saw what they did at Hearthglen to a brother they suspected of the plague, and I left the next night without saying goodbye." } },
      choices = {
        { text = "Then I'll keep watch for you. No one should be hunted for leaving.", next = "BACK", reply = "You'd do that for a stranger? The Light sends help in strange shapes, it seems, and I'll not turn it away.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Desertion is a crime, even from the Crusade.", next = "BACK", reply = "Perhaps it is, and if they come for me I'll not run a second time. I'd only ask that you judge the Crusade by the same law.", fx = { align = { order = 1 } } },
        { text = "Something else, Raleigh.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, and that frightens me more than you do. The Light teaches mercy, and the Crusade taught me to forget that, and every day in this room I try to remember which one I believe." } },
      choices = {
        { text = "Mercy is the Light's true teaching. Hold on to that.", next = "BACK", reply = "I'll try, and I'll thank you for saying it. It's easier to hold on when someone else believes it too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Crusade wasn't wrong about everything. Some things should burn.", next = "BACK", reply = "Some things, yes, and that's exactly the thought that lit every pyre I ever stood beside. Mind where it leads you.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They blame Kel'Thuzad, who was one of yours, and from him it's a short walk to blaming every robe in the kingdom. I heard it preached in the Monastery's chapel, and the men around me cheered, and I said nothing, which I'm told is how most terrible things begin." } },
      choices = {
        { text = "Kel'Thuzad's crimes were his own. Dalaran paid for them too.", next = "BACK", reply = "They did, and I'd forgotten that, which shames me. The Crusade never mentions what Dalaran lost.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dalaran did breed Kel'Thuzad. The Crusade isn't entirely wrong.", next = "BACK", reply = "Not entirely, perhaps, but a sermon that blames a whole city for one man's sin will burn the whole city sooner or later.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_priest", tags = { "news" }, when = { party = { class = "PRIEST" }, faction = "Alliance" },
          text = "You travel with {companion}, and I'd know a fellow priest by the way they bow their head at my door. Southshore has buried too many lately, and I find I'm glad of every healer who passes through." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf. The Crusade would have named you a heretic before you'd finished speaking, {class}, and once I'd have agreed with them, so sit down and let me hear what I'd have condemned." },
        { id = "h_default", key = true,
          text = "I'm Raleigh, and they call me the Devout, which is kind of them. I wore the Crusade's red once, and now I keep a room above an inn and watch the north road." },
        { id = "h_letter", tags = { "news" }, key = true, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "Anton's letter? Give it here. Light help us, he still thinks I'm one of them, and there's something you need to hear before you go anywhere near Tirisfal." },
        { id = "h_monastery", tags = { "news" }, when = { questActive = TODO_QUEST("In the Name of the Light") },
          text = "The Monastery's in Tirisfal, and the Houndmaster, Herod, Mograine and Whitemane hold it. Until they fall, anyone who crosses the Crusade's path is in danger." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("In the Name of the Light"), days = 3 } },
          text = "It's done, then. I won't celebrate, and neither should you. But there are people in Tirisfal tonight who'll live to see morning." },
        { id = "h_cl_cath", tags = { "news" }, when = { cleared = "Scarlet Cathedral", faction = "Alliance" },
          text = "You've stood in the cathedral and come back down its steps, and I can see it on you. I knelt at that altar for six years, and I never thought I'd be glad to hear it had gone quiet." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Close the door, and I'll ask you plainly: were you sent by the Crusade? You move like the men they send for those of us who left." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The Crusade would have burned you before you finished speaking, and once I'd have lit the pyre myself, which is something I think about more than I'd like." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "You stand like a soldier, and I used to drill men to stand like that, under a red banner I'd rather not name. Close the door, please, and sit with your back to the wall if it makes you easier." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you came up the stairs quietly, which I'm grateful for. The Crusade used trackers to find those of us who left, so you'll pardon me if I check the window." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei, here in Southshore. I spent years being told your kind were heathens, and I'm ashamed of how readily I believed it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The Crusade counts Dalaran among the reasons Lordaeron fell, and I believed it once, because it was easier than believing we had failed on our own." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away; I've stopped keeping secrets for them." },
        { id = "h_again2", text = "Go on, the road's quiet tonight, apart from the wolves and my stomach." },
      },
      choices = {
        { text = "You don't seem like a man who left the Crusade lightly.", next = "left" },
        { text = "What's at the Monastery?", next = "monastery" },
        { text = "Brother Anton sent me.", next = "anton", when = { any = { { questActive = TODO_QUEST("Down the Scarlet Path") }, { thread = { id = "scarlet_path", beat = "b2_anton" } } } } },
        { text = "Were you a paladin before the Crusade?", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I came out of Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Was it right, what I did there?", next = "after", when = { questDone = TODO_QUEST("In the Name of the Light") } },
        { text = "Does the Crusade hunt those who leave, Raleigh?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you still see me burned, Raleigh?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Crusade must train its warriors well, Raleigh.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess the Crusade hunts its deserters with trackers, Raleigh.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You wore the Crusade's red. Would they have burned me?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The Crusade seems to blame Dalaran for everything.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would the Crusade really call me a heretic, Raleigh?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been through the cathedral, Raleigh. Whitemane has fallen.", next = "xcl_cath", when = { cleared = "Scarlet Cathedral", faction = "Alliance" } },
        { text = "My companion tends our wounds. Have you advice for them?", next = "xpt_priest", when = { party = { class = "PRIEST" }, faction = "Alliance" } },
        { text = "You flinch every time I move, Raleigh.", next = "prej", when = { prejudiced = true } },
        { text = "I'll leave you to your window.", next = "END" },
      },
    },
    left = {
      big = true,
      lines = { { id = "l_default", key = true, text = "I joined to fight the plague, and left when I understood that to them, the plague is anyone without the tabard. They tortured innocent people for being 'plagued', and I haven't slept much since." } },
      choices = {
        { text = "Why didn't you stop them?", next = "left_stop", fx = { trait = { stern = 1 } } },
        { text = "You did the right thing.", next = "left_right", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You ran when it got hard, and that's all it was.", next = "BACK", reply = "Perhaps it was, and I've asked myself the same on worse nights than this. But I'd rather be a coward who stopped than a brave man who kept going.", fx = { align = { light = -1 } } },
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
      lines = { { id = "lr_default", text = "Leaving was right, but staying quiet afterward wasn't, and that's why I tell the truth to everyone Anton sends me. Most of them go home, and some go north with a different reason." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "You still haven't forgiven yourself, have you?", tag = "Persuade", next = "stayed",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { questDone = TODO_QUEST("In the Name of the Light") } } } },
          fail = { next = "stayed_no", fx = { affinity = -1 } } },
      },
    },
    monastery = {
      big = true,
      lines = {
        { id = "m_default", text = "A fortress with prayers painted on it, in Tirisfal. The Houndmaster and his dogs keep the library and Herod the armoury, while Mograine commands and Whitemane does the questioning." },
        { id = "m_done", when = { questDone = TODO_QUEST("In the Name of the Light") }, text = "You've seen it now. You know what's painted on the walls, and what's under the paint." },
      },
      choices = {
        { text = "Whitemane questions?", next = "monastery_white" },
        { text = "Someone ought to send soldiers.", next = "monastery_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    monastery_white = {
      lines = { { id = "mw_default", text = "The High Inquisitor. People were taken to her suspected of the plague, and what was done to them is why I left. The rest you can see for yourself." } },
      choices = {
        { text = "I'll go.", next = "BACK", reply = "Go carefully, and remember they were people once, all of them, even the ones in red. The Light keep you.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Whitemane's business is her own, and I'll stay clear of it.", next = "BACK", reply = "Wise, perhaps, and I'll not judge you for it. I stayed clear of it too, for far too long.", fx = { align = { light = -1 } } },
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
        { text = "Someone should tell him.", next = "anton_tell" },
        { text = "Let him keep his cause.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    anton_tell = {
      lines = { { id = "at_default", text = "Then you tell him. He'll believe it from someone who's walked the path he sent them down. From me it would only sound like a deserter's excuse." } },
      choices = {
        { text = "Is anything in the Crusade still worth saving?", next = "opn_crusade" },
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
      lines = { { id = "pp_default", text = "Quietly, and with my eyes open. The Crusade prayed loud and closed its eyes to everything else, and I want to see what I'm asking the Light to bless." } },
      choices = {
        { text = "That's a good way.", next = "BACK", reply = "I've found it so. The Light seems to hear a quiet voice just as well as a loud one.", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Prayer won't keep my eyes open. A sharp blade will.", next = "BACK", reply = "A blade has its place, and I'll not argue that it doesn't. Only make sure you know which way it's pointed before you bless it.", fx = { align = { light = -2 } } },
      },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then you know how it was at the start, with everyone afraid of everyone. The Crusade made a faith of that fear, so don't let anyone make one of yours." } },
      choices = {
        { text = "I won't.", next = "BACK", reply = "Good, because you'll be tempted, and so was I. Fear is a terrible teacher and a worse priest.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Fear kept me alive back then, and I'll keep it.", next = "BACK", reply = "Keep it, then, but keep it on a leash. Fear that runs free soon starts choosing who lives.", fx = { align = { light = -1 } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "No servant of the Light should be glad of a death, though some are still needed. Carry it, don't wear it; that's the difference between you and them." } },
      choices = {
        { text = "I'll carry it.", next = "BACK", reply = "Good, because it's heavy, and the weight is how you'll know you're still yourself. The Light walk with you.", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "I'd do it again.", next = "BACK", reply = "Perhaps you would, and perhaps you'd be right to. Only promise me you'll never be glad of it.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    stayed = {
      lines = {
        { id = "sy_default", text = "No. I said I don't know when I started believing them, but I know when I should have stopped: the first time they asked a man if he was plagued and didn't wait to hear his answer, and I stayed a long while after that, which is the part I can't put down." },
        { id = "sy_light", when = { class = { "PRIEST", "PALADIN" } },
          text = "You serve the Light, so you'll understand why I can't. I knew the Crusade was wrong the first time they asked a man if he was plagued and didn't wait for his answer, and I stayed a long while after that, praying it would pass." },
      },
      choices = {
        { text = "You're doing something about it now.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed_no = {
      lines = {
        { id = "sn_default", text = "That's between me and the Light, and the Light hasn't said. Ask me about the Monastery instead; that I can help you with." },
        { id = "sn_new", when = { metBefore = false },
          text = "We've only just met, and that's a long way down to go with a stranger. Ask me about the Monastery instead." },
      },
      choices = {
        { text = "All right.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know much, but what I know cost me two teeth and a good horse. Ask, and I'll tell you true." },
    },
    background = { { id = "tp_bg", text = "I was a paladin who believed the wrong men. I know exactly when I stopped, but I don't know when I started.", next = "left" } },
    advice = { { id = "tp_ad", text = "If a man in red asks whether you're plagued, the right answer is to be somewhere else." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They started out against the plague and ended up against everyone. I was there for both halves.", next = "left" } },
    scarlet_monastery = { { id = "tp_monastery", text = "The heart of the Crusade, in Tirisfal. I can tell you who sits in it, if you mean to go.", next = "monastery" } },
    argent_dawn = { { id = "tp_dawn", text = "The Argent Dawn are men who left the Hand before the rot set in, wiser than me or quicker." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a hard master, and I served it in red once, and I served it badly. I serve it now in a quiet room in Southshore, and I think it prefers me this way." } },
    scourge = { { id = "tp_scourge", text = "I have burned the dead and watched them rise again, and I have seen what that does to a man's mind. The Crusade's madness started there, in the fields outside Stratholme." } },
    forsaken = { { id = "tp_forsaken", text = "They are dead, and they are thinking, and they are brewing something up the hill, and I'd sleep better if one of those three things weren't true. I pray for them anyway, and that's more than my old brothers would do." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was where I joined the Crusade, in the smoke of a city burned by its own prince. The dead hold the east of it now and my old brothers hold the gates, and I couldn't tell you which is worse." } },
    arthas = { { id = "tp_arthas", text = "I saw Prince Arthas once, in his golden armour, riding north to save us all. I don't pray for him, and I've stopped asking the Light whether I should." } },
    _none = { { id = "tp_none", text = "That's not something I know. Ask downstairs; they hear more than I do." } },
  },
}
