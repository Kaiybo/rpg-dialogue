-- Karna Remtravel, dwarf engineer of the Marshal Expedition (0.72.0). Voice: bibles/karna.md
-- Built a mechanical ape to study the apes of Un'Goro; the apes had other ideas.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "karna", id = TODO_NPC("Karna Remtravel"), name = "Karna Remtravel",
  title = "Marshal Expeditions",
  bible = "bibles/karna.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "eager", "cheerful" }, values = { "curious", "inventive" },
  notices = { "craft", "pet" },
  impression = {
    first = "Karna Remtravel builds marvels and then sends them where marvels get dented. She is following in her uncle's footsteps, hunting lost cultures, and her mechanical ape A-Me 01 is her pride and her worry.",
    third = "{name} met Karna Remtravel, a dwarf engineer of the Marshal Expedition who built a mechanical ape named A-Me 01.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello, {g:lad|lass}! Isn't this crater wonderful? Mind the tracks, though, because something big came through last night, and it wasnae a mountain goat." },
    { id = "g_chase", when = { questActive = TODO_QUEST("Chasing A-Me 01") }, text = "Any sign of her? Fungal Rock, just east of here, and please be gentle with her." },
    { id = "g_done", when = { questDone = TODO_QUEST("Chasing A-Me 01") }, text = "A-Me's resting now, and so am I, which is a first. Thank you again; I mean it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}! I've redesigned A-Me's shoulder joint twice in that time, and by my forge I'm still not happy with it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Everyone at the Refuge seems to like you, and they're a hard crowd to please. Well, Spraggle isn't, but the rest are." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, you must see A-Me's gearing sometime, I used a mithril casing round the core and I'm very proud of it." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine {pet}! A-Me was meant to make friends with animals too, though it didn't quite go to plan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Karna Remtravel, engineer with the Marshal Expedition, and a Remtravel of Ironforge, aye! Have you seen all the wonderful things in Un'Goro? Not as wonderful as what I can build, of course, but for being all natural, it's not too bad." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Chasing A-Me 01") },
          text = "Something's happened to one of my greatest inventions. You've seen mechanical squirrels? Well, I built a mechanical ape, to get close to the apes of Un'Goro, and I call her A-Me 01." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Chasing A-Me 01") },
          text = "She has scrying gems for eyes, so I saw everything she saw, right up until she reached Fungal Rock. The last thing I saw was one of their alpha males rushing up to say hello." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Chasing A-Me 01"), days = 3 } },
          text = "You brought her home! A dent in the shoulder and one in the head, but nothing a dwarf with a hammer can't fix. I could kiss you, but I'll just say thank you." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Then you've surely heard of my uncle Remtravel, or you will, because he's never stopped digging long enough to be forgotten." },
      },
      again = {
        { id = "h_again", text = "What else? I love questions almost as much as I love gears, and nearly as much as a good dark ale." },
        { id = "h_again2", text = "Ask away! A-Me can't answer back yet, so I'm glad of the company." },
      },
      choices = {
        { text = "Why build a mechanical ape?", next = "ape" },
        { text = "Tell me about your uncle.", next = "uncle" },
        { text = "What happened at Fungal Rock?", next = "fungal" },
        { text = "You must hope to find something here.", next = "hope" },
        { text = "How did you build A-Me's eyes?", next = "gems", when = { profession = "Engineering" } },
        { text = "Animals know a fake when they see one.", next = "beasts", when = { class = { "HUNTER", "DRUID" } } },
        { text = "How can I help?", next = "BUSINESS" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    ape = {
      lines = { { id = "a_default", text = "The apes of Un'Goro are clever, and they won't let a dwarf within a hundred yards of their young. So I thought, why not send them a friend who looks like them and sees for me?" } },
      choices = {
        { text = "That sounds a lot like spying on them.", next = "ape_stance" },
        { text = "Did it work?", next = "ape_stance" },
      },
    },
    ape_stance = {
      big = true,
      lines = { { id = "as_default", text = "It worked beautifully until it didn't, and I learned more in three days than in three months. Spying is a strong word, though; I'd call it very polite watching." } },
      choices = {
        { text = "Leave them be. They didn't ask to be studied.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Knowledge is worth a little trespass.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uncle = {
      lines = { { id = "u_default", text = "My uncle Remtravel loves old things and lost cultures, the older and more lost the better. I'm following in his footsteps, kind of, only with more gears and fewer cave-ins." } },
      choices = {
        { text = "Fewer cave-ins?", next = "uncle_cave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uncle_cave = {
      lines = { { id = "uc_default", text = "He's had a few, and he always says they were worth it. Family stories say he once dug through a wall and found a room nobody had seen in a thousand years, and then the wall came down behind him." } },
      choices = { { text = "Brave man.", next = "BACK", fx = { affinity = 1 } } },
    },
    fungal = {
      lines = { { id = "f_default", text = "The apes' lair, a cave full of glowing mushrooms just east of the Refuge. A-Me walked in, the big male walked up, and then everything went dark, and I've been biting my nails since." } },
      choices = {
        { text = "Do you think she's broken?", next = "fungal_broken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fungal_broken = {
      lines = { { id = "fb_default", text = "Dented, I hope, not broken. If you find her and she's lost power, a mithril casing should get her moving again, so take one with you if you have it." } },
      choices = { { text = "I'll bring her back.", next = "BACK", fx = { affinity = 1 } } },
    },
    hope = {
      lines = { { id = "h3_default", text = "Proof that somebody lived here long before us, somebody clever. The pylons and the stone guardians around the crater were made by someone, and I'd give anything to know who." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gems = {
      lines = { { id = "g2_default", text = "Two scrying gems, cut as a matched pair, so whatever one sees the other shows. The hard part was the eyelids; you'd be amazed how odd an ape looks if it never blinks." } },
      choices = { { text = "That's brilliant work.", next = "BACK", fx = { affinity = 2 } } },
    },
    beasts = {
      lines = { { id = "b_default", text = "You might be right, and that alpha male certainly thought so. Maybe A-Me needs to smell like an ape too, though I'm not looking forward to that part of the design." } },
      choices = { { text = "Good luck with that.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf engineer, a Remtravel, and a member of the Marshal Expedition, which mostly means I get to see wonderful things and run away from them." } },
    advice = { { id = "tp_ad", text = "Always build two of anything important. I only built one A-Me, and look how that turned out." } },
    explorers_league = { { id = "tp_el", text = "My uncle's the one for the Explorers' League; I'm more for building than digging. Still, I'd love to show them A-Me one day." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, {g:lad|lass}! But give me a forge and a wee bit of time, and I could build something that does." } },
  },
}
