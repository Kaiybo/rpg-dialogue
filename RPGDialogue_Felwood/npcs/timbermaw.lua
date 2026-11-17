-- Felwood's north and the Irontree woods (0.38.0): the Timbermaw at their hold, and a warlock's imp out in the wilds. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grazle", id = TODO_NPC("Grazle"), name = "Grazle", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "wary" }, values = { "loyal", "protective" },
  impression = {
    first = "Grazle is a Timbermaw furbolg who waits outside the tunnels of Timbermaw Hold, testing outsiders before they are let near his people. He is slow to trust and clear about why.",
    third = "{name} met Grazle, the Timbermaw furbolg who guards the way to Timbermaw Hold in Felwood.",
  },

  greetings = {
    { id = "g_default", text = "Stop there, stranger. The Timbermaw do not let just anyone walk into our hold." },
    { id = "g_back", when = { metBefore = true }, text = "Grazle remembers you. The Deadwood remember you too, Grazle thinks, and not fondly." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With Deadwood feathers, and with patience, for the Timbermaw count deeds over many seasons, not over one fight. A warrior who kills one Deadwood is a stranger with a sharp axe, but one who keeps coming back is a friend." } },
      choices = {
        { text = "Then I'll keep coming back until the Timbermaw call me friend.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll kill enough Deadwood to buy your trust quickly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grazle.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We hunt to eat, as all furbolgs did before the corruption, and we give thanks to the spirits for each kill. The Deadwood hunt for the joy of killing now, and they give no thanks, and that is how Grazle knows they are lost." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} smells the Deadwood on the wind, and it does not like them. Beasts know corruption before we do." },
      },
      choices = {
        { text = "A hunter gives thanks for each kill. That's how it should be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Thanks don't fill a belly. I hunt what I need and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Our shamans hear the earth crying under the Deadwood camps, where the corruption soaked in deepest. The spirits there no longer answer the Deadwood, and Grazle thinks that is how the madness took them: they stopped listening, and something else began to talk. You understand this, shaman, better than the others who come to Grazle's door." } },
      choices = {
        { text = "Your elders should decide what's done here, not outsiders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting on elders heals nothing. Someone has to act.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Something in the forest's poison made the Deadwood and the other tribes forget who they were, and it smells like you do. Grazle will not shut the door on you for a smell, but you must prove yourself twice over before the Timbermaw let you pass." } },
      choices = {
        { text = "Then I'll prove it. The Deadwood deserve justice.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I owe the Timbermaw nothing. Let me through.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Deadwood have tried, and one or two outsiders who thought furbolgs were stupid. None of them tried twice, because the Timbermaw remember a face for a very long time, and we remember a broken trust even longer." } },
      choices = {
        { text = "Trust earned openly is worth more. I'll earn it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Any door can be opened by someone patient enough.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Grazle has wondered that for many winters, and the shamans of the hold say the corruption is too deep in them now. Still, Grazle would be glad to be wrong, if a priest's prayers could bring even one of our cousins back." } },
      choices = {
        { text = "Every soul deserves a chance at mercy, even the Deadwood.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some things can't come back, and ending them is the mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because most outsiders come to take, wood or furs or a short path through our tunnels, and they say whatever opens the door. Grazle would rather hear a hard truth spoken plainly than a soft lie, so speak plainly, paladin." } },
      choices = {
        { text = "I'll always speak plainly to the Timbermaw.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A soft word opens more doors than a hard truth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That you prove your prayers by your deeds, because many have come here speaking softly and then cut down our kin. The Deadwood are lost to the corruption, and the Timbermaw will judge you by what you do about them, not by what you say to your gods." } },
      choices = {
        { text = "Then judge me by my deeds. I'll earn your trust.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't need the Timbermaw's leave to walk these woods.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Grazle sees your weapon and your scars, outsider, and the Timbermaw respect both, though we watch where you point them." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Grazle sees your beast does not fear the Timbermaw, and Grazle thinks that says something good of you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Timbermaw have shamans of their own, and Grazle knows the look, so you may stand a little closer than most outsiders." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Grazle smells demon on you, warlock, the same stink the Deadwood carry now. Speak quickly and plainly, and Grazle will decide whether you are a danger to the Timbermaw." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came up very quietly, rogue, but Grazle heard you anyway. A furbolg's ears are older than your tricks, and our doorway is guarded better than you might think." },
        { id = "h_default", text = "I am Grazle of the Timbermaw. Our cousins the Deadwood have taken the corruption into themselves, and they attack anyone who walks these woods, Timbermaw included." },
        { id = "h_cond", when = { class = "DRUID" }, text = "A druid, who knows the forest is sick. You will understand why the Timbermaw guard our door so closely." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, Grazle thinks, with a healer's hands. The Timbermaw have little use for your temples, but Grazle has seen what the Deadwood do to a body, and healers are welcome near our door." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "Grazle sees a paladin, shining like the sun on snow. Your kind are loud and bright, but Grazle hears that you do not lie, and that is worth more at this door than any armour." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, at the Timbermaw door. I do not know your gods, but I know the look of someone who has tended the dying, and you have it." },
      },
      again = {
        { id = "h_again1", text = "Grazle will hear another question, if it is a short one." },
        { id = "h_again2", text = "Speak. Grazle listens." },
      },
      choices = {
        { text = "What do your shamans hear from the Deadwood's land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to the Deadwood?", next = "deadwood" },
        { text = "What is Timbermaw Hold?", next = "hold" },
        { text = "Why distrust outsiders?", next = "outsiders" },
        { text = "The Circle hopes the furbolgs can be healed.", next = "druidg", when = { class = "DRUID" } },
        { text = "Did fel corrupt the Deadwood?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Has anyone ever sneaked into Timbermaw Hold?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can the Deadwood be healed, Grazle, or only fought?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why are honest outsiders so rare at Timbermaw Hold?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the Timbermaw ask of a stranger who prays?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How can a warrior earn the Timbermaw's trust?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the Timbermaw hunt, Grazle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    deadwood = {
      lines = {
        { id = "deadwood_default", text = "The fel in the soil got into their water and their food, and then into their minds, and now they are not furbolgs at all, only anger in fur. If you show Grazle you will fight the Deadwood, the Timbermaw may call you a friend." },
      },
      choices = {
        { text = "Fight your own kin?", next = "deadwood2" },
      },
    },
    deadwood2 = {
      lines = {
        { id = "deadwood2_default", text = "They are not our kin anymore, though it shames Grazle to say so. Some Timbermaw hope the druids can heal them, and some say only an axe will bring them peace now." },
      },
      choices = {
        { text = "Keep hoping for a cure. They're still your people.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Give them peace, then. Waiting only spreads it.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    hold = {
      lines = {
        { id = "hold_default", text = "Our home, under the mountain, with tunnels that run all the way to Winterspring. The Timbermaw alone of the furbolgs kept clean, because we kept apart, and we will keep apart a while longer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = {
        { id = "outsiders_default", text = "Because the elves call furbolgs beasts and the orcs call us targets, and few come to Felwood to make friends. Grazle judges by deeds, so show Grazle yours." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
    druidg = {
      lines = {
        { id = "druidg_default", text = "Then tell the Circle to hurry, for Felwood does not wait. Grazle would welcome the druids, if they come to help and not to lecture." },
      },
      choices = {
        { text = "I'll pass it on.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Grazle is Timbermaw, and Grazle guards the door." } },
    _none = { { id = "tp_none", text = "Grazle does not know. Ask the elders inside, if they will let you in." } },
  },
}

P:NPC {
  key = "nafien", id = TODO_NPC("Nafien"), name = "Nafien", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "grim" }, values = { "practical", "loyal" },
  impression = {
    first = "Nafien is a Timbermaw furbolg who hunts the Deadwood and asks outsiders to help him do it. He takes no joy in it, but he doesn't flinch from it either.",
    third = "{name} met Nafien, a Timbermaw furbolg fighting the corrupted Deadwood in northern Felwood.",
  },

  greetings = {
    { id = "g_default", text = "You smell of the Deadwood camps. Good, then you have been doing useful work." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Nafien has more work, if your arms are not tired." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Like a furbolg who has forgotten everything but anger, and that makes them fierce and foolish both. They will charge a warrior who stands firm and break themselves on the shield, and Nafien has seen it happen, though he takes no joy in watching." } },
      choices = {
        { text = "Then I'll stand firm and end it quickly for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll stand and let them break. Pity won't save them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Nafien.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They carve them from blackened wood and paint them in the colours of the corruption, and still they pray to them. The spirits will not live in such things, so the Deadwood pray to nothing, or to something worse than nothing. Every totem you bring to Nafien is one less mouth for the corruption to speak through." } },
      choices = {
        { text = "A defiled totem should be burned with respect, not hoarded.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A totem's a trophy. I'll bring you every one I find.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nafien wishes it were so, but the Deadwood will not go, and they will not stop until they reach our tunnels. A quick death from a blade they never see is kinder than what the poison is doing to them, and that is the only mercy left to give." } },
      choices = {
        { text = "A quick end is a mercy. I'll make it clean.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose their side. I won't lose sleep over it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll think on that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The shamans of the Timbermaw have tried every rite they know, and none has brought a Deadwood back. Perhaps a mage's learning knows something ours does not, but until someone finds it, Nafien must hunt his own kin." } },
      choices = {
        { text = "I'll look for a cure, if there is one.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You're doing what must be done. That's enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'm sorry it's come to this.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nafien buries what he can when the camps are quiet, because they were Timbermaw once and someone should remember it. The elders say it is foolish, since the corruption stays in the bones, but Nafien does it anyway." } },
      choices = {
        { text = "It isn't foolish. The dead deserve rest, whoever they were.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn them instead. Corruption shouldn't go back into the soil.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The shamans burn their totems and speak their names, so that whatever was Timbermaw in them may find its way home. Nafien does not know whether your loa or your Light would hear such a prayer, but he would not stop you from offering one." } },
      choices = {
        { text = "I'll offer one for each of them I hunt.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead is dead. I'll save my prayers for the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Nafien is glad, for the Deadwood fight with claws and fury now, and a shield is a good answer to both." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and Nafien is glad of it, because a shaman knows a totem when he sees one, and the Deadwood carve theirs wrong now." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, good, for the Deadwood keep watch on their camps and you could get close before they howl. Nafien does not enjoy this hunt, but he would rather it ended quickly." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Nafien has met few mages, but he knows you throw fire and ice from far away. Against the Deadwood that is a good thing, because their claws are poisoned now." },
        { id = "h_default", text = "I am Nafien. The Deadwood keep their camps to the south of our hold, and every feather and totem they carry is a mark of the corruption in them. Bring them to me, and the Timbermaw will know whose side you stand on." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, good. The Deadwood are not beasts, but they hunt like beasts now, and you will know how to answer that." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, Nafien thinks, and you will not like this hunt. Nafien does not like it either, but the Deadwood are past our shamans' help, and they have tried." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Then you have sat beside the dying, and you will understand why Nafien takes no joy in the hunting he must do." },
      },
      again = {
        { id = "h_again1", text = "What else?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What did the Deadwood do to their totems?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why the feathers and totems?", next = "totems" },
        { text = "Are the Timbermaw at war?", next = "tribe" },
        { text = "Is anywhere in Felwood still clean?", next = "felwood" },
        { text = "I'll track them for you.", next = "hunterq", when = { class = "HUNTER" } },
        { text = "Wouldn't it be kinder to drive the Deadwood off than kill them?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there any way to cure the Deadwood?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the Timbermaw honour the Deadwood dead?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there any rite left for the Deadwood dead, Nafien?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How do the Deadwood fight, Nafien?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Good hunting, Nafien.", next = "END" },
      },
    },
    totems = {
      lines = {
        { id = "totems_default", text = "The Deadwood wear them as charms, and carve them with marks that came from no furbolg's mind. When we burn them, it weakens whatever whispers to the tribe." },
      },
      choices = {
        { text = "Does it trouble you, killing them?", next = "totems2" },
      },
    },
    totems2 = {
      lines = {
        { id = "totems2_default", text = "Every night, but the Deadwood would kill our cubs if we let them near. Some outsiders take the work for the reward, and some because it is right, and Nafien cannot always tell the difference." },
      },
      choices = {
        { text = "I do it because it's right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll be honest. I do it for the reputation.", next = "BACK", fx = { align = { order = -1 }, trait = { honest = 1 } } },
      },
    },
    tribe = {
      lines = {
        { id = "tribe_default", text = "We have been at war since the forest sickened, though we rarely leave the hold to fight it. Nafien leaves, because someone has to, and the elders let him because he comes back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "felwood_default", text = "The places the druids guard, and our hold, and little else. Even the rain here tastes wrong, and Nafien remembers when it did not." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hunterq = {
      lines = {
        { id = "hunterq_default", text = "Then go south toward the camps, and watch for their shamans first, because the warriors break when the shamans fall." },
      },
      choices = {
        { text = "Understood.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Nafien is Timbermaw, and Nafien hunts what our cousins became." } },
    _none = { { id = "tp_none", text = "Nafien does not know, and does not pretend to." } },
  },
}

P:NPC {
  key = "niby", id = TODO_NPC("Niby the Almighty"), name = "Niby the Almighty", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "pompous" }, values = { "ambitious", "proud" },
  impression = {
    first = "Niby the Almighty is an imp with a very large name, camped out in Felwood among old fel ruins with another imp who does his errands. He is extremely sure of his own importance.",
    third = "{name} met Niby the Almighty, a self-important imp camped in the wilds of Felwood.",
  },

  greetings = {
    { id = "g_default", text = "Kneel, mortal, kneel before Niby the Almighty! Or don't, actually, your knees look tired." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the mortal returns to bask in Niby's presence, which is very sensible of you." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the Almighty's enemies are many and his arms are, admittedly, short. The Shadow Council at Jaedenar think Niby is a joke, and when Niby has his way, a large warrior will explain to them why they are wrong." } },
      choices = {
        { text = "I don't fight for demons, little or almighty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight for anyone who pays, even a very small demon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Niby.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Impsy is my servant, my apprentice and my footstool, and he would be insulted to be called a pet, if he were allowed to have opinions. Your beast follows you because it loves you, which is sweet, but Impsy follows Niby because the alternative is so much worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And that {pet} of yours keeps sniffing at Impsy, so call it off, before Impsy sets it alight and Niby has to listen to you whine." },
      },
      choices = {
        { text = "A beast that follows for love is worth ten slaves, imp.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear works too. Maybe you're on to something, Niby.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Power? The elements in Felwood are leftovers, shaman, scraps the Legion didn't bother to finish! Fel runs through every root and rock in this forest, and the spirits you chatter to are hiding in the corners. Niby could show you real power, but you'd only use it to make it rain, and Niby finds that very sad." } },
      choices = {
        { text = "I serve no balance. I'll take power where I find it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The spirits keep a balance your Legion never understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Niby is biding his time, as the great ones do, and choosing his servants with care. Kroshius will rise again, and when he does, those who helped Niby will be remembered, and those who mocked him will be remembered much less fondly." } },
      choices = {
        { text = "I serve no imp. Keep your threats.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fine, I'll play along, for now.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Whatever you say, Almighty.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Niby wants nothing stolen, because Niby is owed everything already. But if a certain mighty doomguard's remains happened to need waking, and a certain sneaky someone happened to help, Niby might consider that very loyal, very loyal indeed." } },
      choices = {
        { text = "I steal for myself, not for imps.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Loyalty to the Almighty it is, if it pays.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll keep my hands in my pockets.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Niby wants nothing from priests, since they are always trying to banish things, which is very rude. Still, a Forsaken who dabbles in shadow might see that Kroshius' remains are a great opportunity, and Niby rewards those who see opportunity." } },
      choices = {
        { text = "I banish demons, Niby. I don't wake them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Shadow is shadow. Tell me about this opportunity.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Niby supposes every great master needs some brute to stand in front of him, and you're quite the size for it, so congratulations." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, with a pet! Niby has a pet too, you know, though his has the decency to be an imp and to run the errands." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Niby does not care for your sort, all totems and talking rocks, but even Niby admits you're more interesting than a peasant." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, how quaint. You fling your little fireballs and think you're terribly clever, but Niby the Almighty has forgotten more about fire than Dalaran ever learned." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Niby approves of sneaking, since it saves on all the tiresome fighting. Do you also steal things for great and powerful masters, or only for yourself?" },
        { id = "h_default", text = "I am Niby the Almighty, master of fel secrets, keeper of terrible knowledge, and yes, I am small, so don't mention it. Felwood is full of demonic remains, and Niby knows exactly what they're good for." },
        { id = "h_cond", when = { class = "WARLOCK" }, text = "A warlock! At last, someone who appreciates a demon's wisdom, and who might do as Niby says without all the whining." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest? Niby supposes even the Almighty must suffer visitors who pray, so pray quietly, and don't point any of that holy light at my imp." },
      },
      again = {
        { id = "h_again1", text = "Niby is waiting, and Niby is very busy." },
        { id = "h_again2", text = "Yes, yes, what else?" },
      },
      choices = {
        { text = "Do the elements still have any power here, imp?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are you planning, imp?", next = "power" },
        { text = "Who's the other imp?", next = "impsy" },
        { text = "Why camp in Felwood?", next = "felwood" },
        { text = "I could use a demon's knowledge.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "If you're so mighty, why are you camped in a ruin?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would the Almighty want stolen?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would a demon want with a priest, Niby?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a great master need a warrior, Niby?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is Impsy really your pet, Niby?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell, Almighty One.", next = "END" },
      },
    },
    power = {
      lines = {
        { id = "power_default", text = "Planning is such a small word for it. There are infernal things buried in Felwood that a clever demon could use, and a clever mortal could fetch them for him." },
      },
      choices = {
        { text = "Why would I help a demon?", next = "power2" },
      },
    },
    power2 = {
      lines = {
        { id = "power2_default", text = "Because power is power, mortal, whatever shape it comes in, and the warlocks of your cities know it even if the priests pretend not to. Some mortals say the Legion's leavings should be destroyed, and some say they should be used." },
      },
      choices = {
        { text = "Fel power should be destroyed, not used.", next = "BACK", fx = { align = { light = 1 }, trait = { righteous = 1 } } },
        { text = "A weapon's a weapon. I'll use what I find.", next = "BACK", fx = { align = { light = -1 }, trait = { ambitious = 1 } } },
      },
    },
    impsy = {
      lines = {
        { id = "impsy_default", text = "Impsy, my assistant, who is not almighty at all and knows it. Impsy carries things, Impsy fetches things, and Impsy is not allowed to talk about what happened in the last summoning circle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "felwood_default", text = "Because it smells like home, mortal, and because the druids are too busy weeping over trees to bother me. Also the view of the burning bits is lovely at night." },
      },
      choices = {
        { text = "I suppose that's a reason.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_default", text = "Of course you could, and Niby is generous, in his way. Do as Niby asks, bring Niby what he needs, and one day you will have a steed the Legion itself would envy." },
      },
      choices = {
        { text = "We'll see. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Niby is almighty. That is all you need to know, and frankly more than you deserve." } },
    _none = { { id = "tp_none", text = "Niby knows everything, of course, but Niby chooses not to tell you that." } },
  },
}
