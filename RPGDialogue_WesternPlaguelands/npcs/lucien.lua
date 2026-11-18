-- Lucien Sarkhoff, the Barovs' butler, a ghost at Caer Darrow beside his wife Eva. Voice: bibles/lucien.md
-- Trained never to show what he feels, and still trying, long after there's no one left to serve.
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lucien", id = TODO_NPC("Lucien Sarkhoff"), name = "Lucien Sarkhoff",
  bible = "bibles/lucien.md", role = "questgiver", tier = "quest",
  communities = { "caer_darrow" }, temper = { "reserved" }, values = { "dutiful", "loyal" },
  notices = { "status", "class" },
  impression = {
    first = "Lucien Sarkhoff still stands like a butler waiting at a door, though the house he served is a school of necromancy and he has been dead for years. He lets his wife do the talking, and when he speaks himself, every word is chosen with care.",
    third = "{name} met Lucien Sarkhoff, once butler to House Barov, now a ghost keeping vigil at Caer Darrow with his wife Eva.",
  },

  greetings = {
    { id = "g_formal", text = "Good day to you. If you've come to see my wife, she is just there, and she'll be glad of the company." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Eva said you would, and Eva is generally right about such things." },
    { id = "g_butcher", when = { questActive = TODO_QUEST("Doctor Theolen Krastinov, the Butcher") }, text = "Krastinov. I would ask you to be careful, but I have seen his rooms, and careful is not enough." },
    { id = "g_away", when = { away = 14 }, text = "It has been {away}, I believe. Time is difficult to keep here, but I was trained to keep it, and old habits linger." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown formidable since you first came to the lake. Master Barov would have offered you a seat at table, and I would have poured." },
  },

  notice = {
    { id = "n_noble", cat = "status", when = { origin = "human_minor_noble" },
      text = "You carry yourself like someone who grew up with staff, if you'll forgive my saying so. I don't mean it unkindly; I can always tell, that's all." },
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "MAGE" } },
      text = "You study the arts. So did the young people who came to the house each evening, and they always wiped their boots very politely before going down to the cellars." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lucien Sarkhoff, at your service, or at the service of whoever is left to serve. I was butler to House Barov, and my wife Eva was head maid, and we kept the house until it was no longer a house." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Doctor Theolen Krastinov, the Butcher") },
          text = "If you mean to help us, my wife will tell you how; she has always been better with requests than I have. I'll only say that we'd both like very much to stop being here." },
        { id = "h_bag", tags = { "news" }, when = { questRecent = { TODO_QUEST("Krastinov's Bag of Horrors"), days = 3 } },
          text = "You've brought his bag out of that place. I don't wish to see inside it, and I'd thank you not to describe it, but I'm grateful beyond what I can show." },
        { id = "h_herald", when = { questActive = TODO_QUEST("Kirtonos the Herald") },
          text = "The herald comes when he is called, and the house will be ready for him, it always is. Please don't let him stay long." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Kirtonos the Herald") },
          text = "The edges of things are going soft, and Eva is smiling, which I had nearly forgotten she could do. You have my deepest thanks, and I'm sorry I can't say it better." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You are one of the risen, but your eyes are your own. Forgive me if I keep a little distance; the last of your kind I saw up close were carrying my wife down the cellar stairs." },
      },
      again = {
        { id = "h_again", text = "Is there anything further? Take your time; the dead have little else." },
        { id = "h_again2", text = "Please, go on. Eva says I don't let people finish, and I'm trying to improve." },
      },
      choices = {
        { text = "House Barov must have been grand, before.", next = "house" },
        { text = "How did you and Eva come to be here?", next = "fate" },
        { text = "You let Eva do most of the talking.", next = "eva" },
        { text = "What became of the Barov family?", next = "sons" },
        { text = "I was raised in a house like this one.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "How can I help you?", next = "BUSINESS" },
        { text = "Good day, Lucien.", next = "END" },
      },
    },

    house = {
      lines = { { id = "ho_default", text = "Grand, and orderly, and full of guests in the good years. Master Barov liked a table laid for twenty and the silver bright enough to read by, and I liked that he noticed when it was." } },
      choices = {
        { text = "When did it change?", next = "house_change" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house_change = {
      lines = { { id = "hc_default", text = "When the new guests began arriving after dark and leaving before dawn, and Master Barov stopped asking me to set the table at all. A butler learns not to ask questions, and I was very good at my work." } },
      choices = {
        { text = "You seem to blame yourself for not asking.", next = "house_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house_blame = {
      big = true,
      lines = { { id = "hb_default", text = "Every evening, I think, though it's hard to tell evenings apart now. If I had asked, I'd have been dismissed and my questions forgotten, and if I hadn't asked, well, here we are." } },
      choices = {
        { text = "It wasn't your place. You did your duty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You should have asked. Duty isn't an excuse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fate = {
      lines = { { id = "fa_default", text = "Eva hid in the keep for months when we understood what the house had become, and I stayed near her as best I could. In the end Doctor Krastinov found us both, and I'll say no more than that, if you'll allow me." } },
      choices = {
        { text = "Of course. I'm sorry.", next = "fate_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fate_sorry = {
      lines = { { id = "fs_default", text = "Thank you. We only want our remains seen to properly, so that we can stop keeping watch over a house that doesn't need us. It's a small request, I know, for a very large house." } },
      choices = {
        { text = "It isn't small. I'll see it done.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    eva = {
      lines = { { id = "ev_default", text = "I was trained not to speak unless spoken to, and to keep my face still whatever was said at table. Eva says I've earned the right to stop, but a lifetime is a long habit to break." } },
      choices = {
        { text = "You can stop now, Lucien.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sons = {
      lines = { { id = "so_default", text = "Weldon still lives and Alexi walks with the Forsaken, I'm told, and they each blame the other for selling the house to the wrong people. They were very well-behaved boys at dinner, which I suppose tells you nothing at all." } },
      choices = {
        { text = "Do you blame them?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    noble = {
      lines = { { id = "no_default", text = "Then you'll know there was always someone like me just behind the door, listening for the bell. I hope you were kind to yours; most of the families were, and the ones who weren't, we remembered." } },
      choices = {
        { text = "I tried to be. I hope I was.", next = "BACK", fx = { affinity = 1 } },
        { text = "I barely noticed them, to tell the truth.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept House Barov's silver and House Barov's secrets, and only one of those was ever worth keeping." } },
    advice = { { id = "tp_ad", text = "Watch who arrives after dark, and who stops asking you to set the table. It's not much, but it's what I learned too late." } },
    scholomance = { { id = "tp_scholo", text = "That is what they call the house now. I prefer not to." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "The master of the house made his arrangement with Kel'Thuzad in the great hall, and I poured the wine. I have regretted that glass for a very long time." } },
    lordaeron = { { id = "tp_lordaeron", text = "I served House Barov when Lordaeron was whole, and the house was the finest on Darrowmere Lake. It is a school now, and I am still standing at its door." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came to Caer Darrow as guests, and stayed as masters. I should have locked the gate, and I did not." } },
    _none = { { id = "tp_none", text = "I'm afraid I couldn't say. Eva may know; she always knew more of the household gossip than I did." } },
  },
}
