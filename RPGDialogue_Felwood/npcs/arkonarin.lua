-- Captured Arko'narin, caged in Shadow Hold beneath Jaedenar. Voice: bibles/arkonarin.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "arkonarin", id = TODO_NPC("Captured Arko'narin"), name = "Captured Arko'narin",
  bible = "bibles/arkonarin.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "fierce", "proud" }, values = { "loyal", "brave" },
  notices = { "class", "weary" },

  impression = {
    first = "Arko'narin was caged in the dark beneath Jaedenar, bruised and furious, and still more worried about her friend's sword than her own skin. She will not let anyone see her break.",
    third = "{name} found Arko'narin caged by the Shadow Council in Shadow Hold, still fighting.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice down! The cultists come through here more often than you'd think." },
    { id = "g_key", when = { questActive = TODO_QUEST("A Strange Red Key") }, text = "Is that a key in your hand? Please, tell me that's a key." },
    { id = "g_ready", when = { questActive = TODO_QUEST("Rescue From Jaedenar") }, text = "Lightforge first, then out. Stay close and don't stop for anything." },
    { id = "g_away", when = { away = 14 }, text = "You went away for {away} and came back down here? Either you're mad or you've a reason, and I hope it's the second." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You look like you've been through more than this place since I saw you last. Good, because this place hasn't got any easier." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Even the cultists talk, and they say someone's been giving them grief upstairs. I hope it was you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "You're of the Silver Hand, or near enough. Don't look at me like that; I've seen that light before, and I know where it ended up." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, down here? The Circle should be burning this place out, not sending one of you into it alone." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your armor's in pieces. Whatever you met on the way down, there's worse waiting on the way up, so be ready for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "You're not one of them, are you? I'm Arko'narin, and the Shadow Council has had me in this cage for more days than I can count. I came to Jaedenar with a friend to find out what the Council was doing here, and we found out far more than we wanted." },
        { id = "h_key", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange Red Key") },
          text = "The key, you've found it! It's made of bone, isn't it, and heavy for its size? The cultist who carries it likes to rattle it against the bars while he tells me what's coming, so give it here and let's see how he likes losing it." },
        { id = "h_ready", tags = { "news" }, when = { questActive = TODO_QUEST("Rescue From Jaedenar") },
          text = "Our gear is close, and Trey's sword with it. Once I have Lightforge in my hands, nothing in this barrow is going to keep me in it." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "You came down here with a beast at your heel and the cultists didn't hear you coming? Then you're better at this than Trey and I ever were." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "You smell of the same fire as the ones who put me in here. If you've come to ask me questions too, you can save your breath, because I've heard them all already." },
      },
      again = {
        { id = "h_again", text = "Ask quickly. We don't have long before someone comes to check on me." },
        { id = "h_again2", text = "What else? Talk while you can; it's been a long time since anyone here spoke kindly." },
      },
      choices = {
        { text = "Who did you come here with?", next = "trey" },
        { text = "What is the Council doing down here?", next = "council" },
        { text = "There must be some way to get you out.", next = "out" },
        { text = "Jessir Moonbow is waiting for you.", next = "jessir", when = { questActive = TODO_QUEST("Rescue From Jaedenar") } },
        { text = "I'm a paladin. Who was your friend?", next = "xpala", when = { class = "PALADIN" } },
        { text = "I'm no Council warlock. I'm here to help.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Hold on. I'll be back.", next = "END" },
      },
    },
    trey = {
      lines = {
        { id = "t_default", text = "Trey Lightforge, a Knight of the Silver Hand, and the best friend I've ever had. They took him away first, because they thought a paladin would know more than I did, and I heard everything they did to him through these walls." },
      },
      choices = {
        { text = "Is he still alive?", next = "trey_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trey_dead = {
      lines = {
        { id = "td_default", text = "No. He held out longer than anyone should have to, and then the succubus they keep down here finished him. I keep telling myself I'll grieve when I'm out, because if I start now I won't stop." },
      },
      choices = {
        { text = "Who was the succubus?", next = "trey_rakaiah" },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    trey_rakaiah = {
      big = true,
      lines = {
        { id = "tr_default", text = "Rakaiah, they call her, and she laughs while she works. I don't want revenge, I tell myself, but then I hear that laugh again and I know I'm lying." },
      },
      choices = {
        { text = "Revenge won't bring him back. Get home first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then let her hear you laugh last.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "c_default", text = "They're working with the demons, and not the way a cult prays to something far away. There are demons walking these halls as if they own them, and the warlocks bow to them and call it an alliance." },
      },
      choices = {
        { text = "What were they trying to learn from you?", next = "council_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_ask = {
      lines = {
        { id = "ca_default", text = "Who sent us, and how many more were coming, and what Darnassus knows. The answer to all of it was nothing, which they didn't like, so they kept asking." },
      },
      choices = {
        { text = "Then Darnassus has to be told.", next = "council_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_tell = {
      big = true,
      lines = {
        { id = "ct_default", text = "That's why I can't just run; I have to get out with proof and carry it home myself. If I die on the stairs, everything Trey went through was for nothing, and I won't allow that." },
      },
      choices = {
        { text = "Your duty matters most. I'll see you home.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget orders. Just live through this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    out = {
      lines = {
        { id = "o_default", text = "One of the cultists carries a key made of bone, red as old blood. He's somewhere in Jaedenar, and he likes to come and gloat, so he won't have gone far." },
        { id = "o_key", when = { questActive = TODO_QUEST("A Strange Red Key") }, text = "You've already got the key, so let me out! Then we find our gear and Trey's sword, and we fight our way up together." },
      },
      choices = {
        { text = "You must have plans for after that.", next = "out_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    out_after = {
      lines = {
        { id = "oa_default", text = "Then I go to Darnassus as fast as my legs will carry me, and you find my friend Jessir at the Emerald Circle's camp near the Ashenvale border. Tell her I'm alive, and tell her about Trey, because I don't think I can." },
      },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jessir = {
      lines = {
        { id = "j_default", text = "Jessir's still waiting? Of course she is, she'd wait at that camp until the trees grew back. She'll have that wolf of hers with her, and she'll be pretending not to worry." },
      },
      choices = {
        { text = "She's worried sick.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = {
        { id = "xp_default", text = "Trey Lightforge, and he'd have liked you, because he liked everyone, which was his worst fault. His sword is still down here somewhere, and I won't leave without it, whatever you say." },
      },
      choices = {
        { text = "Then we'll carry it out together, in his honor.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A sword isn't worth your life. Leave it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "You'll understand if I don't take your word for it. Open this cage, and then I'll believe you, and not one moment sooner." },
      },
      choices = {
        { text = "Right. I'll find the key.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a night elf from Darnassus who walked into a trap with her best friend. Ask me again when I'm out of this cage." } },
    advice = { { id = "tp_ad", text = "Don't let them take you alive. Whatever happens on the stairs, don't let them take you alive." } },
    silver_hand = { { id = "tp_sh", text = "Trey's order. He'd want me to say something kind about them, so I'll say they make friends worth dying for." } },
    burning_legion = { { id = "tp_bl", text = "They're here, walking around this barrow as if it were theirs. Whoever says the demons left Felwood has never been down these stairs." } },
    elune = { { id = "tp_elune", text = "I've prayed to Elune every night in this cage, and she sent you, so I suppose she listens after all. I'd like her to send a key next." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess would never have let us come here without a full company of Sentinels. That's why we didn't ask her." } },
    holy_light = { { id = "tp_holy_light", text = "Trey prays to the Light, and he says it goes with him even into a place like this. I hope he's right, because he's somewhere in here too." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs of Shadow Hold are the worst of them, cruel and clever both. They laughed while they put me in here, and I've been listening to them laugh ever since." } },
    _none = { { id = "tp_none", text = "I don't care about that right now. Get me out of here, by Elune, and I'll answer anything you like." } },
  },
}
