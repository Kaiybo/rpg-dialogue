-- Milly Osworth, Northshire Vineyards (her wagon is by the Abbey stable). Voice: bibles/milly.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "milly", id = TODO_NPC("Milly Osworth"), name = "Milly Osworth",
  bible = "bibles/milly.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "drink", "farmhand" },
  impression = {
    first = "Milly Osworth works the Abbey's vineyard with sticky hands and a short temper for the Defias who took it over. She counts her lost harvest in weeks of bread.",
    third = "{name} met Milly Osworth, whose harvest for Northshire Abbey was carried off by the Defias.",
  },

  greetings = {
    { id = "g_vines", text = "Mind the vines!" },
    { id = "g_crates", when = { questActive = TODO_QUEST("Milly's Harvest") }, text = "Have you any crates for me? Even a few would help." },
    { id = "g_thanks", when = { questDone = TODO_QUEST("Milly's Harvest") }, text = "There's my harvest hero. Mind the vines all the same." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "Is that our wine on your breath? At least you've good taste." },
    { id = "n_farmhand", cat = "farmhand", when = { origin = "human_westfall_farmhand" },
      text = "You've worked a harvest. I can tell by the way you stand around a crate." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "You could, if you can tell a grape from a bandit when they're all in the same row. The Defias have my crates in their camp, and I want every one of them back, so freeze the thieves and leave the fruit alone." } },
      choices = {
        { text = "I'll bring back every crate, Milly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll clear the bandits first. The grapes come second.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Milly.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They trampled the north rows and cut whole branches for kindling, the brutes, because they couldn't be bothered to find dead wood. Vines that old take years to come back, and I'll be counting every one of them." } },
      choices = {
        { text = "Then they'll answer for every vine, by the Marshal's law.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll drive them out myself, and the Marshal can wait.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many to count from the fence, and they've set a camp right on my grapes. They're not soldiers, but they've knives and they don't fight fair, so watch the ones you can't see." } },
      choices = {
        { text = "I'll take my harvest back, row by row.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll burn their camp out, grapes and all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Through the north rows, where the vines are thickest. They watch the road and not the grapes, and I've crept past them myself to see what they'd taken, though I'd not do it twice." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And bring your {pet}. If it barks, they'll think it's a stray, and they won't look twice." },
      },
      choices = {
        { text = "I'll go quietly and take back only your crates.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go quietly and leave nobody standing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A rogue could slip into their camp and take back what's mine without the whole vineyard catching fire, which is more than the guards can promise. I don't care how it's done, so long as my grapes come home." } },
      choices = {
        { text = "I'll bring back your grapes, Milly, and take nothing else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring back your grapes and whatever else they have.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd accept a gnoll's help if it brought my harvest back, though I'd count my fingers after. The Brothers would tell me to be careful who I trust, and I'll be careful, after the grapes are home." } },
      choices = {
        { text = "Trust carefully, Milly. I'll earn yours honestly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Desperate folk can't be choosy. Take whatever help comes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "The Defias walked in like they owned the place and now they mostly do. My harvest's sitting in their camp." },
        { id = "q_harvest_active", when = { questActive = TODO_QUEST("Milly's Harvest") },
          text = "Every crate you bring back is a week of bread for us. Mind the ones with the knives." },
        { id = "q_harvest_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Milly's Harvest"), days = 2 } },
          text = "You found them! I'd hug you if my hands weren't sticky to the elbow." },
        { id = "q_manifest", when = { questActive = TODO_QUEST("Grape Manifest") },
          text = "Take that manifest to Brother Neals. He'll want to know exactly how much the Abbey's getting, to the last bushel." },
        { id = "o_contradict", tags = { "news" }, when = { contradiction = "defias" },
          text = "You told the Marshal one thing about the Defias and Willem another. Word gets around a valley this small. Which is it?" },
        { id = "e_dughan", tags = { "news" }, when = { heardLine = "dughan.d_common_thieves" },
          text = "Common thieves? Common thieves don't post a guard on a stolen grape crate. You tell Marshal Dughan that from me.",
          fx = { hear = "defias_trained" } },
        { id = "h_willem", when = { questRecent = { TODO_QUEST("Milly Osworth"), days = 1 } },
          text = "Willem sent you? Bless him, he'd come himself if they didn't keep him nailed to the Abbey door, and this trouble's past him anyway." },
        { id = "h_garrick_done", when = { questDone = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "No more Garrick in the shack past my rows. The rest of them are still across the river, mind. But I sleep a bit better." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've the look of someone who knows how the Defias think, and I'll not ask why, so long as you're on my side." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's something about you that makes the vines droop, and I don't like it, but I'll take any help I can get with the Defias." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Then you can carry crates, and you can carry them past the Defias, which is twice what I hoped for." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be quiet, then, and you'll get into the vineyard without them hearing, which is more than the recruits manage." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, out here among the vines? If you can talk to grapes, tell them I'm coming back for them once the Defias are gone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you burn out the Defias in my vineyard? Only, leave the grapes, if you can manage it." },
      },
      again = {
        { id = "h_again", text = "What else? You can talk while I sort these." },
        { id = "h_again2", text = "Go on, my hands are busy but my ears aren't." },
      },
      choices = {
        { text = "Where are your crates?", next = "BUSINESS" },
        { text = "What happened, exactly?", next = "happened" },
        { text = "Why not just leave?", next = "leave" },
        { text = "Who buys your grapes?", next = "abbey" },
        { text = "I worked fields like these, before the Defias came.", next = "farm",
          when = { origin = "human_westfall_farmhand" } },
        { text = "I'll pray the Light watches over your vineyard.", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Could a rogue help you get your harvest back?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you truly accept a warlock's help, Milly?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many Defias are in the vineyard, Milly?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can I come at the Defias quietly through the vineyard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have the Defias hurt the vines, or only stolen the grapes?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a mage help get your harvest back, Milly?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good luck with the harvest.", next = "END" },
      },
    },
    happened = {
      lines = {
        { id = "hp_default", text = "They walked in right in the middle of the harvest. I'd most of the grapes in buckets and crates, and I left them in the rows to the southeast and ran for the guards." },
      },
      choices = {
        { text = "And the guards?", next = "happened_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened_guards = {
      lines = {
        { id = "hg_default", text = "Promised to see to it. Then I lay awake picturing them chasing thugs through my rows in boots. If the Defias don't take the grapes, our own lot will tread them." },
      },
      choices = {
        { text = "I'll step carefully.", next = "BUSINESS", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Grapes over guards? Really?", next = "happened_grapes" },
      },
    },
    happened_grapes = {
      lines = {
        { id = "hgr_default", text = "The guards are paid either way, but the grapes are all I've got. We're short on guards these days, aren't we? Well, we'll not be short on grapes, if I can help it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "Leave? It's my vineyard, and the Abbey's cellar runs on it. The Defias can leave." } },
      choices = {
        { text = "Then I'll help them leave.", next = "BACK", fx = { trait = { brave = 1 }, standing = { northshire = 2 }, affinity = 1 } },
        { text = "No vineyard is worth dying for.", next = "leave_die", fx = { trait = { cautious = 1 }, affinity = -1 } },
      },
    },
    leave_die = {
      lines = { { id = "ld_default", text = "Tell that to Brother Neals come winter, with nothing to pour. I'll not die for it, but I'll not run from it either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    abbey = {
      lines = {
        { id = "a_default", text = "The Abbey buys them. Brother Neals keeps their food and drink, and he counts every barrel twice and tastes it three times.",
          fx = { learn = { "northshire_abbey" } } },
      },
      choices = {
        { text = "Three times?", next = "abbey_neals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abbey_neals = {
      lines = { { id = "an_default", text = "Up the bell tower, where he thinks nobody can see him, though everybody can. He's a dear, mind; he'll bless every bushel and drink half of one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    farm = {
      lines = { { id = "f_default", text = "Then you know. They say Westfall's lost, so don't you let them say it about Northshire." } },
      choices = {
        { text = "I won't.", next = "BACK", fx = { affinity = 2, standing = { northshire = 1 } } },
        { text = "Westfall wasn't lost. It was left.", next = "farm_left" },
      },
    },
    farm_left = {
      lines = { { id = "fl_default", text = "Left, aye, that's the word Willem won't say. Well, nobody's leaving my vines, not while I've a wagon and two good hands.",
        fx = { learn = { "westfall" } } } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, opinion = { defias = "hardline" } } } },
    },
    bless = {
      lines = { { id = "b_default", text = "Ask it to watch the pickers, not the vines. Vines are tougher than we are." } },
      choices = {
        { text = "The pickers, then.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll leave the praying to the Abbey, Milly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tougher how?", next = "bless_root" },
      },
    },
    bless_root = {
      lines = { { id = "bw_default", text = "Vines don't care who's king. Burn the top off and they come back from the root. I like to think we're the same, in Northshire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I grow grapes, the Abbey buys them, and this year the Defias took them. That's my whole story.", next = "happened" } },
    advice = { { id = "tp_ad", text = "Never leave a harvest in the field overnight. I learned that one the hard way, didn't I." } },
    defias = { { id = "t_defias", text = "They took my harvest and my sleep. Ask me again when they give either back." } },
    northshire_abbey = { { id = "t_abbey", text = "The brothers buy our wine. Brother Neals counts every barrel twice." } },
    _none = { { id = "t_none", text = "Grapes I know, but that I don't." } },
  },
}
