-- Unnamed NPCs of Northshire and Goldshire. A guard's first job is noticing trouble,
-- and their opinion of you is the town's opinion of you.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_northshire", role = "guard", community = "northshire",
  barks = {
    { id = "b_road", text = "Mind yourself on the road, recruit, because the wolves won't, and I'm not digging another grave this week." },
    { id = "yb_kobold", text = "Another kobold in the vineyard last night, and it took a whole lantern, the little thief." },
    { id = "yb_abbey", text = "The abbey bells always sound sweeter when the wolves are quiet, and they've not been quiet in weeks." },
    { id = "b_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "There goes the one who cleared the bandits out of the vineyard." },
  },
  greetings = {
    { id = "g_move", text = "Keep moving, recruit." },
    { id = "g_abbey", text = "The Abbey's straight ahead, recruit, and you'll find Marshal McBride just inside the doors." },
    { id = "g_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "The Marshal's been talking about you. Good things, for once." },
    { id = "g_distrust", when = { townStanding = { town = "northshire", max = -20 } }, text = "I've got my eye on you." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true }, text = "Did the Defias take your clothes too, or did you start that way?" },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Show yourself, and come out slowly!" },
  },
  lines = {
    { id = "l_default", text = "There are kobolds to the north, thieves to the east and wolves everywhere else, so welcome to Northshire, recruit." },
    { id = "yl_mine", text = "The kobolds in Echo Ridge Mine dig toward the abbey a little more every month. The brothers pretend not to hear the picks at night, but I hear them." },
    { id = "yl_recruits", text = "Every week the abbey sends out another batch of recruits, and every week fewer of them come back through this gate. I try to remember their faces anyway." },
    { id = "yl_defias", text = "Garrick Padfoot and his cutthroats have been squatting by the vineyard cottage for a month now. If you've a sword and a strong stomach, the Marshal will pay for his head." },
    { id = "yl_dwarf", when = { race = "Dwarf" }, text = "A dwarf in Northshire! We had one come through last spring who called our kobolds wee cave rats and went into the mine with nothing but a pick. He came out with forty candles." },
    { id = "yl_paladin", when = { class = "PALADIN" }, text = "Brother Sammuel speaks well of the paladins he trains here. Keep the Light close, and keep your shield closer, because the Defias don't care how holy you are." },
    { id = "l_liked", when = { townStanding = { town = "northshire", min = 30 } }, text = "You've done the valley some good. The lads on watch noticed." },
  },
  choices = {
    { text = "Hang the Defias, every last one.", next = "END", reply = "That's the Marshal's view and mine, recruit. A rope settles a lot.", fx = { align = { order = 1 } } },
    { text = "Many Defias were cheated masons. Show some mercy.", next = "END", reply = "Maybe so, but a cheated man with a knife is still a man with a knife.", fx = { align = { order = -1 } } },
    { text = "I'll be on my way.", next = "END" },
  },
  topics = {
    defias = { { id = "t_defias", text = "There are red bandanas in the vineyard again. Deputy Willem keeps a tally, and he's run out of chalk twice." } },
    kobolds = { { id = "yt_kobold", text = "Vermin with candles on their heads, and they dig like they're paid by the yard. Don't take their candles, recruit; they get very upset." } },
    mcbride = { { id = "yt_mcb", text = "Marshal McBride runs Northshire from the abbey steps. He's hard, but he's never sent a recruit anywhere he wouldn't go himself." } },
    _none = { { id = "t_none", text = "You'd best ask the Marshal about that. I just stand here and watch the road, and my feet have the blisters to show for it." } },
  },
}

P:Pool {
  id = "guard_goldshire", role = "guard", community = "goldshire",
  barks = {
    { id = "b_quiet", text = "Calm night, Light be thanked, and I'd like it to stay that way." },
    { id = "b_hogger", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") }, text = "That's the one who brought down Hogger, they say, and carried his claw back to the Marshal." },
    { id = "b_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "Watch that one." },
  },
  greetings = {
    { id = "g_peace", text = "Goldshire's a peaceful town, traveller, so let's keep it that way." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The inn's that way, friend. If there's going to be a fight tonight, take it outside the inn, and well away from my post." },
    { id = "g_hogger", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") }, text = "That's the one who brought in Hogger's claw." },
    { id = "g_hero", when = { townStanding = { town = "goldshire", min = 55 } }, text = "Didn't think I'd ever salute someone who smells that much of gnoll." },
    { id = "g_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "Hands where I can see them." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } }, text = "Go and sleep it off at the Lion's Pride. Farley won't mind a snoring guest, but I'll mind you stumbling about my street." },
  },
  react = {
    { id = "r_stealth", on = "stealth", text = "Oi! None of that in town." },
  },
  lines = {
    { id = "l_default", text = "Marshal Dughan's out by the inn if you're looking for work." },
    { id = "l_liked", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Folk at the inn have been talking about you, and it's mostly kind. Mostly." },
    { id = "l_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "You've been making trouble. The Marshal knows your name, and not fondly." },
  },
  choices = { { text = "Just passing through.", next = "END" } },
  topics = {
    defias = { { id = "t_defias", text = "The Defias are Westfall's problem until they come over the bridge into Elwynn, and then they're mine." } },
    hogger = { { id = "t_hogger", text = "Hogger's a big, angry brute who keeps to the woods southwest of here, and you'd be a fool to go after him alone." } },
    _none = { { id = "t_none", text = "Not my post to say." } },
  },
}
