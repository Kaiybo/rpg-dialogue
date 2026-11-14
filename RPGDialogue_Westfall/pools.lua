-- Unnamed people of Sentinel Hill: militia volunteers and whoever stands guard.
-- Their opinion of you is the hill's opinion of you.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "militia_sentinel_hill", role = "militia", community = "sentinel_hill",
  barks = {
    { id = "b_drill", text = "Left foot, right foot, pitchfork up. Up!" },
    { id = "b_hero", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "That's the one who cleared the Jangolode road. Or was it Moonbrook? Both, I heard." },
  },
  greetings = {
    { id = "g_watch", text = "Keep your eyes south. That's where they come from." },
    { id = "g_tired", when = { timeOfDay = "night" }, text = "Night watch. I'd trade my spear for a bed. Don't tell Gryan." },
    { id = "g_liked", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "You again. Good. Feels safer with you on the hill." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Gryan says let you pass. Doesn't mean I have to like it." },
  },
  notice = {
    { id = "n_bandana", cat = "red", when = { questObjective = { TODO_QUEST("Red Leather Bandanas"), left = { max = 5 } } },
      text = "That's a lot of red sticking out of your pack. You've been busy. Good." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "Did they rob you too? Here, there's a spare cloak by the fire. Ugly, but warm." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Who's there? Show yourself or I'll fork you!" } },
  lines = {
    { id = "l_default", text = "I farmed barley till last spring. Now I hold a spear and pray nobody tests me. Gryan says I'm doing fine." },
    { id = "l_liked", when = { townStanding = { town = "sentinel_hill", min = 30 } }, text = "My mum's farm's quiet this week. She says to thank whoever did it. I think that's you." },
    { id = "l_militia", when = { questDone = TODO_QUEST("The People's Militia") }, text = "You're one of us now, near enough. Don't let it go to your head. Gryan won't." },
  },
  choices = { { text = "Hold the line.", next = "END", fx = { standing = { sentinel_hill = 1 } } } },
  topics = {
    defias = { { id = "t_defias", text = "Red bandanas, everywhere south of here. We count them at night." } },
    people_militia = { { id = "t_militia", text = "Us. Farmers with sticks. And Gryan, who makes us feel like more than that." } },
    _none = { { id = "t_none", text = "Ask the Captain. I just hold the spear." } },
  },
}

P:Pool {
  id = "guard_sentinel_hill", role = "guard", community = "sentinel_hill",
  greetings = {
    { id = "g_hill", text = "Sentinel Hill. Mind the gryphons, they bite." },
    { id = "g_distrust", when = { townStanding = { town = "sentinel_hill", max = -20 } }, text = "Walk slowly. We've had thieves in borrowed cloaks before." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "No drink on the hill, by Gryan's order. Where did you even find it out here?" },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Sneaking up on Sentinel Hill? That's how folk get shot." } },
  lines = {
    { id = "l_default", text = "Gryan's up top. Captain Danuvin's by the map. Anything else, you can ask the gryphons." },
  },
  choices = { { text = "Thanks.", next = "END" } },
  topics = {
    _none = { { id = "t_none", text = "Couldn't say. Ask up top." } },
  },
}
