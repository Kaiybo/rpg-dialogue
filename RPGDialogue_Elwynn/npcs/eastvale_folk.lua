-- More of Eastvale and the farms: Sara Timberlain and Gerard Tiller.
-- Voices: bibles/sara.md, bibles/gerard.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Sara Timberlain: turns Defias bandanas into fine linen, sewing out front where she hears everything.
P:NPC {
  key = "sara", id = TODO_NPC("Sara Timberlain"), name = "Sara Timberlain",
  bible = "bibles/sara.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "steady" }, values = { "ambitious", "witty" },
  notices = { "craft", "red" },
  impression = {
    first = "Sara Timberlain is the only person in the logging camp making anything worth wearing, and she takes thieves' bandanas as cloth without a flicker of shame. I rather admire that.",
    third = "{name} met Sara Timberlain, an Eastvale tailor who turns Defias bandanas into honest clothing.",
  },

  greetings = {
    { id = "g_loom", text = "Careful, that's a warp thread you're standing on." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Linen Goods") }, text = "Have you brought me bandanas? Only the red ones are any use to me, mind." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Linen Goods") }, text = "Hello again, my best supplier of thieves' laundry!" },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Feel this; that's Defias linen, washed twice, and nobody would believe where it came from. That's the beauty of it." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Linen Goods"), left = { max = 2 } } },
      text = "Nearly six, then; I can see the red poking out of your pack from here. Lovely colour, isn't it, though it's a shame about the people inside it." },
  },

  start = "hello",
  nodes = {
    dd_rolf_sara = {
      lines = {
        { id = "dd_rolf_sara_a", text = "He did, and he didn't sleep that night, I'd wager. The lumbermen are nervous about the lake road now, and I've two men who won't haul timber past the water after dark, whatever I pay them." },
      },
      choices = {
        { text = "They're right to be careful. The murlocs are still out there.", next = "dd_rolf_sara2" },
        { text = "Pay them more and they'll find their courage.", next = "dd_rolf_sara2", fx = { align = { light = -1 } } },
        { text = "Fear is fair. I'd not push them, Sara.", next = "dd_rolf_sara2", fx = { align = { light = 1 } } },
      },
    },
    dd_rolf_sara2 = {
      lines = {
        { id = "dd_rolf_sara2a", text = "Well, the timber will wait till morning, and so will I. Thank you for bringing Thomas an answer, because a guard who doesn't know is worse company than one who's grieving." },
      },
      choices = { { text = "Something else, Sara.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not once, no. They took the cloth from honest folk first, and I'm only putting it back to use. Your spirits might call that balance." } },
      choices = {
        { text = "Putting stolen cloth back to use is honest work.", next = "BACK", reply = "That's how I see it, and I'm glad someone agrees. A bandana makes a lovely handkerchief once it's been washed.", fx = { align = { honor = 1 } } },
        { text = "Better to burn it. Don't touch what bandits wore.", next = "BACK", reply = "Burn good linen? You'd have the Abbey after me for waste. I scrub it twice and nobody's the wiser.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I make robes for anyone who pays, but yours I'd make with a double hem, because brimstone eats cloth faster than moths do. The loggers think anyone in a robe is either a priest or trouble, so you'll want to look the respectable sort, at least." } },
      choices = {
        { text = "Make it plain, then. I'll not frighten the loggers.", next = "BACK", reply = "Plain grey, then, and a nice collar, and the loggers will think you're a scribe. That's the sort of respectable I like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Make it dark. Let them think I'm trouble.", next = "BACK", reply = "Dark, with a wide hood, and they'll whisper about you all winter. I'll not stop you, but don't tell them I sewed it.", fx = { align = { order = -1 } } },
        { text = "Something else, Sara.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Linen comes up from the farms, but the forest gives me dye, walnut for brown and elderberry for the purple the folk at the Tower of Azora pay double for. The loggers think I'm mad, picking berries between the stumps." } },
      choices = {
        { text = "Take only the berries, Sara, and let the bushes grow back.", next = "BACK", reply = "I always do, because I want berries next year as well. The bushes and I have an understanding.", fx = { align = { honor = 1 } } },
        { text = "Charge the tower triple. They'll pay whatever you ask.", next = "BACK", reply = "I like the way you think, friend, and so does my purse. They'd likely pay it too, the tower folk.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Padding, mostly, for under the mail, though they never think of it until they've rubbed their shoulders raw. A good quilted gambeson stops more Defias knives than anyone gives it credit for." } },
      choices = {
        { text = "I'll wear the padding and thank you for it.", next = "BACK", reply = "You will, the first time a knife slides off it. Come back and tell me when it happens.", fx = { align = { order = 1 } } },
        { text = "Mail's enough. Padding just slows a fighter down.", next = "BACK", reply = "It slows a fighter less than a knife between the ribs. Come back when your shoulders are raw.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Cloaks in a dull green, so the bears around the camp don't see you before you see them. The loggers won't wear anything but red, and then they wonder why every bear in Eastvale knows where they are." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Cloaks in a dull green, so the bears around the camp don't see you before you see them. And your {pet} has burrs in its coat from the woods, so brush those out before they mat." },
      },
      choices = {
        { text = "I'll wear the green and stay out of their way.", next = "BACK", reply = "Now that's sense, and the bears will never know you're there. Take the darker green, it suits the woods.", fx = { align = { honor = 1 } } },
        { text = "Let the bears see me. They'll learn fast enough.", next = "BACK", reply = "They'll learn, and so will the healer who stitches you up afterwards. Off you go.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "All the time, because every apprentice from the tower comes down the road with a scorch mark somewhere they'd rather not explain. I mend it and don't ask, and the not asking is what they're really paying for." } },
      choices = {
        { text = "Your discretion's worth paying for, Sara. I'll pay fairly.", next = "BACK", reply = "Thank you, friend, and your scorch marks will stay between us. That's what you're paying for.", fx = { align = { honor = 1 } } },
        { text = "Discretion's cheap. I'll mend my own robes and keep my coin.", next = "BACK", reply = "Suit yourself, but I'd like to see you mend a burnt hem with a spell. It'll look worse than the scorch.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not openly, but there's red linen drying on the line behind the mill some mornings, and nobody claims it. I'd tell Marshal Dughan, only I'm fond of the loggers, and I'd hate to find out which of them it belongs to." } },
      choices = {
        { text = "The truth must come out, whoever it touches.", next = "BACK", reply = "It must, I suppose, but I'd hate to be the one who tells it. Maybe you'll find out before I have to.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it be, Sara. A man's past is his own.", next = "BACK", reply = "That's what I keep telling myself, and it's good to hear someone say it. I'll keep my eyes on my needle.", fx = { align = { order = -1 } } },
        { text = "Something else, Sara.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_rolf_sara", when = { questDone = TODO_QUEST("Discover Rolf's Fate") },
          text = "Guard Thomas told the camp what you found at the lake, and the men took their caps off at supper. Rolf used to buy our pine for the bridge posts, and he always paid fair, which is more than I can say for some." },

        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your tabard's been torn and stitched by somebody who didn't know what they were doing, and I can see it from my step." },
        { id = "h_default", text = "I'm Sara Timberlain. The loggers cut wood and I cut cloth, because somebody in this camp has to make something you'd want to wear, even if I cut it from thieves' red bandanas." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Linen Goods") },
          text = "The Defias in Elwynn wear the best red linen I've ever seen, and it's wasted on thieves. Bring me their bandanas and I'll make something honest of them." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Linen Goods") },
          text = "I need six red linen bandanas, not the burlap ones; the Northshire lot wear sacking, and I can't do anything with sacking." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Linen Goods"), days = 3 } },
          text = "A sash and a shirt out of six thieves' bandanas. If any of them come asking for their linen back, send them to me." },
        { id = "h_thread", when = { metBefore = true }, text = "I ran out of blue thread halfway through a hem and finished it in brown. Nobody's noticed, and you didn't either until I told you." },
        { id = "h_sit", when = { timesTalked = { max = 1 } },
          text = "Sit, if you like. Don't mind the needle; I can sew and listen at once. Most of this camp's news comes past my front step." },
        { id = "h_woodsman", when = { origin = "human_eastvale_woodsman" },
          text = "Look who's come down out of the pines with a bow instead of an axe! Your old crew still asks after you at the camp, and still says you were wasted on felling." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and in a robe that's seen some road. If you've singed the hem, I can match the cloth, though I can't promise the color will forgive you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and your tabard's frayed at the hem from all that swinging. I could fix it, if you held still long enough." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be wanting pockets, and plenty of them, because your sort always do." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Kaldorei, by the ears, and that leather's never seen a tanner's vat unless I'm much mistaken. Nobody in Eastvale stitches like that, so I'd love to know who did." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Those robes of yours have seen better days, and so have the hems, which I'd guess have been near something hot." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I make clothes out of bandit bandanas, so I'm in no position to judge anyone's strange habits. What do you need?" },
      },
      again = {
        { id = "h_again", text = "Go on, I'm listening, and so is the needle." },
        { id = "h_again2", text = "What else? Only mind the thread while you think." },
      },
      choices = {
        { text = "Thomas told you about Rolf's men, then.", next = "dd_rolf_sara", when = { questDone = TODO_QUEST("Discover Rolf's Fate") } },

        { text = "That seems a little grim.", next = "grim" },
        { text = "What makes red linen so good?", next = "cloth" },
        { text = "What news comes past your step?", next = "camp" },
        { text = "I'm a tailor myself.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Robes from thieves' cloth seem wrong for a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "Red's a poor colour for sneaking.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do mages bring you much mending work out here?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warriors ever buy anything from a tailor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What does a tailor make for hunters, Sara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess the Defias come into Eastvale now and then, Sara.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever take cloth or colour from the forest itself?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you make robes for a warlock, Sara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Using the Defias's cloth must trouble you a little, Sara.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep an eye out for red.", next = "END" },
      },
    },

    grim = {
      lines = { { id = "g_default", text = "Grim is leaving good cloth on a dead thief. I'm practical, Supervisor Raelen says, and she says almost nothing nice about anyone." } },
      choices = {
        { text = "Where do the bandanas come from?", next = "grim_where" },
        { text = "Ha. Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    grim_where = {
      lines = {
        { id = "gw_default", text = "From Defias camps tucked all over Elwynn, off the ones you've dealt with, preferably. I don't ask, and they don't complain." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },

    cloth = {
      lines = {
        { id = "c_default", text = "It's dyed deep and woven tight, so somebody in that Brotherhood knows cloth, or stole from someone who did." },
      },
      choices = {
        { text = "The Defias Brotherhood, you mean.", next = "cloth_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_defias = {
      lines = {
        { id = "cd_default", text = "Masons, the talk goes: men who built half of Stormwind and were never paid for it. Builders know good materials, so it's funny where life takes people." },
      },
      choices = {
        { text = "That's not funny.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "masons_wronged" } } },
        { text = "Thieves are thieves.", next = "BACK", fx = { learn = { "defias" }, opinion = { defias = "hardline" } } },
      },
    },

    camp = {
      lines = {
        { id = "cp_default", text = "Sawdust and deadlines, mostly. Supervisor Raelen counts logs, the lads count days to payday, and I count what everyone says on the way past." },
      },
      choices = {
        { text = "Hear anything worth knowing?", next = "camp_gossip" },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },
    camp_gossip = {
      lines = {
        { id = "cg_default", text = "Guard Thomas lost two men up the river, old Marshal Haggard lost his badge to a man in a borrowed tabard, and nobody's seen the Brackwells in weeks." },
      },
      choices = {
        { text = "That's a lot of losing.", next = "BACK", fx = { affinity = 1, learn = { "lost_footmen" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },

    tailor = {
      lines = {
        { id = "t_default", text = "Then here's a secret: wash it twice in cold water and never press red linen hot, because thieves' dye runs if you rush it." },
      },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Why not? The cloth didn't choose who wore it. Bless it if it bothers you, and it'll still be good linen afterwards." },
      },
      choices = {
        { text = "Fair. Cloth can be redeemed.", next = "BACK", reply = "That's how I see it, and it's good to hear it from someone in robes. Bless it if you like, it can't hurt.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's only linen, and blessing it won't change a thing.", next = "BACK", reply = "Then we're agreed on that, at least. It's good linen, blessed or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Isn't it? I've always said so, and that's how you can tell the Defias want to be seen." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sew, and I sit out front so I can see the road. That's all a person needs to know about me." } },
    advice = { { id = "tp_ad", text = "Mend a tear the day you get it. A small hole is a stitch; a week-old hole is a new coat." } },
    defias = { { id = "tp_defias", text = "Dreadful people with excellent taste in fabric. Life's complicated like that." } },
    eastvale = { { id = "tp_eastvale", text = "Eastvale gets sawdust in everything: my thread, my bread and my hair." } },
    _none = { { id = "tp_none", text = "Can I sew it? If not, I've no opinion on it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's costumes are the best stitching I see all year, and I've begged their seamstress for her patterns twice. She says they're a family secret, which means she stole them." } },
    stonemasons = { { id = "tp_stonemasons", text = "Those red bandanas I buy off adventurers came off stonemasons' sons, I'd wager, and that's a waste of good hands. Cutting stone or cutting purses, it's the same pair of hands either way." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron silk used to come down the roads every spring, and now it doesn't come at all. I miss the silk and I'm sorry for the people, and some days not in that order, which I'm not proud of." } },
    prestor = { { id = "tp_prestor", text = "Every lady at court wears whatever Lady Prestor wore the week before, so I watch her gowns closer than the guards do. She favours black, which is very hard to sell to a logger's wife." } },
  },
}

-- Gerard Tiller: farming is thirsty work. Works the Maclure vines, sees plenty, says little.
P:NPC {
  key = "gerard", id = TODO_NPC("Gerard Tiller"), name = "Gerard Tiller",
  bible = "bibles/gerard.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "steady" }, values = { "honest" },
  notices = { "drink" },
  impression = {
    first = "Gerard Tiller talks mostly about water, and the length of the rows, and how far it is to the well. I suspect he notices a great deal more than he ever says.",
    third = "{name} met Gerard Tiller, a thirsty hand on the Maclure vines who sees more than he lets on.",
  },

  greetings = {
    { id = "g_thirst", text = "Got any water on you, friend? Farming's thirsty work out here." },
    { id = "g_again", when = { questDone = TODO_QUEST("Give Gerard a Drink") }, text = "My water-bringer! Have you got any more? I've got apples." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Somebody's had something stronger than water, lucky you, and here's me out here with a hoe and a dry throat." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "There's no trouble, only distance. I carry water down the rows every day, and I notice what's dry and what isn't. Your spirits might like to know that." } },
      choices = {
        { text = "Steady work keeps a farm alive, Gerard. I respect it.", next = "BACK", reply = "It keeps the vines alive and my legs strong, so I'll not complain. Kind of you to notice.", fx = { align = { order = 1 } } },
        { text = "Dig a new well closer, Gerard. Stop walking so far.", next = "BACK", reply = "Dig it with what, and with whose coin? Pa Maclure would sooner see me walk than spend a copper on a shovel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bother me? It's trying to kill me, friend, row by row, and the well's at the far end of the field. If you could call up something that fetches water, I'd not ask what it was, only whether it spills." } },
      choices = {
        { text = "I'd sooner carry the water myself, Gerard.", next = "BACK", reply = "Suit yourself, friend, and I'll be glad of the company on the walk. The pails don't get any lighter.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My imp could fetch it, if you don't mind the smell.", next = "BACK", reply = "I've smelled worse in the bottom rows after a boar's been through. I'll think on it, and I'll not tell Pa.", fx = { align = { light = -1 } } },
        { text = "Something else, Gerard.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Often enough to trample them, and they don't care what they ruin on the way. A fighter walking the rows at dusk would do more good than any scarecrow, though I'd not ask it of you." } },
      choices = {
        { text = "I'll walk the rows at dusk, and mind the vines.", next = "BACK", reply = "That's good of you, and the vines will thank you, though Pa won't. Watch your step near the trellis.", fx = { align = { honor = 1 } } },
        { text = "I'll chase them through, and the vines can grow back.", next = "BACK", reply = "Grow back, says you, after a full season's work. I'll keep my scarecrow, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The crows take the first, and the boars take the rest when they root along the bottom rows. I'd sooner a hunter thinned them than watch another season go into their bellies." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The crows take the first, and the boars take the rest when they root along the bottom rows, so I'd sooner a hunter thinned them. Keep your {pet} out of the rows, though, or it'll chase a crow straight through a trellis." },
      },
      choices = {
        { text = "I'll take the boars cleanly and leave the vines standing.", next = "BACK", reply = "That's what I'd hoped for, and you'd have my thanks. Pa would never say it, but he'd notice.", fx = { align = { honor = 1 } } },
        { text = "I'll take whatever's eating your grapes, trellis or no.", next = "BACK", reply = "Mind the trellis, friend, because Pa will blame me if it comes down. Just take the boars.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice this season, and they take the good grapes from the south rows and leave the sour ones for us. The guards from Stormwind come when they can, but they can't come often, so mostly we just count what's left." } },
      choices = {
        { text = "Then I'll keep watch on your rows tonight, Gerard.", next = "BACK", reply = "You'd do that? I'll leave a lantern by the south rows, then, and a cup of something warm.", fx = { align = { order = 1 } } },
        { text = "Leave the Guard out of it. The Defias need a quieter answer.", next = "BACK", reply = "I'll not ask what you mean by that, and I'll not tell Pa either. Just leave the vines standing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I could, if I had another pair of arms and a back that didn't creak, but a man can only carry so many pails before noon. I know a spell isn't the honest way to water a vineyard, but a thirsty man asks anyway." } },
      choices = {
        { text = "Honest work is slow but sure. Keep carrying those pails.", next = "BACK", reply = "Aye, I'll keep at it, because there's nobody else to do it. Thank you for the encouragement.", fx = { align = { order = 1 } } },
        { text = "If magic can save your back, use it and hang tradition.", next = "BACK", reply = "Hang tradition, aye, and hang Pa's opinion too. If you know a spell for pails, I'll not refuse it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, unless you count the crows. The Defias come through after dark and take what they like, and we stand in the rows next morning pretending not to see the footprints." } },
      choices = {
        { text = "Then I'll stand in the rows tonight, Gerard.", next = "BACK", reply = "You'd do that for a vineyard that isn't yours? Then I'll bring a lantern and a second pair of eyes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hire guards, then. A vineyard should pay for its own safety.", next = "BACK", reply = "Should, aye, but Pa Maclure won't pay for it, and I can't afford it. So we count the footprints.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! All that plate in this sun? You'll be thirstier than me by noon, and I didn't think that was possible." },
        { id = "h_default", text = "I'm Gerard, and I work the vines. The sun's hot, the rows are long and the well's a long walk, so a man could die of thirst out here, slowly." },
        { id = "h_trade", tags = { "news" }, when = { questActive = TODO_QUEST("Give Gerard a Drink") },
          text = "Spring water's the good stuff. Bring me a flask and I'll give you an apple for it, and that's the best trade in Elwynn." },
        { id = "h_lovers", when = { topicKnown = "maybell_tommy" },
          text = "Miss Maybell goes down to the river most evenings, says she's counting grapes, though there are no grapes by the river. I don't say anything, since it's not my business." },
        { id = "h_vines", when = { metBefore = true }, text = "The vines are coming on. Another month and we'll have grapes, if the crows don't find them first. The crows always find them first." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came up the rows without rustling a single vine, which is more than the Defias manage. They trample half of what they steal." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You don't know a spell that makes rain fall on purpose, do you? The well's a long walk and the sun doesn't care." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, out among the vines. Mind your elbows; those rows took me years, and a sword takes them in a second." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in the rows. If you've come for crows, you've come to the right place, and I'll thank you for every one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You wouldn't have a cool drink in that bag, would you, or is it all bones and candles?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. If you can talk the well into being closer to the rows, I'd be grateful. It's a long walk." },
      },
      again = {
        { id = "h_again", text = "What else? Talk slow, it saves water." },
        { id = "h_again2", text = "Go on; the vines aren't going anywhere." },
      },
      choices = {
        { text = "Tell me about the vineyard.", next = "vines" },
        { text = "Apples for water seems a strange trade.", next = "water" },
        { text = "Who's the boy I've seen hanging about?", next = "billy" },
        { text = "Blessings on the harvest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I worked Westfall fields before the Defias came.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Here, have a drink.", next = "BUSINESS" },
        { text = "Your vines are tired, Gerard. I can feel it.", next = "druid", when = { class = "DRUID" } },
        { text = "Have the Defias been taking from your vines too?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can't you simply carry more water from the well?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Defias seem to come into these vines often.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The crows seem to get most of your grapes.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Nobody seems to protect the vineyard workers, Gerard.", next = "xapala", when = { class = "PALADIN" } },
        { text = "The sun out here seems to bother you, Gerard.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is there trouble with the water here, Gerard?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Keep at it, Gerard.", next = "END" },
      },
    },

    vines = {
      lines = {
        { id = "v_default", text = "They're Maclure grapes, in long rows under a hot sun, with crows. The family works hard and pays fair, and they never mention the Stonefields if they can shout instead." },
      },
      choices = {
        { text = "You must be caught in the middle of the feud.", next = "vines_feud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vines_feud = {
      lines = {
        { id = "vf_default", text = "I'm a vine-hand, so I don't have feuds; I have blisters." },
      },
      choices = {
        { text = "Wise.", next = "BACK", fx = { affinity = 1 } },
        { text = "You must have an opinion.", next = "vines_opinion" },
      },
    },
    vines_opinion = {
      lines = {
        { id = "vo_default", text = "I do, and I keep it behind my teeth, because a vine-hand who talks about the family doesn't stay a vine-hand." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    water = {
      lines = {
        { id = "w_default", text = "Spring water's clean and the well's a walk, and I've got more apples than I can eat, so that's trade." },
      },
      choices = {
        { text = "That seems a poor deal for you.", next = "water_deal" },
        { text = "Why not drink from the river?", next = "water_river" },
      },
    },
    water_deal = {
      lines = {
        { id = "wd_default", text = "It's the best deal in Elwynn: you get an apple, and I get to not die. Everybody goes home happy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    water_river = {
      lines = {
        { id = "wr_default", text = "Folk say there's murlocs up the streams to the east. I don't know what murlocs do in water, and I don't want to drink it to find out." },
      },
      choices = { { text = "Fair.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },

    billy = {
      lines = {
        { id = "b_default", text = "The young Maclure? He's mostly harmless and mostly hungry. If something goes missing round here, ask where Billy was playing." },
        { id = "b_necklace", when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Bernice Stonefield thinks Billy took her necklace? I couldn't say, or I could, but I won't." },
      },
      choices = {
        { text = "You know something.", next = "billy_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    billy_know = {
      lines = {
        { id = "bk_default", text = "I know the boy goes up toward the mine when he thinks nobody's watching. I'm a vine-hand, so I'm always watching; I'm just not telling." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kobolds" } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "I'll take any blessing going, and bless the crows away if you can. That's the prayer I'd want." },
      },
      choices = {
        { text = "Light keep the vines, and the man who tends them.", next = "BACK", reply = "That's kindly said, friend, and I'll carry it down the rows with me tomorrow.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll leave the blessings to the Abbey.", next = "BACK", reply = "Suit yourself, though I'd not have said no to a little help with the crows.", fx = { align = { light = -1 } } },
        { text = "The crows have to eat too.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "Then you know what thirsty is, because Westfall dirt's drier than ours. Folk come past on the road looking like they haven't had water in a week." },
      },
      choices = {
        { text = "Most haven't.", next = "BACK", fx = { affinity = 1, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "druid_l", text = "Feel it? Well, you're not wrong, though I'd not have said it like that. Three seasons of sour water and no rest for the soil, and they're giving what they can." } },
      choices = {
        { text = "Let one row rest a season. They'll thank you.", next = "druid2", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The land gives what it's given back.", next = "druid2", fx = { trait = { stern = 1 } } },
      },
    },
    druid2 = {
      lines = { { id = "druid2_l", text = "My father said much the same, and I didn't listen to him either. I'll think on it, friend; an elf telling me about vines is a new one, but I've heard stranger in Eastvale." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a vine-hand on Maclure vines for Maclure wages, and that's me, top to bottom." } },
    advice = { { id = "tp_ad", text = "Carry water, more than you think you'll need, and then a bit more." } },
    maybell_tommy = { { id = "tp_lovers", text = "I see things from the vines, but I don't say things, and that's how a vine-hand keeps his job." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Have you got any water?" } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I'd like to go to the Faire when it's at Goldshire, but the Maclures don't stop picking for jugglers. Maybe when I'm old and they've stopped needing me." } },
    holy_light = { { id = "tp_holy_light", text = "I say my prayers to the Light at night, and I ask for rain and fewer kobolds. Some years I get one of the two, and I'm grateful for it." } },
    varian = { { id = "tp_varian", text = "I don't know much about kings, but a vine-hand knows when the master's away, because everybody gets slack. The roads feel like that to me now." } },
  },
}
