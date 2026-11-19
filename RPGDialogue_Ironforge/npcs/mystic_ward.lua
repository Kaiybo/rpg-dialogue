-- The Hall of Mysteries: the High Priest, the priest trainers, the paladins Tiza and Muiredon,
-- and two of the gnome mages who share the hall.
-- Voices: bibles/mystic_ward.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- High Priest Rohan: head of the Church in Ironforge; paces the Hall; sends priests on to
-- Laurena and Alathea; Fear Ward for dwarves; the censer sold to feed the city's poor.
P:NPC {
  key = "rohan", id = TODO_NPC("High Priest Rohan"), name = "High Priest Rohan", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "priest", tier = "major",
  communities = { "ironforge" }, temper = { "steady", "warm" }, values = { "pious", "kind", "generous" },
  likesTone = "polite", race = "Dwarf",
  spiritSensitive = true,
  notices = { "light", "race" },

  impression = {
    first = "He speaks of the Light like a miner of a good seam.",
    third = "{name} met High Priest Rohan, who leads the Church of the Light in Ironforge from the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_walk", text = "Walk wi' me, if ye want a word; I think better on my feet, an' the floor's warm." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, one o' the Light's own. Come along, then, an' tell me how the road's treatin' ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Fall in beside me; I've done six laps o' the Hall waitin' for someone sensible tae talk tae." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been away {away}, by my count, an' I've done a great many laps o' this Hall missin' a sensible voice. Walk wi' me an' tell me where ye've been." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a fair bit since last we walked together, an' it's in yer step as much as yer shoulders. The Light's been wi' ye on the road, I think." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word's reached the Hall that ye've given somebody in the city cause fer anger. Walk wi' me a while, an' then go an' set it right." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear somebody in the city's been speakin' well o' ye, an' that does an old priest's heart good. Kindness travels faster than ye'd think in these halls." },
  },

  notice = {
    { id = "n_human_priest", cat = "light", when = { class = "PRIEST", race = "Human" },
      text = "A priest o' the Cathedral, up the mountain. High Priestess Laurena in Stormwind trains her people well, an' I can always tell, for they stand as if someone's about tae ask them a hard question." },
    { id = "n_dwarf_priest", cat = "light", when = { class = "PRIEST", race = "Dwarf" },
      text = "One o' ours! I remember when the Hall had six priests an' acres o' empty floor, so I'm right pleased tae see ye." },
    { id = "n_gnome_priest", cat = "race", when = { class = "PRIEST", race = "Gnome" },
      text = "A gnome in vestments! Gnomeregan never kept priests, an' for years we were the only Light yer people had, so I'll admit I'm a wee bit proud o' ye." },
    { id = "n_shadow", cat = "light", when = { form = "shadow" },
      text = "Shadow, in my Hall? I'll no' throw ye out, for I know what that discipline's for, but walk softly here; the young ones frighten easily." },
  },

  start = "hello",
  nodes = {
    opn_light = {
      lines = {
        { id = "opn_light_q", text = "Now there's a question that's emptied a few tankards in this Hall. Some o' my priests say it shines on everyone whether they like it or no', an' some say ye have tae reach for it first. Which way d'ye lean, yerself?" },
      },
      choices = {
        { text = "It shines on everyone. That's what makes it the Light.", next = "opn_light_r_faith", fx = { affinity = 1, align = { light = 1 }, opinion = { the_light = "faith" } } },
        { text = "It's a power like any other, Father. Use it well.", next = "opn_light_r_tool", fx = { align = { light = -1 }, trait = { practical = 1 }, opinion = { the_light = "tool" } } },
        { text = "I've seen too many prayers go unanswered to say.", next = "opn_light_r_doubt", fx = { trait = { skeptical = 1 }, opinion = { the_light = "doubt" } } },
        { text = "It answers those who keep their oaths. I've felt it.", next = "opn_light_r_devotion", when = { class = { "PALADIN", "PRIEST" } }, fx = { affinity = 1, trait = { pious = 1 }, opinion = { the_light = "devotion" } } },
        { text = "The stone was here before the Light, Father.", next = "opn_light_r_stranger", when = { class = "SHAMAN" }, fx = { opinion = { the_light = "stranger", the_elements = "first" } } },
        { text = "I'll leave theology to the priests.", next = "BACK" },
      },
    },
    opn_light_r = {
      lines = {
        { id = "opn_light_r_default", text = "Wise of ye. The priests have been arguin' it for a thousand years an' havenae finished yet." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    opn_light_r_faith = {
      lines = {
        { id = "opn_light_r_faith", text = "That's my lean too, though I'll warn ye it makes for a crowded Hall. Come an' help wi' the soup some evenin', an' ye'll see who it shines on." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    opn_light_r_tool = {
      lines = {
        { id = "opn_light_r_tool", text = "A hammer's a power like any other, too, but a hammer doesnae watch what ye do wi' it. Use the Light well, aye, but don't forget it's lookin' back at ye." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    opn_light_r_doubt = {
      lines = {
        { id = "opn_light_r_doubt", text = "So have I, {g:lad|lass}, so have I. Doubt's no' the opposite o' faith; it's only faith wi' its eyes open, an' I'd rather that than the other kind." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    opn_light_r_devotion = {
      lines = {
        { id = "opn_light_r_devotion", text = "Aye, an' keep feelin' it on the days ye've broken one, for those are the days it matters. Brandur Ironhammer, our paladin trainer, would like ye; he says the same thing louder." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    opn_light_r_stranger = {
      lines = {
        { id = "opn_light_r_stranger", text = "So it was, an' I'll no' quarrel wi' the stone. The Light never claimed tae be the oldest thing under the mountain, only the kindest." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    xpt_rohan = {
      big = true,
      lines = { { id = "xpt_rohan_default", text = "The Light does, if ye let it, an' a pint an' a good night's sleep do the rest. I've seen healers pour themselves out for their friends till there was nothin' left, an' the Light never asked that o' them; they asked it o' themselves." } },
      choices = {
        { text = "I'll rest when I must, and trust the Light for the rest.", next = "BACK", reply = "That's the right answer, an' a rare one. Most healers I know have tae fall over twice before they learn it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll lean on my own strength. Faith doesn't turn a blade.", next = "BACK", reply = "It doesnae, aye, but it steadies the hand that holds one, an' I'll pray for ye anyway, whether ye lean on it or no'.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Light favours anyone who stands between the weak an' the dark, an' warriors do that more often than most priests. I've healed a great many warriors in this Hall, an' I've never yet met one who wasnae braver than he looked." } },
      choices = {
        { text = "I stand for others. The Light can count on that.", next = "BACK", reply = "It can, an' I've no doubt it does. Ye've the look o' someone who's already stood in front o' a few folk.", fx = { align = { light = 1 } } },
        { text = "I stand for myself, High Priest. The Light can watch.", next = "BACK", reply = "Then it'll watch, an' it'll wait, for the Light's patient, an' I've seen many a warrior find it in the middle o' a fight.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whether the wolves are lean or fat, for that tells ye how hard the winter's bitin', an' whether the Frostmane are comin' down early. The Light speaks in plain things as often as in great ones, an' a hunter hears more o' the plain ones than any priest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Whether the wolves are lean or fat, for that tells ye how hard the winter's bitin', an' whether the Frostmane are comin' down early. An' yer {pet} is well, I hope; the Light's in the beasts too, ye know, though they've less tae say about it." },
      },
      choices = {
        { text = "I'll pray for an easy winter, High Priest.", next = "BACK", reply = "Bless ye for it. Every dwarf in Dun Morogh says that prayer twice a night, an' the wolves still come down from the hills.", fx = { align = { light = 1 } } },
        { text = "Prayers won't fill a wolf's belly. Hunters will.", next = "BACK", reply = "No, but they'll keep the hunters warm while they fill it, an' I'll keep prayin' for both, if it's all the same tae ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It shines on everyone, though some find it harder tae stand in. I've known rogues who gave more tae the poor than any priest, an' I've known priests who stole more than any rogue, so I judge by deeds an' no' by trade." } },
      choices = {
        { text = "Then judge me by my deeds, High Priest. They'll be good.", next = "BACK", reply = "Gladly. I've a feelin' they'll surprise the priests who look down their noses at yer trade.", fx = { align = { light = 1 } } },
        { text = "The Light can shine where it likes. I prefer the shade.", next = "BACK", reply = "The shade's a fine place tae rest, but ye'll find the Light's waitin' at the edge o' it, an' it's never in a hurry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That the arcane is no enemy o' the Light, only a different road, an' a dangerous one if ye walk it carelessly. They came tae us wi' nothin' after Gnomeregan, an' they've given us more than they took." } },
      choices = {
        { text = "The Light and the arcane can work together. I believe that.", next = "BACK", reply = "So do I! The gnomes have taught me more about it than any book, though they did set my sleeve alight doin' it.", fx = { align = { light = 1 } } },
        { text = "The arcane needs no blessing from the Light, High Priest.", next = "BACK", reply = "Maybe it doesnae, an' I'll no' insist, but it'll give it anyway, for the Light's never been one for askin' permission.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Different roads, I'd say, though they lead toward the same hearth. The Light asks us tae heal the wounded, an' yer Elune asks ye tae heal the land, an' I can't see much quarrel in that." } },
      choices = {
        { text = "All healing serves the same good.", next = "BACK", reply = "Aye, an' that's the whole o' my theology in one breath. I'll leave the arguin' tae the younger priests; they've more wind for it.", fx = { align = { light = 1 } } },
        { text = "Nature heals itself. It doesn't need faith.", next = "BACK", reply = "I'd never argue wi' a druid about the land. But faith's what keeps the healer goin' when the land's slow about it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_crusade_gossip", tags = { "news" }, when = { gossip = { topic = "scarlet_crusade", stance = "admire" } },
          text = "Brandur tells me ye spoke well o' the Scarlet Crusade in his hall. I'll say only this: zeal's a fine fire, but ye want tae know what it's burnin'." },
        { id = "h_pt_rohan", tags = { "news" }, when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true, size = { min = 2 } }, class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } },
          text = "Ye're the only one in yer company who mends, aren't ye? I can tell by how ye stand, a wee bit behind an' watchin' everyone, an' I'll tell ye what I tell my acolytes: watch yerself too, because nobody else will." },
        { id = "h_default", key = true,
          text = "Rohan, High Priest o' the Hall o' Mysteries. I walk this floor from mornin' tae night, because the young priests ask better questions when they have tae keep up, an' this old censer swings better on the move." },
        { id = "h_fear", tags = { "news" }, when = { questActive = TODO_QUEST("A Lack of Fear") },
          text = "Ye came quickly, an' that's a good sign. There's a ward against fear that belongs tae dwarves who serve the Light, an' I've been waitin' tae teach it tae ye." },
        { id = "h_fear_done", when = { questDone = TODO_QUEST("A Lack of Fear") },
          text = "How's the ward holdin'? Fear's a clever enemy, for it never comes the same way twice, so keep the prayer fresh." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "Still here? High Priestess Laurena's waitin' for ye in Stormwind's Cathedral, an' she's no' a woman ye keep waitin'. Go on, wi' my blessin' an' my regards." },
        { id = "h_aid", tags = { "news" }, when = { questActive = TODO_QUEST("Cenarion Aid") },
          text = "Azshara's a long way tae carry a prayer, but the Cenarion Circle asked, an' we answer when people ask. Ogtinc's on the cliffs above the old elven ruins." },
        { id = "h_human_priest", when = { class = "PRIEST", race = "Human" },
          text = "A human priest in a dwarven hall! The Light came up this mountain wi' yer people, so ye're as much at home here as I am. More, maybe, for ye didnae have tae learn the hymns in a second language." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 50 },
          text = "A paladin wi' that look about ye usually wants my censer. Lord Shadowbreaker in Stormwind must be sendin' them up the tram again." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There ye are! I was hopin' ye'd come by, for I've a question that's been botherin' me all week an' the young ones are tired o' hearin' it." },
        { id = "h_acolyte", when = { origin = "dwarf_mystic_acolyte" },
          text = "Well, if it isnae my old broom-pusher! I'd know that walk anywhere, all corners an' no grace, an' I'll wager ye still pray the same way. Fall in beside me an' tell me what the road's taught ye." },
        { id = "h_firstaltar", when = { origin = "gnome_first_altar" },
          text = "There's my first gnome! I still remember ye at the altar rail askin' the acolytes what we prayed to, an' askin' again when ye didnae like the answer. Walk wi' me, for ye've earned a lap." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in the Mystic Ward! The Light an' the wild aren't the same thing, but I've always thought they're both a kind o' care for the world." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Hall o' Mysteries. The Light shines on ye too, I'll have ye know, whatever corners ye prefer tae stand in." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the Hall! The gnomes in the Mystic Ward have taught my priests more about the arcane than I ever wanted tae know, but I'll admit it's been useful." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Walk with me, then; the Light favours a steady arm as much as a steady prayer." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Walk with me; I want tae hear what the high snows look like this season, for I havenae been out o' this Hall in weeks." },
      },
      again = {
        { id = "h_again", text = "Another lap, then? Ask what ye like as we go." },
        { id = "h_again2", text = "Go on. I'm listenin', even when I'm lookin' at the ceiling." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "What else, my friend? There's nae such thing as a daft question in this Hall, only daft answers." },
      },
      choices = {
        { text = "Is the Light really so different from nature?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You never seem to stand still, High Priest.", next = "pacing" },
        { text = "How did the Light come to Ironforge?", next = "came" },
        { text = "What's that old censer for, High Priest?", next = "censer" },
        { text = "There must be plenty of work for a priest here.", next = "work" },
        { text = "Teach me something, High Priest.", next = "lesson", when = { class = "PRIEST" } },
        { text = "Does the Light listen to gnomes?", next = "gnome", when = { race = "Gnome" } },
        { text = "What troubles you, High Priest?", tag = "Persuade", next = "worry",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = { kind = 3 } } } } },
          fail = { next = "worry_no", fx = { affinity = -1 } } },
        { text = "I'm a paladin, High Priest. Teach me what the priests know.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I listen to the earth, High Priest, not the Light.", next = "shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Will you turn me away for the fel, High Priest?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Does the Light shine on rogues too, High Priest?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What have the gnome mages taught your priests?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Light favour warriors, High Priest?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would you like to know about the high snows?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who mends the mender, High Priest?", next = "xpt_rohan", when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" }, ["not"] = true, size = { min = 2 } }, class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
        { text = "Do I still pray like I'm sweeping, High Priest?", next = "xorig_sweep", when = { origin = "dwarf_mystic_acolyte" } },
        { text = "Did you know I'd start praying, when I first came to ask?", next = "xorig_altar", when = { origin = "gnome_first_altar" } },
        { text = "Light keep you, High Priest.", next = "END" },
      },
    },
    xorig_sweep = {
      lines = {
        { id = "xsw_default", text = "Every word o' it, an' I'll no' pretend otherwise! Ye go intae a prayer like ye're chasin' dust intae the corners, an' there's nae grace in it, but I'll tell ye a secret: the Light's never once complained about a clean floor." },
      },
      choices = {
        { text = "Then I'll keep sweeping. It's honest work.", next = "xorig_sweep2", fx = { trait = { stern = 1 }, affinity = 1 } },
        { text = "I've been trying to learn some grace, out on the road.", next = "xorig_sweep2", fx = { trait = { pious = 1 } } },
        { text = "You never told me that when I was sweeping.", next = "xorig_sweep2", fx = { trait = { witty = 1 } } },
      },
    },
    xorig_sweep2 = {
      lines = {
        { id = "xsw2_default", text = "O' course I didnae, for ye'd have stopped sweepin'. The acolytes who come up through the broom make the steadiest priests in the Hall, because they learned early that most o' the Light's work is done on yer knees an' nobody watchin'." },
      },
      choices = {
        { text = "Thank you, High Priest.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_altar = {
      lines = {
        { id = "xal_default", text = "Know it? I'd have wagered against it, an' lost my beard. Ye came in wi' a notebook an' a list o' questions as long as the tram, an' I thought ye wanted tae take the Light apart an' see how it worked, the way yer people do wi' everythin'." },
      },
      choices = {
        { text = "I did, at first. Then it stopped feeling like a machine.", next = "xorig_altar2", fx = { trait = { pious = 1 } } },
        { text = "I still have the notebook. I'm still asking.", next = "xorig_altar2", fx = { trait = { curious = 1 } } },
      },
    },
    xorig_altar2 = {
      lines = {
        { id = "xal2_default", text = "Good, keep askin', for a priest who stops askin' starts preachin', an' I've enough o' those. There's more o' yer people at the rail every season now, an' half o' them say a gnome told them it was worth a look, so I've a fair idea who that was." },
      },
      choices = {
        { text = "The dwarves gave us a home. I wanted to understand why.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },

    pacing = {
      lines = {
        { id = "pa_default", text = "Partly habit, an' partly the knees, which complain less when they're movin'. Mostly it's that the folk who need me are spread all over the Hall, an' a priest who stands still only meets the bold ones." },
      },
      choices = {
        { text = "Who are the ones who don't come forward?", next = "pacing_shy" },
        { text = "A priest should wait to be asked.", next = "BACK", reply = "Some say so, an' the Cathedral teaches it, but my knees tell me otherwise, an' so do the folk who need me an' dinnae ask.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "A priest should go where the need is.", next = "BACK", reply = "That's my thinkin' too. The younger priests say I'll wear a groove in the floor o' this ward, an' they're likely right.", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
      },
    },
    pacing_shy = {
      lines = {
        { id = "ps_default", text = "Gnomes, mostly, sittin' at the back wi' their hands in their laps. They came here wi' nothin' after Gnomeregan, an' some o' them still think they're borrowin' the Light an' will have tae give it back." },
      },
      choices = {
        { text = "What do you tell them?", next = "pacing_tell" },
        { text = "That's a sad thing to hear.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pacing_tell = {
      lines = {
        { id = "pt_default", text = "That the Light keeps nae ledger, an' I'm a dwarf, so I'd know a ledger if I saw one. Then I sit wi' them a while, which does more good than anythin' I say." },
      },
      choices = {
        { text = "Sitting with someone is a prayer too.", next = "BACK", reply = "Aye, the best kind. The Light's no' in the words, {g:lad|lass}, it's in the stayin', an' anyone can stay.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Comfort's fine, but they need work and food more.", next = "BACK", reply = "Aye, they do, an' I'll see they get both, but a soul that's starvin' for comfort cannae eat bread properly either.", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "I'll keep an eye on the back rows.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    came = {
      lines = {
        { id = "ca_default", text = "From the humans, after the Second War. The Silver Hand took a few dwarves in, an' the Church's teachin' came home wi' them, so now Ironforge trains its own priests an' paladins under this roof." },
        { id = "ca_dwarf", when = { race = "Dwarf" },
          text = "Ye'd think it was always here, the way the young ones talk, but yer grandfather would ha' looked at this Hall an' asked where the forge was. The Light came up from the humans, after the Second War, an' it took root." },
      },
      choices = {
        { text = "Does the Light answer everyone, or only the faithful?", next = "opn_light" },
        { text = "I'd guess dwarves pray differently from humans.", next = "came_diff" },
        { text = "Who sends the young priests on, after you?", next = "came_send" },
        { text = "The mountain was fine before the Light came.", next = "BACK", reply = "Maybe it was. The mountain's old an' wise, but I'd like tae think it's glad o' the company all the same.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "It's good that it found its way here.", next = "BACK", reply = "I thank the Light for it every mornin'. The mountain was a colder place before the Silver Hand came home.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    came_diff = {
      lines = {
        { id = "cd_default", text = "Louder, an' shorter, an' wi' more hammerin' in the metaphors. The Cathedral prays like a choir an' we pray like a forge crew, but I've never heard the Light complain about either." },
      },
      choices = {
        { text = "The words matter less than the heart.", next = "BACK", reply = "They do! Just dinnae tell the Cathedral's choir, for they've never forgiven us our hammerin' metaphors.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The rites should be the same everywhere.", next = "BACK", reply = "Maybe they should, but a dwarf prays like a dwarf, an' I've never heard the Light complain that it couldnae understand us.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Ha. I'd like to hear a forge-crew hymn.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    came_send = {
      lines = {
        { id = "cs_default", text = "Humans I send down tae the Cathedral, tae Laurena, who's High Priestess there, an' night elves tae Priestess Alathea in their Temple o' the Moon. The dwarves I keep, for there are lessons that belong tae dwarves." },
        { id = "cs_ne", when = { race = "NightElf" },
          text = "Alathea sends word for her people now an' then, an' Braenna Flintcrag, one o' our trainers, catches most o' the messages, for she's quicker on the stairs than I am. Ye'll hear from Darnassus when ye're ready, never fear." },
      },
      choices = {
        { text = "Lessons that belong to dwarves?", next = "came_ward" },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    came_ward = {
      lines = {
        { id = "cw_default", text = "A ward against fear. A dwarf's no' braver than anyone else, whatever we say in the tavern, but we've learned tae hold a fear in our hands an' look at it, an' the Light honors that." },
      },
      choices = {
        { text = "Fear has its uses; I'd not ward it all away.", next = "BACK", reply = "Fair. The ward doesnae take the fear away anyhow; it only steadies the hand that holds it.", fx = { align = { light = -1 }, trait = { cautious = 1 } } },
        { text = "Then I'd ask the Light for that steadiness.", next = "BACK", reply = "Then ask, an' the Light will answer, for it's always glad tae steady a hand that knows it's shakin'.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    censer = {
      lines = {
        { id = "ce_default", text = "Aye, an old thing, an' I've swung it over more than one poor soul that had somethin' unwelcome livin' in them. Lord Shadowbreaker's paladins come up from Stormwind for it now, an' I give it tae them for a donation." },
      },
      choices = {
        { text = "Selling a holy relic seems a strange thing for a priest.", next = "censer_sell" },
        { text = "What were the exorcisms like?", next = "censer_rite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    censer_sell = {
      lines = {
        { id = "cl_default", text = "I trade it for bread, an' I'll say so tae anyone who asks. The Hall's donations go tae the city's food stores, an' those stores feed folk who'll never set foot in a temple." },
      },
      choices = {
        { text = "Bread for the hungry is a holier use than any rite.", next = "BACK", reply = "Aye, it is, an' I'll say so tae any priest who frowns at me, for the Light never once asked me tae let a bairn go hungry.", fx = { align = { light = 1, order = -1 }, affinity = 2, trait = { generous = 1 } } },
        { text = "Holy things shouldn't carry a price.", next = "BACK", reply = "I'll grant ye the principle. But I'd rather sell a candle an' feed a bairn than keep the candle an' bury him.", fx = { align = { order = 1 }, affinity = -1, trait = { stern = 1 } } },
        { text = "The stores seem low for a temple this size.", next = "censer_stores" },
      },
    },
    censer_stores = {
      lines = {
        { id = "cst_default", text = "Gnomeregan's folk came wi' nothin', the Reserve's gone off tae the Alliance front, an' the farms in Dun Morogh have troggs in the barley. A mountain makes iron easily, but it doesnae grow much bread." },
      },
      choices = {
        { text = "I'll remember the stores when I've coin to spare.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan", "troggs" } } },
      },
    },
    censer_rite = {
      lines = {
        { id = "cr_default", text = "Long, an' loud, an' cold, an' I'll no' tell ye the names o' the folk involved, for they've lives tae get on wi'. I'll say this much: the hardest part was never the spirit, it was the family watchin'." },
      },
      choices = {
        { text = "Some things should stay between a priest and the Light.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "There's always work. The sick in the Hall, the gnomes still coughin' from the city, an' the young ones on the roads wi' nae healer behind them. Pick one an' ye'll never be idle." },
        { id = "wo_high", when = { minLevel = 55 },
          text = "For one o' yer experience? The Cenarion Circle's asked for help in Azshara, an' it's the way o' the Light tae help when asked, whoever's doin' the askin'. Why they need it matters more than how." },
      },
      choices = {
        { text = "Tell me about the sick gnomes.", next = "work_gnomes" },
        { text = "Why help druids in Azshara?", next = "work_druids", when = { minLevel = 50 } },
        { text = "My blade does more good than my prayers.", next = "BACK", reply = "Maybe it does. In my experience, though, a blade an' a prayer together beat either one alone, an' I've buried enough folk tae know.", fx = { align = { light = -1 } } },
        { text = "I'll take whatever work the Light sets before me.", next = "BACK", reply = "Then ye'll never be idle, for the Light's never once run short o' work in this city.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    work_gnomes = {
      lines = {
        { id = "wg_default", text = "Whatever poisoned Gnomeregan sits in the body like coal-damp in a mine. We can ease it, an' sometimes we can chase it out, but the High Tinker takes his readings an' I say my prayers, an' neither of us has a cure yet." },
      },
      choices = {
        { text = "Then prayer and study must work together.", next = "BACK", reply = "They do. The High Tinker an' I meet every week, an' we've cured nobody yet, but we're closer than we were.", fx = { align = { light = 1 }, affinity = 1, learn = { "gnomeregan" } } },
        { text = "Then trust the readings, not the prayers.", next = "BACK", reply = "The readings are fine, an' I'll trust them, but I'll keep prayin' too, for a gnome in pain needs more than a number.", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_druids = {
      lines = {
        { id = "wd_default", text = "Because they asked, an' because the Light doesnae check whose banner ye stand under before it answers. Seek out Ogtinc on the cliffs, if ye're bound that way; he'll have more for ye than I can say from here." },
      },
      choices = {
        { text = "The druids can look after their own.", next = "BACK", reply = "Maybe they can, but they asked, an' the Light doesnae turn away a friend, so I'll keep sendin' help as long as they need it.", fx = { align = { order = 1 } } },
        { text = "Help given freely is the best kind.", next = "BACK", reply = "It is. Give Ogtinc my best if ye pass that way, an' mind the cliffs on the road up.", fx = { align = { order = -1 }, affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      big = true,
      lines = {
        { id = "le_default", text = "Here's one they don't put in the books: the Light will give ye the strength tae heal a man an' the strength tae smite him, an' it'll never tell ye which one ye should ha' used. That part's yer job." },
      },
      choices = {
        { text = "Then I'll always choose mercy first.", next = "lesson_mercy", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Some people have earned the smiting.", next = "lesson_judge", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "How do you choose, High Priest?", next = "lesson_how" },
      },
    },
    lesson_mercy = {
      lines = {
        { id = "lm_default", text = "Good, an' keep that, but keep yer eyes open too, for mercy that never looks up gets its throat cut. Most o' the time, though, ye'll find mercy's the brave choice an' no' the soft one." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    lesson_judge = {
      lines = {
        { id = "lj_default", text = "Some have, aye, an' ye'll meet them out there; I'll no' pretend otherwise. Only make sure it's them ye're angry at, an' no' the long road or the cold or yer own fear." },
      },
      choices = {
        { text = "That's fair counsel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_how = {
      lines = {
        { id = "lh_default", text = "Badly, sometimes, an' I pray about the times I chose badly. I ask myself who'll be standin' there when it's over, an' whether I'll be able tae look at them." },
      },
      choices = {
        { text = "That's a heavy way to live.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      big = true,
      lines = {
        { id = "gn_default", text = "It listens tae everyone, but I'll grant ye it's had less practice wi' gnomes, for yer people trusted wrenches before they trusted prayers. Ye'll find it's a quick learner." },
      },
      choices = {
        { text = "I've always felt it, even in Gnomeregan.", next = "BACK", reply = "Even down there? Then ye've likely taught it a thing or two, for the Light could use a few gnomish ideas.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I trust wrenches more than prayers.", next = "BACK", reply = "Fair enough, an' I'll no' argue wi' a gnome about wrenches, but the Light's here when the wrench slips, an' it always does.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worry = {
      big = true,
      lines = {
        { id = "wr_default", text = "The bread. The stores are thinner than the Senate tells the city, an' I've been sellin' the Hall's old treasures one by one tae fill them. The censer was the last thing I'd a mind tae part with." },
        { id = "wr_after", text = "I've no' told the young priests, an' I'd thank ye no' tae either, for they'd only start fastin' out o' sympathy. Fasting's a fine discipline, but it's a poor way tae help anyone." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "The Senate should be told plainly.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    worry_no = {
      lines = {
        { id = "wn_default", text = "Me? My knees, an' the price o' lamp oil, an' a great many young priests who've never once put the hymnals back where they found them. Nothin' that need trouble ye." },
      },
      choices = {
        { text = "Of course, High Priest.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin = {
      lines = {
        { id = "xpa_default", text = "That ye cannae strike a man and heal him in the same breath an' mean both, so pick which one he needs before ye swing. Brandur teaches ye the hammer, an' I'd like ye tae leave this Hall knowin' when tae put it down." },
        { id = "xpa_dwarf", when = { race = "Dwarf" },
          text = "That a dwarf's temper an' a paladin's zeal make a fine fire an' a poor judge. Plenty o' paladins in this Hall have the broken noses tae prove it, an' I'd spare ye yours if I can." },
      },
      choices = {
        { text = "Judgment is part of the oath, High Priest.", next = "BACK", reply = "It is. But judgement wi'out mercy is just a hammer, an' Brandur's got plenty o' those already.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Mercy comes first. The hammer waits.", next = "BACK", reply = "That's the heart o' it. Tell that tae Brandur sometime, would ye? He might listen tae a paladin sooner than an old priest.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "When should the hammer stay down?", next = "paladin_when" },
      },
    },
    paladin_when = {
      lines = {
        { id = "pw_default", text = "When yer enemy's on his knees an' yer anger's still on its feet. If ye notice that ye want tae swing more than ye need tae, ye've yer answer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "An' ye came into the Hall o' Mysteries tae say so, which is either very brave or very rude, an' I'll take it as brave. Half my priests are fumin' about the dwarves takin' up the old ways, but I'd sooner ye listened tae somethin' than nothin'." },
        { id = "sh_acolyte", when = { origin = "dwarf_mystic_acolyte" },
          text = "Ye served in this very Hall as a young one, I remember the face, an' now ye've gone an' found a different voice. I'm no' angry, {g:lad|lass}, only curious what it said that we didnae." },
      },
      choices = {
        { text = "The Light came from outside. The earth was always ours.", next = "BACK", reply = "Aye, it was. But the Light's made itself at home here, an' I'd like tae think the earth doesnae mind sharin'.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "There's room in the mountain for both.", next = "BACK", reply = "There is. Say it louder, if ye would, for half my priests need tae hear it more than I do.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Why are your priests so angry?", next = "shaman_angry" },
      },
    },
    shaman_angry = {
      lines = {
        { id = "sa_default", text = "Because the humans brought us the Light only a generation ago, an' it took a fair bit o' convincin' tae make dwarves believe in somethin' they couldnae hit wi' a hammer. Now some feel the mountain's callin' its own back, an' they're afraid." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "I've never turned anyone away from this floor, an' I'll no' start wi' ye. But I'll say what I'd say tae my own: the thing ye bargain wi' keeps better books than ye do, an' one day it'll show ye the ledger." },
        { id = "wl_gnome", when = { race = "Gnome" },
          text = "Turn ye away? I've tended gnomes since the day they came up the tunnels coughin', an' ye're no different for what ye carry. But the thing ye bargain wi' keeps better books than ye do." },
      },
      choices = {
        { text = "I keep my own ledger, High Priest.", next = "BACK", reply = "I'm sure ye do, an' I hope it balances, but the other ledger's longer than yours, an' it's never once lost a page.", fx = { align = { light = -1 } } },
        { text = "Pray for me, then. I'll need it.", next = "BACK", reply = "I will, an' gladly, every night, an' if ye ever want tae come an' sit a while, my floor's still open tae ye.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Ach, ye'll make an old priest blush, an' at my age that's a fair piece o' work. Thank ye kindly, for it's good tae hear the Hall's doin' somethin' right." },
        { id = "s2", text = "That's a generous thing tae say, an' I'll carry it round the Hall wi' me for a lap or two. The Light's fond o' a kind tongue, an' so am I." },
      },
      fail = {
        { id = "f1", text = "That's kindly meant, I'm sure, but I've heard a great many confessions, an' I know when someone's sweetenin' the pot. Tell me what's truly on yer mind." },
        { id = "f2", text = "Save the praise for the Light, friend, for it's done the work an' I've only done the walkin'. I'd sooner have an honest word from ye than a handsome one." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Aye, I do go round an' round like a mill pony, an' ye're no' the first tae notice. It's good tae be laughed at now an' then, for it keeps a priest from thinkin' himself holy." },
        { id = "s2", text = "Oh, ye're a sharp one, an' I like ye the better for it. The acolytes are far too polite tae tease me, so I've been starved o' it." },
      },
      fail = {
        { id = "f1", text = "Now, that was unkind, an' I think ye knew it before it left yer mouth. I'll forgive it, because that's my trade, but I'll no' pretend it was clever." },
        { id = "f2", text = "Mock me all ye please, but ye'll keep a civil tongue about the Light in its own Hall. There's folk prayin' ten paces off who came here wi' heavier hearts than yers." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He stops walking for the first time and folds his hands.", text = "There's nae need for that, friend, nae need at all. Ye've a hard road behind ye tae talk so, an' I'll no' stand in yer way over a small thing." },
        { id = "s2", text = "Ye've given me a turn, I'll confess it, for I'm a healer an' no' a fighter. Say what ye want o' me, an' say it gentler if ye can." },
      },
      fail = {
        { id = "f1", text = "I've sat wi' dyin' soldiers through three wars, {g:lad|lass}, so I'm no' easily frightened by the livin'. Whatever's put that anger in ye, it'd do ye more good tae talk about it than tae wave it at me." },
        { id = "f2", text = "Would ye truly threaten a priest in the Hall o' Mysteries? I'll pray for ye, an' I'll thank ye tae lower yer voice while I do." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's a thing I'd only talk over wi' someone I know well, an' we've no' walked enough laps together yet. Give it time, an' I'll tell ye gladly." },
      { id = "gt2", text = "I'll keep that one tae myself for now, if ye'll forgive me. Some matters are for friends, an' we're still gettin' acquainted." },
    },
    knows = {
      { id = "tp_knows", text = "A priest hears all sorts on his laps o' the Hall, an' keeps most of it. Here's what I can share wi' a clear conscience." },
    },
    background = { { id = "tp_bg", text = "I've served in this Hall since it had more empty floor than priests, an' now I'm High Priest, which mostly means I'm the one who gets asked." } },
    advice = { { id = "tp_ad", text = "Heal the one in front o' ye first, an' worry about the rest o' the world afterwards. The world'll still be there.", next = "work" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We were the only Light the gnomes had, for a while, an' some o' them still sit at the back o' the Hall as if they're intrudin'. They're no'.", next = "pacing_shy" } },
    cenarion_circle = { { id = "tp_cenarion", text = "Druids, an' no' my faith, but they've asked for the Light's help in Azshara, an' we answer when asked.", next = "work_druids" } },
    silver_hand = { { id = "tp_silver_hand", text = "It brought the Light up this mountain. Tiza an' Brandur carry its oaths in this Hall now, an' they carry them well." } },
    tome_of_divinity = { { id = "tp_tome", text = "That's Tiza's charge, no' mine. I only patch up the paladins she sends out, an' patch up her husband when they bring him back." } },
    holy_light = { { id = "tp_holy_light", text = "The Light asks a dwarf tae do what dwarves already do: stand fast, keep faith wi' yer neighbours, an' work hard at somethin' worth doin'. The rest is just learnin' the words fer it." }, { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "Ye know it already, I'd wager, as a warmth that comes when ye've nothin' left tae give an' give anyway. Keep that, an' ye'll never need my sermons." } },
    scourge = { { id = "tp_scourge", text = "The dead are an offence tae the Light, an' the Argent Dawn is right tae march against them. I send priests north every season, an' fewer come back each time." } },
    forsaken = { { id = "tp_forsaken", text = "They say the Forsaken have their own minds now an' hate the Lich King as much as we do. I'd still no' turn my back on one, an' I'd still pray fer what they were." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "The Crusade was born o' grief an' good intentions, an' it's gone sour as old milk. They've burned priests o' the Light fer bein' too gentle wi' the sick." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn fights the dead wi' faith an' good sense in equal measure, an' they take anyone who'll stand. That's the Light as I understand it." } },
    elune = { { id = "tp_elune", text = "The night elves pray tae their moon goddess wi' as much faith as any priest o' the Light. I've talked wi' their priestesses, an' I'll no' say they're wrong." } },
    _none = { { id = "tp_none", text = "That's beyond the Hall's walls an' my knowledge, I'm afraid. Ask in the Commons; somebody there always thinks they know." } },
  },
}

-- Theodrus Frostbeard: priest trainer; his one canon line is a warning not to turn from the Light.
P:NPC {
  key = "theodrus", id = TODO_NPC("Theodrus Frostbeard"), name = "Theodrus Frostbeard", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "pious", "dutiful" },
  spiritSensitive = true,
  notices = { "class", "lock_shadow" },

  impression = {
    first = "His warnings are kindly meant, though the scowl hides it.",
    third = "{name} met Theodrus Frostbeard, a stern priest trainer in Ironforge's Hall of Mysteries.",
  },

  greetings = {
    { id = "g_warn", text = "Don't turn yer back on the Light; it may be the one thing that saves ye some day." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more learnin'? Good, for ye cannae have too much o' it." },
  },

  notice = {
    { id = "n_human_priest", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "Cathedral-trained, are ye? Then ye'll have heard all the soft words already, an' I'll give ye the hard ones." },
    { id = "n_dwarf_priest", cat = "class", when = { class = "PRIEST", race = "Dwarf" },
      text = "A dwarf o' the Light, an' standin' straight, too. Good, for there's nae sense in prayin' hunched." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A fighter wi' nae prayer in ye at all, by the look. Ye'll want one some day, when the healer's out o' reach, so learn a short one now." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The candles on the altar bent away from ye when ye walked in, all at once, like grass in a wind. I'll no' bless ye, for the Light flinches from what's on ye, but my door's open if ye ever want tae talk about that road back." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd like tae think so, though I've heard it argued both ways in this very Hall. The Light's no' a jealous thing, whatever some priests say, an' a dwarf who listens tae the stone might hear the Light in it as well. But if ye ever have tae choose, I'll pray ye choose the one that'll save ye." } },
      choices = {
        { text = "The Light and the earth can share one dwarf, Theodrus.", next = "BACK", reply = "Aye, they can. There's room in a dwarf's heart for more than one kind o' listenin', whatever the younger priests say.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The earth was here first. The Light's a guest in it.", next = "BACK", reply = "Maybe it was. But a guest that's stayed this long has earned its chair by the fire, I'd say.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I couldnae tell ye, an' I'd be lyin' if I said I could. But a dwarf an' an elf can both kneel in the dark an' be heard, an' that's enough theology for one mornin'." } },
      choices = {
        { text = "Each people should keep its own faith and its own temples.", next = "BACK", reply = "That's sense. A dwarf in an elf's temple would only knock his head on the moonbeams.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "There's one truth beneath every faith, whatever we call it.", next = "BACK", reply = "Aye, maybe there is, an' I'd like tae think so, for it makes the world a smaller an' friendlier place.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In the moment the line's about tae break an' somehow doesnae, for that's the Light, whether ye call it that or no'. I've seen warriors hold against the Dark Irons wi' nothin' left but that, an' I'll no' hear anyone call it luck." } },
      choices = {
        { text = "Then I'll call it the Light, and be grateful.", next = "BACK", reply = "Good. Ye'd be surprised how many folk come in here callin' it somethin' else entirely.", fx = { align = { light = 1 } } },
        { text = "I call it stubbornness, and I'll keep calling it that.", next = "BACK", reply = "Call it what ye like, the Light's no' fussy, an' I'll still give it the credit when I'm prayin' over ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than a fire, some nights, for the cold gets intae the soul as well as the bones. I've known hunters lost in the snows above Kharanos who came home because they remembered tae pray, an' I've known others who didnae." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than a fire, some nights, for the cold gets intae the soul as well as the bones. Keep yer {pet} close on cold nights, an' all, for there's warmth in a beast that the Light put there on purpose." },
      },
      choices = {
        { text = "I'll remember to pray, Theodrus.", next = "BACK", reply = "Bless ye. The snow's a lonely place wi'out somethin' tae hold on tae, an' ye'll be glad o' it some night out past Kharanos.", fx = { align = { light = 1 } } },
        { text = "A good fire and a warm beast will do me.", next = "BACK", reply = "They will, most nights, but there's a night in every winter when they willnae, an' I'd rather ye had a prayer ready for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "By makin' ye think ye need nothin' but yerself, an' that's the first step down a bad road. I've seen it happen, an' the ones it happened to never noticed till they were too far along tae turn back." } },
      choices = {
        { text = "I'll keep my feet on the right road, Theodrus.", next = "BACK", reply = "I'll be watchin', mind. The road's long an' the turnin's hard tae see, even for a mage wi' sharp eyes.", fx = { align = { light = 1 } } },
        { text = "Needing nothing but myself sounds like freedom, Theodrus.", next = "BACK", reply = "That's what it feels like at first. I've seen where that freedom ends, though, an' it's a very cold place.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "There's always a road back, but it's narrow an' steep, an' few warlocks ever look for it. If ye ever want tae try, come tae me, an' I'll walk it wi' ye as far as ye'll let me." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "There's always a road back, but it's narrow an' steep, an' I doubt yer demon would let ye take the first step wi'out draggin' at yer heel. If ye ever want tae try, come tae me, an' I'll walk it wi' ye as far as ye'll let me, though that thing'll have tae stay behind at the start." },
      },
      choices = {
        { text = "Perhaps someday. I'll remember the offer, Theodrus.", next = "BACK", reply = "I'll hold ye tae it, an' I'll be waitin', for I've walked that road wi' a few before, an' some o' them made it home.", fx = { align = { light = 1 } } },
        { text = "I've no need of a road back. I like where I am.", next = "BACK", reply = "Then I'll no' push ye, but the offer stands, for I've seen warlocks change their minds at the very end o' things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Pride, every time, for a paladin who wins enough fights starts thinkin' the Light's his own, an' that's the first step away from it. I've seen it happen in Lordaeron, an' I'll no' name names, but ye'll know them if ye read the histories." } },
      choices = {
        { text = "Then I'll stay humble. The Light is never mine to own.", next = "BACK", reply = "Ye've learned it quicker than most, then. I watched the best paladins in Lordaeron forget it.", fx = { align = { light = 1 } } },
        { text = "A paladin's victories are earned. Some pride is deserved.", next = "BACK", reply = "Earned, aye, but no' owned, an' that's the difference, so mind ye dinnae let the pride grow bigger than the victory.", fx = { align = { light = -1 } } },
        { text = "Something else, Theodrus.", next = "BACK" },
      },
    },
    dd_td_deaths = {
      lines = {
        { id = "dd_td_deaths1", text = "That's the question every priest asks, an' no two give the same answer. Mine is that the Light doesnae waste anythin', an' a soul that's still got work in it gets sent back tae do it, so if ye keep comin' back, ye've work left." },
      },
      choices = {
        { text = "Then I'll find that work and do it well.", next = "BACK", reply = "Good. An' when ye find it, come an' tell me, for I'm curious what the Light wanted.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Or I'm just too stubborn to stay dead.", next = "BACK", reply = "Stubbornness is a dwarf's gift, an' maybe the Light borrows it now an' then. Off wi' ye.", fx = { align = { light = -1 }, trait = { witty = 1 } } },
        { text = "Something else, Theodrus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Hall. Good; ye'll have heard my warnin' before, but I'll give it again: don't turn yer back on the Light, for it'll no' turn its back on ye." },
        { id = "h_default", text = "Theodrus Frostbeard. I train priests, an' I tell everyone else the same thing: don't turn yer back on the Light, for it may be the one thing that saves ye." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Ye've the look o' someone who's been usin' what I taught ye, which is the only kind o' thanks I want. What'll it be today?" },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Ye came in quiet. Folk who come in quiet usually want somethin' from the Hall, so say what it is an' I'll decide if ye can have it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage come tae a priest? I'll warn ye as I warn everyone: the arcane can lead a soul away from the Light if ye let it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll no' turn ye away, warlock, for the Light turns nobody away, but I'll tell ye plainly ye've already taken the first step down the road I warn folk about." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Don't turn yer back on the Light, for it'll stand beside ye in the shield wall when nothin' else will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Don't turn yer back on the Light out in the snows, for it's colder out there than ye think." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll say tae ye what I say tae everyone: don't turn yer back on the Light, whatever goddess ye pray to." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'll say what I say tae everyone: dinnae turn yer back on the Light, even if ye've found somethin' else tae listen tae." },
        { id = "h_acolyte", when = { origin = "dwarf_mystic_acolyte" },
          text = "I remember ye wi' a broom in yer hands an' yer ears flappin' at every lesson ye werenae meant tae hear. Ye've the vestments now, so I'll expect ye tae have learned the warnin' as well as the prayers." },
        { id = "h_firstaltar", when = { origin = "gnome_first_altar" },
          text = "The gnome who asked me what the Light wanted in return, an' didnae like it when I said nothin'. I'll grant ye've stuck at it longer than I wagered, so don't turn yer back on it now." },
        { id = "dd_deaths", when = { deaths = { min = 10 } },
          text = "Ye've been through the spirit healer's hands more often than most, I'd say. The Light's been patient wi' ye, so maybe it's time ye were a bit more patient wi' yerself." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Speak up; I've students waitin'." },
        { id = "h_again2", text = "Well? The Light's patient, but I'm only a dwarf." },
      },
      choices = {
        { text = "Why does the Light keep bringing me back, Theodrus?", next = "dd_td_deaths", when = { deaths = { min = 10 } } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why warn everyone the same way?", next = "warn" },
        { text = "What should a young priest learn first?", next = "first", when = { class = "PRIEST" } },
        { text = "What's a priest to a fighter like me?", next = "fighter", when = { ["not"] = { class = "PRIEST" } } },
        { text = "How could the arcane lead a soul from the Light?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there any road back for a warlock, Theodrus?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How does the Light stand beside a warrior, Theodrus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The Light must be some comfort out in the high snows.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's a paladin's greatest danger, Theodrus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is Elune's light so different from the Holy Light?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a shaman keep faith with the Light as well, Theodrus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    warn = {
      lines = {
        { id = "wa_default", text = "Because I've seen what's left o' folk who did. Some came back up the tram from Lordaeron wi' nothin' inside them but cold, an' they'd all been told the Light was for other people." },
      },
      choices = {
        { text = "Every soul is better for the Light.", next = "BACK", reply = "It is, an' I'll keep tellin' everyone who passes through this ward until my voice gives out.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Some of us do fine on our own strength.", next = "BACK", reply = "Some do, for a while, but I've seen the cold come for the strong ones first, an' they never see it comin'.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "What did you see in Lordaeron's survivors?", next = "warn_more" },
      },
    },
    warn_more = {
      lines = {
        { id = "wm_default", text = "Despair, mostly, which is a thing ye can catch like a cough. The Light doesnae cure it in a day, but it gives a soul somethin' tae hold while it mends." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Tae keep yer own soul in order before ye go tinkerin' wi' anyone else's. A priest who's run dry is no use tae a party in a cave, an' a danger tae himself besides." },
      },
      choices = {
        { text = "Discipline first, then service.", next = "BACK", reply = "That's it exactly! I'll make a priest o' ye yet, for most o' them learn that one far too late.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather run dry than leave someone hurt.", next = "BACK", reply = "That's a noble thing tae say, an' a foolish one, for a priest who runs dry leaves everyone hurt, himself included.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fighter = {
      lines = {
        { id = "fg_default", text = "The one at the back keepin' ye standin', so be kind tae them an' don't run off where they cannae see ye. Every priest in this Hall has a story about a fighter who did." },
      },
      choices = {
        { text = "Understood. I'll stay where the priest can see me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I'm a trainer, no' a gossip, but I've ears. Here's what I've heard worth repeatin'." } },
    background = { { id = "tp_bg", text = "I teach priests in the Hall, an' that's the whole o' it. My history's my own business, an' it's no' very interestin' besides." } },
    advice = { { id = "tp_ad", text = "Don't turn yer back on the Light. I say it tae everyone, an' I'll say it tae ye twice, for ye asked." } },
    holy_light = { { id = "tp_holy_light", text = "Dinnae turn yer back on the Light, for it won't turn its back on ye, an' that's the whole sermon. I've given it a thousand times an' I'll give it a thousand more." } },
    scourge = { { id = "tp_scourge", text = "The dead walk because men turned their backs on the Light, an' I'll stand by that till I'm grey. Look at Lordaeron, an' tell me I'm wrong." } },
    forsaken = { { id = "tp_forsaken", text = "The dead who think they're free are still dead, an' they'll find that out soon enough. I'll no' pray fer them, an' I'll no' apologise fer it." } },
    _none = { { id = "tp_none", text = "Nae idea, an' I'll no' pretend tae one. Ask the High Priest; he walks about enough tae hear everythin'." } },
  },
}

-- Toldren Deepiron: priest trainer; gentle; his canon line asks what he can do for you.
P:NPC {
  key = "toldren", id = TODO_NPC("Toldren Deepiron"), name = "Toldren Deepiron", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "kind", "patient" },
  spiritSensitive = true,
  notices = { "weary", "lock_taint" },

  impression = {
    first = "He notices tired people before they notice themselves.",
    third = "{name} met Toldren Deepiron, a gentle priest trainer in the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_hope", text = "I hope the Light is wi' ye today, {name}. Is there anythin' I can do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye're lookin' better than last time, or perhaps the lamps are kinder. Either way, welcome back." },
  },

  notice = {
    { id = "n_priest_weary", cat = "weary", when = { class = "PRIEST", resSick = true },
      text = "Ye've been givin' it all away again, haven't ye, an' come back from the edge for it? Sit a moment before ye train; the Light'll wait for a priest tae catch her breath." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "Ye've the grey look o' someone the spirit healer sent back, an' no' long ago. Sit by the brazier a while, an' then we'll talk about whatever ye came for." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "Ye're goin' green, friend, faint round the eyes an' the nails, an' I've seen that color on orcs in the internment camps. It's no' too late, whatever it whispers tae ye, an' I'll pray for ye tonight whether ye ask or no'." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Fear, mostly, dressed up as doctrine. They remember the orcs' shamans became warlocks, an' they think the same rot waits for any dwarf who listens tae the wild. I think the Light judges hearts, no' paths, an' ye've a decent heart, by the look o' ye." } },
      choices = {
        { text = "Then I'll prove my heart to them, one kindness at a time.", next = "BACK", reply = "That's the only way it works. Scowls soften slowly, but they do soften, I promise ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them scowl. I don't need their approval.", next = "BACK", reply = "Maybe ye dinnae, but they're the ones ye'll have tae heal beside, so a wee bit o' patience wouldnae hurt.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same way I'd help anyone, by listenin' first an' fussin' second. Ye kaldorei carry long memories, an' sometimes a long memory needs somewhere tae set itself down." } },
      choices = {
        { text = "Kindness offered should be accepted with grace. I'll sit.", next = "BACK", reply = "Sit as long as ye like. My chair's been empty all mornin', an' so has my teapot.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I keep my burdens to myself, as a druid must.", next = "BACK", reply = "Fair enough, an' I'll no' push, but if ye ever need tae set one down, ye know where my chair is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than they'd admit, for warriors come in sayin' it's only a scratch an' leave wi' twelve stitches. I don't mind, for every one I mend goes back out tae stand in front o' someone else, an' that's worth a bit o' thread." } },
      choices = {
        { text = "I'll go back out and stand in front, as they did.", next = "BACK", reply = "Bless ye. I'll be here when ye come back, an' I'd like ye tae come back walkin' this time.", fx = { align = { light = 1 } } },
        { text = "I'll go back out for my own reasons, Toldren.", next = "BACK", reply = "Fair enough, an' I'll no' ask what they are, but I'll mend ye just the same, whatever's drivin' ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now an' then, wi' claw marks they've tried tae stitch themselves, an' badly, for a hunter will mend his beast before he mends himself. I tell them the Light doesnae mind which comes first, but it would like them both mended." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now an' then, wi' claw marks they've tried tae stitch themselves, an' badly, for a hunter will mend his beast before he mends himself. Yer {pet} looks well cared for, which tells me ye're the sort tae forget yer own wounds." },
      },
      choices = {
        { text = "My beast first, always. That's the hunter's way.", next = "BACK", reply = "I know it. But come tae me before ye try stitchin' yerself again, for yer beast deserves a hunter wi' steady hands.", fx = { align = { light = 1 } } },
        { text = "I mend myself first. A dead hunter feeds no beast.", next = "BACK", reply = "That's sense, an' rarer than ye'd think among hunters, so come by whenever ye need mendin', an' bring the beast too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Often enough, an' I never ask how they came by their wounds. The Light heals what it heals, an' I'd sooner patch ye up than have ye bleed in an alley because ye were afraid o' my questions." } },
      choices = {
        { text = "Thank you, Toldren. I'll repay that kindness someday.", next = "BACK", reply = "There's nae need; the kindness is the Light's, no' mine. Just walk out o' here whole, an' that's payment enough.", fx = { align = { honor = 1 } } },
        { text = "No questions is the best kind of healer. I'll be back.", next = "BACK", reply = "I'll be here, an' I'll still no' ask, but I'd be glad if ye came back wi' fewer holes in ye next time.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A quiet place, maybe, an' a kind word, which yer sort doesnae often get in Ironforge. I've no' much else, but I'll give ye what I have, an' I'll pray for ye whether ye ask or no'." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A quiet place, maybe, an' a kind word, which yer sort doesnae often get in Ironforge, though I'll confess the kind word comes harder wi' yer demon watchin' me. I've no' much else, but I'll give ye what I have, an' I'll pray for ye whether ye ask or no', once that thing's out o' the Hall." },
      },
      choices = {
        { text = "Your prayers are welcome, Toldren. Thank you.", next = "BACK", reply = "Then ye'll have them every night. There's a quiet chair here whenever ye need one.", fx = { align = { light = 1 } } },
        { text = "Keep your prayers. I don't need them.", next = "BACK", reply = "Fair enough, but I'll say them anyway, quietly, for the Light doesnae need yer permission tae care what becomes o' ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than ye'd think, though they come at night when nobody's watchin', for a paladin's no' supposed tae need anythin'. I listen, an' I tell them the Light doesnae ask them tae carry everythin' alone, an' some o' them believe me." } },
      choices = {
        { text = "Then I'll remember it. Even a paladin needs help sometimes.", next = "BACK", reply = "That's the wisest thing a paladin's ever said tae me, an' I'll be here whenever ye need tae set somethin' down.", fx = { align = { light = 1 } } },
        { text = "A paladin carries his own burdens. That's part of the oath.", next = "BACK", reply = "It is. But even the oath was never meant tae be carried alone, so mind ye remember my door.", fx = { align = { light = -1 } } },
        { text = "Something else, Toldren.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Remind ye tae sleep, for a start, an' tae eat somethin' that wasnae conjured, for I've seen mages waste away while their minds run on ahead. The Light doesnae care much for spells, but it cares dearly for the one castin' them." },
      },
      choices = {
        { text = "You're kind, Toldren. I'll rest.", next = "BACK", reply = "I'll hold ye tae that. I've seen too many bright young mages waste away before they've half finished their work.", fx = { align = { light = 1 } } },
        { text = "Rest can wait. The work can't.", next = "BACK", reply = "It can, love, for ye'll do it better rested, an' I'd rather no' be carryin' ye in here on a stretcher next week.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Is there anythin' I can do for ye? Ye've the look o' somebody who's carried other folk's troubles further than ye meant tae." },
        { id = "h_default", text = "Toldren Deepiron, at yer service. I teach the priests, but I'll help anyone who comes through that door, so tell me what ye need." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "I hope the Light is wi' ye, {name}. Is there anythin' I can do for ye today, besides the trainin'? Ye look like there might be." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late tae be up, but the Hall never really closes. The lamps burn all night for the ones who cannae sleep, an' there are always a few." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ah, a rogue. What can I do for ye? Most o' yer sort come tae me for healin' they don't want tae explain." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. What can I do for ye? I'll help where I can, though I'll admit I'm no' sure what a priest can offer ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye look tired, if ye don't mind my sayin' so; sit a moment before ye go." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Ye look as though ye've slept on the ground more than in a bed lately, so sit an' rest a while." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' ye look tired, if ye don't mind my sayin'. Sit a while, for the Hall's open tae anyone, whatever they pray to." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, an' tired, I'd wager, for ye've the look o' someone who's been readin' by candlelight again. Is there anythin' I can do for ye?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Come in, come in. Some o' the brothers'll scowl, but I'll help anyone through that door, an' I made that promise long before yer kind turned up." },
      },
      again = {
        { id = "h_again", text = "Is there anythin' else I can do for ye?" },
        { id = "h_again2", text = "Take yer time, for nobody's hurryin' ye here." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who comes here when they can't sleep?", next = "night" },
        { text = "How do you keep from running dry?", next = "dry" },
        { text = "I came out of the abbey at Northshire.", next = "abbey", when = { origin = "human_abbey_novice" } },
        { text = "Do rogues often come to you for quiet healing?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What could a priest offer a warlock, Toldren?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Many warriors must come to you for healing, Toldren.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters come to you often, Toldren?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do paladins come to you for help, Toldren?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How would a priest of the Light help a druid?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What can a priest do for a mage, Toldren?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do some of the brothers scowl at shamans, Toldren?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Nothing, thank you.", next = "END" },
      },
    },
    night = {
      lines = {
        { id = "ni_default", text = "Widows, mostly, an' soldiers back from the front, an' gnomes who dream o' their city. I don't preach at them; I bring a blanket an' let them talk if they want tae." },
      },
      choices = {
        { text = "That's the best kind of ministry.", next = "BACK", reply = "I think so too. Most o' them have had enough preachin' tae last a lifetime, an' a blanket does more good.", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Grief should be faced, not wrapped in blankets.", next = "BACK", reply = "Aye, it should, an' they face it, but it's easier tae face somethin' wi' a warm blanket round yer shoulders.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Which widows?", next = "night_widow" },
      },
    },
    night_widow = {
      lines = {
        { id = "nw_default", text = "That's theirs tae tell, no' mine. There's a lass in the Military Ward who waits for letters from the Thandol Span, though, an' if ye pass her, a kind word costs nothin'." },
      },
      choices = {
        { text = "I'll look in on her.", next = "BACK", fx = { affinity = 1, learn = { "thandol_span" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry = {
      lines = {
        { id = "dr_default", text = "I don't always. When I'm empty I sit in the back row an' let someone else lead the prayers, for there's nae shame in bein' the one who's prayed for." },
      },
      choices = {
        { text = "A healer has to let others heal them too.", next = "BACK", reply = "It's the hardest lesson o' all for a healer. I'm glad ye see it before ye have tae learn it lyin' on one o' my cots.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A priest's duty is to keep going regardless.", next = "BACK", reply = "Aye, regardless, but no' recklessly, for a priest who falls over cannae keep goin' at all, an' I've seen it happen.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire! Then ye learned yer first prayers among trees an' bees, an' now ye've come tae a mountain wi' nae windows. Do ye miss the light, the ordinary kind?" },
      },
      choices = {
        { text = "Every day, Brother.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Light's the same under stone.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Folk tell me things when they're tired, an' I keep the sad ones tae myself. These I can pass on." } },
    background = { { id = "tp_bg", text = "I train priests in the Hall o' Mysteries, an' I keep the night lamps lit. That's about all there is tae me." } },
    advice = { { id = "tp_ad", text = "Let someone help ye now an' then. It's harder than helpin', an' it's good practice." } },
    thandol_span = { { id = "tp_span", text = "The bridge where the Dark Irons struck. More than one family in Ironforge waits on news from it.", next = "night_widow" } },
    holy_light = { { id = "tp_holy_light", text = "The Light's a warm hand on a tired shoulder, an' I try tae be that fer anyone who comes through the Hall. Ye look tired, if ye dinnae mind my sayin'." } },
    scourge = { { id = "tp_scourge", text = "I've sat wi' soldiers back from the north who couldnae sleep fer the screaming. The dead are hard enough tae fight an' harder tae forget." } },
    stromgarde = { { id = "tp_stromgarde", text = "There's a priest at Refuge Pointe who writes me every month, an' every letter's more tired than the last. I send back what comfort I can, an' it's never enough." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. If it's important, the High Priest might, or the Library in the Hall o' Explorers." } },
  },
}

-- Braenna Flintcrag: priest trainer; passes on the Temple of the Moon's summons to night elf priests.
P:NPC {
  key = "braenna", id = TODO_NPC("Braenna Flintcrag"), name = "Braenna Flintcrag", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "warm" }, values = { "friendly", "dutiful" },
  spiritSensitive = true,
  notices = { "race", "lock_shards" },

  impression = {
    first = "She makes every stranger welcome, briskly and very well.",
    third = "{name} met Braenna Flintcrag, a priest trainer in the Hall of Mysteries who welcomes visitors from other temples.",
  },

  greetings = {
    { id = "g_welcome", text = "Welcome tae the Hall! Mind the step, an' mind the mages; they're the ones in the pointy hats." },
    { id = "g_ne", when = { race = "NightElf" }, text = "Greetings, an' a blessin' on ye an' yer kind. Good tae see ye in our halls." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human", class = "PRIEST" },
      text = "Cathedral robes, an' they've seen weather. The Light's no' fussy about where ye learned yer hymns, an' neither am I." },
    { id = "n_ne", cat = "race", when = { race = "NightElf", class = "PRIEST" },
      text = "A priestess o' Elune, under the mountain! I've a message for yer kind more often than ye'd think, so check wi' me before ye leave." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "The wards on the Hall are hummin' at somethin' in yer pack, an' I'm fairly sure it's soul shards. Mages store power in crystals as well, but ours didnae have tae die tae fill them, so I'd ask ye tae keep the bag closed." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The truth, I suppose, once I know it. Stormwind's Cathedral wants tae know if it's heresy, Darnassus wants tae know if it's druidry, an' the Wildhammers' letter only said it was about time. I'm leanin' towards copyin' the Wildhammers' answer an' sendin' it tae everyone." } },
      choices = {
        { text = "Tell them it's no heresy. The Light and earth aren't rivals.", next = "BACK", reply = "That's what I hope tae say. Mind if I quote ye? The Cathedral listens better when it comes from a believer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tell them it's none of the temples' business.", next = "BACK", reply = "Ha, I'll no' be writin' that tae the Cathedral, but I'll admit I've thought it once or twice myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Now an' again, mostly about wounded soldiers an' who's tae tend them, which is the same thing we write about. Their hand is very elegant, an' I'm a wee bit jealous of it." } },
      choices = {
        { text = "Our temples should tend the wounded together, not apart.", next = "BACK", reply = "I've written as much tae Alathea, an' she agrees, in her very elegant hand. Now we only need tae convince everyone else.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Each temple tends its own. Letters are courtesy, no more.", next = "BACK", reply = "Maybe they are, but courtesy's a start, an' I've seen good things come from a polite letter more than once.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mostly tae Glorin Steelbrow, the priest at Menethil Harbor, for the Dragonmaw cut the road half the time an' he's the worst correspondent in the Alliance. A warrior's a fine courier, for the letters arrive, an' so does the warrior, usually." } },
      choices = {
        { text = "I'll carry your letters, and gladly.", next = "BACK", reply = "Bless ye! Glorin will be glad o' them, though he'll probably no' write back, the stubborn old goat.", fx = { align = { honor = 1 } } },
        { text = "I'm a soldier, not a courier. Find someone else.", next = "BACK", reply = "Fair enough, an' I'll no' push, but if ye're passin' Menethil anyway, a letter in yer pack weighs very little.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The roads are fine; it's what's on them, for the raptors in the Wetlands have eaten two satchels this season an' the Mosshide made off wi' a third. A hunter who could get a letter tae Menethil an' back would be worth {g:his|her} weight in parchment." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The roads are fine; it's what's on them, for the Wetlands raptors have eaten two satchels this season. Yer {pet} could carry a satchel tae Menethil, I suppose, though I'd want it back wi'out teeth marks." },
      },
      choices = {
        { text = "I'll carry them, and keep them safe.", next = "BACK", reply = "Bless ye, an' I'll pack them tight, for I'd rather no' lose another satchel tae a raptor wi' a taste for parchment.", fx = { align = { honor = 1 } } },
        { text = "I'll carry them, and read them on the way.", next = "BACK", reply = "Then ye'll find they're very dull, an' I'll have tae seal them twice next time, so please dinnae, for the priests' sake.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Their old empire leaned on it too hard, long ago, an' they paid for it dearly, or so the Temple o' the Moon says. I'd no' bring it up wi' them unless ye fancy a lecture that lasts till the stars come out." } },
      choices = {
        { text = "Then I'll learn from their mistakes and tread carefully.", next = "BACK", reply = "That's wise. Ye'll still get the lecture if ye so much as glow in their direction, but they'll respect ye for it.", fx = { align = { order = 1 } } },
        { text = "The kaldorei's ancient failures are no concern of mine.", next = "BACK", reply = "Then ye'd best no' say so in front o' them, for the Temple o' the Moon has a very long memory an' very sharp tongues.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They fought them long ago, by their own tellin', an' they've no' forgotten what it cost. If ye want peace in the Hall, leave yer creatures at the door when the kaldorei come callin'." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They fought them long ago, by their own tellin', an' they've no' forgotten what it cost, so I'm glad there's no kaldorei in the Hall this minute tae see yer demon. If ye want peace here, leave the creature at the door when they come callin', for one look at it an' they'd remember everythin' at once." },
      },
      choices = {
        { text = "I'll leave my creatures outside when they visit.", next = "BACK", reply = "Thank ye. The kaldorei visit rarely, an' I'd like them tae leave thinkin' well o' the Hall.", fx = { align = { light = 1 } } },
        { text = "Their old wounds aren't my responsibility, Braenna.", next = "BACK", reply = "No, they're no', but ye'll be standin' in their temple soon enough, an' a wee bit o' courtesy goes a long way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Old ones, mostly, from families askin' after paladins who went north an' never wrote back, an' I've nowhere tae send them. I keep them in a box under the desk, for I cannae bring myself tae burn them." } },
      choices = {
        { text = "Keep them, Braenna. Someone might come asking one day.", next = "BACK", reply = "I will. I've kept them for years already, an' I'll keep them as long as I'm sittin' at this desk.", fx = { align = { light = 1 } } },
        { text = "Burn them. Hope that can't be answered only hurts.", next = "BACK", reply = "Maybe it does, an' I've thought about it, but I couldnae bring myself tae do it, for someone loved every one o' those men.", fx = { align = { light = -1 } } },
        { text = "Something else, Braenna.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I think ye'd be tempted, for a stack o' sealed letters tempts most folk, an' a rogue sooner than anyone. I keep them safe because the priests who send them trust me, an' trust is the one thing in this Hall I cannae replace." },
      },
      choices = {
        { text = "Your letters are safe from me.", next = "BACK", reply = "Thank ye, an' I'll believe ye, for ye've an honest face for a rogue, an' that's rarer than ye'd think.", fx = { align = { honor = 1 } } },
        { text = "A sealed letter is a challenge, Braenna.", next = "BACK", reply = "Then ye'll find it's sealed twice an' watched three times, so I'd no' bother, love, for the priests trust me for a reason.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! There's a letter or two for the Silver Hand in my pile, I'll wager, though I'd no' know who tae send them tae now Lordaeron's gone." },
        { id = "h_default", text = "Braenna Flintcrag. I train priests here an' keep the Hall's messages, for every temple from Stormwind tae Theramore seems tae send its letters through me." },
        { id = "h_returning", tags = { "news" }, when = { questActive = TODO_QUEST("Returning Home") },
          text = "Ye're still here? A priestess o' yer temple came lookin' for ye, an' she said tae go home tae the Temple o' the Moon as soon as ye could. Priestess Alathea's waitin'." },
        { id = "h_ne_priest", when = { race = "NightElf", class = "PRIEST" },
          text = "Good tae see ye in our great halls, an' I mean that; we don't get many o' Elune's priests this far underground. Is it very strange, prayin' wi' nae sky?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! The kaldorei priestesses would have opinions about ye, for their people's history wi' the arcane is a long an' bitter one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the Hall o' Mysteries! I'll ask ye tae keep yer distance from the night elf priestesses who visit, for they've long memories about demons." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll be headin' out o' the city, then, an' I might have a letter or two for ye tae carry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll know the roads better than any courier, an' I've letters that need a sure foot." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've had letters from the Temple o' the Moon pass through my hands, though I'm no' sure the sisters meant them for a dwarf tae sort." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. If ye've come tae read the Hall's letters, I'll save ye the trouble, for half o' them are night elves askin' about the weather on Teldrassil." },
        { id = "h_firstaltar", when = { origin = "gnome_first_altar" },
          text = "Oh, it's you! I've had two letters from the Cathedral in Stormwind askin' whether it's true a gnome took vows in this Hall, an' I keep meanin' tae write back that the gnome's real an' standin' at my desk, only the letters keep pilin' up on top o' theirs." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've letters from three temples askin' what the Hall makes o' dwarves takin' up the old ways, an' I still havenae answered any o' them." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye? I've three letters tae sort, but they'll keep." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who sends letters through you?", next = "letters" },
        { text = "Do night elves pray to the same Light?", next = "elune" },
        { text = "It is strange, praying without stars.", next = "stars", when = { race = "NightElf" } },
        { text = "Why are the night elves bitter about the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do the night elves remember demons so keenly?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What letters need carrying, Braenna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the roads give your letters much trouble, Braenna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What letters come for the Silver Hand now, Braenna?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Sisters of Elune write to the Hall often?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you really think I'd read your letters?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What will you tell the temples about dwarven shamans, Braenna?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Braenna.", next = "END" },
      },
    },
    letters = {
      lines = {
        { id = "le_default", text = "The Cathedral in Stormwind, mostly, an' the Temple o' the Moon in Darnassus, an' now an' then a field chaplain wantin' bandages. I read the address an' find the priest, an' I'm very good at findin' priests." },
      },
      choices = {
        { text = "That must keep you busy.", next = "letters_busy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_busy = {
      lines = {
        { id = "lb_default", text = "It does, but somebody has tae, an' the High Priest walks too fast tae hand anythin' tae. I like knowin' where everyone is, besides; it's a comfort, in times like these." },
      },
      choices = {
        { text = "Every temple should share what it learns.", next = "BACK", reply = "That's why I write so many letters, though my hand aches by the end o' every week. Look at the ink on these fingers!", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Each temple should keep to its own teaching.", next = "BACK", reply = "Maybe they should, but a letter or two between friends never hurt anybody's teaching, an' it's kept a few temples from feudin'.", fx = { align = { order = 1 } } },
      },
    },
    elune = {
      lines = {
        { id = "el_default", text = "Not quite. They pray tae Elune, an' we tae the Light, an' Alathea an' I agree tae disagree in very polite letters. Both kinds o' priest can set a broken leg, an' neither kind enjoys the screamin'." },
      },
      choices = {
        { text = "The Light is the only true source.", next = "BACK", reply = "That's the Cathedral's view, an' I'll no' argue in front o' ye, but Alathea's letters are kind enough that I find it hard tae believe.", fx = { align = { light = 1 }, trait = { stern = 1 } } },
        { text = "Elune and the Light can both be true.", next = "BACK", reply = "That's my thinkin' too, though I'd never say so in front o' the Cathedral, for they'd have my desk by supper.", fx = { align = { light = -1 }, affinity = 1, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stars = {
      lines = {
        { id = "st_default", text = "I thought it might be. Go up tae the gates at night, then; the sky over Dun Morogh's as clear as any, an' cold enough tae keep the prayers short." },
      },
      choices = { { text = "Thank you, I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I read the outside o' a great many letters, which is no' the same as readin' the inside. Here's what I can tell ye." } },
    background = { { id = "tp_bg", text = "Priest trainer, letter-sorter, an' the one who finds folk when the High Priest cannae. I like the work." } },
    advice = { { id = "tp_ad", text = "Write tae someone when ye've a moment. A priest on the road forgets that somebody's prayin' for her too." } },
    teldrassil = { { id = "tp_teldrassil", text = "That's where Alathea's letters come from, the Temple o' the Moon. They smell o' leaves, which is a strange thing tae find in a mountain." } },
    elune = { { id = "tp_elune", text = "The night elf priestesses write tae us now an' then, an' their letters smell o' moonflowers. They pray tae Elune as we pray tae the Light, an' I think both prayers end up in the same place." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind leads the night elves, priestess an' general both, an' her letters tae the Hall are courteous an' very short. I've a great respect fer anyone who can say a lot in few words." } },
    theramore = { { id = "tp_theramore", text = "The priests at Theramore send word through us now an' then, for Lady Jaina takes in all sorts an' needs all sorts o' help. I make sure their letters go out by the first gryphon." } },
    _none = { { id = "tp_none", text = "No letters about that, I'm afraid. Try the Commons, or the Library." } },
  },
}

-- Tiza Battleforge: the dwarven paladins' mentor; Tome of Divinity, the Symbol of Life.
P:NPC {
  key = "tiza", id = TODO_NPC("Tiza Battleforge"), name = "Tiza Battleforge",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "steady", "proud" }, values = { "pious", "dutiful", "generous" },
  spiritSensitive = true,
  notices = { "paladin", "lock_stones" },

  impression = {
    first = "She sends young paladins to help people who can never repay them.",
    third = "{name} met Tiza Battleforge, the respected dwarven paladin who sets Ironforge's young paladins on the path of virtue.",
  },

  greetings = {
    { id = "g_light", text = "The Light be wi' ye. Speak, an' I'll listen." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A paladin! Stand up straight an' tell me what ye've done for someone who couldnae repay ye." },
  },

  notice = {
    { id = "n_human_pal", cat = "paladin", when = { class = "PALADIN", race = "Human" },
      text = "One o' Duthorian Rall's, from Stormwind? Ye've the Stormwind way o' holdin' a hammer, like it's goin' tae be painted. Hold it like it's goin' tae be used." },
    { id = "n_dwarf_pal", cat = "paladin", when = { class = "PALADIN", race = "Dwarf" },
      text = "A dwarf o' the Silver Hand. Brandur Ironhammer sent ye, I'll wager; he sends me all his best an' then sulks about it." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That's a healthstone in yer bag, an' I can feel it from here, a wee green ache like somebody's stolen breath. The Light heals for free, an' it heals clean, so I'll ask ye no' tae drink from that stone in this chapel." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Silver Hand trusts deeds. Ye'll have the same chance as any, an' the same judgment if ye fail it. Mind ye, when I see a dwarf callin' fire up out o' the ground, I think o' Thaurissan, an' I have tae remind myself it's no' the same thing." } },
      choices = {
        { text = "It's not the same. I'll prove it by my deeds, Tiza.", next = "BACK", reply = "The Silver Hand doesnae trust words, so I'll be watchin' yer deeds very closely. Make them good ones.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Judge me by your fears if you like. I'll not plead.", next = "BACK", reply = "Fair enough, an' I'll respect it, but ye'll find my fears are only half o' what ye'll need tae overcome in this Hall.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It is if ye serve somethin' bigger than yerself an' ask nothin' back, which is the only test I use. I've known kaldorei who'd give their lives for a grove, an' I'd call that virtue in any tongue." } },
      choices = {
        { text = "Serving without reward is the truest duty there is.", next = "BACK", reply = "It is, an' that's the whole o' what I teach. It's harder than it sounds, as my young ones keep findin' out.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A druid who's never rewarded doesn't last long.", next = "BACK", reply = "No, they dinnae, an' neither do paladins, but the ones who last are the ones who never needed it, an' that's the test.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "By keepin' the wolves off a farmer's flock an' the bears off a miner's road, an' askin' nothin' for it but a meal. That's virtue in plain boots, an' my paladins would do well tae learn it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "By keepin' the wolves off a farmer's flock an' the bears off a miner's road, an' askin' nothin' for it but a meal. Yer {pet} would be a fine example for my young ones, too, for it serves ye wi'out askin' anythin' back." },
      },
      choices = {
        { text = "I'll keep doing it, and ask nothing back.", next = "BACK", reply = "I'll tell my young ones about ye. A hunter who asks nothin' is worth a dozen paladins who ask too much.", fx = { align = { light = 1 } } },
        { text = "A meal's not enough. I hunt for coin.", next = "BACK", reply = "Fair enough, an' I'll no' scold ye, but coin makes a poor companion on a cold night, an' a farmer's thanks lasts longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because we fight in the open an' ye fight in the dark, an' the Light prefers the open. Still, I've seen rogues drag wounded paladins off a field when nobody else would go, so I'll keep my opinions gentle." } },
      choices = {
        { text = "Then I'll work in the dark so others can live.", next = "BACK", reply = "That's a noble thing tae say, an' I'll remember it, for I've seen it done, an' it's braver than most fightin' in the open.", fx = { align = { honor = 1 } } },
        { text = "Fighting in the open is a good way to die, Tiza.", next = "BACK", reply = "It is, an' I've buried a good many paladins who did it, but I'd still rather die in the open than live in the dark.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "On sight, an' I'd no' stop them, for a demon is a demon whoever's holdin' its leash. Keep it close an' keep it quiet, an' we'll have no trouble." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "On sight, an' I'd no' stop them, an' I'll tell ye plainly that two o' them have their hands on their hammers now wi' yer demon standin' there. Keep it close an' keep it quiet, an' we'll have no trouble, for a demon is a demon whoever's holdin' its leash." },
      },
      choices = {
        { text = "I'll keep it close and quiet, Tiza. You have my word.", next = "BACK", reply = "I'll hold ye tae it. My paladins are young an' eager, an' I'd rather no' explain tae their mothers why one o' them got bitten.", fx = { align = { light = 1 } } },
        { text = "Your paladins would regret it. My demons bite back.", next = "BACK", reply = "Maybe they would, but I'd regret it more, an' I'll no' have that sort o' talk in the Hall, so keep yer threats tae yerself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when he's awake, an' that's most o' the time, for he'll no' lie still an' he'll no' stop talkin'. The priest who's stitchin' him has the patience o' a saint, an' I've told her so, an' she's told me Muiredon's the reason she has tae." } },
      choices = {
        { text = "Then I'll help her. Every patient deserves care, even the noisy ones.", next = "BACK", reply = "Bless ye, for she's been at it all mornin', an' my husband's the noisiest patient in the Hall, I'll warrant.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he won't lie still, let him heal slowly. He'll learn.", next = "BACK", reply = "Ha, maybe he will, but I doubt it, for he's been noisy since the day I married him, an' I'd no' have him any other way.", fx = { align = { light = -1 } } },
        { text = "Something else, Tiza.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No' little, only different, for a mage seeks power an' a paladin seeks tae give his away, or that's what I teach them. The best mages I've known gave theirs away too, sooner or later, an' I'd like tae think ye might be one o' them." },
      },
      choices = {
        { text = "Power should serve others. I agree.", next = "BACK", reply = "Good. There's more mages than ye'd think who understand it, an' fewer than I'd like.", fx = { align = { light = 1 } } },
        { text = "Power serves whoever holds it, Tiza.", next = "BACK", reply = "Maybe it does, but power held too tight crushes the hand that holds it, an' I've seen it happen tae better mages than you.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Tiza Battleforge, o' the Silver Hand. Here in Ironforge I put the young paladins on the path tae virtue, an' it's a longer path than they expect." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "Have ye studied the book? Then go an' do what it asks, for a page ye've read an' never lived is only ink." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "Ye carry the Symbol now. My husband's over there gettin' stitched, an' he'll tell ye the rest, if the priest lets him talk." },
        { id = "h_narm", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Ye brought Narm back. Muiredon's been tellin' the story tae everyone in the Hall, an' it gets a bit bigger every time, but the heart o' it's true, an' I'm proud o' ye." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! We'd be lost wi'out yer kind; it's yer lot patchin' up my husband right now. Thank ye, on his behalf, for he'll forget tae." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue come tae see a paladin's mentor? I'll hear ye, but I'll no' pretend I'm comfortable wi' yer trade." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll no' have yer creatures near my paladins, for they're trained tae smite first an' ask after." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I send my young paladins tae help folk who cannae repay them, an' hunters do the same more often than ye'd think." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Hall o' Mysteries. I put young paladins on the path tae virtue, an' I'd wager yer path's every bit as long." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I've nothin' against the arcane, but I'll say my young paladins learn more from a day helpin' a farmer than from a week o' books." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Silver Hand has fought beside stranger allies than ye, though I'll admit no' many o' them were dwarves." },
      },
      again = {
        { id = "h_again", text = "Go on, {g:lad|lass}; the Light's never too busy fer an honest question." },
        { id = "h_again2", text = "Go on. I've time for an honest question." },
      },
      choices = {
        { text = "What does the path to virtue ask?", next = "path" },
        { text = "Who's the wounded dwarf over there?", next = "husband" },
        { text = "How did you come to the Light?", next = "came" },
        { text = "Brandur speaks highly of you.", next = "brandur", when = { heardLine = "brandur.tz_default" } },
        { text = "I've earned my oaths, Tiza.", next = "oath", when = { class = "PALADIN" } },
        { text = "My family's carried the Silver Hand since the Second War.", next = "hand", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "I'm no paladin, but I'd stand with one.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Why are paladins uneasy with rogues, Tiza?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would your paladins really attack a warlock's demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do hunters help folk who can't repay them, Tiza?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does your husband give the priests much trouble, Tiza?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is a druid's duty to the wild a virtue too?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do paladins think little of mages, Tiza?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the Silver Hand trust a dwarf shaman, Tiza?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Light keep you.", next = "END" },
      },
    },
    path = {
      lines = {
        { id = "pa_default", text = "Charity first, an' patience. I send the young ones tae help someone who cannae ever pay them back, like John Turner wi' his orphans, an' I watch what they do when nobody's thankin' them." },
      },
      choices = {
        { text = "Why start with charity, not combat?", next = "path_why" },
        { text = "Charity's for priests; paladins should fight.", next = "BACK", reply = "They should fight, an' they will, but a paladin who cannae give for nothin' will never understand what he's fightin' for.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Charity done in secret is the truest kind.", next = "BACK", reply = "Aye, it is, an' I'll be watchin' tae see if ye do it when ye think nobody's lookin', for that's when it counts.", fx = { align = { honor = 1 }, affinity = 1, learn = { "tome_of_divinity" } } },
      },
    },
    path_why = {
      lines = {
        { id = "pw_default", text = "Any fool wi' a hammer can fight, an' a great many do. The Light gives its greatest gifts tae those who'll use them on someone else's behalf, an' I want tae know that before I teach them anythin' that matters." },
      },
      choices = {
        { text = "What's the greatest gift?", next = "path_gift" },
        { text = "That's wisdom.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    path_gift = {
      lines = {
        { id = "pg_default", text = "Tae bring someone back who's fallen. The Symbol o' Life only answers a paladin who's ready for it, an' when it answers, the whole Hall hears about it for a month." },
      },
      choices = {
        { text = "Some should be allowed to rest.", next = "BACK", reply = "Some should, an' that's the hardest lesson o' all, for the Light knows better than we do who's ready tae come back.", fx = { align = { light = -1 }, trait = { cautious = 1 } } },
        { text = "Bringing back the fallen is the Light's mercy.", next = "BACK", reply = "It is. But the Light's mercy is no' always the same as ours, an' ye'll learn that the first time it says no.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband = {
      lines = {
        { id = "hu_default", text = "My Muiredon, an' he'll tell ye he's fine, which he isnae. He went spyin' on the Dark Irons south o' Helm's Bed Lake wi' Narm Faulk, an' only Muiredon came back walkin'." },
      },
      choices = {
        { text = "And Narm?", next = "husband_narm" },
        { text = "I'm sorry, Tiza.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    husband_narm = {
      lines = {
        { id = "hn_default", text = "Narm held them off so Muiredon could run, an' that's the kind o' friend he is. Whether he's still holdin' is a question I ask the Light every mornin', an' Muiredon asks it every hour." },
        { id = "hn_done", when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Narm's alive, thanks tae a young paladin wi' the Symbol, an' grumblin' about the cold. I'd ha' given my last candle tae hear that grumble, an' now I hear it for free." },
      },
      choices = {
        { text = "Then someone should go now.", next = "BACK", reply = "Aye, someone should, an' Muiredon would go himself if his stitches would let him, so if ye've a mind tae, go wi' my blessing.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Better to wait for proper orders.", next = "BACK", reply = "Proper orders are comin', I'm told, but Narm's been holdin' a long time, an' I'd rather no' wait much longer.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = {
        { id = "ca_default", text = "The same way as most dwarves o' my years: the Silver Hand needed hands, an' I had two. The oaths took longer than the hammer-work, but they've held better." },
      },
      choices = {
        { text = "Those oaths must chafe at times.", next = "came_chafe" },
        { text = "Something else.", next = "BACK", fx = { learn = { "silver_hand" } } },
      },
    },
    came_chafe = {
      lines = {
        { id = "cc_default", text = "Every day, an' that's how ye know they're doin' their work. An oath that never pinches is just a nice thing ye said once." },
      },
      choices = {
        { text = "An oath must be kept whatever it costs.", next = "BACK", reply = "It must. A paladin who keeps an oath only when it's easy is no paladin at all, an' I've had tae tell a few that tae their faces.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Even oaths should bend for good reason.", next = "BACK", reply = "Maybe. But mind the reason's a good one, for every broken oath I've ever seen came wi' a reason attached.", fx = { align = { honor = -1 } } },
      },
    },
    brandur = {
      lines = {
        { id = "br_default", text = "Does he? He's a good teacher an' a jealous one, an' I told him so tae his face. He swore he'd work on it, an' tae his credit, he is." },
      },
      choices = {
        { text = "That was blunt of you, Tiza.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oath = {
      big = true,
      lines = {
        { id = "oa_default", text = "Have ye, now? Then ye'll know the oath's no' a thing ye earn once an' keep in a drawer. Tell me who ye've helped lately, an' I'll tell ye if ye've earned it this week." },
      },
      choices = {
        { text = "I've helped where I could, and asked nothing.", next = "BACK", reply = "Then ye've earned it this week, an' I'm proud tae hear it, so keep goin', an' I'll ask ye again next week.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I've been too busy fighting to count.", next = "BACK", reply = "Fightin's a fine thing. But the oath's about who ye help, no' who ye hit, so start countin'.", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    hand = {
      lines = {
        { id = "hd_default", text = "Then ye've heard the old stories at supper, about Uther comin' tae the Ward wi' his recruiters an' the first dwarves takin' the oath. The Hand's been broken since, but a broken order's still an order, as long as some of us keep it." },
        { id = "hd_origin", when = { origin = "dwarf_silver_hand" },
          text = "Aye, I know yer family's name; it was on the rolls when I took my own oath, two lines above mine. Ye've big boots tae fill, an' I've no doubt ye'll fill them, but dinnae rush it." },
      },
      choices = {
        { text = "The Hand will rise again.", next = "BACK", reply = "Aye, it will, an' I'll see it does, for there's a great many paladins in this city who remember the oath even wi'out the Hand.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "The Hand's gone. We're paladins on our own now.", next = "BACK", reply = "Maybe we are. The oath still binds us, Hand or no Hand, an' I'll keep teachin' it till I drop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "That's a gift, an' I mean it; half o' what a paladin is, is knowin' who'll stand wi' ye. My husband an' Narm Faulk stood together against the Dark Irons at Helm's Bed Lake, an' it's the only reason either o' them came home." },
      },
      choices = {
        { text = "Who's Narm Faulk?", next = "husband_narm" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The young paladins tell me everythin', whether I want tae hear it or no'. Here's what's worth passin' on." } },
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand an' a mentor tae the young ones, an' Muiredon's wife, which is the hardest o' the three." } },
    advice = { { id = "tp_ad", text = "Help someone who cannae repay ye, an' don't tell anyone ye did it. That's the whole lesson; the rest is practice.", next = "path" } },
    tome_of_divinity = { { id = "tp_tome", text = "It's the book I give the young ones. It asks them tae be charitable an' patient, an' most find patience the harder.", next = "path" } },
    dark_iron = { { id = "tp_dark_iron", text = "There's a camp o' them south o' Helm's Bed Lake, an' a commander givin' orders. My husband has the stitches tae prove it.", next = "husband" } },
    holy_light = { { id = "tp_holy_light", text = "The Light's best served in the dirt, helpin' folk who'll never know yer name. That's where I send my young paladins, an' it's where they learn what they're for." }, { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "Ye've chosen the hardest road there is, an' I'm proud o' ye fer it. Dinnae let anyone tell ye the Light's only fer the battlefield." } },
    silver_hand = { { id = "tp_silver_hand", text = "Uther's order is broken, but the Hand still lives in every paladin who helps somebody who cannae pay. That's the oath, an' it outlives any banner." } },
    scourge = { { id = "tp_scourge", text = "My husband's fought the dead, an' he came home quiet. Send yer prayers north, fer the paladins there need every one." } },
    _none = { { id = "tp_none", text = "That's no' somethin' I can speak tae. Ask the High Priest, or ask Muiredon, who'll talk about anythin'." } },
  },
}

-- Muiredon Battleforge: Tiza's husband, wounded by the Dark Irons at Helm's Bed Lake.
P:NPC {
  key = "muiredon", id = TODO_NPC("Muiredon Battleforge"), name = "Muiredon Battleforge",
  bible = "bibles/mystic_ward.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "loyal", "brave" },
  notices = { "class", "lock_pact" },

  impression = {
    first = "Underneath the jokes he is sick with worry for his friend Narm.",
    third = "{name} met Muiredon Battleforge, Tiza's husband, who came back wounded from spying on the Dark Irons near Helm's Bed Lake.",
  },

  greetings = {
    { id = "g_cough", text = "*cough* Well met, friend! Pay nae heed tae the holes in me; this priest 'ere's patchin' ol' Muiredon up a stitch at a time." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I'm mendin', thank ya, slower than I'd like an' a great deal slower than Tiza'd like." },
    { id = "g_away", when = { away = 14 }, text = "*cough* Ye've been gone {away}, an' I'm still lyin' here gettin' stitched! Tiza says I'm mendin', but she says that every day." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at ye, all grown fierce since ye last came by! Narm would've liked ye, an' I mean that as the highest praise I've got." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The priests say ye've been doin' good turns about the city, friend. That's the stuff, an' it's better medicine than half Tiza's poultices." },
  },

  notice = {
    { id = "n_priest", cat = "class", place = "before", when = { class = "PRIEST" },
      text = "Another priest! Are ya the one doin' the stitchin' now? No? Then sit there an' don't poke, for I've been poked enough this week." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Dwarf" },
      text = "A paladin wi' a proper beard, jus' like Narm. He'd like ya, an' he'd tell ya so, loudly." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "*cough* Ye're givin' off heat like a stove, friend, an' it's no' honest heat, it's an imp's pact sittin' in yer blood. My wounds feel it, an' they ache, but I'll no' complain, for I've had worse company in the Dark Iron cells." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Aye, an' no' the sort that comes from a forge. One o' them raised his hands an' the ground went red under my boots. They say Thaurissan's folk still talk tae the fire they called down, an' I'll no' forget the sound o' it. If ye can talk tae the same fire, I'd like tae know whose side it's on." } },
      choices = {
        { text = "Fire serves whoever has the discipline to master it.", next = "BACK", reply = "Discipline, aye, but I've never seen a Dark Iron wi' much o' that, an' they still had the fire answerin' them like a hound.", fx = { align = { order = 1 } } },
        { text = "Fire belongs to no one. That's why it's dangerous.", next = "BACK", reply = "Aye, an' that's what frightened me. The Dark Irons think it does, an' that's how ye get a Searing Gorge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, an' they left my friend Narm in far worse trouble, so I'll no' complain about mine. If ye know a herb for worry, though, I'd take a whole sack o' it." } },
      choices = {
        { text = "Then let's find Narm. Worry wants doing, not herbs.", next = "BACK", reply = "Ha, ye're right, an' I'd be on my way already if these stitches would let me, so go for me, an' bring Narm back laughin'.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Heal first. Rushing back will only get you killed.", next = "BACK", reply = "Aye, ye're right, an' Tiza says the same, but every hour I lie here is an hour Narm's holdin' them off alone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There were more o' them than there were o' me, which is the usual way o' things wi' Dark Irons. If ye go south o' Helm's Bed Lake, keep yer shield up an' yer back tae a rock, for they come from every side at once." } },
      choices = {
        { text = "Then I'll go south and stand where you stood.", next = "BACK", reply = "Bless ye. Keep yer back tae a rock, mind, for they come at ye from three sides, an' the fire comes from the fourth.", fx = { align = { honor = 1 } } },
        { text = "I'll wait till they scatter, then strike from behind.", next = "BACK", reply = "Ha, that's a Dark Iron's own trick, an' they'll no' be expectin' it from a dwarf, so it might just work.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dark Irons, more than there should be, diggin' at somethin' an' guardin' it close, an' I got near enough tae count them before they counted me. A hunter wi' a long rifle could watch from the ridge an' never come within reach o' their axes, which is the part I got wrong." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dark Irons, more than there should be, diggin' at somethin' an' guardin' it close. Yer {pet} would smell them before ye saw them, for Dark Irons stink o' forge smoke an' sulphur." },
      },
      choices = {
        { text = "I'll watch from the ridge and report what I see.", next = "BACK", reply = "Narm will thank ye. A report is what we need before we go back in wi' enough axes tae bring him home.", fx = { align = { order = 1 } } },
        { text = "From the ridge, I could pick off their guards.", next = "BACK", reply = "Ha, that'd give them somethin' tae think about, an' I'd buy ye a pint for every guard ye drop, but find Narm first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Narm an' I went spyin' on the Dark Irons there, an' we werenae quiet enough, so Narm held them off while I ran. A proper scout might have brought us both home walkin', an' I think about that every night." } },
      choices = {
        { text = "I'll scout for any patrol that needs me. Count on it.", next = "BACK", reply = "Bless ye, an' if ye'd been wi' us, Narm might be home now, so I'll be countin' on ye next time we go south.", fx = { align = { honor = 1 } } },
        { text = "I'll scout for whoever pays best, Muiredon.", next = "BACK", reply = "Fair enough, but there's no' much coin in a wounded paladin's purse, so ye'll have tae settle for my thanks an' a pint.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd be lyin' if I said I didnae, but Tiza tells me hate's a poor thing tae build a life on. I'll settle for wantin' them gone from Helm's Bed Lake, an' leave the rest tae the Light." } },
      choices = {
        { text = "Tiza's right. Justice is better than vengeance.", next = "BACK", reply = "Aye, she is, an' she's usually right, though I'll admit I'd still like tae see a few Dark Irons fall in the lake.", fx = { align = { light = 1 } } },
        { text = "Hate's a fine thing to build on when it's earned.", next = "BACK", reply = "Dinnae say that in front o' Tiza. Besides, I'd rather build on Narm comin' home than on hatin' the ones who took him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That they fight dirty an' they fight hard, an' they'll no' give ya the courtesy o' a fair fight. I went at them the honest way, all hammer an' oath, an' look where it got me, flat on my back wi' a priest sewin' my side." } },
      choices = {
        { text = "I'll still fight them fairly, because that's what makes us different.", next = "BACK", reply = "Aye, it does. Bring a few friends, though, for honest an' alone is what got me these stitches.", fx = { align = { honor = 1 } } },
        { text = "Then I'll fight them their way. Honour can wait.", next = "BACK", reply = "Ha, I'll no' tell Tiza ye said that, but I'll admit I lay here last night wishin' I'd thought o' it before they did.", fx = { align = { honor = -1 } } },
        { text = "Something else, Muiredon.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd fight the Dark Irons beside a trogg wi' a frying pan if it meant gettin' Narm back, an' I'd thank it after. Tiza would have words wi' me for sayin' so, but she's no' the one lyin' here wi' stitches." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd fight the Dark Irons beside a trogg wi' a frying pan if it meant gettin' Narm back, an' I'll say the same o' that thing at yer heel, though it's a mercy Tiza's no' here tae see it by my bed. She'd have words wi' me for sayin' so, but she's no' the one lyin' here wi' stitches." },
      },
      choices = {
        { text = "Tiza's right. A paladin should choose his allies.", next = "BACK", reply = "She usually is. I'd still thank the trogg, frying pan an' all.", fx = { align = { order = 1 } } },
        { text = "Good. In a fight, an ally is an ally.", next = "BACK", reply = "That's my thinkin' too, an' I'm glad o' it, for Narm's waitin', an' I'll take any help that gets me tae him.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Tiza's lot, are ya? Then ye'll know she'll have ya walkin' further than ya want, an' ye'll thank her for it after, same as I did." },
        { id = "h_default", text = "Muiredon Battleforge, Tiza's husband, an' presently the Hall's favorite pincushion. My friend Narm an' I had a wee disagreement wi' some Dark Irons, an' they won the first round." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity"), class = "PALADIN" },
          text = "Tiza's sent ya tae hear it from me, has she? Then sit, an' I'll tell ya the whole of it, about me an' Narm an' the Dark Irons." },
        { id = "h_symbol2", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "Narm needs help, an' I'll no' rest till he gets it, though the priest says I'll rest whether I like it or no'. Take the Symbol south o' Helm's Bed Lake, an' hurry." },
        { id = "h_narm_back", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Ya brought him back! Narm Faulk, breathin' an' complainin', an' I've no' stopped grinnin' since I heard. Tiza's o'er there beamin' at ya; get on o'er an' let her." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "If ya've a spare prayer, I'd no' say no; this priest's very good, but she's got a heavy hand wi' the needle." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, is it? I could have used yer light feet south o' Helm's Bed Lake, an' so could Narm." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've seen what yer fire does tae Dark Irons, an' I'll admit I took some pleasure in it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! I'd stand, but the priest says if I move again she'll sew my mouth shut as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll have sharp eyes, an' I could have used a pair when I went spyin' south o' Helm's Bed Lake." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll no' have any leaves that'd stop these stitches itchin', would ye? I'm askin' for a friend, an' the friend is me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Dinnae mind me, I'm only half-stitched, but if yer servant could keep its claws away from the bandages I'd be grateful." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! If ye've any healin' waters, I'll take them, for the priests have run out o' patience wi' me, if no' o' prayers." },
      },
      again = {
        { id = "h_again", text = "Wut else? I'm no' goin' anywhere, as ya see." },
        { id = "h_again2", text = "Go on, ask. Talkin' takes me mind off the needle." },
      },
      choices = {
        { text = "Where did you run into these Dark Irons?", next = "lake" },
        { text = "Tell me about Narm.", next = "narm" },
        { text = "You look badly hurt.", next = "hurt" },
        { text = "Let me pray over those wounds.", next = "pray", when = { class = "PRIEST" } },
        { text = "Tell me how to fight the Dark Irons, Muiredon.", next = "fight", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "What happened south of Helm's Bed Lake?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you hate the Dark Irons, Muiredon?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How did the Dark Irons get the better of you, Muiredon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What did you see south of Helm's Bed Lake, Muiredon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What did the Dark Irons teach you, Muiredon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Dark Irons gave you those wounds, I'd guess.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you fight Dark Irons beside a warlock, Muiredon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did the Dark Irons call on fire against you, Muiredon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Mend well, Muiredon.", next = "END" },
      },
    },
    lake = {
      lines = {
        { id = "la_default", text = "There's a band o' Dark Irons dug in south o' the lake, an' Narm an' me reckoned they were plannin' mischief. So we crept up close, close enough tae watch their leader barkin' orders." },
      },
      choices = {
        { text = "What were they after?", next = "lake_after" },
        { text = "You ought to have reported back first.", next = "lake_why" },
      },
    },
    lake_after = {
      lines = {
        { id = "lf_default", text = "Papers o' some kind, writin's they guarded close, an' a commander mindin' them. The Senate wants proof they're even there, an' I've got the proof in me ribs, but they'll want somethin' wi' a seal on it." },
      },
      choices = {
        { text = "The Senate should act on your word alone.", next = "BACK", reply = "I'd like tae think so, but the Senate's been burned by dwarves wi' good stories before, so I'll get them their proof somehow.", fx = { align = { order = -1 }, affinity = 1, learn = { "dark_iron" } } },
        { text = "The Senate is right to want proof.", next = "BACK", reply = "It is, an' I cannae fault them. I'll find a way tae bring them somethin' they can read wi' their own eyes.", fx = { align = { order = 1 }, learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake_why = {
      lines = {
        { id = "lw_default", text = "Because we're daft, an' because it was a chance. We dropped a few o' them, but they fought harder than we'd bargained for, an' then their friends came at us from behind." },
      },
      choices = {
        { text = "It was brave, and worth the risk.", next = "BACK", reply = "Thank ye, for I've been tellin' myself the same thing all week, an' it's nice tae hear it from somebody else.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "It was reckless, and Narm paid for it.", next = "BACK", reply = "He did, an' I'll carry that till the day he walks back intae this Hall, so I'll no' argue wi' ye, I'll only go back for him.", fx = { align = { honor = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    narm = {
      lines = {
        { id = "na_default", text = "Narm Faulk, a paladin jus' like Tiza, an' the best friend a dwarf ever had. When they jumped us, he told me tae run an' get help, so I ran, an' I'll be ashamed o' that till he's standin' in front o' me." },
      },
      choices = {
        { text = "You did what he asked.", next = "narm_asked" },
        { text = "A friend doesn't leave a friend.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    narm_asked = {
      lines = {
        { id = "nk_default", text = "Aye, I did, an' that's wut I tell meself at night. It helps a wee bit, an' Tiza helps more, an' a young paladin wi' the Symbol o' Life would help most o' all." },
        { id = "nk_done", when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Aye, an' he's alive tae say so himself now, which he does, often. He says he'd do it again, an' I've told him I'd rather he didnae." },
      },
      choices = {
        { text = "I'll go to him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = {
        { id = "hu_default", text = "Ach, it's only holes, an' holes close. The priest says I'll be up an' about in a week if I stop tellin' the story wi' me arms." },
      },
      choices = {
        { text = "Then stop waving your arms.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would ya? Go on, then, an' I'll keep still, which is a thing I'm very bad at." },
      },
      choices = {
        { text = "The Light mends what hands cannot.", next = "pray_after", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Prayer helps, but the stitches are doing the work.", next = "pray_after", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    pray_after = {
      lines = {
        { id = "pf_default", text = "Ooh, that's warm. That's better than the tea, an' don't tell the priest I said so; she makes the tea." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "Ha! Don't let them pick the ground, for they always pick ground ye cannae see the end of. An' when one o' them starts chantin' fire, hit him first, because it's always the chanter that gets ye." },
        { id = "fi_paladin", when = { class = "PALADIN" },
          text = "Don't let them pick the ground, an' don't stop tae heal me if I'm lyin' in it, which is a lesson Tiza's still angry I learned. Hit the chanters first; it's always the chanter that gets ye." },
      },
      choices = {
        { text = "Hit first, ask questions later. I like it.", next = "BACK", reply = "Ha, I knew I'd like ye, an' ye'll do well against the Dark Irons, so long as ye remember tae hit the chanter first.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll give them a fair fight anyway.", next = "BACK", reply = "Then ye're braver than me, an' ye'll be more bruised. Bring a priest, for they'll no' return the favour.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've been lyin' here a week listenin' tae everyone, so I know a fair bit. Wut d'ya want tae hear?" } },
    background = { { id = "tp_bg", text = "Tiza's husband an' Narm's friend, an' that's about all anyone needs tae know about ol' Muiredon." } },
    advice = { { id = "tp_ad", text = "Don't go peekin' at Dark Irons wi' only two o' ya. Take five, an' a priest." } },
    dark_iron = { { id = "tp_dark_iron", text = "South o' Helm's Bed Lake, wi' a leader an' some writin's they guard close. I've the holes tae show for it.", next = "lake" } },
    scourge = { { id = "tp_scourge", text = "I've only fought Dark Irons, an' look at me, so I'll leave the walkin' dead tae braver dwarves. Narm says they dinnae flinch at a hammer, an' Narm's never wrong about hammers." } },
    holy_light = { { id = "tp_holy_light", text = "The Light kept me breathin' long enough fer this priest tae stitch me up, an' I've thanked it twice already this mornin'. I'll thank it again when she's done." } },
    stromgarde = { { id = "tp_stromgarde", text = "Narm an' I spent a season at Refuge Pointe, an' Stromgarde's soldiers fight like they've nothin' left tae lose, because they don't. I'd go back wi' him tomorrow, once we're both on our feet." } },
    _none = { { id = "tp_none", text = "Couldnae tell ya, friend. I've been lyin' here gettin' stitched, no' readin' the news." } },
  },
}

-- Bink: gnome mage trainer; befriend a mage; sends seasoned mages to Tabetha.
P:NPC {
  key = "bink", id = TODO_NPC("Bink"), name = "Bink", title = "Mage Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "friendly" },
  notices = { "class" },

  impression = {
    first = "She says a mage's sleeves are always full of tricks.",
    third = "{name} met Bink, a quick-talking gnome mage trainer in the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_advice", text = "Well met! Here's free advice, and I've run the numbers on it: make friends with a mage, because our sleeves are absolutely full of tricks, and roughly a third of them work as intended." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Come in, come in, mind the frost on the floor; that was a demonstration." },
  },

  notice = {
    { id = "n_human_mage", cat = "class", when = { class = "MAGE", race = "Human" },
      text = "Trained in Stormwind? You've that tower-mage way of standing, as if someone might ask you to recite. Relax, nobody recites here; we're far too busy blowing things up." },
    { id = "n_gnome_mage", cat = "class", when = { class = "MAGE", race = "Gnome" },
      text = "A gnome mage, and a tidy one! Most of us arrive singed. You must be very careful, or very lucky, and either is fine by me." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, wandering over from the quiet side of the Hall! You lot have the nice benches, you know. We keep setting ours on fire." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Nothing alike, which is a relief and a worry. Mine come from the arcane, measured and formulaic and occasionally on fire. Yours apparently come from asking the fire itself, and I've no idea how to put that out if it disagrees, so I've added a third bucket, just in case." } },
      choices = {
        { text = "I'll never ask fire for more than it would give freely.", next = "BACK", reply = "Oh, that's very wise, and very polite to the fire, which I suspect it appreciates, since mine has never once said thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it disagrees, I'll make it agree, Bink.", next = "BACK", reply = "Oh dear, that's exactly how my third-year students talk, and they're the ones whose eyebrows I keep sweeping up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not at all, because mine comes from study and yours comes from, well, trees, as far as I can tell. I mean that respectfully, mostly, since your trees seem to know what they're doing." } },
      choices = {
        { text = "The arcane nearly destroyed my people. Use it with great care.", next = "BACK", reply = "I know, I know, and I've read the histories, which is why I check my formulas twice and keep a bucket by the door.", fx = { align = { order = 1 } } },
        { text = "Magic is magic. Study and nature can share a road.", next = "BACK", reply = "That's lovely, and I agree, and I'll happily walk that road with you, so long as you keep the trees from glaring at my books.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because my students set things on fire, and warriors are very good at standing between fire and everything else. Also, every mage should learn to stand behind a warrior, for there's no spell as reliable as a big shield." } },
      choices = {
        { text = "I'll hold the line while the mages work.", next = "BACK", reply = "Splendid, and my students will thank you, though they'll probably also set your cloak on fire, so stand slightly to the left.", fx = { align = { order = 1 } } },
        { text = "Mages should learn to take a hit themselves.", next = "BACK", reply = "That's very fair, and I've tried teaching it, but the mages mostly learn to take a hit by watching the warriors do it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We both hate being hit, we both fight from far away, and we both panic slightly when something gets close. The difference is, you have a beast to hide behind and I have a frost nova, and I'd call that about even." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "We both hate being hit, we both fight from far away, and we both panic slightly when something gets close. Your {pet} is lovely, by the way, and I promise I'll never turn it into a sheep, unless it's very rude." },
      },
      choices = {
        { text = "Distance is wisdom. We agree on that, Bink.", next = "BACK", reply = "Exactly! The warriors keep telling me to stand still, which is very bad advice when something is trying to eat you.", fx = { align = { order = 1 } } },
        { text = "I'd sooner fight up close than hide behind anything.", next = "BACK", reply = "Then you're much braver than I am, and I'll be standing behind you, though I promise to throw something helpful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice this month, and both times they took a scroll on basic water conjuration, which is the most dull thing I own. If you want to learn magic, I'd much rather you asked, and anyway, the good scrolls are warded." } },
      choices = {
        { text = "I'd sooner ask than steal from you, Bink.", next = "BACK", reply = "Oh, thank you, and I'll happily teach you anything you ask, starting with water conjuration, which is very dull but very useful.", fx = { align = { honor = 1 } } },
        { text = "Warded scrolls just need a better thief, Bink.", next = "BACK", reply = "Better, perhaps, but the last one that tried was still covered in purple ink when the guards found him, so do be careful.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly, though Theodrus over on the priests' side keeps warning my students that the arcane leads souls astray, and my students keep setting his robes on fire by accident. I think it's even, but Theodrus doesn't agree." } },
      choices = {
        { text = "Theodrus has a point. Magic without restraint can be dangerous.", next = "BACK", reply = "He does, I suppose, and I'll admit some of my students need restraining, though usually it's from Theodrus's robes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Magic is a tool. Theodrus should leave your students alone.", next = "BACK", reply = "Ha, I'll tell him you said so, but very quietly, because he's been very cross since the last robe incident.", fx = { align = { light = -1 } } },
        { text = "Something else, Bink.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because it sometimes goes where I didn't aim it, and once it went into a paladin's hammer, and he wasn't amused, though I thought it was very pretty. Arcane and the Light aren't so different, you know, if you squint." } },
      choices = {
        { text = "They're very different, Bink. The Light isn't a tool to be squinted at.", next = "BACK", reply = "Oh, I know, and I'd never say so to a paladin's face, but it was very pretty when it went into that hammer.", fx = { align = { order = 1 } } },
        { text = "Maybe they're not so different. Power is power, whoever holds it.", next = "BACK", reply = "That's what I've always thought, but please don't tell the paladin whose hammer I hit, because he's still not speaking to me.", fx = { align = { order = -1 } } },
        { text = "Something else, Bink.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, I like priests, because when my students set themselves on fire, which happens, your sort are the ones who put them out." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a list of paladins who've been very rude about my lightning, and I hope you won't be on it." },
        { id = "h_default", text = "Bink, mage trainer, and the Hall's best argument for keeping a bucket of sand by every door; I've measured, and three buckets is the safe ratio. What can I do for you?" },
        { id = "h_tabetha", tags = { "news" }, when = { questActive = TODO_QUEST("Tabetha's Task") },
          text = "Off to see Tabetha, are we? Her cottage is west of Theramore, past the Stonemaul ruins, and take friends, because Tabetha's errands tend to end in Zul'Farrak." },
        { id = "h_mage_high", when = { class = "MAGE", minLevel = 40 },
          text = "Look at you, all grown up and crackling! There's a colleague of mine in Dustwallow Marsh, Tabetha, who's quarrelling with a troll down in Zul'Farrak, and you might be just the mage to help her win it." },
        { id = "h_gnome_mage", when = { race = "Gnome", class = "MAGE" },
          text = "Oh, another one of us! Every gnome mage who walks into this Hall makes the list a little longer, and I do like a longer list. What can I do for you?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Mystic Ward! You'd be amazed how many of you sneak in here hoping to steal a spell, and how few of you can read the scrolls." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Do stand near the door, would you? It's where I keep the sand, and you look like you'd be good at throwing it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Make friends with a mage, I always say, because we're both very good at keeping things at a distance." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You do realise that if you set the Hall on fire as a bear, it's still my bucket of sand that puts it out?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Please tell me you're better with fire than my students. I've used two buckets of sand already this morning." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, before the frost melts, because I timed it at four minutes and I've already lost two to chatting." },
        { id = "h_again2", text = "Ask away! I love questions; they're like spells that haven't gone off yet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why should I befriend a mage?", next = "friend" },
        { text = "Who's Tabetha?", next = "tabetha", when = { class = "MAGE", minLevel = 35 } },
        { text = "What's it like, gnome mages in a dwarven temple?", next = "hall" },
        { text = "What should I study next, Bink?", next = "study", when = { class = "MAGE" } },
        { text = "I studied in the Mage Quarter of Stormwind.", next = "quarter", when = { race = "Human", class = "MAGE" } },
        { text = "I'd have made a fine mage, once.", next = "lock", when = { class = "WARLOCK" } },
        { text = "Rogues must have tried to steal spells from you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a mage trainer want a warrior nearby, Bink?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do mages and hunters have in common, Bink?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do mages and priests get along in the Hall, Bink?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why are paladins rude about your lightning, Bink?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do mages and druids draw on the same magic, Bink?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are a shaman's flames anything like a mage's, Bink?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Bink.", next = "END" },
      },
    },
    friend = {
      lines = {
        { id = "fr_default", text = "Food that appears out of nowhere, water that's always cold, and a portal home when you're too tired to walk! A mage is the most useful friend in Azeroth, and also the most likely to set your eyebrows on fire." },
      },
      choices = {
        { text = "Magic is a tool like any other.", next = "BACK", reply = "It is, and a very useful one, though I'd ask you not to tell my students, because they already think it's a toy.", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Magic that strong should be handled with reverence.", next = "BACK", reply = "Reverence, yes, and caution too, and I'm very glad you see it, because the last time someone didn't, I lost half my ceiling.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "I'll keep my eyebrows clear.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    tabetha = {
      lines = {
        { id = "ta_default", text = "A mage who lives alone in the middle of Dustwallow Marsh, by choice, among the crocolisks and the black dragons. Rumor says she's quarrelling with a sand troll in Zul'Farrak, and Tabetha doesn't lose quarrels." },
      },
      choices = {
        { text = "I'll go and see her.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = {
        { id = "ha_default", text = "Lovely, mostly! The dwarves pray on that side and we study on this side, and about once a week by my count a fireball goes the wrong way and High Priest Rohan comes over very calmly to ask about it." },
      },
      choices = {
        { text = "The priests can't be pleased about it.", next = "hall_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_mind = {
      lines = {
        { id = "hm_default", text = "Not at all! They heal our burns and we keep their lamps lit with a cantrip, which is the sort of tidy exchange we'd have built a machine for back in Gnomeregan, and my brother Dink says it's the most sensible arrangement in Ironforge." },
      },
      choices = {
        { text = "Faith and study belong under one roof.", next = "BACK", reply = "Exactly, and we'd build a machine for it if we had the parts, though I suspect the priests would want to bless the machine.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A temple is no place for fireballs.", next = "BACK", reply = "No, it isn't, and I've told my students so, but they keep forgetting, and the priests keep forgiving them, which is very kind.", fx = { align = { order = 1 } } },
      },
    },
    study = {
      lines = {
        { id = "st_default", text = "Frost, fire or the arcane itself, and everyone tells you to pick one, but I say learn all three until one of them likes you back. Fire likes nearly everyone, so I keep a bucket of sand by every student." },
        { id = "st_last", when = { origin = "gnome_last_student" },
          text = "Oh, you're the one with the satchel from the old lecture halls! I'd study whatever's in that satchel first, because some of those notes are older than the Kirin Tor's copies, and I'd very much like to borrow them." },
      },
      choices = {
        { text = "Fire, then. Quick and certain.", next = "BACK", reply = "Fire is a splendid choice! I'd keep a bucket of water within arm's reach for the first year, though, and possibly the second.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Frost. Control first, then everything else.", next = "BACK", reply = "Frost is very sensible, and very tidy, and you'll never set a library on fire, which is more than I can say for my fire students.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "What does the arcane offer?", next = "study_arcane" },
      },
    },
    study_arcane = {
      lines = {
        { id = "sa_default", text = "Everything, and a headache with it! The arcane is magic with nothing added, so it's the hardest to learn and the easiest to get wrong, so Dalaran adores it and Ironforge keeps it at arm's length." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    quarter = {
      lines = {
        { id = "qu_default", text = "The Mage Quarter, with the towers and the violet lamps! I visited once and got lost for a day, and I'm told that's how they teach first-years. How do you find our Hall, compared?" },
        { id = "qu_origin", when = { origin = "human_mage_quarter" },
          text = "Grew up under those violet lamps, did you? Then you'll find us very cramped and very loud, and I hope you'll find us good company too, because we're trying." },
      },
      choices = {
        { text = "Your Hall's warmer, Bink.", next = "BACK", fx = { affinity = 2 } },
        { text = "Stormwind's towers teach more discipline.", next = "BACK", reply = "They do, I'm sure. I'd still rather have a little less discipline and a lot more tea, which is what we have here.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Here, nobody minds the odd explosion.", next = "BACK", reply = "Exactly, and that's what I love about it, because in Stormwind they'd have written you up for the very first one.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    lock = {
      lines = {
        { id = "lk_default", text = "I don't doubt it, and it's a shame, if you'll let me say so. The difference between us is only where the power comes from, but that's the difference between a stove and a house fire." },
        { id = "lk_gnome", when = { race = "Gnome" },
          text = "I don't doubt it, and I think I know which stacks you were reading in after Gnomeregan; we all did, a little. I stopped, and you didn't, and I'm not sure which of us was braver." },
      },
      choices = {
        { text = "A stove is too slow for what's coming.", next = "BACK", reply = "Too slow, perhaps, but a stove doesn't burn the house down, and I'd rather be warm than right, if it comes to that.", fx = { align = { light = -1 } } },
        { text = "I'll take care not to burn the house.", next = "BACK", reply = "Thank you! And if you ever want to learn a little stove magic, my door's always open, and so is the biscuit tin.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything twice in this Hall, once from the mages and once from the priests, and they never agree. Here's my half." } },
    background = { { id = "tp_bg", text = "I'm a mage trainer, and a gnome, and I taught arcane theory in Gnomeregan before the troggs gave us all an early recess. I've got a brother called Dink who trains mages too, so yes, we've heard all the jokes." } },
    advice = { { id = "tp_ad", text = "Befriend a mage! And if you are one, befriend a priest, because somebody has to put out the fires." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's the greatest city of mages in the world, and they're rebuilding it, and I'd love to go back. Then again, they'd want to know where I picked up some of my tricks, and I've no intention of telling them." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are stuffy, slow and terribly clever, and they'll tell you so if you sit still long enough. I made a friend of one once, and he still won't lend me his books." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a member of the Kirin Tor before he turned to necromancy, and they don't like to talk about it. I'd not like to talk about it either, if I'd been the one who let him in." } },
    _none = { { id = "tp_none", text = "No idea! But if you find out, come and tell me, because not knowing things gives me a sort of itch, like an unsolved equation." } },
  },
}

-- Milstaff Stormeye: portal trainer; his one canon line doubts your mental acuity.
P:NPC {
  key = "milstaff", id = TODO_NPC("Milstaff Stormeye"), name = "Milstaff Stormeye", title = "Portal Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud", "sharp" }, values = { "proud", "curious" },
  notices = { "class", "lock_shards" },

  impression = {
    first = "He doubted I had the mental acuity to grasp portal magic.",
    third = "{name} met Milstaff Stormeye, the gnome portal trainer of the Hall of Mysteries, who thinks very little of everyone else's.",
  },

  greetings = {
    { id = "g_doubt", text = "Hm. I doubt you possess the mental acuity to grasp portal magic, but go on, say what you came to say." },
    { id = "g_mage", when = { class = "MAGE", minLevel = 40 }, text = "Ah, a mage of some standing, here for portals, I presume. Do try to keep up." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You fold the world with prayers, I fold it with geometry, and only one of us can show his working." },
    { id = "n_young_mage", cat = "class", when = { class = "MAGE", maxLevel = 39 },
      text = "A young mage, and impatient, I expect. Portals begin at forty seasons of study, or the equivalent; come back when you've done the equivalent." },
    { id = "n_lock_infernal", cat = "lock_shards", when = { class = "WARLOCK", carrying = 5565 },
      text = "You're carrying an infernal stone, and I can feel its pull on the ley lines like a stone dropped in a pond. A portal opens a door politely, but that thing knocks a hole in the sky and drops a burning giant through it, and I'd like you to keep it well away from my geometry." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I doubt it, and I'd not recommend trying. A portal needs precise arcane geometry, and the elements are many things, but precise is not one of them. Though I'll admit that when I open a portal to Stormwind, I sometimes feel the stone here shudder, and I've never known whether it was disapproving." } },
      choices = {
        { text = "Keep to your discipline, and I'll keep to mine.", next = "BACK", reply = "Agreed. I'll admit, between us, that the stone has given me one or two readings I can't account for.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe the stone's warning you. Mages meddle too much.", next = "BACK", reply = "Perhaps it is, but the stone has been warning mages for a very long time, and we've yet to see it stop a portal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Considerably, since yours was given to you and mine had to be calculated. I don't mean that as an insult, only as a fact, and facts are rarely polite." } },
      choices = {
        { text = "What is earned through study deserves respect.", next = "BACK", reply = "Thank you, and I'll grant that yours deserves respect too, even if I find the method maddeningly imprecise.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Calculation isn't wisdom. The wild teaches what books cannot.", next = "BACK", reply = "Perhaps not, but it has the advantage of being repeatable, which the wild has never once managed in my presence.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In principle, yes, though in practice the warrior would arrive dizzy and the mage would arrive exhausted, which is a poor start to a battle. Your sort is better served by a gryphon, which asks far less of my patience." } },
      choices = {
        { text = "I'll go the long way, as soldiers always have.", next = "BACK", reply = "Your feet may complain, but your stomach will thank you. Nobody has ever been sick on a road.", fx = { align = { order = 1 } } },
        { text = "A dizzy warrior at the front beats a late one.", next = "BACK", reply = "A fair point, and I'll concede it, though I'd want a healer at the front as well, for the dizziness lasts longer than you think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It could, and it would arrive on the other side in a temper that would take a week to settle. I once had a ram come through with a student, and the ram has not forgiven either of us." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It could, and it would arrive on the other side in a temper that would take a week to settle. Your {pet} looks as though it would bite the first thing it saw over there, which is precisely why I'd rather it walked." },
      },
      choices = {
        { text = "Then my beast and I will walk, thank you.", next = "BACK", reply = "A sound decision. The ram I mentioned would agree, though he's never forgiven anyone for anything, so his opinion carries little weight.", fx = { align = { order = 1 } } },
        { text = "Send us both through. We'll manage the temper.", next = "BACK", reply = "Very well, but I'll expect you to clean up afterwards, because the last ram that came through left a very angry stain.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only if a mage opens it for you, and I'd want to know exactly where you're going and why. A portal isn't a back door, though I've had more than one of your kind ask me to make it one." } },
      choices = {
        { text = "I'll never ask you to make a portal a back door.", next = "BACK", reply = "That's more than most of your sort promise. I'll still ask where you're going, every time.", fx = { align = { order = 1 } } },
        { text = "Every door is a back door if you use it right.", next = "BACK", reply = "Not in my presence, it isn't, and I'll kindly ask you to take your clever phrases somewhere I'm not obliged to listen to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Close enough to worry me, for both tear a hole in the world, and only one of them asks permission of what's on the other side. I've studied the geometry of it longer than you've been alive, so please don't argue it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Close enough to worry me, for both tear a hole in the world, and the proof is standing at your heel, which asked nobody's permission to come through. I've studied the geometry of it longer than you've been alive, so please don't argue it, and please tell your demon to stop examining my runes." },
      },
      choices = {
        { text = "Then I'll respect the difference and keep my circles small.", next = "BACK", reply = "Thank you. I'll still check the geometry of any circle you draw near my tower, of course.", fx = { align = { light = 1 } } },
        { text = "Permission is for the weak. I take what I need.", next = "BACK", reply = "Then I'll take my leave of the conversation, because a mage who talks like that is usually halfway to a very bad end.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Both require focus and both punish carelessness, though a careless prayer only fails, while a careless portal can put you halfway into a wall. I'll grant the priests that their work is harder to measure, but mine is harder to survive." } },
      choices = {
        { text = "Prayer needs humility more than focus. That's the difference.", next = "BACK", reply = "You may have a point. Then again, open a portal badly just once and you'll learn humility very quickly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then prayer and portals are both just disciplines. Neither is holier.", next = "BACK", reply = "I'd agree, though I'll not say so too loudly near the Hall of Mysteries, for the priests have very sharp ears.", fx = { align = { light = -1 } } },
        { text = "Something else, Milstaff.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, and I've never understood why, because a paladin who could open a portal to the front lines would be worth a company of foot soldiers. They say it's not their way, and I say they've never tried, and we've left it there." } },
      choices = {
        { text = "A paladin walks to the battle. That's part of the oath.", next = "BACK", reply = "So they tell me. I'd still teach one if they asked; the front lines would thank them for arriving on time.", fx = { align = { order = 1 } } },
        { text = "Any tool that saves lives is worth learning, Milstaff.", next = "BACK", reply = "At last, a paladin with sense! I'll gladly teach you the theory, though I can't promise you'll grasp it.", fx = { align = { order = -1 } } },
        { text = "Good day, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I doubt you've come to study portal magic, but I'll admit your kind understand discipline, and most of my apprentices couldn't sit still through a single candle's burning." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I very much doubt you've the mental acuity for portals, but I'll admit you've the discipline, which is half the battle." },
        { id = "h_default", text = "Milstaff Stormeye, portal trainer. I teach mages to fold one place onto another to within a hand's width, which is the most difficult thing in this Hall, and I include praying in that." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 40 },
          text = "You've reached the point where walking becomes optional. Portals, then, and do pay attention, because a portal opened carelessly arrives somewhere carelessly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue wanting to know about portals? I doubt you possess the mental acuity, but go on, and keep your hands where I can measure them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock asking about portals, are you? I'll tell you now, I won't teach you to open anything, because your kind's openings have a habit of letting things in, and I've the figures to prove it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I doubt very much that you're here to study portal magic, but do go on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Please do keep any beast you have well away from the portal stones." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'm told your people can step to Moonglade without a single equation, and I find that personally offensive." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I fold space, and you, I'm told, speak to the ground beneath it. One day we'll have to compare which of us gets lost more often." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it a sensible something, with defined terms." },
        { id = "h_again2", text = "Well? I've calculations cooling." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE", minLevel = 40 } },
        { text = "How does a portal work?", next = "how" },
        { text = "A careless portal sounds a dangerous thing.", next = "careless" },
        { text = "Why must I wait for portals?", next = "wait", when = { class = "MAGE", maxLevel = 39 } },
        { text = "The Kirin Tor brought my people to Dalaran.", next = "sky", when = { race = "Skyborne", class = "MAGE" } },
        { text = "Could a rogue ever use one of your portals?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are warlock summonings really like portals?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could a portal carry a warrior to the front, Milstaff?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter's beast pass through one of your portals?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do portals and prayer have anything in common, Milstaff?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins ever study portal magic, Milstaff?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is portal magic harder than a druid's road to Moonglade?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a shaman ever learn to open a portal, Milstaff?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, then.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "ho_default", text = "Imagine the world as a map, then imagine folding the map so two cities touch, then imagine doing it without tearing the map or yourself. You're imagining it wrong, but that's the general idea." },
      },
      choices = {
        { text = "Magic like that should have rules and limits.", next = "BACK", reply = "Indeed it should, and the rules are very strict, which is why I'm so particular about who I teach them to.", fx = { align = { order = 1 } } },
        { text = "Magic should go as far as the mind can take it.", next = "BACK", reply = "It should, and it does, for those with the mind for it, which is precisely why I keep the tower door locked.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Fair. I was imagining it wrong.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    careless = {
      lines = {
        { id = "ca_default", text = "It arrives, usually. Whether all of the mage arrives with it is the interesting part, and I won't tell you about the apprentice who left his boots in Stormwind, because it's still a sore point." },
      },
      choices = {
        { text = "His boots, or his feet?", next = "careless_boots" },
        { text = "Something else.", next = "BACK" },
      },
    },
    careless_boots = {
      lines = {
        { id = "cb_default", text = "Just the boots, thank goodness, though he did walk home along the tram in his stockings. I tell every student that story, and they all laugh, and then they all check their feet." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wait = {
      lines = {
        { id = "wa_default", text = "Because a portal holds two places at once, and at your present stage you can barely hold one. Come back when your teleports stop arriving a foot above the floor, and then we'll talk." },
        { id = "wa_gnome", when = { race = "Gnome" },
          text = "Because a portal holds two places at once, and you are presently still learning to hold one, however clever you are. A foot above the floor is a long way for a gnome to fall, so practice your teleports first." },
      },
      choices = {
        { text = "I'm readier than you think, Milstaff.", next = "BACK", reply = "We'll see, and I'll be delighted to be proven wrong, though I'll admit it doesn't happen very often.", fx = { align = { order = -1 } } },
        { text = "I'll be patient and practice.", next = "BACK", reply = "Patience in a young mage? How unusual. Come back when you're ready, and I'll test you properly.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    sky = {
      lines = {
        { id = "sk_default", text = "So I'm told, to the Sky Enclave, and the Kirin Tor are very pleased with themselves about it. I'd like to know how a people folds an island into the Plane of Air, but I suspect you'd like to know that too." },
      },
      choices = {
        { text = "The winds did it, not us.", next = "BACK", fx = { affinity = 1 } },
        { text = "Our magisters were masters of more than portals.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a vast amount, most of it beyond you. Here is the part that isn't." } },
    background = { { id = "tp_bg", text = "I teach portal magic in the Hall of Mysteries. Before that I studied portal magic in Gnomeregan, and before that I wanted to study it, so you see the pattern." } },
    advice = { { id = "tp_ad", text = "Check where you're going before you go there. You'd be astonished how many people don't." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's portals are the finest ever woven, and I'd wager you wouldn't understand a single strand of them. The Kirin Tor are rebuilding, slowly, which is the proper speed for anything worth doing." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are the only body of mages worth the name, and I've met most of them. They'd find you underqualified, I'm sure, but don't let that stop you trying." } },
    theramore = { { id = "tp_theramore", text = "Lady Jaina's portal work is elegant, I'll admit, though she cuts corners I wouldn't. Theramore's a fine city for a young mage, if you don't mind the swamp." } },
    _none = { { id = "tp_none", text = "That isn't a portal, so it isn't my concern." } },
  },
}
