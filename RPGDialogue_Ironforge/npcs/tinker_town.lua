-- Tinker Town: the gnome refugees who are still trying to get home.
-- Voices: bibles/tinker_town.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Tinkmaster Overspark: gnomish engineering's master; Techbot gone rogue; the Pledge of Secrecy.
P:NPC {
  key = "overspark", id = TODO_NPC("Tinkmaster Overspark"), name = "Tinkmaster Overspark", title = "Gnome Engineering Trainer",
  bible = "bibles/tinker_town.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "proud" }, values = { "inventive", "proud" },
  notices = { "craft" },

  impression = {
    first = "He mourns his broken robot Techbot as if it were a friend.",
    third = "{name} met Tinkmaster Overspark, the master of gnome engineering, who works in Tinker Town while Gnomeregan lies poisoned.",
  },

  greetings = {
    { id = "g_stand", text = "Yes, yes, how may I help? I've nothing but time, standing about in Tinker Town while our dear city sits under its green poison cloud." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Seeing a fellow engineer brightens even a terrible day, and they're all terrible lately." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { name = "Engineering", min = 200 } },
      text = "You've the burn marks of a serious engineer, and the eyebrows of one who's learned from them. Have you chosen a discipline yet? Choose wisely; choose gnomish." },
    { id = "n_priest", cat = "craft", when = { class = "PRIEST" },
      text = "A priest! Brother Sarno in your Cathedral was very kind about Techbot when I wrote to him. Do thank him for me, if you're passing." },
  },

  start = "hello",
  nodes = {
    opn_goblins = {
      lines = {
        { id = "opn_goblins_q", text = "Trust one? I'd sooner trust a steam boiler with no valve, and at least the boiler doesn't send you an invoice afterwards. But you've been out among them, I expect, in Booty Bay and Ratchet. What do you think of the little profiteers?" },
      },
      choices = {
        { text = "They sell to both sides. That's all you need to know.", next = "opn_goblins_r_distrust", fx = { affinity = 1, align = { order = 1 }, opinion = { goblins = "distrust" } } },
        { text = "Their gear works, and they don't ask permission. I like that.", next = "opn_goblins_r_admire", fx = { affinity = -1, align = { order = -1 }, opinion = { goblins = "admire" } } },
        { text = "A goblin's useful as long as you read the contract twice.", next = "opn_goblins_r_useful", fx = { trait = { practical = 1 }, opinion = { goblins = "useful" } } },
        { text = "Goblin engineering is noise and fire. Gnomes do it properly.", next = "opn_goblins_r_contempt", when = { race = "Gnome" }, fx = { affinity = 2, opinion = { goblins = "contempt" } } },
        { text = "I've never met one, Tinkmaster.", next = "BACK" },
      },
    },
    opn_goblins_r = {
      lines = {
        { id = "opn_goblins_r_default", text = "Well, you'll meet one soon enough, and when you do, count your fingers after the handshake." },
      },
      choices = {
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    opn_goblins_r_distrust = {
      lines = {
        { id = "opn_goblins_r_distrust", text = "Exactly so! I've said the same to the council for years, and now I can say a well-travelled adventurer agrees with me, which sounds much better in the minutes." },
      },
      choices = {
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    opn_goblins_r_admire = {
      lines = {
        { id = "opn_goblins_r_admire", text = "Permission is what keeps the roof on, my friend! Well, I suppose a goblin's roof comes off rather often, and they seem to like it that way, but I'll not have that talk in my workshop." },
      },
      choices = {
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    opn_goblins_r_useful = {
      lines = {
        { id = "opn_goblins_r_useful", text = "Twice? I read them three times and then have a dwarf read them aloud, and I still find a clause about my eyebrows. But yes, I suppose they have their uses." },
      },
      choices = {
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    opn_goblins_r_contempt = {
      lines = {
        { id = "opn_goblins_r_contempt", text = "Ha! That's the spirit, and that's the pledge, and I'll hear no more about Booty Bay's clever little rockets in this room." },
      },
      choices = {
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Whether it's angry with us. We dug deep and we dug fast, and then the troggs came up out of the depths. I've always blamed the troggs, but sometimes, late at night, I wonder whether we woke something we oughtn't to have, and whether your elements would say we deserved it." } },
      choices = {
        { text = "No one deserved Gnomeregan's fall. The earth isn't cruel.", next = "BACK", reply = "That's very kind of you, and I'd like to believe it, so I'll write it down on a card and pin it above my bench for the bad nights.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe you did dig too deep. The earth remembers.", next = "BACK", reply = "Oh dear, that's exactly what I was afraid you'd say, and I'll be up until dawn now, recalculating every drill depth we ever logged.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They poured up from the deep in their thousands, and our defenders fell back level by level until there was nothing left to do but flee. I'll not pretend I fought, for I'm an engineer, but I watched a great many brave gnomes hold doorways while the rest of us ran, and I'll never forget them." } },
      choices = {
        { text = "Those who held the doorways deserve to be honoured.", next = "BACK", reply = "They do, every one of them, and I've drawn up plans for a memorial with eleven moving parts, though the Assembly says ten would be more dignified.", fx = { align = { honor = 1 } } },
        { text = "Running was the clever choice. I don't blame you.", next = "BACK", reply = "That's generous of you, though it doesn't stop me feeling like a coward every time I pass the gate, but I'll try to hear it your way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It chased a trogg back into Gnomeregan and never came out, which I choose to believe was an act of great heroism. Your beasts have one advantage over mine, at least, which is that they come back when you call them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It chased a trogg back into Gnomeregan and never came out, which I choose to believe was great heroism. Your {pet} would put my poor hound to shame, I'm sure, but please don't tell it I said so." },
      },
      choices = {
        { text = "Then your hound died a hero. I'll believe that too.", next = "BACK", reply = "Thank you, truly, and I'll engrave it on his charging plate, if I ever find it, which is a very small probability but not zero.", fx = { align = { honor = 1 } } },
        { text = "It was a broken machine, Tinkmaster. Build a better one.", next = "BACK", reply = "A better one, yes, I'm working on it, but you can't simply replace a hound who fetched your slippers for six years, even a clockwork one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some live in Tinker Town, some went to Stormwind, and some never came out of the radiation at all. The ones left are building again, which is the gnomish way, though their gadgets are rather more cautious now." } },
      choices = {
        { text = "Caution is wise after a disaster like Gnomeregan.", next = "BACK", reply = "Thank you! The younger gnomes keep calling me a coward for checking every rivet three times, and I keep telling them that's exactly how many rivets Gnomeregan didn't check.", fx = { align = { order = 1 } } },
        { text = "Caution builds nothing. Gnomeregan fell because it hesitated.", next = "BACK", reply = "Oh, that's a terrible thing to say, and possibly true, which makes it worse, so I'll be thinking about that all evening, thank you very much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the dwarves of Ironforge already think we brought our troubles on ourselves, and a gnome warlock in every alley doesn't help. Keep your head down and do good work, and the whispers will fade in time." } },
      choices = {
        { text = "I'll do good work and let the whispers fade.", next = "BACK", reply = "That's the spirit, and the whispers will fade, they always do, though it helps enormously if nothing catches fire in the meantime.", fx = { align = { light = 1 } } },
        { text = "Let the dwarves whisper. Their opinion changes nothing.", next = "BACK", reply = "It changes the rent, and the rent changes everything, so please be a little more careful for the sake of the rest of us in Tinker Town.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Perhaps not yet! But a mechanical bear isn't so far from a mechanical chicken, and I've built several of those. You'd be surprised what clockwork can imitate." } },
      choices = {
        { text = "Some things should stay natural, Tinkmaster.", next = "BACK", reply = "Perhaps, perhaps, and I'll admit a clockwork bear might frighten the real ones, but I'd still like to try, purely in the name of science.", fx = { align = { order = -1 } } },
        { text = "Invention has its place beside nature.", next = "BACK", reply = "Exactly, and I'm so glad you see it, because my mechanical squirrel and a real squirrel got along splendidly until one of them exploded.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I don't know, and it keeps me up at night, which is very unscientific of me. Techbot helped everyone who asked, for years, and if that isn't something worth a prayer, then I don't know what prayers are for." } },
      choices = {
        { text = "Kindness is worth a prayer, wherever it comes from. I'll say one.", next = "BACK", reply = "Thank you, oh, thank you, that's the kindest thing anyone's said about Techbot since the trouble began, and I'm a little overcome.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A machine is a machine, Tinkmaster. Save your grief for the gnomes.", next = "BACK", reply = "I know, I know, everyone says that, but he helped every single gnome who asked, and I'm not sure a heart made of gears matters less.", fx = { align = { light = -1 } } },
        { text = "Tell me about engineering instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Repaired, if I had my way, for he was good once and the fault's somewhere in his memory core. But the Assembly says he's dangerous, and they're not wrong, so I've asked for his brain and left the rest to whoever goes down there." } },
      choices = {
        { text = "If he can be saved, he should be. That's justice.", next = "BACK", reply = "Oh, I'm so glad you think so, and I'll put it in my petition to the Assembly, with your name at the bottom if you don't mind.", fx = { align = { light = 1 } } },
        { text = "A dangerous machine is a dangerous machine. Shut it down.", next = "BACK", reply = "The Assembly would agree with you, and they're probably right, but I'd still like to try the repair once before anyone pulls the lever.", fx = { align = { light = -1 } } },
        { text = "Something else, Tinkmaster.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I think anyone would, for gnomish secrets are the finest in the world, and since Gnomeregan fell they're nearly all we have left! Forgive me, I'm being dramatic again, but some of those plans are the only copies, and I'd sooner lose my beard." },
      },
      choices = {
        { text = "Your secrets are safe with me, Tinkmaster.", next = "BACK", reply = "Thank you, I knew I could trust you, and I'll sleep much better tonight, unless I start worrying about something else, which I will.", fx = { align = { honor = 1 } } },
        { text = "Then lock them up better, Tinkmaster.", next = "BACK", reply = "Better? I've already got four locks, two traps and a very suspicious mechanical parrot, but I'll consider a fifth lock on your advice.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xcl_gnome = {
      big = true,
      lines = { { id = "xcl_gnome_default", text = "Then you walked past everything we built and left behind, the drill rigs, the clean rooms and the great machines in the engineering halls. Thermaplugg turned all of it against us, which is the cruellest thing you can do to an engineer, because a machine only ever does what it's told." } },
      choices = {
        { text = "Then the machines can be forgiven, and the gnomes who built them too.", next = "BACK", reply = "That's a very generous thought, and I hope the High Tinker hears it, because some of the engineers who built those machines can barely look at them now.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then scrap them, Tinkmaster, every last one of them.", next = "BACK", reply = "Every one? Oh, I don't think I could, because some of those machines were the finest work of my career, but I'll confess I've thought it.", fx = { align = { light = -1 } } },
        { text = "What do you think happened to Techbot?", next = "xcl_gnome2" },
      },
    },
    xcl_gnome2 = {
      lines = { { id = "xcl_gnome2_default", text = "I don't know for certain, and that's what keeps me at my blueprints all night. He was still in the city when the troggs came and the radiation went up, and something got into his logic that shouldn't have, so now he goes on being helpful in all the wrong ways." } },
      choices = {
        { text = "I'm sorry about Techbot, Tinkmaster.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_gnomeregan_abandon", tags = { "news" }, when = { gossip = { topic = "gnomeregan", stance = { "abandon", "seal" } } },
          text = "Ah, you're the one who told the High Tinker to give up on Gnomeregan. Bold of you, and wrong, but bold, and Tinker Town's been talking about nothing else." },
        { id = "o_gnomeregan_retake2", tags = { "news" }, when = { gossip = { topic = "gnomeregan", stance = "retake" } },
          text = "Word is you told the High Tinker we should go home! Splendid, splendid. You'll need a suit, of course, and I've a design with only three known flaws." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Forgive my melodrama, but if you've a prayer for Techbot, I'd be grateful, even if he is only a machine, which he isn't, not to me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've always wanted to build a self-polishing breastplate for your sort, but the prototype polished the wearer as well, quite vigorously." },
        { id = "h_cl_gnome", tags = { "news" }, when = { cleared = "Gnomeregan", faction = "Alliance" },
          text = "You've been to the very bottom of Gnomeregan and come back! Forgive my melodrama, but I must sit down, and then I must ask whether you saw Techbot on the way." },
        { id = "h_default", key = true,
          text = "Tinkmaster Overspark, master of gnomish engineering, the one true discipline. Forgive my melodrama, but our situation is dire, what with my poor Techbot gone wrong, and dire situations deserve a bit of drama." },
        { id = "h_techbot", tags = { "news" }, when = { questActive = TODO_QUEST("Tinkmaster Overspark") },
          text = "So Brother Sarno told you, then. Techbot has gone rogue, my Techbot, who used to help everyone, and now he's down in Gnomeregan doing who knows what. Will you help me?" },
        { id = "h_brain", tags = { "news" }, when = { questActive = TODO_QUEST("Save Techbot's Brain!") },
          text = "Techbot's still in the city, near the entrance, and the memory core is the part that matters. Bring me his brain, and gently, if you can; I'd like to know what went wrong." },
        { id = "h_brain_done", when = { questDone = TODO_QUEST("Save Techbot's Brain!") },
          text = "I've been reading Techbot's memory core every evening. Most of it is helpfulness, rows and rows of it, and then something went wrong near the end, and I'm still looking for the bad line." },
        { id = "h_gnome_eng", tags = { "news" }, when = { questActive = TODO_QUEST("Gnome Engineering") },
          text = "You've brought the manual! A young engineer answering the call of true engineering, how splendid. Read it all, then sign the pledge, and mean it." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in Tinker Town! Fascinating, absolutely fascinating, because your shapeshifting is precisely the sort of thing I'd love to build a machine for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Some of my best students were gnome mages before Gnomeregan fell, and they built the most marvellous arcane-powered gadgets." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've got that look, the one from the sealed stacks. I suppose you've heard that Gnomeregan sheltered your sort before the fall, and I'd thank you not to mention it too loudly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, if only we'd had a few more of you when the troggs came up through Gnomeregan's lower levels, the tragedy of it all!" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I once built a mechanical hound, you know, but it chased the wrong things, as all my best inventions eventually do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in Tinker Town! Oh, forgive the dramatics, but I must ask you to keep your fingers off the schematics, because the Pledge of Secrecy covers every last one of them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Our situation is dire, but even in dire times one can marvel. You hear the earth? Does the earth say anything about Gnomeregan?" },
        { id = "dd_artificials", when = { questDone = TODO_QUEST("Essential Artificials") },
          text = "Klockmort tells me you brought him the artificial extrapolators from Gnomeregan itself. Into that radioactive mess and out again, which is a better result than our last three expeditions combined." },
      },
      again = {
        { id = "h_again", text = "More questions? Splendid, it's that or stare at my blueprints of Gnomeregan again." },
        { id = "h_again2", text = "Ask on, ask on! It takes my mind off things." },
      },
      choices = {
        { text = "Could a machine ever do what a druid does?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who is Techbot?", next = "techbot" },
        { text = "What makes gnomish engineering the true discipline?", next = "discipline" },
        { text = "What's this pledge of secrecy?", next = "pledge", when = { profession = "Engineering" } },
        { text = "You must know Oglethorpe Obnoticus.", next = "oglethorpe" },
        { text = "What happened to your city?", next = "city" },
        { text = "Dwarven engineering isn't so bad, Tinkmaster.", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "What happened to the gnome mages after Gnomeregan fell?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why shouldn't I mention what Gnomeregan sheltered too loudly?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What happened when the troggs reached Gnomeregan, Tinkmaster?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What became of your mechanical hound, Tinkmaster?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can a machine have something worth praying for, Tinkmaster?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should Techbot be destroyed or repaired, Tinkmaster?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a rogue would steal gnomish secrets?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What would you ask the earth about Gnomeregan, Tinkmaster?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I came back from the bottom of Gnomeregan, Tinkmaster.", next = "xcl_gnome", when = { cleared = "Gnomeregan", faction = "Alliance" } },
        { text = "I tried to wire the arcane into our machines, Tinkmaster.", next = "xorig_arcaneeng", when = { origin = "gnome_arcane_engineer" } },
        { text = "I'll leave you to it, Tinkmaster.", next = "END" },
      },
    },
    xorig_arcaneeng = {
      lines = {
        { id = "xoarcaneeng_default", text = "Ah, yes, I remember, and so do my eyebrows, which have never quite grown back the same. I called it reckless at the time and I still do, but I've had three requests this month from the Mystic Ward for your schematics, so I'm prepared to call it reckless and interesting. Have you made it work yet?" },
      },
      choices = {
        { text = "Almost. It only explodes some of the time now.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "It works, Tinkmaster, and the mages know it.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    techbot = {
      lines = {
        { id = "te_default", text = "My mechanical assistant, a kind and helpful thing who fetched tools and greeted visitors and was, frankly, better company than most of the Assembly. We left him behind when we fled, and now he's malfunctioned." },
      },
      choices = {
        { text = "Something has clearly gone wrong with him.", next = "techbot_wrong" },
        { text = "It's only a machine, Tinkmaster.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    techbot_wrong = {
      lines = {
        { id = "tw_default", text = "The radiation, I suspect, or the troggs, or being alone too long in a dead city. Machines aren't supposed to mind being alone, but I built him to like people, and perhaps that was the flaw." },
      },
      choices = {
        { text = "Building him to care was no flaw.", next = "techbot_save", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Then the next one shouldn't feel anything.", next = "techbot_save", fx = { align = { light = -1 }, trait = { practical = 1 } } },
      },
    },
    techbot_save = {
      lines = {
        { id = "ts_default", text = "Whatever he is now, his memory core is still in there. If someone brought it back, I could read what happened, and maybe build him better." },
        { id = "ts_done", when = { questDone = TODO_QUEST("Save Techbot's Brain!") },
          text = "And someone did bring it back, thank you. I'll build him again one day, with better shielding and the same manners." },
      },
      choices = {
        { text = "I'll bring it back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    discipline = {
      lines = {
        { id = "di_default", text = "Gnomish engineering is about wonderful devices that make life better, while goblin engineering is about bigger explosions and getting paid. Membership is permanent, mind, so choose with your head and not your eyebrows." },
      },
      choices = {
        { text = "Would you ever trust a goblin engineer?", next = "opn_goblins" },
        { text = "Making life better is the nobler aim.", next = "BACK", reply = "Exactly what I've always said, and I'll sign you up for the gnomish discipline the moment you're ready, with a little ribbon on top.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "A good explosion solves a lot of problems.", next = "BACK", reply = "It solves them, and then it creates entirely new ones, usually involving the ceiling, but very well, I'll send you to the goblins with my blessing.", fx = { align = { order = -1 }, affinity = -1, trait = { witty = 1 } } },
        { text = "Why must the choice be permanent?", next = "pledge" },
      },
    },
    pledge = {
      lines = {
        { id = "pl_default", text = "Because our secrets are all we carried out of Gnomeregan, besides each other. Every gnomish engineer signs a pledge of secrecy, I signed it, and so will you, and we keep it for life." },
      },
      choices = {
        { text = "Knowledge should be shared freely.", next = "BACK", reply = "Freely? Oh dear, that's a lovely idea in peacetime, but we're refugees, and our secrets are the only thing we've got left to bargain with.", fx = { align = { order = -1 } } },
        { text = "A pledge is a pledge. Keep it, secret or not.", next = "BACK", reply = "Exactly, and you've understood it better than half the apprentices I've trained, so you may sign right here, and here, and here.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Your secrets must be worth stealing.", next = "pledge_who" },
      },
    },
    pledge_who = {
      lines = {
        { id = "pw_default", text = "Goblins, chiefly, who'll sell anything to anyone, and a few gnomes who've forgotten whose side they're on. We found out what happens when you trust the wrong engineer, and his name was Thermaplugg." },
      },
      choices = { { text = "Thermaplugg.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan" } } } },
    },

    oglethorpe = {
      lines = {
        { id = "og_default", text = "Obnoticus! He let the Crowd Pummeler loose, whatever he tells people, and the council banished him for it. I hear he's set up shop among the goblins of Booty Bay, which suits him." },
      },
      choices = {
        { text = "Maybe he was wronged.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Troggs from below, a plan to flush them out, and poison that found our homes instead. Now Gnomeregan glows, and I stand in Tinker Town teaching young engineers to build things they can't take home." },
      },
      choices = {
        { text = "You'll go home one day.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan", "troggs" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    k_dwarf = {
      lines = {
        { id = "xdw_default", text = "Not so bad! Oh, I'm sure your guns go bang very satisfyingly, and your pipes carry steam from here to there, but where's the elegance, where's the sheer improbability? Gnomish engineering is the art of things that shouldn't work, working anyway." },
      },
      choices = {
        { text = "Dwarven gear works the first time. That's elegance.", next = "BACK", reply = "Works the first time, yes, and then never does anything surprising ever again, which I suppose some people find comforting.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "You're right. Improbable is better.", next = "BACK", reply = "Oh, I knew you'd come round to it, a mind like yours could never be satisfied with a pipe that simply carries steam.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Engineers talk, endlessly and about everything. Here's what's stuck in my head." } },
    background = { { id = "tp_bg", text = "I'm the Tinkmaster, which means I'm in charge of gnomish engineering and the pledge that keeps it ours. Before the fall I had a workshop; now I have a corner." } },
    advice = { { id = "tp_ad", text = "Test it on a dummy first. Ideally a dummy that isn't you.", next = "discipline" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our city, poisoned and full of troggs, and Techbot still down there somewhere.", next = "techbot" } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages build arcane constructs that walk and guard and never tire, and I'd love to compare one with Techbot's old schematics. They'd never let a gnome near one with a screwdriver, of course, and they'd be quite right." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Goblin engineering is fast and loud and has no respect for elegance whatsoever. It works, yes, but so does a hammer." } },
    magni = { { id = "tp_magni", text = "King Magni once asked me what Techbot was for, and I couldn't answer, and I've never felt so foolish. Techbot was for being Techbot, and that's enough." } },
    _none = { { id = "tp_none", text = "That isn't engineering, so I'm afraid I've no opinion. Well, I've an opinion, but it isn't informed." } },
  },
}

-- Master Mechanic Castpipe: organizes data-rescue missions into Gnomeregan (the punch cards).
P:NPC {
  key = "castpipe", id = TODO_NPC("Master Mechanic Castpipe"), name = "Master Mechanic Castpipe",
  bible = "bibles/tinker_town.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "anxious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "He talks about punch cards the way others talk about lost children.",
    third = "{name} met Master Mechanic Castpipe, who organizes missions into Gnomeregan to rescue the city's lost data.",
  },

  greetings = {
    { id = "g_data", text = "Are you here for the data mission? Please be here for the data mission." },
    { id = "g_back", when = { metBefore = true }, text = "Have you brought any punch cards up from Gnomeregan? Even a plain white one would cheer me up." },
  },

  notice = {
    { id = "n_gnome", cat = "craft", when = { race = "Gnome", origin = "gnome_tinker_apprentice" },
      text = "You were an apprentice in the city, weren't you? Then you know what's on those terminals, and you know we can't leave it there." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll understand the terminals, then, or at least you won't hit them, and the last group hit three, one with a mace." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Possibly! If you can feel a tunnel about to collapse before it collapses, that beats three sensors, all of which have broken. But I'd need you to report through the proper channels, in writing, with timestamps, which I suspect isn't how the earth usually communicates." } },
      choices = {
        { text = "I'll report properly, timestamps and all, Castpipe.", next = "BACK", reply = "Splendid, timestamps and all, you've no idea how happy that makes me, and I'll file your reports under the very best colour of folder.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The earth won't wait for paperwork, and neither will I.", next = "BACK", reply = "Oh dear, that's what everyone says until the reports go missing, and then nobody knows which tunnel collapsed, so please do try.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Leper gnomes, sadly, who were our neighbours once and don't know us now, and some very unhappy machines. Nothing green grows down there anymore, and I doubt it will for a long time." } },
      choices = {
        { text = "Recover your data, then help the lepers too.", next = "BACK", reply = "That's a kind thought, and Ozzie would be grateful, though I'm afraid the lepers rarely let you get near enough to help.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take the data and seal the place. Some losses can't be mended.", next = "BACK", reply = "That's what part of me thinks too, but sealing it means admitting we'll never go home, and I'm not quite ready to sign that form.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because Gnomeregan is full of troggs, leper gnomes and malfunctioning machines, and all three object to us taking our data back. A warrior at the front of a team means the engineers can read their punch cards instead of running from things." } },
      choices = {
        { text = "I'll lead the way and keep your engineers safe.", next = "BACK", reply = "Thank you, oh, thank you, and my engineers will thank you too, assuming they survive long enough to fill out the gratitude form.", fx = { align = { honor = 1 } } },
        { text = "I'll lead, if I get first pick of the salvage.", next = "BACK", reply = "First pick? Well, I suppose there's a form for that, somewhere, and I'll find it, provided the punch cards come to me first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The approaches, mostly, for the troggs have dug their own tunnels into ours, and nobody knows where half of them lead. If you mark them for me, I'll fold them into the procedure, which is complicated, but improving." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The approaches, mostly, for the troggs have dug their own tunnels into ours, and nobody knows where half of them lead. Your {pet} would hear the machines before we did, I expect, which would save us many unpleasant surprises." },
      },
      choices = {
        { text = "I'll mark every tunnel and follow your procedure.", next = "BACK", reply = "Wonderful, you've no idea how rarely anyone says that to me, and I'll make a special folder just for your tunnel markings.", fx = { align = { order = 1 } } },
        { text = "I'll scout my own way. Procedures get people killed.", next = "BACK", reply = "Procedures get people killed less often than no procedures, according to my ledger, but I suppose that's not very comforting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We could, if our arcane engineers were still alive, but most of them didn't make it out. A mage on the team might recover data we'd given up for lost, and I'd consider it an honour to have you." } },
      choices = {
        { text = "I'll join your team and recover the data properly.", next = "BACK", reply = "Properly, you said properly, oh, I could hug you, but I won't, because that would be very irregular and there's a form for that too.", fx = { align = { order = 1 } } },
        { text = "I'll open the locks, but anything else I find is mine.", next = "BACK", reply = "Yours? Well, that's not quite how the salvage procedure works, but I'll make a note, and we'll discuss it after you've opened the locks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Nobody knows, and I'd prefer the experiment stayed untested. Leave the creature at the entrance if you can, and I'll gladly have you on the team, because the troggs down there are bigger than they used to be." } },
      choices = {
        { text = "I'll leave it outside and follow your procedure.", next = "BACK", reply = "Thank you, that's very thoughtful, and the troggs down there will be quite enough excitement for everyone without adding an irradiated horror.", fx = { align = { light = 1 } } },
        { text = "Something irradiated and hungry sounds useful, Castpipe. I'll find out.", next = "BACK", reply = "Useful? Oh, I'd really rather you didn't, because I'd have to write the incident report, and I don't even know what heading it would go under.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most of them, and some don't come back at all, which I write in the ledger beside the data they were sent to fetch. I know it's grim to keep the two together, but I think it's honest, and I'd like the Assembly to read it that way." } },
      choices = {
        { text = "No data is worth a life. I'll heal whoever comes back.", next = "BACK", reply = "Thank you, and I'll write that in the ledger too, beside the names, because it's the kindest thing anyone's said about them in weeks.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The data matters. Gnomeregan's future depends on it.", next = "BACK", reply = "It does, and I tell myself that every day, but I still keep the names beside the data, so I never forget what it cost us.", fx = { align = { light = -1 } } },
        { text = "Explain the punch cards instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I have, and I've regretted it, for a team of engineers is very good at fixing terminals and very bad at being chased by troggs. A paladin at the front means the engineers can do their work, and that's one less name in my ledger of the lost." } },
      choices = {
        { text = "Then I'll lead the team. The engineers will come home.", next = "BACK", reply = "Oh, would you? That's wonderful, and I'll tell the engineers, and they'll follow you very closely, perhaps a little too closely.", fx = { align = { honor = 1 } } },
        { text = "Engineers should learn to fight. A paladin can't babysit everyone.", next = "BACK", reply = "They should, and some of them are trying, but most of them still hold their swords like soldering irons, so I'd rather not risk it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Castpipe.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, good, because my teams come back from Gnomeregan with burns and radiation sickness, and the punch cards don't heal anybody." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Splendid, because the procedure is complicated, but the hitting is very simple, and my teams could use someone who does the hitting." },
        { id = "h_default", key = true,
          text = "Castpipe, Master Mechanic. I'm sending teams back into Gnomeregan to recover our lost data, and if you've come to join one, listen closely, because the procedure is complicated." },
        { id = "h_task", tags = { "news" }, when = { questActive = TODO_QUEST("Castpipe's Task") },
          text = "You came! The Assembly told you it was important, I suppose, and for once they've undersold it. Let me explain about the punch cards." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Data Rescue") },
          text = "Not back with the prismatic card yet? Then remember: white card in terminal A, yellow in terminal B, then blue, then red, and the prismatic card waits deep in the city at terminal D." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Data Rescue") },
          text = "You found the prismatic card and brought back the data, data so important I haven't a big enough word for it! Gnomeregan will remember you, and so will I, every time I open the archive." },
        { id = "h_low", when = { maxLevel = 24 },
          text = "You're keen, I can see that, but Gnomeregan would eat you whole just now. Come back when you've a few more scars, and some friends who have more." },
        { id = "h_rearguard", when = { origin = "gnome_rearguard" },
          text = "Oh! You were with the rearguard, weren't you? I'd know that look anywhere, because half my volunteers have it, the look of somebody who's already measured every corridor down there for how long it can be held." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and just when I needed one! The punch cards in Gnomeregan are stored behind arcane locks, and my last team couldn't open them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Oh. Oh dear. I won't lie, the procedure for someone with your sort of companion on a Gnomeregan team is very complicated, and it's mostly about what to do if it gets irradiated." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Excellent, because my recovery teams keep asking for someone to stand at the front, and I keep having to volunteer engineers." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Good, because the outer tunnels of Gnomeregan need scouting, and my engineers keep walking into things." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! If you've come to help in Gnomeregan, the procedure is complicated, and I'm afraid the radiation won't care how natural you are." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Is there a procedure for consulting the earth? Because if there is, I'd like it written down before you consult anything near my teams." },
      },
      again = {
        { id = "h_again", text = "Questions? Ask them now, before you're in the city; there's no asking down there." },
        { id = "h_again2", text = "What else? Quickly, quickly." },
      },
      choices = {
        { text = "What data was left behind?", next = "data" },
        { text = "Explain the punch cards.", next = "cards" },
        { text = "What's it like down there now?", next = "down" },
        { text = "Data hardly seems worth risking lives for.", next = "worth" },
        { text = "I worked those terminals once.", next = "apprentice", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I've been down there without a team, Castpipe.", next = "k_rogue", when = { race = "Gnome", class = "ROGUE" } },
        { text = "Can you not open the arcane locks yourselves?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What happens if my companion gets irradiated in Gnomeregan?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do your recovery teams need a warrior, Castpipe?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would a hunter scout in Gnomeregan's tunnels?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How many of your teams come back hurt, Castpipe?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you send a team down without a paladin, Castpipe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is anything still living in Gnomeregan besides the troggs?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a shaman help your teams inside Gnomeregan, Castpipe?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I held a corridor while the city emptied. I could go back.", next = "xorig_rear", when = { origin = "gnome_rearguard" } },
        { text = "I'll be back.", next = "END" },
      },
    },
    xorig_rear = {
      lines = {
        { id = "xor_default", text = "You could, and I'd be glad of you, but I have to ask, and the procedure says I must: are you going back for the data, or for the corridor? Because the ones who go back for the corridor tend to stay in it." },
      },
      choices = {
        { text = "For the data. The corridor's behind me.", next = "xorig_rear2", fx = { trait = { cautious = 1 } } },
        { text = "For the corridor. I ran once, and I won't run again.", next = "xorig_rear2", fx = { trait = { brave = 1 } } },
        { text = "I don't know yet, Castpipe.", next = "xorig_rear2" },
      },
    },
    xorig_rear2 = {
      lines = {
        { id = "xor2_default", text = "That's an honest answer, and honest answers come back up the tunnel more often than brave ones. The radiation's no kinder than it was the day you ran, so whatever you're going back for, wear the mask and count your cards." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    data = {
      lines = {
        { id = "da_default", text = "Everything! Designs, records, census rolls, schematics for half the machines in Khaz Modan. When we fled, nobody stopped to save the archives, because nobody stopped for anything." },
      },
      choices = {
        { text = "Why does it matter so much?", next = "data_why" },
        { text = "You saved yourselves first. That was right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    data_why = {
      lines = {
        { id = "dw_default", text = "Because a people is what it knows, and we've lost so much of ourselves already. If we go home one day, I'd like us to go home knowing how the doors work." },
      },
      choices = {
        { text = "Then it's worth the risk.", next = "BACK", reply = "Thank you, I knew you'd understand, and I'll put your name on the next team list, right at the top, in the best handwriting I have.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Knowledge can be rebuilt; people can't.", next = "BACK", reply = "That's true, and it's the part I lose sleep over, so I'll make sure every team comes back before the data does, if I can manage it.", fx = { align = { order = -1 } } },
      },
    },

    cards = {
      lines = {
        { id = "ca_default", text = "The prismatic card sits in a high-security terminal, the Matrix Punchograph 3005-D, deep in the city. To reach it you need clearance from the A, B and C terminals, and to use those you need cards, and we left every card in the city." },
      },
      choices = {
        { text = "So where do I begin?", next = "cards_begin" },
        { text = "Whoever designed that should be fired.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    cards_begin = {
      lines = {
        { id = "cb_default", text = "Find a white card on one of the poor souls near the entrance and run it through the A terminal by the Train Depot. It'll give you yellow, and yellow gets you blue, and so on; it's very logical, once you stop crying." },
      },
      choices = {
        { text = "Logical, apart from the crying.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    down = {
      lines = {
        { id = "do_default", text = "Troggs, leper gnomes, machines gone wrong, and the air hums. Some of the leper gnomes were our neighbors, so be quick, and be kind if you can, and if you can't, be quick." },
      },
      choices = {
        { text = "They're not our neighbors any more.", next = "BACK", reply = "Not now, perhaps, but they were, and I'd rather someone remembered that while they're down there, even if it's only me.", fx = { align = { light = -1 }, learn = { "gnomeregan", "troggs" } } },
        { text = "I'll show them mercy where I can.", next = "BACK", reply = "Thank you, that means a great deal, and if any of them seem to know you, please write down which ones, because I'd like to tell their families.", fx = { align = { light = 1 }, trait = { kind = 1 }, learn = { "gnomeregan", "troggs" } } },
      },
    },

    worth = {
      lines = {
        { id = "wo_default", text = "I ask myself that every time a group goes in. Then I remember that Thermaplugg sits on those archives, and every page he keeps is a page we've lost twice." },
      },
      choices = {
        { text = "Then let's take them from him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Did you! Then you'll know the B terminal sticks if you feed it crooked, and you'll know which corridors the troggs like. You're worth three of anyone else down there." },
      },
      choices = { { text = "I'll go down with the next group.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Without a team, without a procedure and without a single form signed, I'd wager. Did you at least bring back any punch cards, or only parts for the Tinker Town stalls?" },
        { id = "xro_scav", when = { origin = "gnome_scavenger" },
          text = "Oh, it's you. The parts you sold to the stalls last month had my department's serial numbers on them, and I'd like them back, but I'd like your map of the lower tiers even more." },
      },
      choices = {
        { text = "Parts feed people. Your cards don't.", next = "BACK", reply = "They do feed people, and I can't argue with that, but the cards might feed our children's children, and I'd like you to think about it.", fx = { align = { order = -1 } } },
        { text = "Next time I'll bring you the cards.", next = "BACK", reply = "Oh, would you, that would be wonderful, and I'll have the forms ready, and a little cake, because it's a very special occasion when somebody brings cards.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've catalogued what's lost, which means I can list, by shelf and drawer, everything we haven't got. Here's what I can tell you." } },
    background = { { id = "tp_bg", text = "Master Mechanic, formerly of a very large workshop in Gnomeregan and now of this very small one. I keep lists, mostly." } },
    advice = { { id = "tp_ad", text = "Keep a copy of everything, and keep it somewhere else.", next = "data" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our city, and our archives, and I want them both back, in that order or the other.", next = "down" } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's goblins would buy every punch card I recover, and sell them back to me at double. I keep them under lock and key, and the key under another lock." } },
    magni = { { id = "tp_magni", text = "The King's been very patient with our expeditions, and he asks after every one. I like to think that one day I'll bring him back something that makes it all worth it." } },
    scourge = { { id = "tp_scourge", text = "I've wondered if the Scourge's plague is in any way like our radiation, all creeping and invisible and contaminating. I've decided I'd rather not find out by experiment." } },
    _none = { { id = "tp_none", text = "No data on that, I'm afraid. Possibly it's on a punch card somewhere in Gnomeregan." } },
  },
}

-- Klockmort Spannerspan: gnomish blacksmith; Furen's notes, searing coral, essential artificials.
P:NPC {
  key = "klockmort", id = TODO_NPC("Klockmort Spannerspan"), name = "Klockmort Spannerspan",
  bible = "bibles/tinker_town.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "inventive", "curious" },
  notices = { "craft", "kit" },

  impression = {
    first = "He won't name his great invention, and I suspect he can't yet.",
    third = "{name} met Klockmort Spannerspan, a gnomish blacksmith in Tinker Town forever chasing harder metals.",
  },

  greetings = {
    { id = "g_day", text = "Hello, whatever time of day it is up there; it's always the same down here. Have you brought me business?" },
    { id = "g_quest", text = "I'm on a quest! A quest for new alloys and harder metals for the greatest invention of all!" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, your poor armor, the poor thing! Who did that to it, and was it a new technique? Tell me it was a new technique." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! What are you working on, what temperature, what quench? Sorry, sorry, I get excited about quenching." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In a heartbeat! The dwarves tell me the seams have voices, and if you can hear which one's iron and which one's mithril, I'd save years of digging. Though Bengus says it's cheating and Geofram says it's rude to the mountain, so I'd have to keep it quiet." } },
      choices = {
        { text = "Then it's cheating. I'll not take ore the earth didn't offer.", next = "BACK", reply = "That's very principled of you, and Bengus will be delighted, though I'll admit I'm a little disappointed on behalf of my alloy.", fx = { align = { honor = 1 } } },
        { text = "Keep it quiet, and I'll lead you to every seam.", next = "BACK", reply = "Oh, splendid, I'll keep it as quiet as a gnome can, which isn't very quiet, but I'll try my very best to whisper.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The greatest invention of all, though I haven't quite worked out what that is yet. I'd make it light enough to carry and strong enough to outlast me, and if it could grow back when broken, like your trees, so much the better." } },
      choices = {
        { text = "Build it to last. That's a worthy dream.", next = "BACK", reply = "Thank you, and I'll make it last, I promise, as soon as I've worked out what it is, which should only take another decade or two.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Things that last forever crowd out whatever comes after.", next = "BACK", reply = "Oh, that's a terribly deep thought, and I'll have to think about it, though I suspect the answer is to make it last only a very long time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a broken blade tells you exactly where the metal was weakest, and that tells me what not to put in my next alloy. Bring me the pieces after you've fought the troggs, and I'll make you something that won't break where the last one did." } },
      choices = {
        { text = "I'll bring you every piece. Your work is worth it.", next = "BACK", reply = "Thank you, oh, thank you, and every piece will go on the wall with a little label, so I can see exactly where the troggs won.", fx = { align = { honor = 1 } } },
        { text = "I'll sell my scrap to whoever pays best.", next = "BACK", reply = "Well, I suppose that's fair, though I'll pay you in data and gratitude, which is rather less than the goblins offer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because every time I make one lighter it bends, and every time I make one stronger it gains a pound. Somewhere between the two is the perfect barrel, and I mean to find it before the dwarves stop buying rifles, which I suspect is never." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because every time I make one lighter it bends, and every time I make one stronger it gains a pound. Your {pet} could carry a heavy one for you, I suppose, which is an engineering solution I hadn't considered." },
      },
      choices = {
        { text = "I'd carry a heavy barrel that never bends.", next = "BACK", reply = "A sensible choice, and a heavy barrel that never bends will be my next prototype, though I can't promise you'll still have shoulders afterwards.", fx = { align = { order = 1 } } },
        { text = "Light and quick suits me. I'll risk the bend.", next = "BACK", reply = "Oh, then you'll love my latest, which bends only very slightly, and only to the left, which I'm told some hunters prefer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They're the closest thing I have to the formula for the alloy I'm chasing, and they're somewhere in the old workshops. If a quiet sort could fetch them, I'd be very grateful, and I'd ask no questions about the route." } },
      choices = {
        { text = "I'll fetch the notes and bring them straight back.", next = "BACK", reply = "Thank you, that would be wonderful, and I'll put the kettle on for when you're back, because it's a very long walk to the old workshops.", fx = { align = { honor = 1 } } },
        { text = "I'll fetch them, but I'll read them first, Klockmort.", next = "BACK", reply = "Oh, well, I suppose I'd do the same, but please don't spill anything on them, because they're the only copy and the ink runs.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In theory, though the last test melted half my anvil and singed my eyebrows. Still, a mage who understands metal could change everything, and I'd love to try again with someone more careful." } },
      choices = {
        { text = "Then we'll test it carefully, one step at a time.", next = "BACK", reply = "Splendid, and I'll fetch my spare eyebrows, I mean my spare anvil, and we'll proceed very cautiously this time, I promise.", fx = { align = { order = 1 } } },
        { text = "Melted anvils are a sign of progress, Klockmort.", next = "BACK", reply = "They are, aren't they, and I'm so glad someone else sees it, because Bengus keeps sending me bills for the anvils.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, I think so, though I'll admit I don't know quite what it is yet, which makes the searching very exciting. Some of the gnomes say I'm chasing a dream, and I tell them dreams are the only things worth chasing." } },
      choices = {
        { text = "Dreams are worth chasing, Klockmort. I'll pray you find yours.", next = "BACK", reply = "Thank you, that's very kind, and I'll take all the prayers I can get, because the dream has been very slippery so far.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Find out what it is first. Then chase it.", next = "BACK", reply = "Oh, I'll find out, I'm sure of it, though I've a feeling it'll find me first, which is how all my best ideas have arrived.", fx = { align = { light = -1 } } },
        { text = "Tell me about Furen Longbeard instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "On willing ones, yes, and with every precaution, though the last volunteer did end up with very shiny gauntlets that wouldn't come off for a week. I'd never test on anyone who didn't ask, and I'll put that in writing." } },
      choices = {
        { text = "Only with consent. Anything else is wrong, however good the cause.", next = "BACK", reply = "Exactly what I've always said, and I'd never do otherwise, which is why my volunteers keep coming back, shiny gauntlets and all.", fx = { align = { order = 1 } } },
        { text = "Progress needs risks. Test it however it gets done fastest.", next = "BACK", reply = "Oh dear, no, I couldn't do that, because I'd never sleep again, and the Assembly would never let me near an anvil after.", fx = { align = { order = -1 } } },
        { text = "Good luck with your quest.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Oh, not really, no, because my friend Mathiel, a smith in Darnassus, would never write to me again, and I'd likely melt my own eyebrows off. But I do wonder, which is the trouble with being an inventor, so if you ever learn the answer, write it down for me." },
      },
      choices = {
        { text = "Some things shouldn't be learned, Klockmort.", next = "BACK", reply = "Some things, yes, and that's very sensible, and I'll try to stop wondering, though my curiosity has never once listened to me.", fx = { align = { light = 1 } } },
        { text = "I'll test it for you, if you like.", next = "BACK", reply = "Oh, that's very generous of you, but Mathiel would never write to me again if she heard, and her letters are my favourite thing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_gnome = {
      big = true,
      lines = { { id = "xcl_gnome_default", text = "Then you've seen what the radiation does to good gnomish steel, all pitted and green and humming when it oughtn't. I'd love to study it, I really would, but the High Tinker's forbidden anyone to bring the tainted metal up to Tinker Town, and I suppose he's right, though it pains me terribly." } },
      choices = {
        { text = "The High Tinker is right. Some things should stay down there.", next = "BACK", reply = "He is, I suppose, and I'll be good and leave it alone, but I'll keep a very small notebook of what I'd study if I were allowed.", fx = { align = { order = 1 } } },
        { text = "Study it anyway, Klockmort. Knowledge is worth a little risk.", next = "BACK", reply = "Oh, you're a terrible influence, and I love it, but the High Tinker would have my anvil if he found out, so let's keep this between us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What would that metal teach you?", next = "xcl_gnome2" },
      },
    },
    xcl_gnome2 = {
      lines = { { id = "xcl_gnome2_default", text = "Whether an alloy can be made to shrug off poison the way Furen's gauntlets shrug off a hammer, that's what! If I could crack that, the next gnome city wouldn't fall to a few barrels of something nasty, and I'd call that worth some singed eyebrows." } },
      choices = {
        { text = "Then I hope you crack it someday, and safely.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh my, you'll forgive the mess, I'm sure, because priests forgive everything, or so I've heard, and my workshop needs all the forgiving it can get." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your plate's lovely, but I'll wager I could make it lighter and stronger, if you've a few months and don't mind being a test subject." },
        { id = "h_cl_gnome", tags = { "news" }, when = { cleared = "Gnomeregan", faction = "Alliance" },
          text = "Somebody said you'd gone right through Gnomeregan to the very end! Did you pass the artificial extrapolators, and were any of them still ticking? Oh my, I do hope so." },
        { id = "h_default", key = true,
          text = "Klockmort Spannerspan, smith and seeker! I'm on a quest for new alloys and harder metals for the greatest invention of all, and every bit of metal you bring me gets me a little closer." },
        { id = "h_notes", tags = { "news" }, when = { questActive = TODO_QUEST("Klockmort Spannerspan") },
          text = "Notes? From Furen Longbeard? Oh my, give them here; these are marvelous, these are astounding, my knees have gone quite weak!" },
        { id = "h_coral", tags = { "news" }, when = { questActive = TODO_QUEST("Iron Coral") },
          text = "Have you found the searing coral? It only grows in the shallows below Menethil Harbor, and I'm so eager to start that my toes are twisting." },
        { id = "h_gauntlets", tags = { "news" }, when = { questDone = TODO_QUEST("Klockmort's Creation") },
          text = "How are the gauntlets? Furen's process worked brilliantly; a siege engine could roll over them and they'd pop back into shape. Please don't test that." },
        { id = "h_artificials", tags = { "news" }, when = { questActive = TODO_QUEST("Essential Artificials") },
          text = "The essential artificials are in the deep parts of Gnomeregan, in big steam-powered cabinets called artificial extrapolators. Nobody thought to bring any when we fled, and now I need twelve." },
        { id = "h_scavenger", when = { origin = "gnome_scavenger" },
          text = "You're the one who goes back down for parts, aren't you? Oh my, don't look like that, everybody in Tinker Town knows, and half of them are jealous, and the other half have a shopping list." },
        { id = "h_apprentice", when = { origin = "gnome_tinker_apprentice" },
          text = "An apprentice! I can always tell, because you've got the singed eyebrows and the expression of someone counting how many explosions they're allowed before the master stops being patient." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'd be perfect for slipping into Gnomeregan and fetching Furen's notes without waking the troggs." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've a theory that the right enchantment on the right metal could make an alloy stronger than mithril, and you might be the one to test it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll have broken a blade or two, I expect, and I'd very much like to see the pieces." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do you know, I've been trying to make a lighter rifle barrel for years, and I keep making heavier ones." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I don't suppose the forests of Teldrassil hide any interesting metals? Even an odd sort of rock would do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've got a heat about you, haven't you? Tell me, does that green fire burn hotter than a forge? I only ask because I'm looking for new ways to temper an alloy, and I've tried nearly everything else." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Could you ask the stone where the best ore is hiding? I'll pay you in finished alloys, which, admittedly, I haven't finished yet." },
      },
      again = {
        { id = "h_again", text = "What else? I've a crucible warming." },
        { id = "h_again2", text = "Go on, go on, I'm listening, mostly." },
      },
      choices = {
        { text = "What's the greatest invention of all?", next = "invention" },
        { text = "Who's Furen Longbeard?", next = "furen", when = { any = { { questActive = TODO_QUEST("Klockmort Spannerspan") }, { questDone = TODO_QUEST("Klockmort Spannerspan") } } } },
        { text = "What's an essential artificial?", next = "artificial", when = { any = { { questActive = TODO_QUEST("Essential Artificials") }, { questDone = TODO_QUEST("Essential Artificials") } } } },
        { text = "Can you look at my work?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Your alloys might make better plate.", next = "k_plate", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Why are Furen's notes so important, Klockmort?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could magic really make an alloy stronger than mithril?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would you want my broken blades, Klockmort?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do your rifle barrels keep getting heavier?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is the greatest invention worth all this searching, Klockmort?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should you test your alloys on living paladins, Klockmort?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you build if you found your perfect alloy?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you really use green fire at your forge?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you have a shaman find ore for your alloys, Klockmort?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been through Gnomeregan to the end, Klockmort.", next = "xcl_gnome", when = { cleared = "Gnomeregan", faction = "Alliance" } },
        { text = "I go back into Gnomeregan for parts. What do you need?", next = "xorig_scav", when = { origin = "gnome_scavenger" } },
        { text = "Good luck with your quest.", next = "END" },
      },
    },
    xorig_scav = {
      lines = {
        { id = "xsc_default", text = "Artificials, extrapolators, anything with a gear in it that isn't glowing! But I'll only buy what the troggs had, and not what some poor family left on a workbench, because the High Tinker says that's the difference between salvage and theft." },
      },
      choices = {
        { text = "Parts don't belong to anyone once the city falls.", next = "xorig_scav2", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "I leave the workbenches alone. Some of them were friends'.", next = "xorig_scav2", fx = { align = { honor = 1 } } },
        { text = "How would you even tell the difference?", next = "xorig_scav2" },
      },
    },
    xorig_scav2 = {
      lines = {
        { id = "xsc2_default", text = "Oh, I can't, not really, and that's what keeps me up at night between quenches. Bring me what you find and tell me where you found it, and I'll try not to ask the questions I can't answer." },
      },
      choices = {
        { text = "That's fair, Klockmort.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    invention = {
      lines = {
        { id = "in_default", text = "Ah! Well! It's, um, very great, and very inventive, and it'll need the hardest metal anyone's ever made, so I'm making that first." },
      },
      choices = {
        { text = "You don't know yet, I think.", next = "invention_know" },
        { text = "Every great invention starts with a good metal.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    invention_know = {
      lines = {
        { id = "ik_default", text = "Shh! Not so loud! I'll know it when the metal's ready, because the metal will tell me, and anyway that's how half of Gnomeregan's best inventions began." },
      },
      choices = {
        { text = "A craftsman should plan before he forges.", next = "BACK", reply = "A craftsman should, yes, and I'll admit it, but the metal hasn't told me what it wants yet, so I'll plan as soon as it speaks up.", fx = { align = { order = 1 } } },
        { text = "The best ideas come from following your curiosity.", next = "BACK", reply = "Exactly, you understand, and so did Gnomeregan's best inventors, who followed their curiosity right into some very marvellous holes.", fx = { align = { order = -1 }, affinity = 2, trait = { curious = 1 } } },
      },
    },

    furen = {
      lines = {
        { id = "fu_default", text = "A dwarven armorsmith, and a very clever one, who's been fire-hardening mail with a technique of his own. He sent me his notes, and I've been applying his method to mine, and the results are, well, marvelous!" },
      },
      choices = {
        { text = "How does fire-hardening work?", next = "furen_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    furen_how = {
      lines = {
        { id = "fh_default", text = "Heat, quench, and a special coral that only grows in hot water near Menethil, smelted in. The coral does something to the iron that I don't fully understand yet, which is the best kind of something." },
      },
      choices = {
        { text = "Some secrets are better left in the coral.", next = "BACK", reply = "Perhaps, perhaps, but I'd love to know what it's doing all the same, and a secret left in the coral is a secret I can't sleep beside.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Then cut it open and find out.", next = "BACK", reply = "Cut it open, yes, and I've tried, but the coral keeps its secrets very well, so I'll need more samples and a much sharper chisel.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    artificial = {
      lines = {
        { id = "ar_default", text = "A nigh-universal mechanical component! Every tinker and smith in Gnomeregan used them for everything, and in all the panic, not a single one of us remembered to bring any." },
      },
      choices = {
        { text = "Why need so many?", next = "artificial_why" },
        { text = "Panic makes people forget.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    artificial_why = {
      lines = {
        { id = "aw_default", text = "Experiments! Lots of them, and most will fail, which is the point of experiments. Whoever brings me twelve pushes gnomish research forward by miles." },
      },
      choices = {
        { text = "Science is worth the risk.", next = "BACK", reply = "It is, and you've said it beautifully, so I'll put you down as an honorary researcher, with a little badge and everything.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Experiments should have safeguards.", next = "BACK", reply = "They should, and I've added three new ones since the last experiment, which only melted a very small part of the floor.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },

    smith = {
      lines = {
        { id = "sm_default", text = "Ooh, let me see! Good folding, decent temper, and a quench that's a touch too quick; dwarves taught you, I can tell, because you hit it like it owes you money." },
      },
      choices = {
        { text = "Fair, I'll slow the quench.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_plate = {
      lines = {
        { id = "xpl_default", text = "Better plate, lighter plate, plate that hums when somebody swings at you! Well, not that last one yet. A warrior's armor is the most honest test there is for a metal, because it either holds or it doesn't, and you find out which very quickly." },
      },
      choices = {
        { text = "I'll wear whatever you forge and report back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll wait until someone else tests it.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Metals, mostly, but I hear things over the anvil. Here's what's rattling round my head." } },
    background = { { id = "tp_bg", text = "Smith, gnome, seeker of harder metals. That's the whole of me, and I like it that way." } },
    advice = { { id = "tp_ad", text = "Never trust a metal you haven't broken at least once. It hasn't told you its secrets yet." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We left everything behind, including every essential artificial in the city.", next = "artificial" } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons smelt metals I've never seen before, deep under Blackrock, and I'd give my goggles for a sample. They'd give me a crossbow bolt, most likely, so I'll keep looking elsewhere." } },
    uldaman = { { id = "tp_uldaman", text = "Titan metal from Uldaman is the hardest alloy anyone's ever seen, and I'd like to know how they made it. I'm fairly sure the answer is 'not with a forge', which is annoying." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Goblins in Gadgetzan sell scrap metal from the desert that might be anything at all. I bought a bar once that turned out to be cheese." } },
    _none = { { id = "tp_none", text = "Is it a metal? If it isn't, then I'm afraid I've no idea." } },
  },
}

-- Gnoarn: lost his gnomefro to the radiation; would very much like to save Gnomeregan.
P:NPC {
  key = "gnoarn", id = TODO_NPC("Gnoarn"), name = "Gnoarn",
  bible = "bibles/tinker_town.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "fierce" }, values = { "vengeful", "loyal" },
  notices = { "kin" },

  impression = {
    first = "He lost his magnificent hair to the radiation, and his temper too.",
    third = "{name} met Gnoarn, a bald and furious gnome in Tinker Town who coordinates the effort to take back Gnomeregan.",
  },

  greetings = {
    { id = "g_home", text = "Where troggs and leper gnomes roam stands our home, Gnomeregan! We must make our stand, friend!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for orders? Good, because the movement needs everyone!" },
    { id = "g_gnomeregan_resolved", when = { thread = { id = "gnomeregan_lost", state = "resolved" } }, text = "The High Tinker stood up at the assembly and said the order was his too, and you could have heard a cog drop! The arguing's stopped, mostly, and the planning's started, which is much louder." },
    { id = "g_gnomeregan_soured", when = { thread = { id = "gnomeregan_lost", state = "soured" } }, text = "The High Tinker named Thermaplugg at the assembly and nobody else, and we all cheered, and then he went home early. I cheered loudest, friend, and I keep thinking about him going home early." },
  },

  notice = {
    { id = "n_refugee", cat = "kin", when = { race = "Gnome", origin = "gnome_gnomeregan_refugee" },
      text = "You got out too! Then you remember the carefree days, before the troggs, before the leak, before my hair. We'll have them back, the days, I mean; the hair's beyond science." },
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "A dwarf! Your King gave us Tinker Town, and I'll never forget it, though I'd like to point out that it was your digging that woke the troggs." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Listening posts! Shamans at every tunnel mouth from Kharanos to the Gnomeregan gate, telling us what the troggs and the leper gnomes are doing below. The second part of the plan is persuading enough shamans to sit in tunnels, and that's where I've stalled." } },
      choices = {
        { text = "Count me in. Gnomeregan's people deserve their home back.", next = "BACK", reply = "Splendid, I'll put your name on the very large paper, right next to the third tunnel mouth, which is the most exciting one.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sitting in a tunnel for gnomes isn't my calling, Gnoarn.", next = "BACK", reply = "Hmph, well, I suppose not everyone's cut out for a tunnel, but the troggs won't count themselves, so think about it again later.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I blame the troggs, because they came up from the deep and took our city, and I blame the leak, because it took my hair. Mekkatorque says blame is a waste of time, and he's right, but it keeps me warm at night." } },
      choices = {
        { text = "Blame won't retake the city. Careful planning will.", next = "BACK", reply = "Careful planning, yes, and I've done plenty of it, on very large paper, but the anger is what gets me out of bed in the morning.", fx = { align = { order = 1 } } },
        { text = "Anger can be a weapon, Gnoarn. Keep it sharp.", next = "BACK", reply = "Exactly, and I've sharpened mine every single day since the leak, so the troggs had better be ready when I finally swing it.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "First clear the troggs from the outer levels, then secure the airlocks, then take back the city level by level, and I've drawn every step of it on very large paper. A warrior would be at the front of step one, which is the most glorious step, and also the most dangerous." } },
      choices = {
        { text = "I'll follow your plan step by step, Gnoarn.", next = "BACK", reply = "Wonderful, a warrior who reads plans, you're a rarer thing than a trogg with manners, and I'll mark your position in red.", fx = { align = { order = 1 } } },
        { text = "Plans fail at the door. I'll go in and adapt.", next = "BACK", reply = "Adapt, adapt, everyone wants to adapt, and nobody wants to read the very large paper, but very well, adapt quickly and come back alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "All around Gnomeregan's entrance, and they bring their filthy cave beasts with them, which is why I've lost my hair and my patience both. If you count them and tell me which tunnels they use, I'll put it in the plans." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "All around Gnomeregan's entrance, and they bring their filthy cave beasts with them, so count them and tell me which tunnels they use. And keep your {pet} away from the radiation, for I'd hate for it to lose its fur the way I lost my hair." },
      },
      choices = {
        { text = "I'll count them carefully and bring you the numbers.", next = "BACK", reply = "Splendid, and I'll add them to the chart, so I can work out exactly how many troggs I owe a terrible fate to.", fx = { align = { order = 1 } } },
        { text = "I'll stop counting and start thinning them out.", next = "BACK", reply = "Oh, well, I suppose that works too, and it'll make the counting much easier next time, so carry on with my blessing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Scouting, mostly, for we need to know where Thermaplugg's troops are before we can take the city back. I'd send a gnome, but most of us are too clumsy for sneaking, and the troggs hear our boots." } },
      choices = {
        { text = "I'll scout for Gnomeregan. Your people deserve their home back.", next = "BACK", reply = "Thank you, oh, thank you, and every gnome in Tinker Town will hear about it when we march home through those gates.", fx = { align = { honor = 1 } } },
        { text = "I'll scout it, but the information will cost you, Gnoarn.", next = "BACK", reply = "Cost me? Well, I suppose that's fair, but the movement's very short of coin, so I'll pay you in gratitude and very large paper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ozzie and Razzle are working on a cure in Kharanos, and I believe in them, though I'll admit some days are harder than others. A priest who'd sit with the sick ones would do more good than any plan of mine, and I don't say that lightly." } },
      choices = {
        { text = "Then I'll go to Kharanos and sit with them. They won't be alone.", next = "BACK", reply = "Thank you, really, and they'll be so glad of the company, because the sick ones are frightened and nobody likes to sit with them for long.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers can't fix radiation. Help Ozzie find the cure instead.", next = "BACK", reply = "Help Ozzie, yes, I'll tell him you said so, and he'll take all the help he can get, especially if it doesn't explode.", fx = { align = { light = -1 } } },
        { text = "For Gnomeregan, then.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Discipline, courage, and someone at the front who won't run when the troggs come screaming out of the tunnels. I keep the plans, but plans don't swing hammers, and I'd sleep better if I knew you'd be there." } },
      choices = {
        { text = "I'll be there, at the front, when the march begins.", next = "BACK", reply = "That's the spirit, and I'll have your name read out at the gate when we march, right after mine, which will be very loud.", fx = { align = { honor = 1 } } },
        { text = "I'll fight for gnomes, but I won't die for a lost city.", next = "BACK", reply = "That's fair, I suppose, and I won't hold it against you, though the city isn't lost, it's only misplaced, and I mean to find it again.", fx = { align = { honor = -1 } } },
        { text = "For Gnomeregan!", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Our people need your sort more than anyone, for the radiation sickness hasn't left the ones who escaped, and some of them still cough at night." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! For Gnomeregan, if you'll have it, because we'll need every hammer we can get when we march back through those gates." },
        { id = "h_default", key = true,
          text = "Gnoarn, at your service and the service of Gnomeregan! Our families lost, our homes taken, our people scattered, and I'm the one who keeps the plans, so if you want to help, you've come to the right gnome." },
        { id = "h_day_after", tags = { "news" }, when = { questActive = TODO_QUEST("The Day After") },
          text = "Ozzie Togglevolt and Razzle are working on a cure in Kharanos, so go to them and tell them Gnoarn sent you. Perhaps it isn't too late to save the city." },
        { id = "h_bingles", tags = { "news" }, when = { questActive = TODO_QUEST("Find Bingles") },
          text = "Bingles Blastenheimer went scouting over Loch Modan and hasn't reported for more than a week. I'd bet my last sprocket he's exploded himself again." },
        { id = "h_shoni", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Shoni") },
          text = "Shoni the Shilent commands our underground assault crew, down in Stormwind's Dwarven District. She needs help with her gyrodrillmatic excavationators, and nobody can say that word but her." },
        { id = "h_bingles_done", when = { questDone = TODO_QUEST("Find Bingles") },
          text = "Bingles is alive, and unexploded, even! He says I don't trust his reconnaissance abilities, and he's right, but I'm glad all the same." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I've a few plans for Gnomeregan that need someone who can get in and out without being seen, if you're interested." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Splendid, for Gnomeregan will need soldiers when we march back in, and I'm the one who keeps the plans." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Good, for the troggs keep coming up out of the tunnels, and somebody needs to count them before I lose my temper again." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Gnomeregan needs every pair of hands it can get, paws included, and I mean that as a compliment." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The dwarves gave Gnomeregan's people a home, and now one of them talks to the very earth that swallowed our city. I've a plan for that, though it's only half a plan." },
        { id = "dd_recomb", when = { questDone = TODO_QUEST("Operation Recombobulation") },
          text = "Razzle Sprysprocket sent word that you brought him the parts for his Recombobulator! Every step toward a cure is a step toward going home, and I've added your name to the plans, in the margin, where the important notes go." },
      },
      again = {
        { id = "h_again", text = "What else, recruit? The troggs aren't resting, and neither am I." },
        { id = "h_again2", text = "Ask your questions, recruit, and then go!" },
      },
      choices = {
        { text = "Your hair looks to have had a hard time of it.", next = "hair" },
        { text = "What are your people doing to win Gnomeregan back?", next = "movement" },
        { text = "Who's Bingles?", next = "bingles", when = { any = { { questActive = TODO_QUEST("Find Bingles") }, { questDone = TODO_QUEST("Find Bingles") } } } },
        { text = "Saving Gnomeregan seems a tall order.", next = "save" },
        { text = "I was raised here in Tinker Town.", next = "raised", when = { origin = "gnome_ironforge_raised" } },
        { text = "Does the movement have room for a gnome who studied the sealed stacks?", next = "k_lock", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "Put a mage on your plans, Gnoarn.", next = "k_mage", when = { race = "Gnome", class = "MAGE" } },
        { text = "What sort of plans need someone quiet in Gnomeregan?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What are your plans for retaking Gnomeregan, Gnoarn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where are the troggs coming up, Gnoarn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can anything be done for the gnomes still sick from the leak?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What will the march on Gnomeregan need most, Gnoarn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you blame the troggs or the leak for Gnomeregan?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What's your half a plan for a shaman, Gnoarn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "For Gnomeregan!", next = "END" },
      },
    },

    hair = {
      lines = {
        { id = "ha_default", text = "Did you think I was born this shiny? I wore the one and only gnomefro in Azeroth, and the radiation leak took it in clumps, clusters, right there on the workshop floor." },
      },
      choices = {
        { text = "Hair grows back.", next = "hair_back" },
        { text = "It suits you, really it does.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    hair_back = {
      lines = {
        { id = "hb_default", text = "Not this hair, not after that. So I turned my anger on the troggs, and every trogg in Dun Morogh owes me a gnomefro, and I mean to collect." },
      },
      choices = {
        { text = "Then let's make the troggs pay.", next = "BACK", reply = "Yes, yes, that's exactly it, and every one of them will pay twice over, once for the city and once for my magnificent gnomefro.", fx = { align = { honor = -1 }, affinity = 1, trait = { brave = 1 }, learn = { "troggs" } } },
        { text = "Vengeance won't grow it back.", next = "BACK", reply = "No, but it'll make me feel much better about the bald patch, and that's worth a great deal on a cold morning in Dun Morogh.", fx = { align = { honor = 1 }, affinity = -1, learn = { "troggs" } } },
      },
    },

    movement = {
      lines = {
        { id = "mo_default", text = "Every gnome who wants to go home, working together: Ozzie and Razzle in Kharanos on the cure, Shoni in Stormwind on the drills, Bingles in the air, and me here, keeping the plans straight." },
      },
      choices = {
        { text = "What's the cure?", next = "movement_cure" },
        { text = "Who commands it all?", next = "movement_cmd" },
      },
    },
    movement_cure = {
      lines = {
        { id = "mc_default", text = "Ozzie calls it Gnogaine, and it's meant to scrub the radiation out of the leper gnomes. It doesn't work yet, but the important thing is that it doesn't work in very promising ways." },
      },
      choices = {
        { text = "Science will cure them.", next = "BACK", reply = "It will, I know it will, and Ozzie says we're only a few dozen failed tests away, which is very nearly no tests at all.", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "They'll need prayer as much as science.", next = "BACK", reply = "Perhaps they will. Some days the lepers look like they need comfort as much as a cure, and I've no formula for comfort.", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    movement_cmd = {
      lines = {
        { id = "mm_default", text = "The High Tinker, officially, and he's very good at it. Unofficially, central command is this corner of Tinker Town, and central command is me." },
      },
      choices = { { text = "Yes, commander.", next = "BACK", fx = { affinity = 2 } } },
    },

    bingles = {
      lines = {
        { id = "bi_default", text = "Bingles Blastenheimer, our aerial reconnaissance, which is to say he flies over things and writes down what he sees, when he doesn't crash. Mostly he crashes." },
      },
      choices = {
        { text = "I'll keep an eye out for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    save = {
      big = true,
      lines = {
        { id = "sa_default", text = "A tall order? It's the only order, recruit, and I believe in it right down to my boots! I don't know when, or how, or which of us will be left to do it, but we'll walk back through those gates, and I'll stand in my old workshop and shake my fist at the ceiling." },
      },
      choices = {
        { text = "I'll walk in beside you.", next = "BACK", reply = "Then you'll walk right beside me, recruit, and we'll shout so loudly that the troggs will hear us before we even reach the gate.", fx = { align = { order = 1 }, affinity = 2, trait = { brave = 1 } } },
        { text = "Maybe it's time to build somewhere new.", next = "BACK", reply = "New? Never, not while I've got breath in my body and a single strand of hair left, and I've barely got the one.", fx = { align = { order = -1 }, affinity = -2 } },
      },
    },

    raised = {
      lines = {
        { id = "ra_default", text = "Then you've never seen the city! You've grown up among dwarves and never seen the great lift, or the Clean Room, or the light on the gears at shift change. We'll fix that, recruit, I promise you." },
      },
      choices = { { text = "I'd like to see it.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "A place? Well, I, ah, the movement has a place for every gnome who wants Gnomeregan back, and that's the official position. Unofficially, please don't call up anything in the meeting room, because the plans are on paper and paper burns." },
      },
      choices = {
        { text = "We'll need every power we have to take it back.", next = "BACK", reply = "We will, and I'll say so at the next meeting, though I'll ask you very politely not to demonstrate during it.", fx = { align = { light = -1 } } },
        { text = "I'll keep what I command out of the meetings.", next = "BACK", reply = "Thank you, that's very thoughtful, and the meetings will be much calmer for it, which isn't saying much, because they're very loud.", fx = { align = { light = 1 }, affinity = 2 } },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "A mage! The plans call for a great many things we can't build yet, and a few of them might be cast instead, if you squint. Could you freeze a trogg in place long enough for a punch card to be retrieved?" },
      },
      choices = {
        { text = "I could freeze a whole corridor of them.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'd rather not promise what I can't do.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Central command hears everything, eventually, and most of it's about troggs. Here's the report." } },
    background = { { id = "tp_bg", text = "I'm Gnoarn, formerly of the only gnomefro in Azeroth, now of the movement to retake Gnomeregan. That's all you need to know." } },
    advice = { { id = "tp_ad", text = "Never stand next to a radiation leak. I know it sounds obvious, but somebody has to say it.", next = "hair" } },
    troggs = { { id = "tp_troggs", text = "Damn those troggs, damn them all! They owe me a city and a head of hair.", next = "hair_back" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home! Where troggs and leper gnomes roam now, but not for ever.", next = "movement" } },
    magni = { { id = "tp_magni", text = "King Magni promised we'd have Gnomeregan back one day, and I'm holding him to it. I'll lead the charge myself if I have to, hair or no hair." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has its plague and we have our radiation, and both of them steal people from the inside. At least our troggs can be shot." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's goblins sold me a hair tonic that did nothing at all, and I've written them four angry letters. They haven't answered, and I'm writing a fifth." } },
    _none = { { id = "tp_none", text = "That's not a matter for central command. Ask a dwarf, they love questions." } },
  },
}
