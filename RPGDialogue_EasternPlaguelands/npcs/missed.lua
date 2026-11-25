-- Eastern Plaguelands, one an earlier pass missed: Adon, the high elf who waits with his trunk at the sealed
-- gate of Quel'Thalas, at the top of the Thalassian Pass. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Adon: high elf at the entrance to Quel'Thalas.
P:NPC {
  key = "adon", id = TODO_NPC("Adon"), name = "Adon", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "thalassian_pass" }, temper = { "proud", "wry" }, values = { "patient", "proud" },
  notices = { "race" },
  impression = {
    first = "Adon is a high elf who waits beside a travelling trunk at the sealed gate of Quel'Thalas, at the far northern end of the Plaguelands. He talks of going home as a man talks of a ship that is late, and will not say how long he has stood there.",
    third = "{name} met Adon, a high elf waiting at the closed gate of Quel'Thalas in the Thalassian Pass.",
  },
  greetings = {
    { id = "g_default", text = "You have come a long way north to find a locked door, {class}. I should know, for I have been admiring it rather longer than you have." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the traveller again. No, it has not opened, though I thank you for the hope in your face." },
  },
  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Banshee Queen's people. She was Ranger-General of Silvermoon when I last saw this gate open, and I do not know whether to bow to you or to weep." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A cousin from across the sea, and one with a long memory, I expect. Let us agree that our ancestors quarrelled quite enough for both of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Adon, of Quel'Thalas, which lies on the other side of that gate. I was abroad when the Scourge marched through my homeland, and by the time I returned the way was shut, so here I wait with my trunk like a guest who has arrived on the wrong day." } },
      again = {
        { id = "h_again", text = "What else would you ask of a man with nothing but time?" },
        { id = "h_again2", text = "Do go on. Conversation is rare at this end of the road." },
      },
      choices = {
        { text = "Why is the gate closed?", next = "gate" },
        { text = "What happened to Quel'Thalas?", next = "fall" },
        { text = "What do you carry in the trunk?", next = "trunk" },
        { text = "I hope it opens for you.", next = "END" },
      },
    },
    gate = {
      lines = { { id = "gate_default", text = "Because those who survived within have no reason left to trust what walks up from the south. I cannot blame them, having walked up from the south myself and seen what else is on the road." } },
      choices = {
        { text = "Have you called to them?", next = "called" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    called = {
      lines = { { id = "c_default", text = "Until my voice gave out, in the first weeks. Either nobody stands watch on the far side, or the watch has been told to hear nothing, and I honestly cannot say which I would find the easier to bear." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    fall = {
      lines = { { id = "f_default", text = "The prince of Lordaeron came north with an army of the dead, wanting the Sunwell for his master's purposes. He burned the forests my people had tended for seven thousand years and broke Silvermoon to reach it, and most of the high elves in the world died in his path." } },
      choices = {
        { text = "And yet you want to go back.", next = "back" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "It is my home, and one does not stop having a home because it has been ruined. If there are a dozen of my kin alive behind that gate, I would sooner be the thirteenth among them than the last elf in the Plaguelands." } },
      choices = { { text = "I understand. Another matter.", next = "BACK", fx = { affinity = 1 } } },
    },
    trunk = {
      lines = { { id = "t_default", text = "Everything I took abroad with me, which is everything I now own. There are books, a few clothes, and a bottle of Silvermoon wine I have been saving for the day the gate opens, and I should warn you that I know its weight to the ounce." } },
      choices = { { text = "I wouldn't dream of it. Another matter.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A son of Quel'Thalas who was away from it at the worst possible time. I have been trying to return ever since." } },
    quelthalas = { { id = "tp_qt", text = "The kingdom of the high elves, beyond this gate. The Scourge left little of it standing, and what remains has shut itself in." } },
    _none = { { id = "tp_none", text = "I fear very little news reaches this gate, and none at all comes out of it." } },
  },
}
