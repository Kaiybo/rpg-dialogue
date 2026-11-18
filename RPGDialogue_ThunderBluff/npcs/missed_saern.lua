-- Saern Priderunner, moved here from the Stonetalon roster (a later-era placement). Voice: bibles/missed_saern.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Saern Priderunner: tauren on Hunter Rise, Thunder Bluff (the scan's "Sunwalker Saern" is her later name).
P:NPC {
  key = "saern_priderunner", id = TODO_NPC("Saern Priderunner"), name = "Saern Priderunner", gender = "female",
  bible = "bibles/missed_saern.md", role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "proud", "steady" }, values = { "brave", "loyal" },
  notices = { "class" },
  impression = {
    first = "Saern Priderunner is a tauren brave who stands on Hunter Rise in Thunder Bluff with the bearing of someone who has run a long way to be there. She watches the plains below as if she could still see every mile of them.",
    third = "{name} met Saern Priderunner, a tauren brave on Hunter Rise in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "The winds greet you on Hunter Rise, {class}. Stand a while and look out, for there is no finer view of Mulgore." },
    { id = "g_back", when = { metBefore = true }, text = "You have climbed the Rise again. The plains have not changed, and I am glad of that." },
  },
  notice = {
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = { "WARRIOR", "HUNTER" } },
      text = "You carry yourself as one who has run the plains with a spear in hand. The Rise is the right place for you, and the elders here will be glad to see it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Saern Priderunner. My family carried word between the tribes on foot in the days before we had a city, and though the Bluff has made that work lighter, I have not forgotten how to run." } },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak, and I will hear you." },
      },
      choices = {
        { text = "Your people ran between the tribes?", next = "ran" },
        { text = "What do you watch for from up here?", next = "watch" },
        { text = "Who should a young hunter seek on the Rise?", next = "seek" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    ran = {
      lines = { { id = "r_default", text = "When the centaur drove us from one grazing ground to the next, the tribes were often many days apart. A runner who knew the plains could cross them faster than a kodo, and bring warning before the dust of the war bands was in sight." } },
      choices = {
        { text = "And now that the tribes are one?", next = "now" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now Cairne has given us a home that does not move, and I thank the Earth Mother for it each morning. But I still run the plains at dawn, because a people who forget how they survived will not survive the next hardship." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Old habit, mostly. I look for dust where there should be none, and though the centaur do not come into Mulgore now, the quilboar and the goblins' diggers have given my eyes new work." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    seek = {
      lines = { { id = "s_default", text = "The Thunderhorns teach the hunter's path here, and the Ragetotems the warrior's. Go to them humbly, for they have forgotten more of the hunt than most will ever learn." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am of the Priderunners, who carried word between the tribes on foot. I keep the old running alive." } },
    _none = { { id = "tp_none", text = "The winds have not told me. Ask among the elders on Elder Rise." } },
  },
}
