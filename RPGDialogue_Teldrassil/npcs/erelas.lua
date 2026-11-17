-- Erelas Ambersky, who raises young hippogryphs in Rut'theran Village and studies the wildkin (0.72.0). Voice: bibles/erelas.md
-- Classic: Favored of Elune?, Moontouched Wildkin, Find Ranshalla, Guardians of the Altar, Wildkin of Elune.
-- He lives here rather than in the Darnassus pack because Rut'theran Village is in the Teldrassil zone.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "erelas", id = TODO_NPC("Erelas Ambersky"), name = "Erelas Ambersky",
  bible = "bibles/erelas.md", role = "scholar", tier = "quest",
  communities = { "rutheran" }, temper = { "gentle", "curious" }, values = { "nature", "curious" },
  notices = { "pet", "form" },
  impression = {
    first = "Erelas Ambersky raises hippogryph chicks in Rut'theran and wonders aloud whether Elune made the wildkin. He asks questions the way other people breathe, and he listens to the answers.",
    third = "{name} met Erelas Ambersky, a druid in Rut'theran Village who raises young hippogryphs and studies the wildkin.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah, friend. Mind the nest on your left; that one bites, and she's only two weeks old." },
    { id = "g_feathers", when = { questActive = TODO_QUEST("Favored of Elune?") }, text = "Any luck in the Hinterlands? Bring the feathers carefully, if you can, and not too bloodied." },
    { id = "g_moon", when = { questActive = TODO_QUEST("Moontouched Wildkin") }, text = "Winterspring feathers, friend, the ones that have fallen in the snow. I can hardly sit still waiting for them." },
    { id = "g_answer", when = { questDone = TODO_QUEST("Wildkin of Elune") }, text = "I still think about what you found at that altar. Elune's own guardians, and we never knew!" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and two of the chicks have flown their first circle of the harbour since. You missed it, I'm sorry to say." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown a great deal since we first spoke on this pier. Like the chicks, really, except you complain less about being fed." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} back from the nests, please; the mothers will take an interest, and it won't be a friendly one." },
    { id = "n_moonkin", cat = "form", when = { form = "moonkin" },
      text = "Oh, look at you! Stand still a moment, because I've been staring at wildkin feathers all week, and you are the closest I've come to a live one that doesn't want to kill me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Erelas Ambersky, and I care for the young hippogryphs here until they're ready to fly. When I'm not cleaning nests, I study the wildkin, which some say Elune made with her own hands." },
        { id = "h_young", when = { maxLevel = 40 },
          text = "You're welcome to look around the nests, friend, though I'd not ask you to go chasing wildkin just yet. They are gentle right up until they decide you're a threat." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Favored of Elune?"), minLevel = 45 },
          text = "I've heard of wildkin living wild in the Hinterlands, and I'd give a great deal for a bundle of their feathers. Will you gather some for me?" },
        { id = "h_fav_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Favored of Elune?"), days = 3 } },
          text = "These feathers carry something, friend, a trace of power the creatures don't seem to wield at all. It's part of them, like the colour of their eyes." },
        { id = "h_moon_active", tags = { "news" }, when = { questActive = TODO_QUEST("Moontouched Wildkin") },
          text = "I've heard Winterspring has a great many wildkin, and I want to know if their feathers hold the same power. Gather what's fallen to the snow, and leave the owls be if you can." },
        { id = "h_ranshalla", tags = { "news" }, when = { questActive = TODO_QUEST("Find Ranshalla") },
          text = "Ranshalla went into Winterspring to watch the wildkin where they live. Catch up with her in the east and see what she's found, because she always finds more than I do." },
        { id = "h_altar", tags = { "news" }, when = { questActive = TODO_QUEST("Guardians of the Altar") },
          text = "Ranshalla means to go deep into the wildkin caves, friend, and I'm glad she has you beside her. Whatever you find in there, tell me everything." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wildkin of Elune"), days = 5 } },
          text = "The Arch Druid has your report, and I have my answer, or the start of one. They were set to guard something of Elune's, and the moon left her mark on them for it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle! Then you'll understand why I'd rather raise hippogryphs than argue in the Enclave." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I can talk and clean nests at the same time, for the hippogryphs have kept me humble these many centuries." },
        { id = "h_again2", text = "Go on. The chicks like the sound of voices, I think." },
      },
      choices = {
        { text = "Where do the hippogryph eggs come from?", next = "eggs" },
        { text = "Why study the wildkin?", next = "wildkin" },
        { text = "You speak of Ranshalla as though you miss her.", next = "ranshalla", when = { any = { { questActive = TODO_QUEST("Find Ranshalla") }, { questDone = TODO_QUEST("Moontouched Wildkin") } } } },
        { text = "What did the altar tell you?", next = "altar", when = { questDone = TODO_QUEST("Wildkin of Elune") } },
        { text = "Can I hold one of the chicks?", next = "chick" },
        { text = "How does a moonkin form compare?", next = "druid_e", when = { class = "DRUID" } },
        { text = "Have you any work for me?", next = "BUSINESS" },
        { text = "Goodbye, Erelas.", next = "END" },
      },
    },

    eggs = {
      lines = {
        { id = "eg_default", text = "Many of them come from Feralas, where the hippogryphs are in danger from the corruption there. A gnome named Curgle Cranklehop collects the eggs and has them sent to me, and I hatch them and raise them up." },
      },
      choices = {
        { text = "A gnome? Helping night elves with hippogryphs?", next = "eggs_curgle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eggs_curgle = {
      lines = {
        { id = "ec_default", text = "She has a gift for it, and a great deal of energy, and she ships eggs halfway across the world in crates I'd never trust with a teacup. Not one has broken yet, which I count as a small miracle." },
      },
      choices = {
        { text = "Is she in Feralas too?", next = "eggs_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eggs_where = {
      lines = {
        { id = "ew_default", text = "Gadgetzan, in Tanaris, so the eggs come a long way round. If you're ever in that desert, give her my thanks, and tell her the brown one with the white wingtips is flying now." },
      },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Erelas.", next = "END" },
      },
    },

    wildkin = {
      big = true,
      lines = {
        { id = "wi_default", text = "Because they're rumoured to have been made by Elune, and nobody seems to have checked. Ferocious monsters or misguided pets, the hunters say, but I'd like to know the truth before we decide." },
      },
      choices = {
        { text = "Some questions are better left to the priestesses.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. Somebody should ask instead of assuming.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What have you learned so far?", next = "wildkin_learned" },
      },
    },
    wildkin_learned = {
      lines = {
        { id = "wl_default", text = "That they're capable of great gentleness, and of terrible fury when something they think is important is threatened. That sounds to me less like a beast and more like a guardian." },
        { id = "wl_feathers", when = { questDone = TODO_QUEST("Favored of Elune?") },
          text = "That the feathers you brought hold a power the wildkin never seem to use, as though it were given to them rather than learned. That's what makes me think of Elune." },
      },
      choices = {
        { text = "A guardian of what?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ranshalla = {
      lines = {
        { id = "ra_default", text = "A colleague and a friend of mine, braver than I am and better at sitting still in the snow. She went to Winterspring to watch the wildkin in their own country, and she'd welcome company in the caves." },
      },
      choices = {
        { text = "I'll find her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    altar = {
      big = true,
      lines = {
        { id = "al_default", text = "That the wildkin in those caves were left to guard something sacred to Elune, and they've kept the watch longer than any of us remember. The Arch Druid will make of it what he likes, but I'll never look at an owlbeast the same way again." },
      },
      choices = {
        { text = "Then we should stop hunting them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Guardians or not, they attack travellers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chick = {
      lines = {
        { id = "ch_default", text = "Hold out your arm, not your hand, and keep still. There, she's decided you're furniture, which is the highest compliment a hippogryph chick can pay." },
      },
      choices = {
        { text = "She's heavier than she looks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_e = {
      lines = {
        { id = "de_default", text = "That's what I keep asking the druids who wear it! The Circle teaches the shape, but nobody can tell me whether it's borrowed from the wildkin or the other way about." },
      },
      choices = {
        { text = "Perhaps both come from the same place.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid who found he liked hatching things more than arguing about them. The hippogryphs keep me humble, and the wildkin keep me awake at night." } },
    advice = { { id = "tp_ad", text = "If a creature is fierce about something, find out what it's protecting before you decide it's a monster." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sends me eggs and questions, and I send back hippogryphs and more questions. It's a fair trade." } },
    teldrassil = { { id = "tp_tree", text = "Rut'theran sits at the tree's roots, so I get the sea air and the arrivals and none of the stairs. I wouldn't trade it." } },
    nordrassil = { { id = "tp_nordrassil", text = "The hippogryphs came down from Hyjal with us, and the old ones still turn their heads north when the wind's right. I think they miss the first tree as much as we do." } },
    green_dragons = { { id = "tp_green_dragons", text = "The Circle says Ysera's flight was cool toward this tree, and I believe it. The wildkin here hatch a little restless, and I've wondered if that's why." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I've walked the edge of the Dream once, and there were hippogryphs there as well, bigger and calmer than mine. I came back and fed mine extra, out of guilt." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins have asked me twice to sell them hatchlings. They didn't like my answer either time." } },
    _none = { { id = "tp_none", text = "I'm afraid I know hippogryphs and wildkin and not much else, friend. Vesprystus might know; he talks to everyone who flies." } },
  },
}
