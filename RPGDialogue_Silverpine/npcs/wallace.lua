-- Wallace the Blind, weapon seller at North Tide's Run. Voice: bibles/wallace.md
-- A living man who sells blades to anyone, because he can't see who's buying, and doesn't ask.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wallace", id = TODO_NPC("Wallace the Blind"), name = "Wallace the Blind",
  bible = "bibles/wallace.md", role = "vendor", tier = "service",
  communities = { "north_tides_run" }, temper = { "cheerful" }, values = { "practical", "honest" },
  notices = { "race", "craft" },
  impression = {
    first = "Wallace the Blind sells weapons on a lonely stretch of the Silverpine coast to anyone who comes to his door. He can't see his customers, and he has decided that suits him very well.",
    third = "{name} met Wallace the Blind, a sightless weapon seller at North Tide's Run who serves every comer alike.",
  },

  greetings = {
    { id = "g_hello", text = "Footsteps! Come in, come in, and mind the doorframe; it's lower than people expect." },
    { id = "g_back", when = { metBefore = true }, text = "I know that step. You've been here before, and you favor your left foot, so don't think you can sneak up on me." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, by my reckoning, which is to say by the number of times I've wound the clock. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk heavier than you used to, friend, and I mean that as a compliment. More steel on you, I'd wager." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You smell like a cellar after a wet spring, friend, but then so does half this forest. I won't hold it against you if you don't hold my nose against me." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Coal smoke and quench oil on your hands. A smith! Then you'll be judging my stock, and I'll be listening to you do it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wallace, they call me, and the Blind, since they're being accurate. I sell blades to whoever walks through that door, and I've never once asked who they were." },
        { id = "h_orc", when = { race = { "Orc", "Tauren", "Troll" } },
          text = "That's a big step for a doorway this size, and a deep voice to go with it. Whatever you are, friend, your coin weighs the same as anyone's." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Ah, you sound like Lordaeron, or near enough. It's been a long while since I heard an accent that didn't come out of a grave." },
        { id = "h_wolves_quiet", tags = { "news" }, when = { thread = { id = "arugal_wolves", state = "resolved" } },
          text = "The howling's gone ragged out there, friend, all out of order, like a choir that's lost its leader. Somebody did something up at that keep, and from the way you walk in, I've a feeling it was you." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late visitor, is it? Day and night are much the same to me, but the wolves out there seem to prefer the dark, so you're braver than most." },
      },
      again = {
        { id = "h_again", text = "Something else, friend? I'm in no hurry, and neither are the murlocs." },
      },
      choices = {
        { text = "How do you know what you're selling?", next = "blades" },
        { text = "You live out here alone?", next = "alone" },
        { text = "Do you know who your customers are?", next = "customers" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "Good day, Wallace.", next = "END" },
      },
    },

    blades = {
      lines = { { id = "bl_default", text = "By the weight and the balance, and by running my thumb along the edge, carefully. A good blade sings a little when you flick it, and a bad one just sulks." } },
      choices = {
        { text = "Show me one that sings.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    alone = {
      lines = { { id = "al_default", text = "Alone with the gulls and the murlocs down at the tide line, who gurgle all night and never buy anything. Folk come by often enough, and they're always polite to a blind man, which is more than I can say for the sighted world." } },
      choices = {
        { text = "Aren't you afraid, with what walks these woods?", next = "alone_afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_afraid = {
      lines = { { id = "af_default", text = "I hear the howling at night the same as anyone. But nothing's come through my door that wanted to hurt me, and I've decided not to go looking for reasons to start being afraid now." } },
      choices = {
        { text = "That's either very wise or very lucky.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    customers = {
      lines = { { id = "cu_default", text = "I know their voices and their footsteps, and some of them smell rather strongly of the grave. Folk tell me all sorts about who's dead and who's living around here, but they all count their coins out the same." } },
      choices = {
        { text = "Some of them are dead, you know.", next = "customers_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_dead = {
      big = true,
      lines = { { id = "cd_default", text = "So they keep telling me, and very kindly, as if I might faint. A man buys a sword and says thank you, and I'm not sure what else I'm meant to know about him." } },
      choices = {
        { text = "That's a fair way to deal with folk.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Not knowing could get you killed one day.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've sold blades on this coast a long while, and I've been blind longer. That's as much story as I keep handy." } },
    advice = { { id = "tp_ad", text = "Listen to the steel before you buy it, friend. Your eyes will lie to you about a blade long before your ears do." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Folk tell me about plenty, but not about that." } },
  },
}
