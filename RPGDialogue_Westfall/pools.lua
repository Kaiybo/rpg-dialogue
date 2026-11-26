-- Unnamed people of Sentinel Hill: militia volunteers and whoever stands guard.
-- Their opinion of you is the hill's opinion of you.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "militia_sentinel_hill", role = "militia", community = "sentinel_hill",
  barks = {
    { id = "b_drill", text = "Left foot, right foot, pitchfork up! Light's sake, Harlan, your other left!" },
    { id = "y_b_mud", text = "Somebody tell Harlan the spear goes point-first. Again." },
    { id = "y_b_rain", text = "If it rains I'll dance, and then I'll weep, because the barley's already dead." },
    { id = "b_hero", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "That's the one who cleared the Jangolode road, or was it Moonbrook? Both, the way I heard it." },
  },
  greetings = {
    { id = "g_watch", text = "Keep your eyes south, friend; that's where they always come from." },
    { id = "g_tired", when = { timeOfDay = "night" }, text = "Night watch again, and my boots haven't been dry since the last rain. I'd trade this spear for a bed in a heartbeat, but don't you tell Gryan I said so." },
    { id = "g_liked", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "You again? Good, it feels safer with you on the hill." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Gryan says to let you pass, but that doesn't mean I have to like it." },
  },
  notice = {
    { id = "n_bandana", cat = "red", when = { questObjective = { TODO_QUEST("Red Leather Bandanas"), left = { max = 5 } } },
      text = "That's a lot of red sticking out of your pack, friend. You've been busy, and I'm glad of it." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "Did they rob you too? There's a spare cloak by the fire; it's ugly and it smells of goat, but it's warm." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's there? Show yourself or I'll fork you!" } },
  lines = {
    { id = "l_default", text = "I farmed barley till last spring, and now I've spear blisters where the hoe calluses used to be. Gryan Stoutmantle says I'm doing fine, but he says that to everybody." },
    { id = "l_liked", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "My mum's farm has been quiet all week, and she says to thank whoever did it. I think that's you." },
    { id = "l_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "You're one of us now, near enough, but don't let it go to your head, because Gryan certainly won't." },
    { id = "y_l_cousin", text = "My cousin Wes went over to the Brotherhood last winter. I see red bandanas on the road and I look for his face every time, and I don't know what I'll do if I find it." },
    { id = "y_l_dwarf", when = { race = "Dwarf" }, text = "You dwarves fight like you were born holding an axe. Gryan says I hold my spear like a pitchfork, and he's right, because a pitchfork's what I held for twenty years." },
    { id = "y_l_night", when = { timeOfDay = "night" }, text = "Nights are the worst. You hear the Defias whistling to each other in the fields, and you never know if it's ten of them or two." },
  },
  choices = {
    { text = "Hold the line.", next = "END", fx = { standing = { sentinel_hill = 1 } } },
    { text = "Your cousin chose his side. Show him no mercy.", next = "END", reply = "Aye. I hope I'm as hard as you when the day comes.", fx = { align = { honor = -1 } } },
    { text = "If you find him, try bringing him home first.", next = "END", reply = "Light willing. I'd like to think he'd come.", fx = { align = { honor = 1 } } },
  },
  topics = {
    defias = { { id = "t_defias", text = "There are red bandanas everywhere south of here. We count them from the wall at night, and Jory always loses count around forty and starts over." } },
    moonbrook = { { id = "y_t_moonbrook", text = "Moonbrook was the market town. Now it's the Brotherhood's camp, and we don't go there without Gryan." } },
    harvest_golems = { { id = "y_t_golem", text = "The Defias stole the harvest golems and set them on us. Machines that were meant to bring in the barley now cut down the farmers." } },
    people_militia = { { id = "t_militia", text = "That's us: farmers with sticks, and Gryan, who somehow makes us feel like more than that." } },
    _none = { { id = "t_none", text = "You'd best ask Captain Danuvin about that. I just hold the spear." } },
  },
}

P:Pool {
  id = "guard_sentinel_hill", role = "guard", community = "sentinel_hill",
  barks = {
    { id = "b_xstew", text = "Salma's stew again. Nobody knows what's in it, and nobody's brave enough to ask." },
    { id = "y_b_gryph", text = "Gryphon's back from Stormwind. No soldiers on it again, just letters." },
    { id = "b_xwatch", text = "Smoke over Moonbrook again. The Brotherhood's cooking something, and it isn't supper." },
  },
  greetings = {
    { id = "g_hill", text = "Welcome to Sentinel Hill. Mind the gryphons, they bite." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Walk slowly. We've had thieves in borrowed cloaks before." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "No drink on the hill, by Gryan's order. Where did you even find it out here?" },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneaking up on Sentinel Hill? That's how folk get shot." } },
  lines = {
    { id = "l_xfarm", text = "Most of us were farmers before the Brotherhood came. Now we hold spears instead of hoes, and the fields grow dust." },
    { id = "l_xcrown", text = "Stormwind forgot Westfall, so Westfall remembers itself. That's what Gryan says, and he's right." },
    { id = "l_default", text = "Gryan's up in the tower and Captain Danuvin's by the map. Anything else, ask the quartermaster, and count your change after." },
    { id = "y_l_stonemasons", text = "My father was a stonemason. He built walls in Stormwind and the city never paid. Half the Brotherhood's leaders were masons, they say. I understand them, and I hate that I do." },
    { id = "y_l_human", when = { race = "Human" }, text = "You're from the city, by your boots. Tell them in Stormwind that Westfall still stands, and that we didn't need their help to do it." },
    { id = "y_l_liked", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "Gryan mentions you at supper sometimes. That's rare. Most folk he only mentions when they owe him something." },
  },
  choices = {
    { text = "Thanks.", next = "END" },
    { text = "Stormwind should have sent you soldiers.", next = "END", reply = "Should have, aye. They didn't, so here we stand.", fx = { align = { order = -1 } } },
    { text = "The king has wars to fight. Be patient.", next = "END", reply = "Patience doesn't feed a family, friend. But I'll try.", fx = { align = { order = 1 } } },
    { text = "The masons were wronged. That doesn't excuse banditry.", next = "END", reply = "No, it doesn't. But it explains it, and that's worse.", fx = { align = { honor = 1 } } },
    { text = "If Stormwind cheated them, they're owed.", next = "END", reply = "Careful. Say that too loud and Danuvin will have words.", fx = { align = { honor = -1 } } },
  },
  topics = {
    defias = { { id = "t_xdefias", text = "Bandits and turncoats. Some of them were our neighbours once, which makes it worse." } },
    stonemasons = { { id = "y_t_masons", text = "The Stonemasons' Guild built Stormwind and never got paid. That's where the Brotherhood started, if you ask the old men." } },
    danuvin = { { id = "y_t_danuvin", text = "Captain Danuvin keeps the map and the watch rota. He's fair, and he never sleeps." } },
    gryan_stoutmantle = { { id = "t_xgryan", text = "He built the militia out of nothing. I'd follow him anywhere." } },
    _none = { { id = "t_none", text = "Couldn't tell you that. Ask up in the tower." } },
  },
}
