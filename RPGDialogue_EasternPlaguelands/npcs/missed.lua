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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my faithful visitor returns! The gate remains closed, but your company makes the wait a little shorter, {class}." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The gate is still closed, and frankly, I'd prefer its company to yours." },
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
    yabroad = {
      lines = { { id = "yabroad_x", text = "In Dalaran, studying among the humans, and complaining of their cooking. The news came late, as news does, and by the time I had ridden north the forests were ash and the roads were full of things I once called neighbours." } },
      choices = {
        { text = "You must have heard of Dalaran's fall, too.", next = "ydalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydalaran = {
      lines = { { id = "ydalaran_x", text = "I watched the lich's army burn the city's spires from a hill outside it. Some of my teachers stayed and died. I ran. I have wondered since whether a scholar owes his life to his school or to himself. What would you say?" } },
      choices = {
        { text = "To the school. You should have stood with them.", next = "BACK", reply = "Then I have been a coward twice, once at each gate. I will try not to make it three.", fx = { align = { honor = 1 } } },
        { text = "To yourself. A dead scholar teaches no one.", next = "BACK", reply = "That is what I tell myself, in the evenings. It sounds better in your voice.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ynever = {
      lines = { { id = "ynever_x", text = "Then I will grow old at it, which for my people is a very long time. The Argent Dawn at Light's Hope offered me a bed and work. I said I would come when the gate had given me its answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yhope = {
      lines = { { id = "yhope_x", text = "My mother tended the gardens near Silvermoon, and my younger sister was a ranger under Sylvanas Windrunner. I hear the ranger-general fell defending the gates. I do not like to imagine what became of her rangers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Adon, of Quel'Thalas, which lies on the other side of that gate. I was abroad when the Scourge marched through my homeland, and by the time I returned the way was shut, so here I wait with my trunk like a guest who has arrived on the wrong day." },
        { id = "yh_mage", when = { class = "MAGE" }, text = "I am Adon, of Quel'Thalas, beyond that gate. A mage, I see. You will have felt it, then, the thread of the Sunwell's power that no longer reaches this far south. I was abroad when the Scourge came, and I have been waiting to go home since." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of a man with nothing but time?" },
        { id = "h_again2", text = "Do go on. Conversation is rare at this end of the road." },
      },
      choices = {
        { text = "Why is the gate closed?", next = "gate" },
        { text = "What happened to Quel'Thalas?", next = "fall" },
        { text = "What do you carry in the trunk?", next = "trunk" },
        { text = "Where were you when the Scourge came?", next = "yabroad" },
        { text = "What will you do if the gate never opens?", next = "ynever" },
        { text = "Who do you hope is still inside?", next = "yhope" },
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
    dalaran = { { id = "ytp_dal", text = "I studied in Dalaran, among humans and their terrible soups. I would give much to taste one again." } },
    sylvanas = { { id = "ytp_syl", text = "The ranger-general died at her own gates, they say. My sister served her. I pray they both found rest." } },
    background = { { id = "tp_bg", text = "A son of Quel'Thalas who was away from it at the worst possible time. I have been trying to return ever since." } },
    quelthalas = { { id = "tp_qt", text = "The kingdom of the high elves, beyond this gate. The Scourge left little of it standing, and what remains has shut itself in." } },
    _none = { { id = "tp_none", text = "I fear very little news reaches this gate, and none at all comes out of it." } },
  },
}
