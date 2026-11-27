-- Bloodhoof Village's teachers the roster scan found unwritten: Chaw Stronghide (leatherworking) and
-- Yonn Deepcut (skinning), who share a lodge, Vira Younghoof (bandages), Reban Freerunner (pet trainer),
-- and Vorn Skyseer, who welcomes newcomers. Forever: Chaw, Yonn and Vira each end a Camping 101 quest
-- from Kaga Wildhoof. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Vorn Skyseer: Bloodhoof Village; ends Welcome! (the gift-voucher greeting quest).
---------------------------------------------------------------------------
P:NPC {
  key = "vorn_skyseer", id = TODO_NPC("Vorn Skyseer"), name = "Vorn Skyseer", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "hospitality", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Vorn Skyseer stands a little apart in Bloodhoof Village with his face turned up toward the bluffs and the clouds beyond them. He welcomes each new arrival as though the sky had already told him they were coming.",
    third = "{name} met Vorn Skyseer, who welcomes newcomers to Bloodhoof Village.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Bloodhoof Village, {class}. The winds said that someone was coming along the road, and I am glad that it was you." },
    { id = "g_back", when = { metBefore = true }, text = "The winds bring you back to us, and they bring you a little changed, I think." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You come with An'she's first light, which is the best omen a traveller can carry." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You listen to the wind as I watch the sky, shaman. Perhaps between the two of us we have the whole of the weather." },
    { id = "n_far", cat = "race", when = { race = { "Orc", "Troll", "Scourge" } },
      text = "You were not born under this sky, and still it has room for you. Be at ease here, for no one in the village will ask you to explain yourself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vorn Skyseer. I read what the clouds and the birds have to say over Mulgore, and I greet those who come to Bloodhoof with a gift owed to them." },
        { id = "h_welcome", tags = { "news" }, when = { questActive = TODO_QUEST("Welcome!") }, text = "You carry a voucher, and I am the one it was meant for. Give it to me, friend, and choose your gift with care, for such a thing is given only once." },
        { id = "h_welcomed", when = { questDone = TODO_QUEST("Welcome!") }, text = "I am Vorn Skyseer, as you will recall, and I hope the gift I gave you travels well at your side. The sky has been clear over you since, as far as I can read it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of the sky, or of me?" },
        { id = "h_again2", text = "Speak, friend, for the clouds will wait." },
      },
      choices = {
        { text = "What is this voucher I was given?", next = "voucher", when = { questActive = TODO_QUEST("Welcome!") } },
        { text = "What do you see in the sky?", next = "sky" },
        { text = "What should a newcomer know of Bloodhoof?", next = "village" },
        { text = "I have no voucher. Am I still welcome?", next = "welcome" },
        { text = "Bloodhoof Village seems to welcome everyone.", next = "welcomes" },
        { text = "Do the clouds warn of danger?", next = "warn" },
        { text = "The winds speak to me too, Skyseer.", next = "shaman_wind", when = { class = "SHAMAN" } },
        { text = "May the sky stay clear for you.", next = "END", fx = { affinity = 1 } },
      },
    },
    welcomes = {
      lines = { { id = "welcomes_d", text = "It does, for the High Chieftain's own kin keep it, and he has taught us that a guest is a gift as much as any voucher. Orcs and trolls and even the Forsaken pass through on the road to the Barrens, and every one of them leaves a little different than they came." } },
      choices = {
        { text = "Baine Bloodhoof keeps the village?", next = "welcomes_baine" },
        { text = "Even the Forsaken are welcome?", next = "welcomes_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    welcomes_baine = {
      lines = { { id = "welcomes_baine_d", text = "Baine stands among the elders here while his father keeps Thunder Bluff, and he is young but listens well. The sky has always been gentle over him, and I take that as a good sign for the village." } },
      choices = {
        { text = "A chieftain's son with good omens.", next = "BACK", reply = "So I hope. The sky does not lie, though it does not always explain itself." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    welcomes_dead = {
      lines = { { id = "welcomes_dead_d", text = "They are, though the elders watch them closely and so do I. Their sky is always grey, friend, even in full sun, and I cannot read it, which troubles me more than anything they say aloud." } },
      choices = {
        { text = "Perhaps the grey is only grief.", next = "BACK", reply = "Perhaps. You see more kindly than I do, and I will try to see as you do." },
        { text = "Something else.", next = "BACK" },
      },
    },
    warn = {
      lines = { { id = "warn_d", text = "They do, if you know how to listen. Storms gather over the Venture Company mine to the east, where the goblins have torn the ground open, and the birds will not fly over the Windfury cliffs at all." } },
      choices = {
        { text = "Storms over the mine?", next = "warn_mine" },
        { text = "Birds avoiding the harpies seems simple enough.", next = "BACK", reply = "It is simple, and that is why I trust it. The sky speaks plainly to those who listen plainly." },
        { text = "Something else.", next = "BACK" },
      },
    },
    warn_mine = {
      lines = { { id = "warn_mine_d", text = "Dark clouds that come from nowhere and do not move with the wind. I think the land is angry at what the goblins take from it, and I have told Baine so, though he says anger alone will not drive the goblins away." } },
      choices = {
        { text = "Then someone must drive them away.", next = "BACK", reply = "Someone young and strong, perhaps. The sky would be glad of it." },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    shaman_wind = {
      lines = { { id = "shaman_wind_d", text = "Then you know that the sky and the wind are cousins, but not friends. The wind tells you what is coming, and the sky tells you what has been, and a skyseer must listen to both and believe neither too quickly." } },
      choices = {
        { text = "I'll listen to both, then.", next = "BACK", reply = "Good. The elements will be pleased to be heard by someone so willing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    voucher = {
      lines = { { id = "v_default", text = "It is a token of welcome sent ahead of you by friends from far away, to be honoured in the first village you came to. I do not ask who they were, for a gift is not made better by questions." } },
      choices = { { text = "Then I'll choose well. Something else.", next = "BACK" } },
    },
    sky = {
      lines = { { id = "s_default", text = "Today I see swoops circling high over the lake, which means fair weather, and a line of cloud on the western rim that means it will not last. The sky rarely lies, though it often says less than one would wish." } },
      choices = {
        { text = "Does it tell you more than the weather?", next = "sky_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_more = {
      lines = { { id = "sm_default", text = "At times it does. The harpies of Windfury Ridge have been flying further south than they used to, and the eagles have left the eastern hills where the goblins are cutting. The sky notices what is done to the land beneath it.", fx = { learn = { "venture_company" } } } },
      choices = {
        { text = "And what does it say of the days ahead?", next = "sky_ahead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_ahead = {
      lines = { { id = "sa_default", text = "It says that Mulgore will need its young to be strong sooner than the elders hoped. I do not read doom in that, only work, and I have never yet known the tauren to be afraid of work." } },
      choices = {
        { text = "The wind tells me the same.", next = "BACK", when = { class = { "SHAMAN", "DRUID" } }, reply = "Then I am glad to have it confirmed by one who hears what I can only see.", fx = { affinity = 1 } },
        { text = "Then I'll get to work. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "Know that it is Cairne's own tribe who live here, and that his son Baine speaks for the village while the chieftain sits in Thunder Bluff. Know also that no one goes hungry at Kauth's fire, whatever their people.", fx = { learn = { "cairne" } } } },
      choices = {
        { text = "Even one of the Forsaken?", next = "BACK", when = { race = "Scourge" }, reply = "Even so. You may not need the stew, but you are owed the seat, and I would have you take it." },
        { text = "A generous village. Something else.", next = "BACK" },
      },
    },
    welcome = {
      lines = { { id = "w_default", text = "You are welcome twice over, since you came with nothing in your hand and still stopped to speak with an old sky-watcher. The voucher is only a custom, while the welcome is the truth of the matter." } },
      choices = { { text = "Thank you, Vorn. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has read the skies for the Bloodhoof since the wandering years, when a missed storm could cost the tribe a herd." } },
    cairne = { { id = "tp_ca", text = "The chieftain asked that every newcomer be greeted, and it is the most pleasant duty in the village." } },
    venture_company = { { id = "tp_vc", text = "The birds have gone from the hills where they dig, and that tells me all I need to know of them." } },
    earth_mother = { { id = "tp_em", text = "An'she and Mu'sha are her eyes, and I spend my days looking back at them." } },
    _none = { { id = "tp_none", text = "The sky is silent on that, friend, and so I must be as well." } },
  },
}
