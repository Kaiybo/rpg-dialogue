-- Arathi's guards: Stromgarde's last soldiers at Refuge Pointe, and the Horde's guardians at Hammerfall.
local P = RPGDialogueAPI:Pack("rpgd.arathi")

P:Pool {
  id = "guard_refuge", role = "guard", community = "refuge_pointe",
  barks = {
    { id = "xb_ogre", text = "Ogres on the eastern ridge again, and the sergeant says to count them, so I count them, and then I count them again because I hope I was wrong." },
    { id = "b_keep", text = "You can see the keep from the ridge on a clear day. It was ours once, and it'll be ours again, once the quartermaster finds us arrows that don't snap." },
    { id = "b_tents", text = "Tents again tonight, and mine leaks right over my bedroll, so I sleep with my boots on and my feet in a puddle." },
  },
  greetings = {
    { id = "g_pointe", text = "This is Refuge Pointe. It's not much of a town, but it's what Stromgarde has left, so we hold it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The highlands bit you, trolls or ogres by the look of it, so get mended." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Syndicate creep around these hills, so step out where I can see you." } },
  lines = {
    { id = "xl_dwarf", when = { race = "Dwarf" }, text = "Ironforge sent us rifles once, before the Third War. If you're writing home, {g:lad|lass}, tell them we'd take more." },
    { id = "xl_trollbane", text = "Lord Galen's sworn to retake the keep, and every one of us here has sworn it with him, for whatever that's worth to a soldier in a tent." },
    { id = "l_default", text = "The Third War took the keep, but it didn't take us, and we'll be here until Stromgarde is ours again." },
  },
  choices = {
    { text = "What's the worst of it out here?", next = "END", reply = "The waiting, mostly, and the Syndicate arrows that come when the waiting's over." },
    { text = "Stromgarde will rise again.", next = "END", reply = "It will, and I'd like to be alive to see it." },
    { text = "For Stromgarde.", next = "END", fx = { standing = { refuge_pointe = 1 } } } },
  topics = {
    syndicate = { { id = "xt_syn", text = "The Syndicate hold the upper keep. Every week we lose a scout to them." } },
    hammerfall = { { id = "xt_hf", text = "The orcs hold the old camp to the east, and they've long memories of it." } },
    _none = { { id = "t_none", text = "Ask Captain Nials, and she'll tell you, briefly, and probably while she's eating." } },
  },
}

P:Pool {
  id = "guard_hammerfall", role = "guard", community = "hammerfall",
  barks = {
    { id = "xb_stone", text = "These walls were built by human hands to cage us. Now our hands keep them standing, and that is a fine joke." },
    { id = "b_name", text = "This place is named for Doomhammer, so stand up straight in it." },
    { id = "b_trolls", text = "Witherbark drums in the hills again. Let them drum; I've slept through worse snoring in this barracks." },
  },
  greetings = {
    { id = "g_fort", text = "This is Hammerfall. The humans kept orcs in cages here once, and now it's ours." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! Your grandfathers might have stood behind these walls in chains, so remember who broke them." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Someone's creeping by the wall, so show yourself before I put an axe in the shadow." } },
  lines = {
    { id = "xl_human", when = { race = "Human" }, text = "A human, inside Hammerfall. Mind your feet, and remember whose walls these are." },
    { id = "xl_camps", text = "Some of the older warriors here wore chains in this very yard, so you'll forgive them if they don't smile at visitors." },
    { id = "l_default", text = "Thrall and Doomhammer broke this camp open and set our people free, and Doomhammer died for it, so we hold it in his name." },
  },
  choices = {
    { text = "What threatens Hammerfall most?", next = "END", reply = "Stromgarde's soldiers, and the ogres, and the Witherbark drums. We have enemies enough to keep sharp." },
    { text = "Lok'tar ogar.", next = "END", reply = "Lok'tar. Victory or death, as Grom said." },
    { text = "For Doomhammer.", next = "END", fx = { standing = { hammerfall = 1 } } } },
  topics = {
    stromgarde = { { id = "xt_sg", text = "Their kings built these cages. Their sons want them back. They will not have them." } },
    thrall = { { id = "xt_th", text = "The Warchief freed us from this place. We will hold it in his name." } },
    _none = { { id = "t_none", text = "Ask Drum Fel; he leads here, and he's in a mood since a wind rider ate his map." } },
  },
}
