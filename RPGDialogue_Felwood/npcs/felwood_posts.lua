-- Felwood's outpost hands (0.39.0): the hippogryph master at Talonbranch Glade, and the wind rider master
-- and the general goods seller at Bloodvenom Post. Voice: bibles/felwood.md ("Outpost hands")
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "mishellena", id = TODO_NPC("Mishellena"), name = "Mishellena", title = "Hippogryph Master",
  bible = "bibles/felwood.md", role = "flightmaster", tier = "service",
  communities = { "talonbranch" }, temper = { "solemn" }, values = { "dutiful", "nature" },
  notices = { "race" },

  impression = {
    first = "She won't let her birds drink anything but moonwell water.",
    third = "{name} met Mishellena, the night elf hippogryph master at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. The hippogryphs are rested, and they would be glad to leave this poisoned forest behind them, as would I." },
    { id = "g_horde", when = { faction = "Horde" }, text = "My hippogryphs fly for the Alliance, stranger, not for you. Your people keep their wind riders at Bloodvenom Post, away to the southwest." },
    { id = "g_away", when = { away = 14 }, text = "Ishnu-alah. You've been away {away}, and I've counted more fires over the forest since you left, though I'm glad to see you safe." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard you left someone in the glade angry, and Talonbranch is too small and too beset for quarrels. I hope you'll make it right." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The glade speaks kindly of you, and that's a rare thing to hear in Felwood, so thank you for whatever you did." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Sister or brother of the forest, welcome. It hurts to see Felwood with kaldorei eyes, doesn't it? Rest a while before you fly." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It carries the smell of fel from Jaedenar and the ash from the Shadow Hold, and my birds won't fly low any longer. If the spirits can be healed, I'd give anything to see it." } },
      choices = {
        { text = "They can be healed. I'll do what I can.", next = "BACK", reply = "Elune bless you for saying it, and I'll hold you to it. My birds would fly low again for the first time in years.", fx = { align = { light = 1 } } },
        { text = "Some spirits are past healing. Cleanse them by force.", next = "BACK", reply = "Perhaps, but force is how the forest came to this. I'd rather the spirits were coaxed than broken.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because every magic they've met in Felwood has been the fel kind, and they can't tell one from another. They've seen the Jadefire satyrs burn the trees and the cultists of Jaedenar call down green fire, so to them a mage is just another bright danger, at least until you've flown with them a while." } },
      choices = {
        { text = "I'll be patient. They've seen enough of this forest's horrors.", next = "BACK", reply = "Thank you. Talk to them low as you mount, and keep your hands where they can see them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My magic is nothing like the fel. They'll learn the difference.", next = "BACK", reply = "They may, in time, but not tonight, and not over this forest. Please, keep your hands still in the saddle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to walk the road to the Emerald Sanctuary and keep it open, mostly, because the Deadwood and the satyrs close it every time we turn our backs. I fly over it every day and count the fires, and there are more each season." } },
      choices = {
        { text = "Then I'll keep the road open, however long it takes.", next = "BACK", reply = "Then you'll have my thanks every time I fly over it. Without that road, the Sanctuary would starve in a month.", fx = { align = { order = 1 } } },
        { text = "Roads are for patrols. I'd rather burn the satyrs out of their camps.", next = "BACK", reply = "Burn them if you can, and I'll not mourn a single satyr. But someone still has to keep the road.", fx = { align = { order = -1 } } },
        { text = "Something else, Mishellena.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It has made them hungry in ways a beast should never be hungry, so that the bears and the wolves eat things that only make them sicker. My hippogryphs will not land anywhere but Talonbranch, and I don't blame them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It has made them hungry in ways a beast should never be hungry, so that the bears and the wolves eat things that only make them sicker. Let {pet} drink from the moonwell before you go, please. It's the only clean water for miles, and I'd hate for it to drink anything else." },
      },
      choices = {
        { text = "I'll keep my beast clean of this forest, whatever it costs.", next = "BACK", reply = "That's the right choice. Keep it off the green water, and don't let it eat anything it kills here.", fx = { align = { light = 1 } } },
        { text = "If the forest makes beasts stronger, maybe it isn't all bad.", next = "BACK", reply = "Stronger, perhaps, and sicker with every bite. I'd not trade one for the other.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "When the Sentinels ask it, yes, though I keep the birds high and the passengers quiet. Satyr archers in Jadefire Glen have tried for my hippogryphs before, so I would rather carry one silent scout than a whole noisy patrol." } },
      choices = {
        { text = "Scouting from the air is safer for everyone.", next = "BACK", reply = "It is, and the birds can see a satyr camp from higher than any arrow can reach.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner go in on foot and do it properly.", next = "BACK", reply = "Then go carefully, and let the Sentinels know where you've gone. The satyrs don't miss twice.", fx = { align = { order = -1 } } },
        { text = "I'll remember to keep quiet up there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They will, because I ask it of them, and because the Alliance asks it of me. But I will check their feathers twice tonight, and I hope you understand that it is the fire I mistrust and not, perhaps, you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They will, because I ask it of them, but I will have to ask very firmly, because they have gone stiff as stone since your demon came onto the landing. I will check their feathers twice tonight, and I hope you understand that it is the fire I mistrust and not, perhaps, you." },
      },
      choices = {
        { text = "I understand. The fel ruined this land, and I won't excuse it.", next = "BACK", reply = "Thank you for saying it so plainly. The birds will still shy from you, but I'll talk them round.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire is fire. It burns whoever doesn't master it.", next = "BACK", reply = "It burns everyone, eventually, and the Legion proved that. I'll check their feathers all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my distance from the birds.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They feel it, and they fly higher over this forest than anywhere else in Kalimdor, because the air above Jaedenar tastes of ash even to them. I have wondered whether a prayer could reach the trees below as easily as my birds reach the sky, though I am only their keeper." } },
      choices = {
        { text = "Prayer and patience can heal this forest, given time.", next = "BACK", reply = "Then I'll hope with you, and Elune will hear us both. I've waited this long; I can wait a little longer.", fx = { align = { light = 1 } } },
        { text = "Prayer won't move the satyrs. Fire and steel will.", next = "BACK", reply = "Perhaps, but the satyrs will not be the last enemy here. Prayer is for what comes after.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Sentinels would say a sword, and Golhine, the druid by our moonwell, would say neither, only patience. I think the forest needs both, and someone who knows which to reach for when the Deadwood come down the road at night." } },
      choices = {
        { text = "Then I'll hold the road and let the druids do the healing.", next = "BACK", reply = "That's the balance, and I think Golhine would approve. The druids can't heal what they can't reach.", fx = { align = { order = 1 } } },
        { text = "The druids are too slow. Burn the corruption out and be done.", next = "BACK", reply = "The druids are slow because the forest is slow, and fire makes things fast in the wrong way. I'd ask you to wait.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Badly, though they hide it well. I keep them on clean water from the Emerald Sanctuary and send them high over the forest, never low, because the air near the Bloodvenom falls makes them sick. One day I hope to fly them over a green Felwood again, the way I did when I was young." } },
      choices = {
        { text = "We will heal Felwood. You'll fly over green woods again.", next = "BACK", reply = "Elune, I hope so. I was young when I last flew over green woods here, and I barely remember the colour.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Felwood may be lost for good. Guard the beasts you have.", next = "BACK", reply = "I am, every day, and I'll keep guarding them. But I'd rather believe Felwood can come back.", fx = { align = { light = -1 } } },
        { text = "Something else, Mishellena.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You flinch when the hippogryphs spread their wings, {class}, like someone who has fallen from a height and not forgotten it. Hold on and they will not drop you; it is the cliffs of Felwood you should be wary of." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance, at Talonbranch Glade. My hippogryphs drink only moonwell water, and they're wary of anything that smells of magic not drawn from Elune, so please be patient with them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance. Our Sentinels have bled for every mile of road between here and Ashenvale, and I'm glad to see another blade come north." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance. My birds watch your beast closely, because nothing in this forest walks as calmly as that anymore." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk softly, which my birds appreciate, because a hippogryph startled in this forest does not always come down where you meant it to." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You smell of the same fire that burned this forest, warlock, and my birds have noticed it before I have. Stand back a little, please, while I calm them." },
        { id = "h_default", key = true,
          text = "I am Mishellena, and I keep the hippogryphs of Talonbranch Glade. From here they carry the Alliance to Ashenvale and Darkshore and to Everlook in the snows, and away from the corruption, for a little while." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, and welcome to the roost. My birds settle when someone prays near them, I think, and Felwood leaves them little enough peace." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in armour that rings like a bell! Stand easy by the roost, please, because my birds take all that steel for a predator until they learn your step." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, at Talonbranch. Thank Elune; my hippogryphs breathe easier with one of you near, and so do I, with Jaedenar so close to the road." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. The wind over Felwood has been sick since the Legion came, and my hippogryphs feel it, so perhaps you feel it too." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask? The birds are patient, but the light is fading." },
        { id = "h_again2", text = "Speak, then, and I will listen, as the kaldorei have learned to listen to grief." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do the hippogryphs bear this forest?", next = "corrupt" },
        { text = "Felwood must have been something else, before.", next = "before" },
        { text = "Do you ever fly scouts over the Jaedenar camps?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will your hippogryphs carry me, even so?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your birds must feel the corruption when they fly over Felwood.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Talonbranch need a sword more than a prayer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Sentinels here must need warriors.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What has the corruption done to Felwood's beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The hippogryphs can't like Felwood's corruption.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why are your hippogryphs wary of my magic, Mishellena?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What has the corruption done to Felwood's winds, Mishellena?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    corrupt = {
      lines = { { id = "c_default", text = "Poorly. They will not eat what grows here, and they drink only from the moonwell in the glade, which is still clean. I check their feathers every evening for the green taint, and so far I have found none." } },
      choices = {
        { text = "What happens if you do find it?", next = "corrupt_taint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupt_taint = {
      lines = { { id = "ct_default", text = "Then I would send the bird south to Ashenvale and pray to Elune the druids could cleanse it. I do not like to think about what happens if they can't." } },
      choices = {
        { text = "Elune will watch over them.", next = "BACK", reply = "She will, and she always has, even here. I leave a little moonwater by their nests each night.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to put a sick bird down quickly.", next = "BACK", reply = "Perhaps that's kinder, and I've thought it on bad nights. But I'll try the druids first, every time.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Part of Ashenvale, green and quiet and full of life. Then the demons came in the war and poisoned it to the roots, and now the wolves are mad and the trees are sick, and the water burns." },
        { id = "b_nelf", when = { race = "NightElf" }, text = "You remember, surely, or your elders do: it was Ashenvale, green and quiet. The demons poisoned it to the roots in the war, and every flight over it reminds me of what we lost." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I have kept hippogryphs for the Sentinels for a long time, and I go where they are needed. That is enough to know." } },
    advice = { { id = "tp_ad", text = "Drink nothing in Felwood that does not come from a clean moonwell, no matter how thirsty you are." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids of the Emerald Circle are trying to heal this forest. I pray they have more patience than I do." } },
    nordrassil = { { id = "tp_nordrassil", text = "My birds fly north to Hyjal when I let them, and they always come back calmer. The first tree does that to anything with sense." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw don't like my birds over their ground. I fly them high and I fly them fast." } },
    everlook = { { id = "tp_everlook", text = "Everlook's beyond the Timbermaw tunnels, in the snow. My birds go there when they must, and they come back shivering and cross." } },
    _none = { { id = "tp_none", text = "I cannot help you with that. My knowledge is of birds and of sky, and of what this forest was before the fel." } },
  },
}

P:NPC {
  key = "brakkar", id = TODO_NPC("Brakkar"), name = "Brakkar", title = "Wind Rider Master",
  bible = "bibles/felwood.md", role = "flightmaster", tier = "service",
  communities = { "bloodvenom_post" }, temper = { "gruff" }, values = { "dutiful", "honor" },
  notices = { "race" },

  impression = {
    first = "He shows his wind riders more warmth than he shows any person.",
    third = "{name} met Brakkar, the orc wind rider master at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_default", text = "You want a wind rider? Good, because nobody should stay in this cursed forest a moment longer than they must, and the wyverns agree. One bit a grunt last week for dawdling at the saddle." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "No wind rider for you, Alliance. Your elves keep their birds at Talonbranch Glade, away to the northeast, and you can walk there." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar, {g:brother|sister}. Don't let this place get into your head; the green fire here is the same that once burned in our own blood, and we're done with it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "You count as strange, and you smell like the forest, so close enough. My beasts don't care whose Light you carry, only that you sit still in the saddle and don't glow in their eyes." } },
      choices = {
        { text = "I'll sit still and follow your rules, Brakkar.", next = "BACK", reply = "Good. That's all I ask of anybody in my saddles, living or dead.", fx = { align = { order = 1 } } },
        { text = "I'll fly as I please, rules or none.", next = "BACK", reply = "Then you'll walk, and the satyrs will be glad of the company. My beasts, my rules.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every time we fly over Jaedenar the cultists throw something up at us, and one of my best beasts came home with a burned wing and never flew straight again. I don't care how clean your magic is, mage; if it glows, my riders flinch, so keep your hands down when you're on the perch." } },
      choices = {
        { text = "I'll keep my hands still. Your riders have suffered enough.", next = "BACK", reply = "Good. They've earned a quiet passenger or two after what this forest has put them through.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your beasts need to get used to magic. They're war mounts.", next = "BACK", reply = "They're war mounts, aye, not targets. You keep your fire in your hands or you walk.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Once, south of Jaedenar, when a bolt of fel came up out of the trees and singed a wing. The rider walked back to the post with three cultists on her heels, and the beast limped home on its own, and I've hated that place ever since." } },
      choices = {
        { text = "Then I'll walk into Jaedenar and face them openly.", next = "BACK", reply = "Then you're braver than the rider was, and I hope luckier. Lok'tar, and watch the trees.", fx = { align = { honor = 1 } } },
        { text = "Then I'll find their camp and burn it while they sleep.", next = "BACK", reply = "That's how the Horde used to fight, and some days I miss it. Just come back with your wings whole.", fx = { align = { honor = -1 } } },
        { text = "Something else, Brakkar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than they trust me, some days, because a beast knows when another beast is well fed and well treated. They won't go near anything that's grazed in Felwood, though, and they'll scream at a corrupted bear from a mile up." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than they trust me, some days, because a beast knows when another beast is well fed and well treated. Let {pet} stay by the perch while you're here, if you like. My riders will sniff it, and then they'll decide whether to like you." },
      },
      choices = {
        { text = "I treat my beast as kin. It's the only right way.", next = "BACK", reply = "Then my beasts will trust you, and so will I. They can smell it on you, you know.", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. I feed it so it fights.", next = "BACK", reply = "Then your beast will fight, but it'll never fly for you the way it would for a friend. Mine won't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The wind over this forest is foul, shaman; it carries the stink of the river and something worse besides, and the beasts fight their harness when we climb through it. I fly them high and fast and never let them drink below. If the air spirits are sick here, I'd thank you to say a word to them on my riders' behalf." } },
      choices = {
        { text = "I'll ask the wind's leave properly, by the old rites.", next = "BACK", reply = "Good, shaman. Do it before you mount, and maybe my beasts will climb easier out of this stink.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't bother with rites. I tell the wind what I need.", next = "BACK", reply = "Then the wind might tell you something back, and you won't like it. Mind how you speak to it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "That's what Gul'dan's people said, and the Horde paid for it with its whole spirit until Thrall pulled us out. I'll fly you where you need to go, but you'll not summon anything on my landing, and that's not a request." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That's what Gul'dan's people said, and the Horde paid for it with its whole spirit until Thrall pulled us out, and the sight of {pet} on my landing brings it back. I'll fly you where you need to go, but that thing goes back where it came from before you mount, and that's not a request." },
      },
      choices = {
        { text = "You're right. We must never wear those chains again.", next = "BACK", reply = "Aye, never again, and Thrall made sure of it. I'm glad to hear a warlock say it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thrall's way is slow. Power wins wars.", next = "BACK", reply = "Slow, and it's kept us free. I'll fly you, but I'll be watching your hands all the way.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "No summoning on the landing, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a goblin from who knows where tried to walk off with a saddle, and my best beast nearly took his arm for it. The riders know their handlers, so thieves get bitten long before they get far, and I let them." } },
      choices = {
        { text = "A thief who gets bitten deserves it.", next = "BACK", reply = "Aye, and my beast agreed. That goblin left with one less finger and a lot more respect.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Poor fool. Everyone's got to eat.", next = "BACK", reply = "Everyone does, but not off my saddles. The beast made that very clear.", fx = { align = { order = -1 } } },
        { text = "I'll keep my hands off the saddles.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every time we cross the Jaedenar hills they pull at the reins and won't settle until we're well past. A beast knows a poisoned place better than any shaman does, and I trust their noses more than anyone in this post." } },
      choices = {
        { text = "Then I'll say a prayer over them before they fly.", next = "BACK", reply = "They'd like that, I think, and so would I. Say one for me while you're at it; I breathe this air too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're beasts. Fly them where you're told and be done.", next = "BACK", reply = "They're beasts, aye, and they're my beasts. I'll fly them where they'll come home from.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They cough every morning and they fight me when I steer them north over Jaedenar. Bloodvenom Post was built for the Horde's business here, and I do that business, but I'll tell you plain that if your Earth Mother could clear this sky, my beasts would thank her before I did." } },
      choices = {
        { text = "Then I'll help cleanse it. The beasts shouldn't suffer for us.", next = "BACK", reply = "Good. Clean that forest and my beasts will stop screaming every time we fly over it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Horde has its business here. The beasts will manage.", next = "BACK", reply = "The Horde has its business, aye, and I'll do it. But the beasts aren't the Horde's to waste.", fx = { align = { light = -1 } } },
        { text = "Something else, Brakkar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You've fallen off something high and died of it, {class}. I can tell by how you eye my wind riders. They don't drop riders who hold on, so hold on, and leave the cliffs to the goats." },
        { id = "o_demons_useful", tags = { "news" }, when = { gossip = { topic = "demons", stance = "useful" } },
          text = "Dreka's been grumbling that you'd use demons and break them after. Don't do it near my wind riders, because they spook." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. Keep that fire away from my riders' feathers, and don't call down anything green near the post, because the beasts have seen enough of that colour to last them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Good, because if one of my wind riders comes down in this forest I'd rather a warrior found it than a satyr." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. My wind riders like your kind, because you smell of honest beasts instead of the rot in this forest." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. My beasts grow calmer when one of your kind is near, and nothing else in this forest calms them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. We drank the demon's blood once and it nearly finished us, so don't expect me to smile when I see that green light in your hands." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Hm, a rogue, and I didn't hear you come up the path, though I hear the satyrs a mile off. Want a ride, or did you just want to prove you could sneak up on an old orc?" },
        { id = "h_default", key = true,
          text = "I am Brakkar, wind rider master at Bloodvenom Post. My beasts fly to Splintertree Post, to Everlook in the snows and to Valormok, and from there to anywhere the Horde can reach, so tell me where you're going and let's be done." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. My wind riders won't drink from the river and neither should you, so if you've a blessing for clean water, start with the troughs." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A druid. You'll not like Felwood, tauren, and you'll like flying over it less, because the air down near Jaedenar burns the throat." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I've no patience for this forest, and none for anything strange that crawls out of it, so tell me where you're flying and let's be done." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts are waiting, and so is the Horde." },
        { id = "h_again2", text = "Speak. I've time, but not much patience." },
      },
      choices = {
        { text = "Do the winds over Felwood trouble your riders, Brakkar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why keep a post in this forest at all?", next = "post" },
        { text = "Your wind riders don't look happy here.", next = "riders" },
        { text = "The power's the same. It depends who holds the leash.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does anyone try to steal your wind riders?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your wind riders feel the forest's sickness, Brakkar?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your wind riders must have come down in Felwood once or twice, Brakkar.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your wind riders trust a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do your wind riders suffer in this air?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Have your wind riders suffered from fel magic, Brakkar?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do I count as something strange from the forest, Brakkar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "Because the demons' leavings are still in this forest, and Orgrimmar wants eyes on them. Trull Failbane does the watching, and I make sure he can get word home quickly when he sees something." } },
      choices = {
        { text = "Trull seems to be watching for something.", next = "post_trull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_trull = {
      lines = { { id = "pt_default", text = "Ask him yourself; he doesn't share his business with me, and I don't ask. But I've flown his messages home, and they weren't short." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    riders = {
      lines = { { id = "r_default", text = "They hate it. They won't land outside the post and they won't touch the water, so I carry their drink up from the clean stream by hand, every morning. A wind rider deserves better than poison." } },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", reply = "They're lucky to have the clean stream, more like. My back isn't so lucky.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're beasts. They'll drink what they're given.", next = "BACK", reply = "Not on my watch, they won't. A wind rider is a warrior, and warriors drink clean water.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fly wind riders for the Horde. Where I came from and what I did before is my business." } },
    advice = { { id = "tp_ad", text = "Don't sleep under the trees in Felwood. Sleep at the post, or don't sleep at all." } },
    thrall = { { id = "tp_thrall", text = "The Warchief needs riders in Felwood, so I'm here. I'd rather be home, but home's where he sends me." } },
    timbermaw = { { id = "tp_timbermaw", text = "Furbolgs who throw rocks at my wind riders. I throw them back, which doesn't help relations." } },
    everlook = { { id = "tp_everlook", text = "Everlook's a goblin town past the tunnels. They take Horde gold and Alliance gold, and they don't care which, which is the only reason I tolerate them." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who isn't busy; an orc's work doesn't wait for talk." } },
  },
}

P:NPC {
  key = "bale", id = TODO_NPC("Bale"), name = "Bale", title = "General Goods",
  bible = "bibles/felwood.md", role = "vendor", tier = "service",
  communities = { "bloodvenom_post" }, temper = { "calm" }, values = { "nature", "kind" },
  notices = { "race" },

  impression = {
    first = "He is slow to speak, and grieves quietly for the land.",
    third = "{name} met Bale, the tauren who sells general goods at Bloodvenom Post.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, traveler, and may the Earth Mother keep you. I have clean water and bread that did not grow in this forest, and that is the best thing I can offer you here." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother keep you, child of the plains. It hurts, doesn't it, walking on land that's been poisoned like this? Sit with me a moment if you need to." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I hope so, and I am careful with hope. The demons poisoned this soil and the Circle labours to mend it, but you are proof that something broken can be made to stand again, even if it is never quite the same." } },
      choices = {
        { text = "It can heal, Bale. Nothing is beyond the Light.", next = "BACK", reply = "I would like to believe that, and perhaps I do, a little. You are kind to say it.", fx = { align = { light = 1 } } },
        { text = "Some things are better burned and started fresh.", next = "BACK", reply = "Fire would be faster, I know, but the Earth Mother is a patient healer. I would rather she had the chance.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I worry that someone will need them more than they can pay, and steal them out of thirst. That I could forgive, though I'd rather they asked, but a rogue who sold my water on to the Alliance for a profit, that I would not forgive, and the Earth Mother would not either." } },
      choices = {
        { text = "I'd never steal water from the thirsty. You have my word.", next = "BACK", reply = "Thank you, friend, and I believe you. Others have not been so honest with my barrels.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Water's worth what someone will pay. That's just trade.", next = "BACK", reply = "Perhaps in the cities, but not here, friend, not water. The Earth Mother would weep to hear it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every stream in Felwood carries the corruption down from the hills, and a warrior who drinks from one fights the satyrs half-sick the next day. I sell water carried in from outside, and it is dear, but it is cheaper than a grave." } },
      choices = {
        { text = "Then I'll carry my own water and keep myself clean, Bale.", next = "BACK", reply = "Good, and you'll fight the better for it, friend. I've seen grunts go green around the mouth from one careless drink.", fx = { align = { light = 1 } } },
        { text = "Warriors drink what they find. A little sickness won't stop me.", next = "BACK", reply = "It will, friend, slowly, and you'll not know it until it's too late. Please, take a skin from my barrels.", fx = { align = { light = -1 } } },
        { text = "Something else, Bale.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Nothing I would eat, nor feed to anyone I cared for. The deer and the bears drink the same streams as everything else, and their flesh tastes of it, so the hunters at this post bring their meat up from Ashenvale or go hungry." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Nothing I would eat, nor feed to anyone I cared for. Your {pet} must eat too, I know. Feed it from clean stores, not from the forest, and it will thank you by living." },
      },
      choices = {
        { text = "I'll hunt here only to end their suffering, never for meat.", next = "BACK", reply = "Then the Earth Mother will see it, friend. Say a word over them when you do; they've suffered enough.", fx = { align = { light = 1 } } },
        { text = "Meat is meat. I'll eat what I kill and take my chances.", next = "BACK", reply = "I will not stop you, friend, but I will not cook it for you either. Take care of your belly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I don't know, shaman, and I've asked myself that every morning I've stood at this counter. In Mulgore the soil was black and sweet, but here it's grey and it stings the hand, and even the water I sell has to be carried in from outside. The Emerald Circle says it can be mended, and I'd like to believe them, though I've seen what runs in that river." } },
      choices = {
        { text = "We owe the Earth Mother our help. I'll do my part.", next = "BACK", reply = "Then go to the druids at the Sanctuary, friend, and tell them Bale sent you. They will put you to work.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some land is lost. Our strength is better spent elsewhere.", next = "BACK", reply = "Perhaps, but I am not ready to say so, not while the druids are still trying. The Earth Mother does not give up on her children.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I sell bread and water to anyone of the Horde who is hungry, and a warlock gets as hungry as anyone. What I cannot do is tell you the earth here forgives, because it does not, and I would not want you to find out by drinking from it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I sell bread and water to anyone of the Horde who is hungry, though I cannot sell to the creature at your side, because I do not know what it eats and would rather not. And I cannot tell you the earth here forgives, because it does not, and I would not want you to find out by drinking from it." },
      },
      choices = {
        { text = "I'll respect this land. It has suffered enough.", next = "BACK", reply = "Thank you, friend. The land cannot say so, but I can, and I am grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The earth doesn't get a say in what I do.", next = "BACK", reply = "No, it does not, but it remembers, and so do I. Walk carefully on it all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll take the bread, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The druids at the Emerald Sanctuary are trying, but every spring here drinks from the same poisoned ground, so I haul barrels up the road from Ashenvale instead. If a mage knew a spell to make the water clean, I would trade all my stock to learn it." } },
      choices = {
        { text = "Patience will heal this land, as the druids say.", next = "BACK", reply = "The druids have more patience than I do, and I am glad you see it. I only sell the water while they work.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cleanse it all at once with fire, if need be.", next = "BACK", reply = "Fire is what the Legion brought, and the land remembers it. I would rather the druids did their work.", fx = { align = { order = -1 } } },
        { text = "I'll leave the hauling to you.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Slowly, and only by hands willing to kneel in it for years. The druids at the Emerald Sanctuary try, and I sell them what they need, but a forest that drank fel this long won't be cured by one prayer, or by a hundred." } },
      choices = {
        { text = "Then I'll give it a hundred and one.", next = "BACK", reply = "Ha! A hundred and one, then, and I will keep count for you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Felwood is lost. The Horde has better land to defend.", next = "BACK", reply = "Some say so, and they may be right. But the Earth Mother does not forget her children, even the sick ones.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing I'd trust, though the Emerald Circle tells me some corners are coming back. I've seen orcs eat the fruit from the Irontree and wake up shouting, and I'll not have that on my conscience, so everything I sell is carried in from cleaner land, and it costs what it costs." } },
      choices = {
        { text = "You're right. Nothing from this forest should reach the Horde.", next = "BACK", reply = "Good, friend, and I will keep it so. Not a crumb on my shelf grew within a day's walk of here.", fx = { align = { order = 1 } } },
        { text = "The Circle's mending it. Trust what they've cleansed.", next = "BACK", reply = "I will trust them when I see a green branch on my own table. Until then, the barrels from Ashenvale.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Never mind the stores.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. I've clean water and bread that didn't grow in this forest, and I'd ask you to pay for both, as everyone does, because the cart from Splintertree doesn't come often." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior of the Horde. You've walked through the rot to reach us, I see it on your boots, and I hope you didn't drink from anything on the way." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You'll be careful what you take from this forest, I hope, because the meat of a Felwood beast is as poisoned as its water." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, Earth Mother be thanked. Sit a while, if you can bear it; the ground here weeps, and I think you'll hear it more plainly than I do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "You are a warlock, I think; the land shivers a little where you stand, as it does in the hollows of Jaedenar. I do not judge you, but I would ask you to tread gently here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde, and far from any city. Could you keep my water cold with a spell, I wonder, or is that a foolish question to ask someone who studies the arcane?" },
        { id = "h_default", key = true,
          text = "I am Bale, and I keep the general goods at Bloodvenom Post. Water, food, thread and tools, all of it carried in from cleaner land, because nothing that grows in Felwood is fit to eat, and the Earth Mother weeps for it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here where nothing grows clean. The Earth Mother would welcome any healing you can give this soil, whatever name you give it in." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A druid, and a tauren besides. You'll understand, I think, why I sell nothing that grew in Felwood, because even the water here tastes of rot." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The land here is sick and does not heal, and yet you were sick once, and something healed you." },
      },
      again = {
        { id = "h_again", text = "Is there something more I can find for you on these shelves, friend?" },
        { id = "h_again2", text = "Take your time. There's no hurry in my corner; the herd always waits for the slowest calf." },
      },
      choices = {
        { text = "Can the earth of Felwood ever heal, Bale?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Nothing here is fit to eat?", next = "food" },
        { text = "Why is a tauren out here?", next = "why" },
        { text = "You'd sell goods to a warlock, knowing what fel did here?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "You carry all the water in, when the springs could be cleansed.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Can Felwood's soil be healed at all, Bale?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The water here must be dangerous, Bale.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can nothing in Felwood be hunted for food?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is nothing here fit to eat, even with care?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Someone must try to steal your supplies, Bale.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could Felwood heal the way I did, Bale?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Nothing. The fruit is bitter and the animals are mad, and even the water in the river runs green with venom; that's why we call this place Bloodvenom. Everything I sell came in on a wind rider's back." } },
      choices = {
        { text = "Can the land ever heal?", next = "food_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_heal = {
      lines = { { id = "fh_default", text = "The druids at the Emerald Sanctuary believe it can, and I want to believe them. The Earth Mother is patient, and she has healed worse wounds than this, though I do not know of any." } },
      choices = {
        { text = "With enough care, it will heal.", next = "BACK", reply = "It will, friend, and I will hope with you. The elders say she has mended deeper wounds than this one, given time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some land is lost for good.", next = "BACK", reply = "Perhaps, but I am not ready to believe it. Not while the druids are still kneeling in the soil.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Horde needed someone to keep the stores, and an orc would rather be fighting than counting bread. I don't mind the counting, but I do mind the forest." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell bread and water to tired people. There isn't much more to say than that, and I prefer it that way." } },
    advice = { { id = "tp_ad", text = "Buy more water than you think you need, because you can't refill it anywhere in Felwood." } },
    cenarion_circle = { { id = "tp_cc", text = "The druids at the Emerald Sanctuary want to heal the forest, and I wish them all the strength the Earth Mother can give." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw buy bread off me sometimes, through a go-between. They pay in honey, and I don't complain." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins pass through on their way south and buy everything I've got. I don't like the prices I charge them, but I like the money." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids here say the Dream remembers Felwood green. I'd settle for remembering what clean water tastes like." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, but I don't know anything about that. Walk with the Earth Mother all the same." } },
  },
}
