-- Kali Remik of Sen'jin Village, moved here from the Orgrimmar roster (a later-era placement). Voice: bibles/missed_kali.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Kali Remik: Darkspear of Sen'jin Village (her Classic post; filed here from the Orgrimmar roster).
P:NPC {
  key = "kali_remik", id = TODO_NPC("Kali Remik"), name = "Kali Remik", gender = "female",
  bible = "bibles/missed_kali.md", role = "villager", tier = "service",
  communities = { "senjin" }, temper = { "easy", "watchful" }, values = { "tribe", "patient" },
  notices = { "race", "pet" },
  impression = {
    first = "Kali Remik is a Darkspear woman with a hunter's stillness, who watches a stranger for a good while before she decides to smile. She talks about her tribe with pride and about the sea with something closer to longing.",
    third = "{name} met Kali Remik, a Darkspear who remembers the islands her tribe lost.",
  },
  greetings = {
    { id = "g_default", text = "Hey there, mon. You walk loud for somebody in troll country, but you walk friendly, so sit a while." },
    { id = "g_back", when = { metBefore = true }, text = "I know dat walk before I see the face. Good to have you back among the Darkspear." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "One of our own, and looking strong. The tribe be small, mon, so every one of us who stands tall makes all of us taller." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Dat be a fine beast beside you, and it trusts you, I can see. {pet} would not look so calm with a bad hunter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Kali Remik, of the Darkspear. We be a small tribe a long way from where we started, mon, but we got a chief worth following and friends worth having, and dat is more than we had on the islands at the end." },
      },
      again = {
        { id = "h_again", text = "What else you want to hear, mon?" },
        { id = "h_again2", text = "Go on. The tide not going anywhere without us." },
      },
      choices = {
        { text = "What happened on the islands?", next = "islands" },
        { text = "How do the Darkspear live among orcs?", next = "orcs" },
        { text = "You have a hunter's eyes.", next = "hunter" },
        { text = "Stay well, Kali.", next = "END" },
      },
    },
    islands = {
      lines = { { id = "i_default", text = "The sea witch came for us first, and Thrall's orcs pulled us out from under her. Then the Echo Isles were ours for a little while, until Zalazane turned his voodoo on his own people and we had to run to the mainland.", fx = { learn = { "echo_isles" } } } },
      choices = {
        { text = "Who is Zalazane?", next = "zalazane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zalazane = {
      lines = { { id = "z_default", text = "He was a witch doctor of the tribe, mon, and now he be a thief of minds. Some of the trolls who serve him on dose islands are people I grew up with, and they would not know my face if I stood before them." } },
      choices = {
        { text = "The tribe will take the isles back.", next = "BACK", reply = "Vol'jin says the same, and I believe him. I only hope there be somebody left out there to bring home, mon." },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = {
        { id = "o_orc", when = { race = "Orc" }, text = "Better than you might think, mon, and I say it to your face. Your people be loud and they cook everything too long, but they stood between us and the sea witch, and a troll don't forget dat." },
        { id = "o_default", text = "We live well enough with them. The orcs gave us a place when we had none, so we give them our spears and our voodoo, and we keep our own ways in our own huts." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = {
        { id = "hu_hunter", when = { class = "HUNTER" }, text = "It takes one to see one, mon. Durotar be thin hunting after the islands, all boar and scorpid, but a thin land makes a sharp hunter, and you got the look of one who learned dat." },
        { id = "hu_default", text = "Every Darkspear grows up with a spear in the hand, mon, even the ones who end up healers. On the islands you learned to see the raptor before it saw you, or you did not grow up at all." },
      },
      choices = {
        { text = "Do you miss that hunting?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss the green, and the rain coming in warm off the water. This red land be dry as an old bone, but it is ours by Thrall's word, and I would sooner have a dry home than a wet grave." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, island born, and carried over the sea on an orc ship. Dat be my whole story so far, mon." } },
    echo_isles = { { id = "tp_echo", text = "You can see them from the shore on a clear day. Dat be the hard part, mon, seeing them." } },
    _none = { { id = "tp_none", text = "I don't know about dat, mon. Ask the elders, they know more than they say." } },
  },
}
