-- Arathi's guards: Stromgarde's last soldiers at Refuge Pointe, and the Horde's guardians at Hammerfall.
local P = RPGDialogueAPI:Pack("rpgd.arathi")

P:Pool {
  id = "guard_refuge", role = "guard", community = "refuge_pointe",
  barks = {
    { id = "yguardrefuge6", text = "Captain Nials says the rations are late again. Second week running. I'm eating my boots soon." },
    { id = "yguardrefuge7", text = "Somebody saw Lieutenant Valorcall's riders on the north road at dawn. Good. That means the road's still ours." },
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
    { id = "ybguardrefuge1", when = { race = "Dwarf" }, text = "Ironforge's men stood on these hills once. If you see the King, tell him Stromgarde remembers." },
    { id = "yguardrefuge3", text = "The Dabyrie farm sends us bread when they can. Kenata's a hard old woman, but she bakes like a saint." },
    { id = "yguardrefuge4", when = { race = "Human" }, text = "From Stormwind, are you? Tell them we're still here. Tell them we could use some help." },
    { id = "yguardrefuge5", when = { class = "PALADIN" }, text = "A paladin! Lieutenant Valorcall will be glad to see you. He's the last of the Silver Hand in these parts." },
    { id = "xl_dwarf", when = { race = "Dwarf" }, text = "Ironforge sent us rifles once, before the Third War. If you're writing home, {g:lad|lass}, tell them we'd take more." },
    { id = "xl_trollbane", text = "Lord Galen's sworn to retake the keep, and every one of us here has sworn it with him, for whatever that's worth to a soldier in a tent." },
    { id = "l_default", text = "The Third War took the keep, but it didn't take us, and we'll be here until Stromgarde is ours again." },
  },
  choices = {
    { text = "Hold Refuge Pointe. Discipline will win the keep back.", next = "END", reply = "Aye. Every day we hold is a day closer.", fx = { align = { order = 1 } } },
    { text = "Stromgarde should abandon the keep and save its people.", next = "END", reply = "Don't say that near Lord Galen. He'd have your head.", fx = { align = { order = -1 } } },
    { text = "What's the worst of it out here?", next = "END", reply = "The waiting, mostly, and the Syndicate arrows that come when the waiting's over." },
    { text = "Stromgarde will rise again.", next = "END", reply = "It will, and I'd like to be alive to see it." },
    { text = "For Stromgarde.", next = "END", fx = { standing = { refuge_pointe = 1 } } } },
  topics = {
    galen = { { id = "yguardrefuge1", text = "Lord Galen Trollbane. He's sworn to retake the keep." } },
    dabyrie = { { id = "yguardrefuge2", text = "The farm to the south. They send us bread when they can." } },
    syndicate = { { id = "xt_syn", text = "The Syndicate hold the upper keep. Every week we lose a scout to them." } },
    hammerfall = { { id = "xt_hf", text = "The orcs hold the old camp to the east, and they've long memories of it." } },
    _none = { { id = "t_none", text = "Ask Captain Nials, and she'll tell you, briefly, and probably while she's eating." } },
  },
}

P:Pool {
  id = "guard_hammerfall", role = "guard", community = "hammerfall",
  barks = {
    { id = "yguardhammerfall6", text = "The kodo are restless tonight. Something's moving in the hills, and they smell it before we see it." },
    { id = "yguardhammerfall7", text = "Drum Fel's in a mood again. Somebody find him a new map, before he takes it out on the grunts." },
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
    { id = "ybguardhammerfall1", when = { class = "SHAMAN" }, text = "A shaman. The spirits are restless here, so close to the old cages. Say a word to them for us." },
    { id = "yguardhammerfall3", text = "My father stood in chains in this very yard. I stand guard on the same stones, free, and I spit on them every morning." },
    { id = "yguardhammerfall4", when = { race = "Tauren" }, text = "A tauren this far east! Brumn Winterhoof camps on the hill to the north. He'll be glad to hear a voice from home." },
    { id = "yguardhammerfall5", when = { race = "Troll" }, text = "Darkspear, eh? The Witherbark in the hills are no kin of yours, I hope. They've been drumming every night." },
    { id = "xl_human", when = { race = "Human" }, text = "A human, inside Hammerfall. Mind your feet, and remember whose walls these are." },
    { id = "xl_camps", text = "Some of the older warriors here wore chains in this very yard, so you'll forgive them if they don't smile at visitors." },
    { id = "l_default", text = "Thrall and Doomhammer broke this camp open and set our people free, and Doomhammer died for it, so we hold it in his name." },
  },
  choices = {
    { text = "Thrall freed us with mercy. We should show it too.", next = "END", reply = "Mercy, to the humans who caged us? Maybe. Thrall would say so.", fx = { align = { honor = 1 } } },
    { text = "The humans caged us. Show them no mercy.", next = "END", reply = "Lok'tar! That's what I tell the young ones.", fx = { align = { honor = -1 } } },
    { text = "What threatens Hammerfall most?", next = "END", reply = "Stromgarde's soldiers, and the ogres, and the Witherbark drums. We have enemies enough to keep sharp." },
    { text = "Lok'tar ogar.", next = "END", reply = "Lok'tar. Victory or death, as Grom said." },
    { text = "For Doomhammer.", next = "END", fx = { standing = { hammerfall = 1 } } } },
  topics = {
    drum_fel = { { id = "yguardhammerfall1", text = "Leads here. In a mood since a wind rider ate his map." } },
    witherbark = { { id = "yguardhammerfall2", text = "Trolls in the hills. They drum all night and won't come close." } },
    stromgarde = { { id = "xt_sg", text = "Their kings built these cages. Their sons want them back. They will not have them." } },
    thrall = { { id = "xt_th", text = "The Warchief freed us from this place. We will hold it in his name." } },
    _none = { { id = "t_none", text = "Ask Drum Fel; he leads here, and he's in a mood since a wind rider ate his map." } },
  },
}
