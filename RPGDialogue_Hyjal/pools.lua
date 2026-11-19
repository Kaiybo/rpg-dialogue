-- Mount Hyjal's unnamed folk: the sentinels, wardens and watchers on the slopes, the druids and
-- tenders healing the mountain, and the traders who came up through Darkwhisper Gorge.
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_hyjal", role = "guard", zone = "Mount Hyjal",
  barks = {
    { id = "b_quiet", text = "Not one owl calling on the ridge tonight. When the owls shut up, I string my bow." },
    { id = "b_gorge", text = "Another pack came up through the gorge this morning, and not all of them came up whole." },
  },
  greetings = {
    { id = "g_default", text = "Keep to the paths, stranger. The mountain is still healing from the Legion's fire, and so is my knee." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Ishnu-alah, friend of the Alliance. Mind your step on the slopes." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You may pass, since your people bled here too, but you will be watched." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Welcome home, {g:brother|sister}. It is good to see our own on the mountain again." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Something foul just walked onto the sacred mountain. Keep whatever follows you close and your hands still, or I will see to both." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. If you are going toward Mourning's Rest, your prayers will be needed more than my bow." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Druid, the Talon have been asking for help with the slopes. Find Thisalee, if she stays still long enough." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You came through Darkwhisper, by the look of you. Rest before you go further; the demons in there aren't the worst of it." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Step out where I can see you. Things that hide on this mountain get shot." } },
  lines = {
    { id = "l_default", text = "For years nobody walked these slopes but us and the druids. Now the gorge is open, and every week brings more strangers up it, and I can't decide if that's a blessing." },
    { id = "l_tree", text = "Look up at the summit, toward the tree. It's still scarred black at the crown, but there's green coming back, a little more every season." },
    { id = "l_daegun", text = "Stay out of Dae'gun unless you're looking for a fight. The demons that fled after the battle went to ground there, and they've had years to get comfortable." },
    { id = "l_mourning", when = { subzone = "Mourning's Rest" }, text = "This is where the defenders camped, during the battle. Now the dead get up at night and wander, and I'm not ashamed to say I keep my back to a tree." },
    { id = "l_shrine", when = { subzone = "Shrine of Aviana" }, text = "Lower your voice near the shrine. Aviana rests close by, and the birds here are hers." },
    { id = "l_felblood", when = { subzone = { "Felblood Scar", "Tainted Foothills" } }, text = "The fel ran thickest down these slopes when the Legion came. Don't drink from anything here, and don't touch the brambles." },
    { id = "l_malorne", when = { subzone = "Malorne's Retreat" }, text = "The furbolgs in the caves here won't talk, only fight. Something has soured them, the same as the brambles." },
    { id = "l_yashiro", when = { questDone = TODO_QUEST("Yashiro's Windwalk") }, text = "The doomguard Yashiro was hunting in Dae'gun is dead, they say, and you were there for it. The patrols near Dae'gun are breathing easier." },
    { id = "l_human", when = { race = "Human" }, text = "Humans fought beside us here, when the Legion came. I've not forgotten it, even if Ashenvale makes it hard to remember." },
    { id = "l_horde", when = { faction = "Horde" }, text = "Ashenvale is Ashenvale, and Hyjal is Hyjal. Here we hold our arrows unless you give us cause." },
  },
  choices = {
    { text = "I'll watch the paths too.", next = "END", fx = { affinity = 1 } },
    { text = "Stay safe.", next = "END" },
  },
  topics = {
    malfurion = { { id = "t_malf", text = "The Shan'do sealed this mountain so it could heal. We keep it for him while he sleeps in the Dream." } },
    burning_legion = { { id = "t_bl", text = "They're beaten, not gone. Look in the gorge or in Dae'gun if you doubt me." } },
    sentinels = { { id = "t_sent", text = "We watch the slopes as our sisters watch Ashenvale, though up here the enemy is older." } },
    furbolgs = { { id = "t_furb", text = "Keep away from the caves by Malorne's Retreat. Whatever tribe that was, it's lost its mind." } },
    _none = { { id = "t_none", text = "That's no business of the watch. Ask the druids; they talk more than we Sentinels do, and remember longer." } },
  },
}

P:Pool {
  id = "citizen_hyjal", role = "citizen", zone = "Mount Hyjal",
  greetings = {
    { id = "g_default", text = "Elune's peace on the mountain, traveller. Mind the saplings; they're younger than they look, and their roots run back to Nordrassil." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune's light on you. The moon sits close to the summit tonight." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Come and lend a hand with the growth on the lower slopes; there's always more of it than there are of us." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, up on Hyjal. The wounded from Dae'gun could use you, and so could the dead at Mourning's Rest, in a different way." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your beast from the nests, hunter. The Talon are very particular about their owls." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Please, keep that darkness away from the saplings. They have had enough of shadow." },
  },
  lines = {
    { id = "l_default", text = "We're mending what the war broke, one slope at a time. My hands are so full of thorns I've stopped bothering to pick them out." },
    { id = "l_weeds", text = "The brambles drank the fel when it fell, and now they choke everything. Thylaen has the right idea: cut them out at the root." },
    { id = "l_gorge", text = "I never thought I'd see strangers walking up from Winterspring. The gorge was the Legion's for years, and now there's a path through it." },
    { id = "l_coalescence", when = { class = "MAGE" }, text = "You feel the old magic, don't you? There's a shrine to the east where it gathers, the Shrine of Coalescence; I'd not linger there." },
    { id = "l_feathers", when = { questActive = TODO_QUEST("Feathers in Flight") }, text = "Gathering owl feathers? Take the ones from the nests and leave the birds be, and nobody here will mind." },
    { id = "l_owls", when = { faction = "Alliance", questBefore = TODO_QUEST("Feathers in Flight") }, text = "The fletcher's always short of feathers. The white owls nest in the valley to the south, and they shed plenty." },
  },
  choices = {
    { text = "I'll help where I can.", next = "END", fx = { affinity = 1 } },
    { text = "Good luck with the work.", next = "END" },
  },
  topics = {
    cenarion_circle = { { id = "t_cc", text = "The Circle sends who it can, though never as many as the mountain needs." } },
    malfurion = { { id = "t_malf", text = "He sleeps in the Dream, and the tree mends while he sleeps. That's what we're told, and I choose to believe it." } },
    _none = { { id = "t_none", text = "I only tend the growth. Ask one of the Talon; they see the whole mountain from above, as the Ancients once did." } },
  },
}

P:Pool {
  id = "vendor_hyjal", role = "vendor", zone = "Mount Hyjal",
  greetings = {
    { id = "g_default", text = "Supplies, fresh up from Everlook, or as fresh as anything gets after the gorge." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You'll want a smith more than a trader, by the look of that armour, but I can at least sell you a bandage." },
  },
  lines = {
    { id = "l_default", text = "Everything up here came through the snow on somebody's back. You're not paying for the goods; you're paying for the walk." },
    { id = "l_lotus", when = { profession = { name = "Herbalism", min = 300 } }, text = "Herbalist, are you? They say there's a lotus on this mountain that only shows itself to the right kind of gloves. I've never seen one, and I've looked." },
    { id = "l_thorium", when = { profession = { name = "Mining", min = 275 } }, text = "If you've a pick, the thorium in these rocks is the richest I've heard of, and sometimes it comes up with a green crystal in it that I wouldn't hold for long." },
  },
  choices = { { text = "Let's see what you have.", next = "BUSINESS" } },
  topics = {
    trade = { { id = "t_trade", text = "Azzleby's caravans, when the Winterfall don't get to them first. Last month they ate a whole crate of candles, wicks and all, so prices go up." } },
    _none = { { id = "t_none", text = "I sell things, friend. Knowing things costs extra, and I don't stock it." } },
  },
}
