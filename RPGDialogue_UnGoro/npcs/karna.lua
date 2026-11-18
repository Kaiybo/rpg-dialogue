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
    op_gnomeregan = {
      lines = {
        { id = "opg_q", text = "Some folks say gnomes should have stopped tinkering after Gnomeregan, which is silly, but I hear it a lot. What do you think, should we go back for it, or let it go?" },
      },
      choices = {
        { text = "Take it back. It's your home, and the troggs don't deserve it.", next = "op_gnomeregan_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { gnomeregan = "reclaim" } } },
        { text = "Let it go. The radiation's not worth more gnome lives.", next = "op_gnomeregan_r2", fx = { affinity = -1, align = { honor = -1 }, trait = { cautious = 1 }, opinion = { gnomeregan = "lost" } } },
        { text = "Your people poisoned it themselves. Be careful what you build next.", next = "op_gnomeregan_r3", fx = { trait = { stern = 1 }, opinion = { gnomes = "reckless" } } },
        { text = "Gnomeregan will be ours again, Karna. I'll see to it.", next = "op_gnomeregan_r4", fx = { affinity = 2, opinion = { gnomeregan = "reclaim" } }, when = { race = "Gnome" } },
        { text = "That's for the gnomes to decide, Karna.", next = "BACK" },
      },
    },
    op_gnomeregan_r1 = {
      lines = {
        { id = "op_gnomeregan_r1", text = "That's what I think too! A-Me 01 would help, if she weren't busy getting dented in the jungle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_gnomeregan_r2 = {
      lines = {
        { id = "op_gnomeregan_r2", text = "Maybe you're right, and that's a sad thing to say. I still dream about the lifts, though." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_gnomeregan_r3 = {
      lines = {
        { id = "op_gnomeregan_r3", text = "Ouch, but fair, I suppose. I've been very careful with A-Me 01's power cells, I promise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_gnomeregan_r4 = {
      lines = {
        { id = "op_gnomeregan_r4", text = "Oh, I'll hold you to that! Bring me something from the old workshops when you go, would you?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Does engineering run in your family?", next = "uncle" },
        { text = "What happened at Fungal Rock?", next = "fungal", when = { any = { { questActive = TODO_QUEST("Chasing A-Me 01") }, { questDone = TODO_QUEST("Chasing A-Me 01") } } } },
        { text = "You must hope to find something here.", next = "hope" },
        { text = "How did you build A-Me's eyes?", next = "gems", when = { profession = "Engineering" } },
        { text = "Animals know a fake when they see one.", next = "beasts", when = { class = { "HUNTER", "DRUID" } } },
        { text = "A-Me's home safe. What comes next?", next = "next", when = { questDone = TODO_QUEST("Chasing A-Me 01") } },
        { text = "What do you make of Shizzle's flyer?", next = "shizzle" },
        { text = "Gnomes have built mechanical squirrels for years.", next = "squirrel", when = { race = "Gnome" } },
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
        { text = "Leave them be. They didn't ask to be studied.", next = "BACK", reply = "They didn't, I'll grant you, and the alpha made that very clear to A-Me 01. Perhaps I'll study them from a polite distance next time.", fx = { align = { order = 1 } } },
        { text = "Knowledge is worth a little trespass.", next = "BACK", reply = "That's my feeling too, though Hol'anyee would scold us both for it. A little trespass, a lot of notes, and nobody gets hurt, ideally.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    uncle = {
      lines = { { id = "u_default", text = "My uncle Remtravel loves old things and lost cultures, the older and more lost the better. I'm following in his footsteps, kind of, only with more gears and fewer cave-ins." } },
      choices = {
        { text = "Do you ever think about Gnomeregan?", next = "op_gnomeregan" },
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
    next = {
      lines = { { id = "n2_default", text = "A-Me 02, of course! Thicker plating on the head, a softer voice-box she can't use yet, and maybe a scent pouch, if I can bear to collect the scent. The apes have met her once now, so the next one might get a proper welcome." } },
      choices = {
        { text = "Do the apes really need a second visitor?", next = "next_stance" },
        { text = "A voice-box? For an ape?", next = "next_voice" },
      },
    },
    next_voice = {
      lines = { { id = "nv_default", text = "Not for talking to the apes, silly, for talking to me! If she could say what she saw instead of only showing it, I'd stop chewing my nails every time the gems go dark." } },
      choices = { { text = "You care about her a great deal.", next = "BACK", fx = { affinity = 1 } } },
    },
    next_stance = {
      big = true,
      lines = { { id = "ns_default", text = "That's what Hol'anyee asked me, though less politely, and I didn't have a good answer. What would you do, if you could learn something nobody has ever known, and the only price was bothering some apes?" } },
      choices = {
        { text = "Send A-Me 02. Knowledge builds a better world.", next = "BACK", reply = "That's what I'd like to believe, and you've made me feel much better about the blueprints. A-Me 02 it is, with stronger shoulders this time.", fx = { align = { order = 1 } } },
        { text = "Let the apes be. Not every door needs opening.", next = "BACK", reply = "Maybe you're right, and maybe some doors are better left shut. I'll keep the blueprints anyway, just in case.", fx = { align = { order = -1 } } },
        { text = "I'd need to think on that.", next = "BACK" },
      },
    },
    shizzle = {
      lines = { { id = "sz_default", text = "Oh, it's a wonderful idea, built with tremendous enthusiasm and a frightening lack of arithmetic! He keeps asking to see A-Me's casing, and I keep saying yes, the moment his flyer stops landing on people." } },
      choices = {
        { text = "Has it landed on you?", next = "shizzle_land" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shizzle_land = {
      lines = { { id = "szl_default", text = "Only on my tent, and only once, but A-Me's spare arm was inside it! We're friends again now, mostly, though I've moved my tent uphill of his testing ground." } },
      choices = { { text = "Very sensible.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    squirrel = {
      lines = { { id = "sq_default", text = "Squirrels, yes, and very good ones, I took one apart as a girl and couldn't put it back together for a month! An ape's a different problem, though; a squirrel only has to look like a squirrel, but an ape has to behave like one, or the others notice." } },
      choices = { { text = "Gnomish squirrels behave beautifully.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } } },
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
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan was the most wonderful city in the world, and we lost it, and I was too young to help. That's why I build things that go where things get dented, so I'm never too young again." } },
    magni = { { id = "tp_magni", text = "King Magni gave the gnomes a home in Ironforge when we had nowhere else, and I'll always love him for it. He's very loud, though." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan sells good parts, if you check every one, and I check every one twice. A-Me 01's left arm came from there, and it's still the best part of her." } },
    silithid = { { id = "tp_silithid", text = "The bugs crawling up from Silithus are fascinating, mechanically speaking, all levers and plates. I'd like to take one apart, if it would hold still." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, {g:lad|lass}! But give me a forge and a wee bit of time, and I could build something that does." } },
  },
}
