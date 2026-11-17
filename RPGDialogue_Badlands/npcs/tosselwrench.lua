-- Lucien Tosselwrench, Lotwil Veriatus's assistant: a pessimistic gnome alchemist who expects the worst and brews for it.
-- Voice: bibles/tosselwrench.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_HARD = TODO_QUEST("This Is Going to Be Hard")
local Q_LIQUID = TODO_QUEST("Liquid Stone")
local Q_STONE = TODO_QUEST("Stone Is Better than Cloth")
local Q_GYRO = TODO_QUEST("Gyro... What?")

P:NPC {
  key = "tosselwrench", id = TODO_NPC("Lucien Tosselwrench"), name = "Lucien Tosselwrench",
  bible = "bibles/tosselwrench.md", role = "questgiver", tier = "quest",
  communities = { "badlands_camp" }, temper = { "anxious", "dry" }, values = { "careful", "loyal" },
  notices = { "race", "craft", "class" },

  impression = {
    first = "Lucien Tosselwrench is Lotwil Veriatus's assistant, a gnome who keeps the camp's notes, mixes its potions and expects every experiment to end in fire. He offered me a beer before he offered me his name, and I gathered both were meant to steady his nerves.",
    third = "{name} met Lucien Tosselwrench, Lotwil Veriatus's long-suffering assistant in the Badlands.",
  },

  greetings = {
    { id = "g_default", text = "You've got to try some of this beer, really, because it's the only thing in the camp that hasn't exploded yet." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, you're back, and in one piece, which is more than I'd have wagered. Has Lotwil sent you, or have you come to hide?" },
    { id = "g_hard", when = { questActive = Q_HARD }, text = "Cog number five, is it? Yes, this isn't going to be good, and I want that noted somewhere for the inquest." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, out here! If Lotwil asks, you're my replacement, and I've gone home to Ironforge to sleep for a month." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, by the stains, and a good one, I hope, because I could use somebody in this camp who understands a stopper." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, out of Kargath, I expect. That's fine, Lotwil says knowledge has no banner, and I say the explosions don't either." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lucien Tosselwrench, assistant to the great Lotwil Veriatus, and keeper of the notes, the potions and the list of everything that's caught fire. The list is long, and I keep a second copy somewhere safe, in case the first one catches fire too." },
        { id = "h_gyro", when = { questDone = Q_GYRO, questBefore = Q_LIQUID },
          text = "So you've been fetching parts for Lotwil's newest marvel, which means it's nearly finished, which means I need to get ready. I'll need a healing potion and an invisibility potion, and I'm not going to tell you which one I expect to use first." },
        { id = "h_liquid", when = { questActive = Q_LIQUID },
          text = "A healing potion and a lesser invisibility potion, that's all I ask, and please hurry, because he's getting closer to finishing and I can hear him humming." },
        { id = "h_liquid_done", tags = { "news" }, when = { questRecent = { Q_LIQUID, days = 3 } },
          text = "I've got both potions on my belt now, and I've practised drinking them in the dark, and I think I can do the pair in under a breath. Thank you again, from the bottom of my soon-to-be-singed heart." },
        { id = "h_stone", when = { questActive = Q_STONE },
          text = "Patterned bronze bracers, from any blacksmith who knows the pattern, and I'll set the stones in them for you. I wouldn't wait too long, because who knows what Lotwil will do next?" },
        { id = "h_stone_done", tags = { "news" }, when = { questRecent = { Q_STONE, days = 3 } },
          text = "How do the bracers fit? The stones are the ones you gathered for Lotwil, so you could say you earned them twice, and he never noticed a single one was missing." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, before he calls for me." },
        { id = "h_again2", text = "Go on. I've a minute, unless something blows up." },
        { id = "h_again3", text = "More questions? Have some more beer, then; it helps." },
      },
      choices = {
        { text = "What is Lotwil building?", next = "machine" },
        { text = "Why work for him if you expect disaster?", next = "why" },
        { text = "What do you need potions for?", next = "potions" },
        { text = "Can you make me something useful?", next = "bracers" },
        { text = "What's in the beer?", next = "beer" },
        { text = "How does a gnome become so gloomy?", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    machine = {
      lines = { { id = "ma_default", text = "Shackles, he says, to bind an elemental and set it to work, and every piece of the thing has been fetched by someone like you from somewhere nobody should go. He calls it the future of the Assembly, and I call it a very expensive way to make a rock elemental angry." },
        { id = "ma_hard", when = { questDone = Q_HARD },
          text = "Shackles, to bind an elemental and set it to work, and you've seen how far along they are, because you fetched cog number five for him. He calls it the future of the Assembly, and I've started sleeping behind the big rock, on the far side." } },
      choices = {
        { text = "Will it work?", next = "machine_work" },
        { text = "The Assembly?", next = "machine_assembly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    machine_work = {
      lines = { { id = "maw_default", text = "That's the problem, you see, because if it doesn't work we'll be flattened, and if it does work we'll have a bound elemental and no idea what it wants. I've run the numbers both ways and I don't like either answer." } },
      choices = {
        { text = "Then why help him at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    machine_assembly = {
      lines = { { id = "maa_default", text = "The Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences, which is a very long name for Lotwil and anyone he can persuade to stand near him. I'm the alchemy, and Servo is the engineering, and Lotwil is all three and more besides, if you ask him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because he's brilliant, honestly, and somebody has to be standing beside him with a bucket of water when the brilliance gets out of hand. I've thought about going home many times, but then I picture him alone out here, and I pour another beer and stay." } },
      choices = {
        { text = "Loyalty like that is rare. Stay with him.", next = "why_stay", fx = { align = { order = 1 } } },
        { text = "Go home, Lucien. Let him blow himself up.", next = "why_stay", fx = { align = { order = -1 } } },
        { text = "Does he know how you feel?", next = "why_stay" },
      },
    },
    why_stay = {
      lines = { { id = "whs_default", text = "He knows I worry, and he thinks it's sweet, and he never once listens. Once, after the second fire, he thanked me for the bucket, and I've been living on that thank-you for about a year now." } },
      choices = {
        { text = "That's touching, Lucien.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    potions = {
      lines = { { id = "po_default", text = "Healing for after the explosion, and invisibility for during, because a rock elemental can't hit what it can't see, or so I hope. I've been working on a stoneshield potion of my own, from Lotwil's notes, and if it works, I'll give you the recipe." },
        { id = "po_done", when = { questDone = Q_LIQUID },
          text = "Healing for after the explosion and invisibility for during, and thanks to you I have both. The stoneshield recipe you got from me is still my best work, and I'm rather proud of it, though don't tell Lotwil it came from his notes." } },
      choices = {
        { text = "A stoneshield potion? How does it work?", next = "potions_stone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    potions_stone = {
      lines = { { id = "pos_default", text = "It borrows a little of the rock's stubbornness, so your skin takes a blow like granite does, for a little while, anyway. I tested it on myself and dropped a hammer on my foot, and I barely felt it, though I did feel very heavy and slightly sad." } },
      choices = { { text = "Sounds useful. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    bracers = {
      lines = { { id = "br_default", text = "Bracers, if you bring me a pair of patterned bronze ones from a smith, and I'll set them with the stones left over from Lotwil's work. Lotwil can be cheap, and I'd like you to have something for your trouble, and for what's coming." } },
      choices = {
        { text = "What's coming?", next = "bracers_coming" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bracers_coming = {
      big = true,
      lines = { { id = "brc_default", text = "His newest invention, the shackles, and whatever happens when he switches them on. I'd stand well back, wearing every enchantment I could find, and I'd tell everyone I love that I love them, just in case." } },
      choices = {
        { text = "Science needs risk. Switch them on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some things shouldn't be bound. Tell him so.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    beer = {
      lines = { { id = "be_default", text = "Barley, water, hops, and a pinch of my own powder to keep it from going sour in the heat, and nothing that'll make you glow, I promise. I brew it in a cask behind the rocks where Lotwil can't find it, because he'd want to improve it." } },
      choices = { { text = "I'll have a cup. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    xgnome = {
      lines = { { id = "xg_default", text = "By working for a cheerful one, mostly, because somebody has to balance the books. I was quite an optimist before I met Lotwil, and now I keep my beard short so it doesn't catch." } },
      choices = { { text = "That makes sense. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I studied alchemy in Gnomeregan before it fell, and when it fell I needed work, and Lotwil was hiring. He's been hiring ever since, because his assistants keep leaving, but I haven't." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid, but have some beer and ask Lotwil. He'll have a theory, and it'll be wrong, but it'll be interesting." } },
  },
}
