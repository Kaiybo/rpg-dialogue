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
    hello = {
      lines = { { id = "h_default", key = true, text = "Willix, importer, at your service, or I would be if these pigs hadn't grabbed me and my whole shipment on the road. Get me out of the Kraul and I promise you'll never regret the investment." } },
      again = { { id = "h_again", text = "What, more questions? The meter's runnin' on my life here, pal." }, { id = "h_again2", text = "Sure, sure, ask away, just keep one eye on the tunnel." } },
      choices = {
        { text = "How did a goblin end up here?", next = "caught" },
        { text = "What were you importing?", next = "goods" },
        { text = "What do the quilboar want with you?", next = "quilboar" },
        { text = "You've got some nerve, trading out here.", next = "nerve" },
        { text = "Let's get you out of here.", next = "BUSINESS" },
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
  },

  topics = {
    charlga = { { id = "tp_ch", text = "Charlga Razorflank, the bossy old sow who runs this place. Scary lady, and I've met tax collectors." } },
    _none = { { id = "tp_none", text = "Pal, I'm a hostage, not an information broker, so ask me again when I'm free and charging." } },
  },
}
