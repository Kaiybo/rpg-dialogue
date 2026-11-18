-- The Wetlands beyond Menethil: Dun Modr and Whelgar's Excavation. Voice: bibles/wetlands_roads.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longbraid", id = TODO_NPC("Longbraid the Grim"), name = "Longbraid the Grim",
  bible = "bibles/wetlands_roads.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "gruff" }, values = { "loyal", "brave" },
  notices = { "race" },

  impression = {
    first = "Longbraid the Grim holds what's left of Dun Modr against the Dark Irons, and he has earned his name.",
    third = "{name} met Longbraid the Grim, who leads the dwarves clinging to the edge of Dun Modr.",
  },

  greetings = {
    { id = "g_modr", text = "Keep yer head down, stranger. The Dark Irons have archers on the walls, and they're better shots than they look." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathin'? Good. In Dun Modr that's a compliment." },
  },

  start = "hello",
  nodes = {
    opn_magni = {
      lines = {
        { id = "opn_magni_q", text = "I said I'll no' curse him, an' I won't. But I've buried dwarves who asked me every day when the reserves were comin', an' I gave 'em the same answer every day. Ye've been tae Ironforge; ye tell me if he failed us." },
      },
      choices = {
        { text = "He did. Dun Modr should have come first.", next = "opn_magni_r_failed", fx = { affinity = 1, align = { honor = -1 }, opinion = { magni = "failed" } } },
        { text = "He gave his word to the Alliance. A king keeps his word.", next = "opn_magni_r_loyal", fx = { affinity = -1, align = { honor = 1 }, opinion = { magni = "loyal" } } },
        { text = "He's stretched thin. No king could hold every fire.", next = "opn_magni_r_stretched", fx = { trait = { practical = 1 }, opinion = { magni = "stretched" } } },
        { text = "The King asked after Dun Modr. He hasn't forgotten you.", next = "opn_magni_r_loyal", when = { heardLine = "magni.h_default" }, fx = { affinity = 1, opinion = { magni = "loyal" } } },
        { text = "That's between you and the King.", next = "BACK" },
      },
    },
    opn_magni_r = {
      lines = {
        { id = "opn_magni_r_default", text = "Between us an' a lot o' graves, aye. Never mind me; I've been on this wall too long." },
      },
      choices = {
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    opn_magni_r_failed = {
      lines = {
        { id = "opn_magni_r_failed", text = "Aye. There, ye've said it, so I don't have tae, an' I'll feel the worse for agreein' wi' ye. Don't say it near Captain Stoutfist in Menethil; he'll throw ye in the harbour." },
      },
      choices = {
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    opn_magni_r_loyal = {
      lines = {
        { id = "opn_magni_r_loyal", text = "Keeps his word tae the Alliance, an' it's his own people out here payin' for it. I'll hear ye, but ye've no' buried anyone on these walls." },
      },
      choices = {
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    opn_magni_r_stretched = {
      lines = {
        { id = "opn_magni_r_stretched", text = "Aye, well. That's what I tell the lads, an' it sounds better when someone else says it. It doesnae bring Dun Modr back, mind." },
      },
      choices = {
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    xpt_warrior = {
      big = true,
      lines = { { id = "xpt_warrior_default", text = "Aye, it was, and it still is when the Dark Irons come down out of Dun Modr, though my knees have their own opinions now. A warrior's whole trade is standing between the ones behind him and whatever's in front, and if your friend understands that, you're in good hands." } },
      choices = {
        { text = "A good shield wall beats any hero. We fight as one.", next = "BACK", reply = "That's the right of it, and it's what kept us alive at the Span longer than we had any right to live. Bring that thinking up the hill and you'll be welcome in my line.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Heroes win wars. Shield walls only hold them off.", next = "BACK", reply = "Tell that to the heroes I buried at the Span, friend. Every one of them was brave, and every one of them died because he stepped out of the wall.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Powder broke the Span, I'm told, but I saw what came after, an' it wasnae powder. They came through the smoke callin' fire like their grandsires under Thaurissan, an' good dwarves burned. If ye can talk tae that fire, tell it Longbraid wants Dun Modr back." } },
      choices = {
        { text = "I'll stand with your soldiers and win it back properly.", next = "BACK", reply = "That's the answer of someone who's seen a war, an' I thank ye for it. The lads need tae see the hill won by dwarves standin' together, no' handed back by magic.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go in alone and burn them out myself.", next = "BACK", reply = "Alone? Ye'd be one more name for Rhag tae carve, an' I've enough o' those. Burn them if ye must, but take some o' my lads tae watch yer back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aye, maybe, for the Dark Irons are no strangers tae dark arts themselves, an' they'd no' expect it from our side o' the Span. But I've seen good dwarves turn tae worse things when the fightin' went bad, so mind ye keep hold o' yerself." } },
      choices = {
        { text = "I'll keep hold. I control it, not the reverse.", next = "BACK", reply = "Ye say that, an' I believe ye mean it, as did the last one who said it tae me. Keep sayin' it every mornin', an' keep meanin' it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "When the fighting goes bad, I'll use whatever works.", next = "BACK", reply = "An' that's just how it starts, wi' whatever works. I'll take yer help against the Dark Irons, but I'll be watchin' ye closer than I watch them.", fx = { align = { light = -1 } } },
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By standing where I put you and not moving, for the Dark Irons come up out of the old ruins in waves and they test every gap we leave. We lost the Span because one line broke, and I'll not lose this hill the same way." } },
      choices = {
        { text = "Put me where the line is thinnest. I'll stay.", next = "BACK", reply = "Good, that's all I ask of any warrior, and more than most will give me. The thin spot's on the east slope by the old wall, and it's yours.", fx = { align = { order = 1 } } },
        { text = "I'll take the fight to them in the ruins.", next = "BACK", reply = "Brave, and foolish, and the very thing that cost us the Span. Go into the ruins if you must, but don't expect me to send anyone in after you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Watch the ruins from the high ground and tell me when the Dark Irons move, for they gather before every push and my sentries never see it. And keep the raptors off the road behind us, for if we have to fall back, I'd rather not fall back into their jaws." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch the ruins from the high ground and tell me when the Dark Irons move. {pet} could sit on the ridge and smell them coming, and I'd sleep better for it, if I slept at all." },
      },
      choices = {
        { text = "I'll watch and warn you, and hold my fire.", next = "BACK", reply = "That's what I need, a keen eye and a steady hand, not another sword in the mud. Warn me in time and I'll owe you more than I can say.", fx = { align = { order = 1 } } },
        { text = "I'll pick off their scouts before they can gather.", next = "BACK", reply = "Thin their scouts and they'll come at us blind, which I'd not mind at all. Just don't get yourself spotted doing it, or they'll come at you instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Inside? Ye'd be the first since they took it who came out again, an' I'd want tae hear every word. They've Dark Iron sentries on the walls an' more in the cellars, so if ye go, go by night an' go alone." },
      },
      choices = {
        { text = "I'll bring you back their plans, nothing more.", next = "BACK", reply = "Plans are worth more than any dead captain, so ye've a good head on ye. Bring me what they're plannin' an' I'll see it reaches Ironforge.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "And their captain's throat, if I can reach it.", next = "BACK", reply = "Aye, well, if it's in reach, I'll no' weep for him. But a dead captain's soon replaced, an' a dead rogue's no' much use tae me either.", fx = { align = { honor = -1 } } },
        { text = "How did Dun Modr fall?", next = "fall" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Maybe no', but it burned through my lines, an' good dwarves were standin' in them. If ye've ice enough tae cool a Dark Iron's temper, take it tae the Span an' show them what ye've got." },
      },
      choices = {
        { text = "I'll stand at the Span with you.", next = "BACK", reply = "Then ye're welcome there, an' the lads will be glad o' ye. Mind ye stand behind a shield, for the Dark Irons aim for casters first.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way, where they least expect.", next = "BACK", reply = "Suit yerself, so long as yer way ends wi' Dark Irons on the ground. Just dinnae come runnin' tae my lines wi' half o' Dun Modr on yer heels.", fx = { align = { order = -1 } } },
        { text = "What happened to the Span?", next = "span" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That it was a dwarven hold once, an' the Dragonmaw have it now, wi' a red dragon chained in the deep. Even the beasts won't go near that mountain." } },
      choices = {
        { text = "The red dragon must be freed.", next = "BACK", reply = "Freed? Ye'd need an army tae get within a mile o' Grim Batol, an' I've no' got one. If ye ever find a way, though, I'd like tae hear it.", fx = { align = { light = 1 } } },
        { text = "Leave that mountain and its dragons alone.", next = "BACK", reply = "Wise words, an' ones my dwarves have lived by since the Dragonmaw came. That mountain's a grave, an' there's no sense climbin' intae it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whoever's least hurt, which some days is me, an' I've no gift for it. We send the worst back tae Menethil, but the road's long an' the Dark Irons watch it." } },
      choices = {
        { text = "Then I'll stay a while and tend them.", next = "BACK", reply = "The Light bless ye for it, for the lads have been patchin' each other wi' spit an' prayer. Go see the ones by the fire first; they've waited longest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Send them all back. Your fighters need to fight.", next = "BACK", reply = "Spoken like someone who's never had tae watch a lad bleed while he held his post. They'll fight better knowin' someone cares if they fall.", fx = { align = { light = -1 } } },
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stand on the bridge wi' us when the Dark Irons come, an' let the lads see someone who isnae afraid. Fear's been our worst enemy since the Span fell, an' fear doesnae die tae an axe." } },
      choices = {
        { text = "I'll stand on that bridge with you, Longbraid.", next = "BACK", reply = "Then ye'll stand at my right hand, an' the lads will see it. That's worth more tae me than any reinforcements Ironforge might send.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Holding a lost bridge is folly. Fall back to Menethil.", next = "BACK", reply = "Fall back? An' hand the Dark Irons the whole o' the Wetlands? Ye can go back tae Menethil if ye like, but my dwarves stay.", fx = { align = { honor = -1 } } },
        { text = "Something else, Longbraid.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_warrior", tags = { "news" }, when = { party = { class = "WARRIOR" }, faction = "Alliance" },
          text = "That one with you, {companion}, holds a shield like someone who's stood in a line before, and I've a soft spot for anyone who has. I lost too much of my company at the Span to think a lone hero is worth half a good shield wall." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, out here? I've wounded enough tae keep ye busy, an' dead enough tae keep ye prayin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The Light's a long way from Dun Modr these days, so ye're welcome tae bring some o' it with ye." },
        { id = "h_default", key = true,
          text = "Longbraid, they call me, and they add 'the Grim' because I've had little to smile about since the Dark Irons came. They broke the Thandol Span and took Dun Modr, and we hold on by our fingernails." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's a face I'm glad to see, and there's no' many of those left round here. Come in out of the wet." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "A mountaineer out o' Dun Morogh, by the cut o' yer cloak. Ye kept the passes clear o' trolls, so ye'll know what it is tae hold a gap wi' too few, and that's all Dun Modr is now, a gap we cannae hold." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here! I've no quarrel wi' yer kind, only wi' the Dark Irons an' the dragons over Grim Batol." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, for Dun Modr needs every arm it can get, and it's had precious few." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have come up past the raptors, then, which tells me you know your trade." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll take any help that's goin', though I'll no' smile about it, an' they'll tell ye I dinnae smile about anythin'." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Dark Irons have their own fire-callers, an' they used them on us at Dun Modr. I'll judge ye by what ye do, but I'll be watchin'." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the walls have ears." },
        { id = "h_again2", text = "Speak yer piece, then, and dinnae waste my breath or yers." },
      },
      choices = {
        { text = "What do you know of Grim Batol?", next = "druid_q", when = { class = "DRUID" } },
        { text = "How did the Dark Irons take Dun Modr?", next = "fall" },
        { text = "The Thandol Span seems to be in ruins.", next = "span" },
        { text = "Why do they call you Grim?", next = "grim" },
        { text = "I'm a dwarf of Ironforge. Tell me how to help.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I could get inside Dun Modr and learn what they're planning.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Dark Iron fire won't burn through a mage's ward.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How can a warrior help hold Dun Modr, Longbraid?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What could a hunter do for Dun Modr?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who tends your wounded out here, Longbraid?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you ask of a paladin, Longbraid?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a warlock be any use against the Dark Irons, Longbraid?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did the Dark Irons call fire at Dun Modr, Longbraid?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My companion is a warrior. Was that your trade too?", next = "xpt_warrior", when = { party = { class = "WARRIOR" }, faction = "Alliance" } },
        { text = "Hold fast, Longbraid.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "They came out of the south in force, with powder and steel, and we were too few. Harlo Barnaby, one of my soldiers, took an axe in the back covering the retreat, and he's lucky he lived." } },
      choices = {
        { text = "You should have been reinforced.", next = "fall_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_why = {
      lines = { { id = "fw_default", text = "Ironforge has a dozen fires to put out, and ours wasnae the biggest until it was too late. I'll no' curse the King for it, but I'll no' pretend it didnae hurt." } },
      choices = {
        { text = "The King should have come. Loyalty runs both ways.", next = "fall_end", fx = { align = { honor = -1 } } },
        { text = "You've held your post anyway, with mud to your knees.", next = "fall_end", fx = { align = { honor = 1 } } },
        { text = "What happens now?", next = "fall_end" },
      },
    },
    fall_end = {
      lines = { { id = "fe_default", text = "Now we take it back, a stone at a time if need be. Every Dark Iron ye put down out there is one less on my walls." } },
      choices = {
        { text = "Did the King fail you here, Longbraid?", next = "opn_magni" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    span = {
      lines = { { id = "s_default", text = "The great bridge into Arathi, or it was until the Dark Irons blew half of it into the gorge. Motley Garmason can tell ye more, for he's taken it to heart." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    grim = {
      lines = { { id = "g_default", text = "Because I lost good dwarves on these walls, and I remember each one by name. I'll smile again when Dun Modr's ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Then ye already know, kinsman: go out there and fight. And when ye get back to Ironforge, tell them Longbraid still holds." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know Dark Irons and walls, and naught else these days." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol was the Wildhammer's home till the Dark Irons cursed it. We've enough Dark Irons in Dun Modr without diggin' up their old curses." } },
    magni = { { id = "tp_magni", text = "King Magni gave me Dun Modr's edge tae hold, an' I'm holdin' it. When he wants it back whole, I'll give him that too." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Span's the only road from Khaz Modan tae Arathi, an' the Dark Irons want it. They'll have tae come through my lads first." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons took Dun Modr while we were lookin' the other way, an' I've no' looked away since. Every one o' them I see goes in the loch." } },
  },
}

P:NPC {
  key = "motley_garmason", id = TODO_NPC("Motley Garmason"), name = "Motley Garmason",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "sharp" }, values = { "loyal" },
  notices = { "class" },

  impression = {
    first = "Motley Garmason camps near the Thandol Span and can't stop thinking about the Dark Irons who broke it.",
    third = "{name} met Motley Garmason, a dwarf of Dun Modr bent on avenging the Thandol Span.",
  },

  greetings = {
    { id = "g_span", text = "Ye've come up the road from Menethil? Then ye've seen what's left of the bridge, and ye know why I'm angry." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "With anythin' that works. They blew the Span tae cut us off from Arathi, an' they laugh about it in Dun Modr. If yer earth an' fire can shake them out o' their holes, I'll no' ask where it comes from, an' I'll no' let anyone else ask either." } },
      choices = {
        { text = "Even Dark Irons deserve mercy if they yield.", next = "BACK", reply = "Mercy, for them? They'll get what they gave my cousin, an' he got none. Talk tae Longbraid about mercy; he's the patient one, no' me.", fx = { align = { light = 1 } } },
        { text = "No quarter. They broke the Span.", next = "BACK", reply = "Now there's a voice I like tae hear. Shake them out o' their holes, an' I'll be waitin' at the bottom wi' my axe.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would, an' I'd sleep sound after, for they killed good dwarves on that bridge an' laughed while they did it. Longbraid says I'm too angry tae think straight, an' he may be right, but anger's what I've got left." } },
      choices = {
        { text = "Don't let it eat you, Motley. That's my trade's lesson.", next = "BACK", reply = "Easy for ye tae say, wi' yer fancy dark books an' yer warnings. It's eatin' me already, if ye want the truth, an' I cannae seem tae stop it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anger keeps you alive out here. Hold on to it.", next = "BACK", reply = "Aye, that's what I keep tellin' Longbraid, an' he never listens. Ye're the first who's said it back tae me, an' I'll no' forget it.", fx = { align = { light = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, if ye've the stomach for it, for they hold the ruins o' the Span an' throw anythin' that comes near intae the gorge. They've their own fire-casters, mind, so ye'll want tae bring the cold an' leave the flames at home." } },
      choices = {
        { text = "Vengeance won't rebuild the Span, Motley.", next = "BACK", reply = "Maybe no', but it'll make sleepin' easier, an' that's somethin'. Let Longbraid worry about stones; I'll worry about the dwarves who broke them.", fx = { align = { light = 1 } } },
        { text = "They'll pay for every stone they broke.", next = "BACK", reply = "Every last stone, an' every dwarf who fell wi' them. Freeze them solid, an' I'll do the breakin' for ye.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A bridge, for a start, an' the dwarves who were on it when it fell, an' I'll no' rest till they've paid it back. Go down tae the Span an' ye'll find them crawlin' over the rubble like they own it." } },
      choices = {
        { text = "I'll fight them for the living, not for vengeance.", next = "BACK", reply = "For the livin', then, if that's how ye want it. I'll take the help whatever yer reasons, so long as the Dark Irons fall.", fx = { align = { light = 1 } } },
        { text = "Then I'll collect your debt in full, Motley.", next = "BACK", reply = "In full, aye, wi' interest. Ye're a fighter after ma own heart, an' I'll stand beside ye at the Span when ye go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "North across the broken Span tae Arathi, or back intae the hills toward Grim Batol, an' I cannae tell which. Find out for me, an' I'll know where tae send the next lot o' axes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "North across the Span or back toward Grim Batol, an' I cannae tell which. {pet} could follow a Dark Iron's stink through any bog, though, for they smell o' brimstone an' never wash." },
      },
      choices = {
        { text = "I'll track them and bring you the truth of it.", next = "BACK", reply = "Truth's what I need, so I can stop sendin' good axes intae the wrong hills. Bring it back, an' I'll stand ye a pint in Menethil.", fx = { align = { honor = 1 } } },
        { text = "I'll track them and ambush them on their own trail.", next = "BACK", reply = "Ambush them on their own trail? Ha! I like the sound o' that, though Longbraid will say I'm a bad influence on ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's all I've got left that's worth wantin', since the Span took my cousin an' half the road with it. When it's done, maybe I'll want somethin' else, an' maybe then I'll come an' talk tae ye." } },
      choices = {
        { text = "Vengeance won't bring him back. Grieve first, Motley.", next = "BACK", reply = "I cannae grieve yet, for there's no room for it wi' all this anger in the way. Maybe when it's done, like I said, but no' before.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then make them pay, Motley. They earned it.", next = "BACK", reply = "They did, every one o' them, an' it's good tae hear someone say it plain. Go wi' ma blessin', such as it is.", fx = { align = { light = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My axe, if it's up tae me, but I'll grant ye a court would hang them just as dead an' wi' more folk watchin'. Either way they answer, an' that's all I ask." } },
      choices = {
        { text = "A court, then. Justice should be seen.", next = "BACK", reply = "A court it is, then, if ye can drag them tae one alive. I'll be there in the front row, an' I'll no' be quiet about it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your axe. It's quicker and surer.", next = "BACK", reply = "Ye see it the way I do, then. Courts take months, an' my axe takes a moment.", fx = { align = { order = -1 } } },
        { text = "Something else, Motley.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Dwarves an' stone an' years, an' the Dark Irons gone from the bridgeheads first, for they'll knock down anythin' we raise. It joined Khaz Modan tae Arathi for longer than any of us has lived, an' now ye cannae cross it without a fight." } },
      choices = {
        { text = "Then drive out the Dark Irons and build it again.", next = "BACK", reply = "Aye, drive them out first, an' then the stonemasons can do the rest. That's the order o' it, an' I'll be first in line for the drivin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some bridges are meant to fall. Find another road.", next = "BACK", reply = "Another road? There is no other road, ye daft beggar, save the sea. That bridge was Khaz Modan's pride, an' I'll see it standin' again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If ye're here tae talk me out o' vengeance, save yer breath, for I've heard it all from my mother." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll understand, then, that some things need answerin' for, an' the Span's one of them." },
        { id = "h_default", key = true,
          text = "Motley Garmason, and I mean to see the Dark Irons pay for the Thandol Span. They blew it to cut us off from Arathi, and they're no' finished yet." },
        { id = "h_span", when = { questActive = TODO_QUEST("The Thandol Span") },
          text = "Go and see the Span for yerself, and find out what the Dark Irons left behind. They're bold enough to leave clues." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Good, for I've a list o' Dark Irons who owe me for the Span, an' I need someone tae collect." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, eh? The Dark Irons at the Span leave tracks like anyone else, an' I'd like tae know where they lead." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've no time for trees an' moss, for I've a grudge tae tend, but ye're welcome tae stand an' listen while I tend it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! The Dark Irons blew the Span wi' powder, an' I'd like tae see them meet somethin' that burns hotter." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Fine by me, for I'd set every demon in the Nether on the Dark Irons if I thought it'd bring the Span back." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dark Iron", min = 30 } }, text = "Ye've been at the Dark Irons, I hear, an' there's fewer of them crawlin' over the Span's ruins than there were. It'll no' bring the bridge back, but it's a start, an' I thank ye for it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Good. The Dark Irons fight wi' fire an' powder, an' I'll take any dwarf who can answer them in kind." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've a vengeance to plan." },
        { id = "h_again2", text = "Speak yer mind, friend." },
      },
      choices = {
        { text = "Why did they blow up the Span?", next = "why" },
        { text = "You must have family near here.", next = "family" },
        { text = "How does it look from Arathi's side?", next = "arathi" },
        { text = "I know demolitions. Who set the charges?", next = "rogue", when = { class = "ROGUE" } },
        { text = "What do the Dark Irons owe you, Motley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where do you think the Dark Irons' tracks lead?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Vengeance seems to be all you want from the Dark Irons, Motley.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Dark Irons answer to a court, or your axe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would it take to rebuild the Thandol Span?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a mage help you against the Dark Irons, Motley?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You'd really use demons against them, Motley?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Will you fight the Dark Irons with fire, Motley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck, Motley.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "To split Khaz Modan from the human lands, so Ironforge stands alone. Clever, and cruel, and just like them." } },
      choices = {
        { text = "What will you do about it?", next = "why_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_do = {
      lines = { { id = "wd_default", text = "Find the ones who did it and send them back to their Emperor Thaurissan in pieces. Or at least in chains, if Longbraid's watching." } },
      choices = {
        { text = "In chains. They should face the King's justice.", next = "why_end", fx = { align = { order = 1 } } },
        { text = "In pieces. They earned it.", next = "why_end", fx = { align = { order = -1 } } },
        { text = "You've thought about this a lot.", next = "why_end" },
      },
    },
    why_end = {
      lines = { { id = "we_default", text = "Every night since the bridge fell, aye. Help me and ye'll see it done right." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    family = {
      lines = { { id = "f_default", text = "My kin are scattered between here and Ironforge, those that are left. I don't speak of the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arathi = {
      lines = { { id = "a_default", text = "Orcs and trolls to the north, and Stromgarde's ruins beyond. Without the Span, we'd as well be on the moon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Dark Iron sappers, by the scorch marks, and good ones. If ye can read their work, ye'll be more use to me than ten soldiers." } },
      choices = { { text = "I'll take a look.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, and I've no time to find out. Ask Longbraid." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons hold Dun Modr an' they're spyin' on the Span. I've no time for anythin' else, so that's all ye'll get from me." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Span's broken an' the Dark Irons did it, an' every day it stays broken they get bolder. That's all the history I've time for." } },
    grim_batol = { { id = "tp_grim_batol", text = "Don't ask me about Grim Batol. I've enough tae think about on this side o' the hills." } },
  },
}

P:NPC {
  key = "ormer_ironbraid", id = TODO_NPC("Ormer Ironbraid"), name = "Ormer Ironbraid",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "proud" }, values = { "brave" },
  notices = { "class" },

  impression = {
    first = "Ormer Ironbraid guards Whelgar's Excavation from the raptors, and he holds a grudge against each raptor personally.",
    third = "{name} met Ormer Ironbraid at Whelgar's Excavation, a dwarf with a score to settle against the local raptors.",
  },

  greetings = {
    { id = "g_dig", text = "Watch the long grass, friend. If it moves and ye didnae move it, run." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some say the dig's on their nestin' grounds, an' some say they've just a taste for dwarf. Whelgar's diggers say the raptors grow wilder the deeper they dig, an' I've half a mind tae believe them. If the earth's tellin' the beasts tae drive us off, I'd like tae know." } },
      choices = {
        { text = "Then maybe the dig should respect their nesting grounds.", next = "BACK", reply = "Maybe, aye, an' I'll grant there's sense in that. But try sayin' it tae Whelgar wi' his bones an' his League papers, an' see how far ye get.", fx = { align = { honor = 1 } } },
        { text = "Beasts don't own the ground. Keep digging.", next = "BACK", reply = "That's how I'd have it, too, but they keep comin', an' they've taken good dwarves. If ye're stayin', keep yer axe handy.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Precious little, an' that's the trouble, for they've taken diggers an' mules an' they keep comin' back for more. Fire sends them off for a night, but they remember, an' they come back angrier, so whatever ye set on them, make sure it finishes the job." } },
      choices = {
        { text = "I'll drive them off, not wipe them out.", next = "BACK", reply = "Drive them off, then, if ye've the patience for it. I warn ye, they've come back angrier every time, an' I've the scars tae prove it.", fx = { align = { light = 1 } } },
        { text = "Not one of them leaves the marsh alive.", next = "BACK", reply = "That's what I needed tae hear. Wipe out the lot, an' maybe my lads can work wi'out lookin' over their shoulders.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Ormer.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In threes an' fours, circlin' till one o' them finds a gap, an' then the rest pile in after it. Stand yer ground an' keep yer shield up, an' they'll lose interest before ye do, though my diggers always lose their nerve first." } },
      choices = {
        { text = "I'll hold the gap so none get through.", next = "BACK", reply = "That's a warrior's answer, an' I'll take it gladly. Hold the gap, an' I'll take care o' whatever slips round the side.", fx = { align = { order = 1 } } },
        { text = "I'll charge the pack before they finish circling.", next = "BACK", reply = "Charge them? Ye'll have three on yer back before ye reach the first, but I'll grant ye've the nerve for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Cleverer than a raptor's no' hard, friend, but quieter is, for they hear a twig snap from the far side o' the marsh. Get close tae the big ones an' ye'll find they've a soft spot under the jaw, if ye're quick." },
      },
      choices = {
        { text = "I'll take them clean and quick.", next = "BACK", reply = "Clean an' quick's the way, an' kinder than they deserve. Mind the big ones, for they've a sharper nose than ye'd think.", fx = { align = { honor = 1 } } },
        { text = "I'll bleed them out from the brush.", next = "BACK", reply = "Bleed them out? Aye, if ye can stay hidden long enough. Just dinnae let them smell the blood an' come lookin' for ye.", fx = { align = { honor = -1 } } },
        { text = "Why are the raptors so bold?", next = "raptors" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ye'd think so, but these lot only get angrier, an' an angry raptor's worse than a hungry one. Freeze them where they stand an' I'll do the rest wi' my axe." },
      },
      choices = {
        { text = "Together, then. Your axe, my frost.", next = "BACK", reply = "Together, then, an' I'll be glad o' the help. Ye freeze them, I chop them, an' we'll have the beasts sorted by supper.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll handle them myself, Ormer.", next = "BACK", reply = "Suit yerself, but dinnae come cryin' tae me when ye've a raptor on each arm. My axe'll be here if ye change yer mind.", fx = { align = { order = -1 } } },
        { text = "What's the dig for?", next = "dig" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Shallow graves under the ridge an' a stone each, for that's all we had time for wi' the raptors circlin'. I'd thank ye for a word over them, if ye've one tae spare." } },
      choices = {
        { text = "I'll go to the ridge and say the words.", next = "BACK", reply = "Thank ye, for they deserve better than a few stones an' my clumsy words. Their names are scratched on the rocks, if ye need them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living diggers need guarding more than the dead.", next = "BACK", reply = "Aye, the livin' need it more, an' I'll no' argue. But a word over the dead keeps the livin' goin', an' that's worth somethin' too.", fx = { align = { light = -1 } } },
        { text = "Something else, Ormer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In front o' the diggers wi' yer back tae the trench, for the raptors go for whatever runs. Stand firm an' they'll circle, but run an' they'll have ye down." } },
      choices = {
        { text = "Then I'll stand in front and hold, Ormer.", next = "BACK", reply = "That's the way tae do it, an' ye've the sense for it. Stand firm, an' the diggers will stand wi' ye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt them in the grass before they reach the dig.", next = "BACK", reply = "Huntin' them in the grass is their game, no' ours. Ye'll find more teeth than ye bargained for, but go if ye must.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ormer.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because we've built camps on their nestin' ground, if ye want the honest answer, though I'll no' say it in front o' Whelgar. Knowin' why doesnae bring back the lads they took." } },
      choices = {
        { text = "Hold the ground and drive them off. The dig matters.", next = "BACK", reply = "Aye, that's the League's answer, an' Whelgar's. I'll hold it, but I'll no' pretend it sits easy wi' me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Move the camp off their nests and let them be.", next = "BACK", reply = "An' tell Whelgar tae move his precious dig? I'd like tae see ye try, though I'll admit ye might be right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! We've lost diggers tae the raptors an' buried them where they fell, an' none o' them had proper words." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I could use a shield when the raptors come at the dig, an' a holy one would do nicely." },
        { id = "h_default", key = true,
          text = "Ormer Ironbraid, and I keep the raptors off Whelgar's dig. They've taken diggers, mules and more lunches than I care to count." },
        { id = "h_revenge", when = { questActive = TODO_QUEST("Ormer's Revenge") },
          text = "The raptors round the dig need thinnin', and I want the big ones gone most of all. Do it for me, and do it for the lads they took." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Grand; the raptors come at the dig in packs, an' I could use someone who'll stand firm while they circle." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Ye'll be tellin' me the raptors are only doin' what raptors do, an' I'll be tellin' ye they killed my friends, so let's save each other the breath." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Good, for the raptors here are cleverer than they've any right tae be, an' I'd like tae see one try tae outwit a demon." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Mottled", min = 30 } }, text = "The raptors round the dig are fewer an' warier, an' the diggers swear it's because o' you. That's the first good news I've had out here in a month." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The raptors here are the worst I've ever seen. Can ye speak tae beasts, or only tae rocks?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep yer eyes on the grass while ye ask." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "You seem to have a special hatred for the raptors.", next = "raptors" },
        { text = "What's Whelgar digging for?", next = "dig" },
        { text = "There must be a trick to fighting them.", next = "fight" },
        { text = "Raptors are fine prey. I'll hunt them.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Raptors have sharp senses. I'll have to be cleverer than usual.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Fire, then. Raptors fear fire, surely?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How do the raptors attack the dig, Ormer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Were the lost diggers given a proper burial, Ormer?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where should I stand when the raptors come, Ormer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do the raptors hunt the dig so fiercely, Ormer?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do the raptors here fear, Ormer?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why are the raptors so fierce around the dig, Ormer?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good hunting, Ormer.", next = "END" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They took a friend of mine off the dig in broad daylight, while he was eatin' his bread. He never even screamed, and I'll hear that silence till I die." } },
      choices = {
        { text = "Revenge may not be worth it.", next = "raptors_rev" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors_rev = {
      lines = { { id = "rv_default", text = "Worth it? I dinnae know, but it's what I've got. Some say I should let it lie, and they werenae there." } },
      choices = {
        { text = "Vengeance won't bring him back. Guard the living instead.", next = "raptors_end", fx = { align = { light = 1 } } },
        { text = "He'd want the beasts dead. Make them pay.", next = "raptors_end", fx = { align = { light = -1 } } },
        { text = "What was his name?", next = "raptors_end" },
      },
    },
    raptors_end = {
      lines = { { id = "re_default", text = "Ye can ask, but I keep it to myself, for it's mine to carry. Help me with the raptors and that'll be enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dig = {
      lines = { { id = "d_default", text = "Old things in the earth, for the Explorers' League, and Whelgar won't say much more. Ask him yerself; he's near the caves." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    fight = {
      lines = { { id = "f_default", text = "Back to a wall and a shield up, for they hunt in packs. Kill the first one fast, or the next one kills you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then ye're doubly welcome here, hunter. Bring me the claws of the biggest and I'll drink to yer name." } },
      choices = { { text = "Consider it done.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldnae tell ye. All I think about these days is raptors." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The Dragonmaw on the highland don't bother me half as much as the raptors on this ridge. Ye can see an orc comin'." } },
    magni = { { id = "tp_magni", text = "I'll tell King Magni himself I cleared this ridge once it's cleared. Until then I'm no' fit tae stand before him." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons? Let Longbraid have them. I've raptors tae deal wi' first, an' then I'll see." } },
  },
}

P:NPC {
  key = "whelgar", id = TODO_NPC("Prospector Whelgar"), name = "Prospector Whelgar",
  bible = "bibles/wetlands_roads.md", role = "scholar", tier = "service",
  communities = { "menethil" }, temper = { "steady" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Prospector Whelgar runs the excavation that bears his name, and he cares more about what's under the mud than what's in the grass.",
    third = "{name} met Prospector Whelgar, who leads the Explorers' League dig in the Wetlands.",
  },

  greetings = {
    { id = "g_dig", text = "Careful where ye step, friend. Ye could be standin' on a thousand years of history." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Great bones, bigger than any beast walkin' the Wetlands now, an' the deeper we go, the bigger they get. My diggers say the ground's uneasy an' the raptors seem tae agree, so if the earth wants its dead left alone, ye'd tell me, would ye no'?" } },
      choices = {
        { text = "I'd tell you. The dead deserve their rest, Prospector.", next = "BACK", reply = "Then ye've the shaman's sense, an' I respect it, though I've diggin' tae finish. I'll ask the lads tae bury the bones we've done wi'.", fx = { align = { honor = 1 } } },
        { text = "Dig on. Knowledge is worth a little unease.", next = "BACK", reply = "That's the League talkin', an' I'm glad tae hear it. Unease never stopped a good dig, an' it'll no' stop this one.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bones, pots an' a few carvings in a hand nobody at the League can read yet, an' none o' it hums, thank the Light. If anythin' ever does start hummin', it goes straight tae Ironforge an' no' tae you, so dinnae get yer hopes up." } },
      choices = {
        { text = "Ironforge is the right place for it, Whelgar.", next = "BACK", reply = "It is, an' the scholars there will make sense o' it, which I cannae. I'm glad tae hear a warlock say so, if I'm honest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Scholars hoard what they fear. I'd put it to use.", next = "BACK", reply = "Put it tae use? No' while I'm prospector here, ye'll no'. The League's careful wi' what it finds, an' so am I.", fx = { align = { order = -1 } } },
        { text = "Something else, Whelgar.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raptors from the grass, Mosshide gnolls from the hills to the east, and Ormer shouting at both of them. If you'd stand watch at the edge of the trench for a spell, we might actually get some work done." } },
      choices = {
        { text = "I'll stand watch. Your work matters, Prospector.", next = "BACK", reply = "That's kind o' ye, an' the diggers will breathe easier knowin' ye're there. Take the eastern edge; that's where the gnolls come over.", fx = { align = { honor = 1 } } },
        { text = "I'll stand watch for a share of what you find.", next = "BACK", reply = "A share, is it? I cannae promise ye any o' the League's finds, but ye'll have my thanks an' a good word in Ironforge.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They keep my diggers from digging, which comes to the same thing, for nobody works well with one eye on the grass. Ormer's been thinning them, but there are more in the marsh than he has patience." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They keep my diggers looking over their shoulders, which comes to the same thing. {pet} has a fine eye for the grass, I think, and I'd be glad to have it watching ours." },
      },
      choices = {
        { text = "I'll thin the pack so your diggers can work.", next = "BACK", reply = "Good, that's all I'm askin' for. Thin them out, an' the lads might get a full day's diggin' done for once.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt them for the sport, not for the dig.", next = "BACK", reply = "Sport or no, so long as they're thinned, I'll no' complain. Just keep yer arrows pointed away from my diggers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Hum, do they? Then I'll thank ye tae keep yer hands off them until the League's had a look. Whatever's under this marsh is older than Menethil, I'd wager, an' I'll no' have it blown up by accident." },
      },
      choices = {
        { text = "Agreed. The League should see it first.", next = "BACK", reply = "Thank ye, that's all I ask. The League'll know what tae make o' them, an' I'll sleep easier wi' them catalogued.", fx = { align = { order = 1 } } },
        { text = "Knowledge belongs to whoever can read it.", next = "BACK", reply = "Not here, it doesnae. Here it belongs tae the League, an' tae Ironforge, an' I'll thank ye tae remember it.", fx = { align = { order = -1 } } },
        { text = "What have you found so far?", next = "finds" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "An' me, an' I'm no' as slow as I look. Everything here's catalogued an' bound for Ironforge, so if a piece goes missin', the League will know, an' the League never forgets." },
      },
      choices = {
        { text = "I'm here to help, not to pocket.", next = "BACK", reply = "Glad tae hear it, an' I'll take ye at yer word. Just keep yer hands where I can see them, an' we'll get along fine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Catalogues can be wrong, Prospector.", next = "BACK", reply = "Maybe they can, but mine never are. I've counted every bone in this trench twice, an' I'll count them again tonight.", fx = { align = { honor = -1 } } },
        { text = "Have the raptors hurt anyone?", next = "raptors" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fossils, mostly, and bones far bigger than any beast living now, which aren't the sort you bury. There's a strangeness in a few of them that makes the diggers uneasy, and they're not easily made uneasy." } },
      choices = {
        { text = "Some things are better left in the ground, Prospector.", next = "BACK", reply = "Ye sound like my diggers, an' maybe ye're right. But the League pays me tae dig, so dig I will, uneasy or no'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dig it all up. Knowledge shouldn't fear the dark.", next = "BACK", reply = "That's the League's own creed, near enough, an' it's good tae hear it from someone wi' faith. We'll keep at it, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I ask myself that every night, and every morning the ground gives me some new reason to keep digging. The League will remember the finds, but I'll remember the names, and that's my burden, not theirs." } },
      choices = {
        { text = "Then honour them by finishing the work.", next = "BACK", reply = "Aye, that's what I tell maself every mornin'. I'll finish it, an' I'll make sure their names are on the report.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No find is worth more lives. Pack it up.", next = "BACK", reply = "Pack it up? After all we've lost? Then their deaths would mean nothin', an' I cannae let that be.", fx = { align = { honor = -1 } } },
        { text = "Something else, Prospector.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A skull bigger than a cart, wi' a ridge o' horn like no beast I know, an' scorch marks on it older than the stone round it. The diggers say it's a dragon, an' I say it's no' my place tae guess until I've cleaned it." } },
      choices = {
        { text = "Study it properly. The past should be understood.", next = "BACK", reply = "That's what the League's for, an' what I'm for. It'll be studied right, an' ye can come see it in Ironforge someday.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rebury it. Some bones are better left in the mud.", next = "BACK", reply = "Rebury it? I've half a mind tae, some nights, but the League would have my beard. It goes tae Ironforge, an' that's the end o' it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Some of what we dig up here is old and some is very old, and a few pieces I'd rather a priest looked at before I touched them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! My diggers will stand a little straighter with you around, and I'll take all the straight backs I can get." },
        { id = "h_default", key = true,
          text = "Prospector Whelgar of the Explorers' League, and this is my excavation, raptors and all. The ground here hides more than mud, though it hides it under plenty of mud." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! The dig could use one, for my diggers keep looking over their shoulders instead of at the ground." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Good, for the raptors know this ground better than any of my maps, and you'll know the raptors." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Yer folk are old, I'm told, older than ours by a good few thousand years, an' I'd like tae know if ye recognise anythin' we've dug up." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at my dig! Mind where ye step, for if ye summon anythin' on top o' my trenches, I'll have ye fillin' them back in." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, at my excavation! I've bones in the ground here older than Ironforge, an' I'd dearly like tae know what the earth makes o' my diggin' them up." },
      },
      again = {
        { id = "h_again", text = "What else? I've a trench to check." },
      },
      choices = {
        { text = "You must have found something worth all this digging.", next = "finds" },
        { text = "The raptors look a real danger to the dig.", next = "raptors" },
        { text = "A gnome scholar would love to see this.", next = "gnome", when = { race = "Gnome" } },
        { text = "Your finds hum with old magic, Prospector.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "A dig full of treasure, and only raptors for guards.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What has your diggers looking over their shoulders?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the raptors keep you from digging, Prospector?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What have you found that needs a priest's eye, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I wonder if your dig is worth the lives it's cost.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's the strangest thing you've pulled out of the mud?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Has your dig turned up anything a warlock should know about?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What has your dig turned up that worries you, Whelgar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    finds = {
      lines = { { id = "f_default", text = "Old dwarven stonework, older than Ironforge's records, and some say older still. The League wants it all catalogued before the Dark Irons come lookin'." } },
      choices = {
        { text = "The past should stay buried. Leave it be.", next = "BACK", reply = "Leave it be? An' let the Dark Irons dig it up instead? Nae, better it's in our hands than theirs.", fx = { align = { order = -1 } } },
        { text = "It belongs in Ironforge's halls, properly recorded.", next = "BACK", reply = "Exactly, an' that's what we're doin', one bone an' one stone at a time. Thank ye for seein' it right.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They're a nuisance, and Ormer takes them very personally. I let him, for he keeps my diggers alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Then tell them to come, for I've more stones than scholars. Mind the raptors on the way." } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's beyond me, I'm afraid, though I'll talk about old stones all day." } },
    explorers_league = { { id = "tp_explorers_league", text = "The League sent me out here wi' Merrin tae dig, an' we turned up bones bigger than anythin' that ought tae walk. Then the raptors came, an' now we're diggin' wi' one eye on the trees." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's the great prize, deep in the Badlands, an' Prospector Ironband's lot say its stones are older than Ironforge. I believe them, for I've seen the drawings." } },
    grim_batol = { { id = "tp_grim_batol", text = "Old stones are my trade, an' Grim Batol's the oldest in these hills, but I'll no' go near it. Some stones are best studied in books." } },
    magni = { { id = "tp_magni", text = "King Magni reads our reports himself, so I write them neat. That's the only reason my handwritin's improved in fifty years." } },
  },
}
