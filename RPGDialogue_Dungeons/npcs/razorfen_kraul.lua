-- Razorfen Kraul: Willix the Importer, a goblin captive of the quilboar who wants out, and
-- Charlga Razorflank, the crone who speaks for Agamaggan's thorns.
-- Voices: bibles/dg_willix.md, bibles/dg_charlga.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Willix the Importer: a goblin trader caught by the quilboar, desperate and still selling.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_willix", id = TODO_NPC("Willix the Importer"), name = "Willix the Importer",
  bible = "bibles/dg_willix.md", role = "questgiver", tier = "quest",
  temper = { "anxious", "chatty" }, values = { "greedy", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Even tied up, he's pricing your gear with his eyes.",
    third = "{name} found Willix the Importer held captive deep in Razorfen Kraul.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Pal! My favourite rescuer in the world! Every time I see you, I feel about forty percent less likely to die." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd rather you than a quilboar, pal, but honestly, not by much right now." },
    { id = "g_default", text = "Hey, hey, over here, pal! You're not a quilboar, which already makes you my favorite person in this whole thorny dump." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Willix the Importer") }, text = "Okay, we're doin' this, we're really doin' this, so stay close and keep those pigs off me, because I'm not built for runnin'." },
    { id = "g_done", when = { questDone = TODO_QUEST("Willix the Importer") }, text = "You came back in here on purpose? Friend, I don't know whether to admire you or bill you for my nerves." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Nice soft boots you got there. You walked right past three of 'em, and that's a skill I'd pay good coin to rent." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Look, whatever your cousins said about the Cartel, I'm independent, so let's keep this strictly business." },
  },

  start = "hello",
  nodes = {

    wx_ratchet = {
      lines = { { id = "wxr_1", text = "Half the town, pal, but mostly Gazlowe, because the boss of Ratchet likes his rum strong and his fireworks on time. I'm three days late now, so if he asks, I was kidnapped heroically, which is technically true." } },
      choices = {
        { text = "Will Gazlowe forgive a late delivery?", next = "wx_ratchet2" },
        { text = "Heroically tied to a post. I'll vouch for that.", next = "wx_ratchet2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wx_ratchet2 = {
      lines = { { id = "wxr2_1", text = "Gazlowe forgives anything with a good enough story attached, and pal, this story's got pigs, thorns and a mystery rescuer, so I'm sellin' it to the whole dock. You want a cut of the telling rights, we can talk." } },
      choices = {
        { text = "Keep the rights. Just get out alive.", next = "BACK", reply = "Now there's a deal I can afford, pal, and I can't afford much right now.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wx_maze = {
      lines = { { id = "wxm_1", text = "Tell me about it, pal; I've been dragged through every tunnel in here and I still can't tell 'em apart. There's a big ugly boar beast they keep penned near the bottom, too, and they talk to it like it's royalty." } },
      choices = {
        { text = "Which way leads out?", next = "wx_maze2" },
        { text = "I'm a druid. These thorns grew from Agamaggan's blood.", next = "BACK", when = { class = "DRUID" }, reply = "From a dead god's blood? Pal, that is the last thing I needed to know while I'm tied to one. Thanks, I guess." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wx_maze2 = {
      lines = { { id = "wxm2_1", text = "Up and toward the light, which is my whole plan, and it's a good plan, because the quilboar like it dark and their shamans like it darker. Keep me between you and the walls, pal, and if you hear a horn, run first and ask questions in Ratchet." } },
      choices = {
        { text = "Toward the light it is. Stay close.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", key = true, text = "Willix, importer, at your service, or I would be if these pigs hadn't grabbed me and my whole shipment on the road. Get me out of the Kraul and I promise you'll never regret the investment." } },
      again = { { id = "h_again", text = "What, more questions? The meter's runnin' on my life here, pal." }, { id = "h_again2", text = "Sure, sure, ask away, just keep one eye on the tunnel." } },
      choices = {
        { text = "How did a goblin end up here?", next = "caught" },
        { text = "What were you importing?", next = "goods" },
        { text = "What do the quilboar want with you?", next = "quilboar" },
        { text = "You've got some nerve, trading out here.", next = "nerve" },
        { text = "I could've just walked past, you know.", next = "past", when = { class = "ROGUE" } },
        { text = "Ratchet's goblins say you owe them money.", next = "debts", when = { faction = "Horde" } },
        { text = "Let's get you out of here.", next = "BUSINESS" },
        { text = "Who in Ratchet were you delivering to?", next = "wx_ratchet" },
        { text = "This place is a maze of thorns.", next = "wx_maze" },
        { text = "Good luck, Willix.", next = "END" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "I took a shortcut through the southern Barrens to save two days on a delivery to Ratchet, and two days is real money, friend. Turns out the quilboar charge a toll, and the toll is you." } },
      choices = {
        { text = "That shortcut cost you a lot more.", next = "BACK", reply = "Don't I know it, and I'm writin' the whole thing off as a learning expense.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods = {
      lines = { { id = "g1_default", text = "Fine spirits, a few crates of fireworks, some very delicate Kalimdor curios, and none of it insured, because insurance is for people who plan on bad luck." } },
      choices = {
        { text = "Fireworks, around the quilboar?", next = "fireworks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fireworks = {
      lines = { { id = "f_default", text = "Yeah, one of 'em lit a crate to see what it did, and now he's missin' most of his bristles and calls himself a holy man. I think I may have started a religion, and nobody's paying me royalties." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quilboar = {
      lines = { { id = "q_default", text = "Near as I can tell, the old crone Charlga thinks I'm some kind of offering to their big dead boar god, Agamaggan. I'm too stringy for that, and I told 'em so, but they don't speak Goblin and they sure don't speak reason." } },
      choices = {
        { text = "The quilboar are just defending their home.", next = "BACK", reply = "Sure, sure, and I'm just a guy who'd like to defend my neck. We can both have our principles, pal.", fx = { align = { order = -1 } } },
        { text = "Those savages need to be cleared out.", next = "BACK", reply = "Now you're talkin' my language, and I'd pay to see it, if I had anything left to pay with.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "charlga" } } },
      },
    },
    nerve = {
      lines = { { id = "n_default", text = "Nerve's free, and that's the only thing in the Barrens that is. Anyway, somebody's gotta bring rum to Ratchet, and if it ain't me, it's some Venture Company creep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "ps_default", text = "Sure you could've, and I'd have hated you for it all the way to the altar. But you didn't, and that tells me you're the kind of operator who knows a good return when one's tied to a post." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    debts = {
      lines = { { id = "db_default", text = "Owe? Owe is a strong word, pal. I prefer to call it a long-term arrangement with flexible terms, and the terms get a whole lot more flexible if I'm dead, so think of savin' me as protectin' their investment." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're a real lifesaver, pal, literally! When I'm back in business, there's a discount with your name on it." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been rough with me, pal, and I'm already tied up in a thorny hole. Lighten up a little." },
    },
    charlga = { { id = "tp_ch", text = "Charlga Razorflank, the bossy old sow who runs this place. Scary lady, and I've met tax collectors." } },
    _none = { { id = "tp_none", text = "Pal, I'm a hostage, not an information broker, so ask me again when I'm free and charging." } },
  },
}
