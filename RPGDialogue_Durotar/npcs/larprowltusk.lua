-- Lar Prowltusk, the Darkspear scout who crept into Kolkar Crag. Voice: bibles/larprowltusk.md
-- Quiet, watchful, and more interested in battles that never happen than in ones that do.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "larprowltusk", id = TODO_NPC("Lar Prowltusk"), name = "Lar Prowltusk",
  bible = "bibles/larprowltusk.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "calm" }, values = { "careful", "loyal" },
  notices = { "stealth", "class" },
  impression = {
    first = "Lar Prowltusk speaks low and watches the western ridge while he talks. He crept into Kolkar Crag alone and came back with the centaur's battle plans, and he would rather burn those plans than win the battle.",
    third = "{name} met Lar Prowltusk near Sen'jin Village, a Darkspear scout who uncovered the Kolkar centaur's plan to attack Durotar.",
  },

  greetings = {
    { id = "g_low", text = "Lower your voice, mon. The wind carry from here to the ridge, and so do careless words." },
    { id = "g_active", when = { questActive = TODO_QUEST("Thwarting Kolkar Aggression") }, text = "Three leaders, three pieces of the plan. Burn them all, or the centaur only lose a little time." },
    { id = "g_done", when = { questDone = TODO_QUEST("Thwarting Kolkar Aggression") }, text = "The ridge be quiet, mon. I like it quiet." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, mon. I watch the ridge the whole time, so I can tell you nothing come over it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk different now, mon, heavier and surer. The Kolkar would see you coming, but they'd think twice about it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Somebody say you got caught in a lie, mon. A scout lives on true words, so I listen to yours a little closer today." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Quiet steps, mon, but these old ears still catch them. The centaur would not have heard you at all." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "ROGUE" } },
      text = "You got the quiet feet, I see. Good, because Kolkar Crag be no place for loud ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lar Prowltusk, scout of the Darkspear. I watch the ridge to the west, because over it be Kolkar Crag, and the centaur there got more on their minds than raiding." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Thwarting Kolkar Aggression") },
          text = "Lower your voice, {class}. Last night while the Kolkar were out raiding, I crept into their village and found their plans, and the dirty beasts mean to strike at Durotar's trolls and orcs in three places at once." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Thwarting Kolkar Aggression"), days = 3 } },
          text = "All three plans be ashes, mon, and the Kolkar must start over with nothing. You spared a lot of warriors a fight they didn't need, and that be the best kind of victory." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Thwarting Kolkar Aggression"), days = 10 } },
          text = "The Kolkar still ride the ridge some nights, mon, but they ride like centaur with no plan. There will be blood before this be done, but less of it than there would have been." },
        { id = "h_troll", when = { race = "Troll" }, text = "A cousin, good. Sit low beside me, and watch the ridge while we talk." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Keep it soft." },
        { id = "h_again2", text = "Ask, but ask quiet. The ridge got ears." },
      },
      choices = {
        { text = "What did you find in Kolkar Crag?", next = "plans" },
        { text = "How did you get in there unseen?", next = "sneak" },
        { text = "Why do the centaur want Durotar?", next = "kolkar" },
        { text = "I move unseen too. Let me scout the Crag.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "I'll keep my voice down. Farewell.", next = "END" },
      },
    },
    plans = {
      lines = { { id = "p_default", text = "A three-tiered attack, mon, written out on hides. The Kolkar split the plans among three of their leaders, so no one centaur carry the whole thing, and that be clever for a beast that smell like that." } },
      choices = {
        { text = "Then we kill the three leaders.", next = "plans_kill" },
        { text = "Why not warn Razor Hill and let them come?", next = "plans_wait" },
      },
    },
    plans_kill = {
      lines = { { id = "pk_default", text = "Kill them if you must, but burn the plans, because that be the part that matter. A dead leader get replaced by morning, but a lost plan cost the Kolkar the whole season." } },
      choices = {
        { text = "Then the plans burn. Something else.", next = "BACK" },
        { text = "Why do you care so much about the plans?", next = "bloodshed" },
      },
    },
    plans_wait = {
      lines = { { id = "pw_default", text = "Gar'Thok would love that, mon, a big fight on open ground. But every warrior who fall on that ground be one the Horde lose for nothing, when we could have stopped it with a torch." } },
      choices = {
        { text = "Then we stop it with a torch.", next = "bloodshed" },
        { text = "Something else, Lar.", next = "BACK" },
      },
    },
    bloodshed = {
      big = true,
      lines = { { id = "b_default", text = "Because the Darkspear lose too many already, mon, on the isles and before that in the jungle. As sure as there be sand in Tanaris, there will be blood before these times be through, but I won't spend it where I don't have to." } },
      choices = {
        { text = "A war won without bloodshed is the best kind.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some blood should be spilled. They'd spill ours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    sneak = {
      lines = { { id = "s_default", text = "The Kolkar raid at night and leave the old ones and the young ones behind, so the village be half empty. I wait in the brush until the fires burn low, and then I walk in like I belong there, which be the whole trick." } },
      choices = {
        { text = "That took nerve.", next = "BACK", fx = { affinity = 1 } },
        { text = "Could you teach me that?", next = "teach" },
      },
    },
    teach = {
      lines = { { id = "te_default", text = "Patience be the whole lesson, mon, and nobody want to learn it. Sit in the brush until your legs hurt, then sit some more, and then you be ready." } },
      choices = { { text = "I'll practice. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    kolkar = {
      lines = { { id = "k_default", text = "The centaur been in these lands longer than us, mon, and they don't like sharing them with orcs and trolls. The Kolkar raid the caravans and the farms, and now they think they got enough spears to take more." } },
      choices = {
        { text = "They were here first. Maybe they have a claim.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "This land is the Horde's now. That's the end of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "r_default", text = "Maybe so, mon, because you got the feet for it. Go in when the fires burn low, and remember the plans be the prize, not the throats." } },
      choices = { { text = "The plans first. Understood.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear scout, mon. I watch, I listen, and I come back, and most scouts only manage two of those." } },
    advice = { { id = "tp_ad", text = "Lower your voice, mon. The Kolkar hear a loud mouth from a mile off, and so do the vultures." } },
    echo_isles = { { id = "tp_isles", text = "I can see them from the shore, mon, but I don't look long. A scout keep his eyes on the danger in front of him." } },
    _none = { { id = "tp_none", text = "That be nothing I scouted, mon. Ask somebody who sit by a fire, not in a bush." } },
  },
}
