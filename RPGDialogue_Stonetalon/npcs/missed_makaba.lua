-- Camp Aparaje: Makaba Flathoof, Kaya's father, in the ashes the Grimtotem left on the Stonetalon road
-- (the wiki files him under the Southern Barrens, where he is found in a later age). Voice: bibles/missed_makaba.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Makaba Flathoof: survivor of Camp Aparaje; wants the Grimtotem answered and his daughter found.
P:NPC {
  key = "makaba_flathoof", id = TODO_NPC("Makaba Flathoof"), name = "Makaba Flathoof", gender = "male",
  bible = "bibles/missed_makaba.md", role = "questgiver", tier = "quest",
  communities = { "camp_aparaje", "sun_rock" }, temper = { "grieving", "hard" }, values = { "family", "justice" },
  notices = { "race", "class" },
  impression = {
    first = "Makaba Flathoof stands among the burned tents of Camp Aparaje with soot to his elbows and his eyes on the road east. The Grimtotem took his village and, he believes, his daughter, and he speaks slowly because he is holding a great deal down.",
    third = "{name} met Makaba Flathoof, a tauren whose village at Camp Aparaje was burned by the Grimtotem.",
  },
  greetings = {
    { id = "g_default", text = "Tread softly here, {class}. You are walking through what was my village until the Grimtotem came down the road." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the ashes. Tell me that you bring word from the east, for I have had none." },
    { id = "g_kaya", when = { questDone = TODO_QUEST("Kaya's Alive") }, text = "Earth Mother keep you, friend. My daughter breathes because of you, and there is no fire I own that you may not sit beside." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are shu'halo, and so you will feel this as I do. It was not centaur or quilboar who did this to us, but our own kind." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry yourself like a hunter. I was one, before there was nothing left here to feed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_alive", tags = { "news" }, when = { questDone = TODO_QUEST("Kaya's Alive") },
          text = "Kaya is alive, and I had already begun to mourn her. I am Makaba Flathoof, and whatever else you ask of me today, you will be asking it of a grateful tauren." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Makaba Flathoof, and this was Camp Aparaje. The Grimtotem burned it, young one, tauren putting the torch to tauren, and they carried my daughter Kaya away with them." },
        { id = "h_default", text = "I am Makaba Flathoof, and these ashes were Camp Aparaje. The Grimtotem fell on us without warning and killed all they could reach, and my daughter Kaya has not been seen since that night." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have nowhere to be but here." },
        { id = "h_again2", text = "Speak, friend, and forgive me if my eyes stay on the road." },
        { id = "h_again_alive", when = { questDone = TODO_QUEST("Kaya's Alive") }, text = "What more can I tell you, friend? Ask it freely." },
      },
      choices = {
        { text = "Tell me what happened here.", next = "attack" },
        { text = "Who are the Grimtotem?", next = "grimtotem" },
        { text = "Tell me about your daughter.", next = "kaya", when = { ["not"] = { questDone = TODO_QUEST("Kaya's Alive") } } },
        { text = "Kaya is safe, Makaba. How is she?", next = "home", when = { questDone = TODO_QUEST("Kaya's Alive") } },
        { text = "Let me help you answer them.", next = "BUSINESS" },
        { text = "You shouldn't stay here alone.", next = "alone" },
        { text = "Walk with the Earth Mother, Makaba.", next = "END" },
      },
    },
    attack = {
      lines = { { id = "a_default", text = "They came at night from their post up the road, with axes and torches, and they did not trouble to give a reason. We were hunters and herders with our weapons hung on the tent poles, and by dawn there was only smoke and those of us too stubborn to die." } },
      choices = {
        { text = "Where is this post of theirs?", next = "post" },
        { text = "Why would they strike a peaceful camp?", next = "why" },
        { text = "Something else, Makaba.", next = "BACK" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "East along the road toward the Barrens, where they have raised their own tents and their own totems. Grundig Darkcloud commands it, and it was his voice I heard giving the orders while my village burned.", fx = { learn = { "grimtotem" } } } },
      choices = {
        { text = "What sort of chief is Grundig?", next = "grundig" },
        { text = "Another question.", next = "BACK" },
      },
    },
    grundig = {
      lines = { { id = "g_default_", text = "A large one, who keeps his brutes close about him and lets his ruffians do the burning. He will not come out to face one old hunter, but he may find it harder to ignore a {class} who walks into his camp." } },
      choices = { { text = "He'll find it very hard. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "I have asked the ashes that every day, and they do not answer. We sat on the road between Stonetalon and the Barrens, and I think the Grimtotem simply wanted that road to belong to no one but themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grimtotem = {
      lines = {
        { id = "gt_tauren", when = { race = "Tauren" }, text = "You know the name already, and you know that Magatha sits on her rise in Thunder Bluff and smiles at Cairne. Her tribe's hands are another matter, and I have seen what those do when the elders are not looking." },
        { id = "gt_default", text = "They are a tribe of my own people who never bent the knee to Cairne Bloodhoof and never joined your Horde. They paint themselves dark and they call the rest of us weak, and they hold that the land belongs to whoever is cruel enough to keep it.", fx = { learn = { "grimtotem" } } },
      },
      choices = {
        { text = "Has no one in Thunder Bluff answered for this?", next = "answer" },
        { text = "Something else, Makaba.", next = "BACK" },
      },
    },
    answer = {
      lines = { { id = "an_default", text = "Thunder Bluff is far away, and a burned camp on a mountain road is a small thing to those who must keep the tribes at one fire. Maggran Earthbinder at Sun Rock grieves with us, but he has harpies and goblins enough to fill his days." } },
      choices = { { text = "Then I'll see to it. Another matter.", next = "BACK" } },
    },
    kaya = {
      lines = { { id = "k_default", text = "She is young, and quicker than I am, and braver than is good for her. I taught her to read a trail and set a snare, and I pray she remembered how to hide as well, because I did not find her among our dead." } },
      choices = {
        { text = "Then she may still be alive.", next = "hope" },
        { text = "I know snares. Did she learn them well?", next = "snares", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hope = {
      lines = { { id = "hp_default", text = "That is the thought that keeps me standing, and I am almost afraid to say it aloud. If she lives, the Grimtotem hold her at their post, and her aunt Tammra at Sun Rock must be told the moment she is found." } },
      choices = { { text = "I'll look for her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    snares = {
      lines = { { id = "sn_default", text = "Better than I did at her age, hunter, though I never told her so. Watch for snares yourself on that road, for the Grimtotem learned the craft at the same fires we did, and a set snare means one of them is near." } },
      choices = { { text = "I'll watch for them. Another matter.", next = "BACK" } },
    },
    home = {
      lines = { { id = "hm_default", text = "She jumps at every snapped twig, and she tells me that my stew is worse than ever, which is how I know she is mending. Tammra wept when she heard, and then she scolded me for half a day for ever letting the girl out of my sight." } },
      choices = { { text = "I'm glad of it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alone = {
      lines = { { id = "al_default", text = "Perhaps not, and Sun Rock would take me in gladly. But the dead of Aparaje are not yet properly mourned, and I will not turn my back on this road while the ones who lit the fire still camp beside it." } },
      choices = { { text = "Something else, Makaba.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted these hills and raised my daughter at Camp Aparaje. Now I keep watch over what the Grimtotem left of it." } },
    grimtotem = { { id = "tp_gt", text = "They burned my village from their post up the road, under Grundig Darkcloud. I would not have believed it of tauren before that night." } },
    _none = { { id = "tp_none", text = "I cannot help you with that, friend. My thoughts do not travel far from this road." } },
  },
}
