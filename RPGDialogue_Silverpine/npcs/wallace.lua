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
      text = "You smell like a cellar after a wet spring, friend, but then so does half this forest, so I won't hold it against you." },
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
        { text = "You seem to live out here alone.", next = "alone" },
        { text = "Do you know who your customers are?", next = "customers" },
        { text = "Tell me about this stretch of coast.", next = "coast" },
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
      lines = { { id = "al_default", text = "Alone with the gulls and the murlocs down at the tide line, who gurgle all night and never buy anything. Folk come by often enough, and they're always polite to a blind man; I had to lose my eyes before the world learned its manners." } },
      choices = {
        { text = "I'd be afraid, with what walks these woods.", next = "alone_afraid" },
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
        { text = "That's a fair way to deal with folk.", next = "BACK", reply = "I think so too, and I've never had cause to change my mind. A thank-you sounds the same from anyone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Not knowing could get you killed one day.", next = "BACK", reply = "Perhaps it could, but I'm old and blind and still breathing, so I must be doing something right.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coast = {
      hub = true,
      lines = { { id = "co_default", text = "North Tide's Run, they call it, and it's a lonely stretch of shingle with the sea on one side and the pines on the other. I know it by the wind and the gulls, and by the smell of fish when the murlocs have been busy." } },
      again = { { id = "co_again", text = "What else about the coast? I've walked every yard of it with a stick." } },
      choices = {
        { text = "The murlocs don't trouble you?", next = "coast_murlocs" },
        { text = "Where do your blades come from, out here?", next = "coast_supply" },
        { text = "Do the Sepulcher's people come this far?", next = "coast_sepulcher" },
        { text = "That's enough about the coast.", next = "BACK" },
      },
    },
    coast_murlocs = {
      big = true,
      lines = { { id = "cm_default", text = "They gurgle up the beach at night and rattle my door, and then they go away again, because I don't open it. I've come to think of them as weather, friend, and I've never yet seen a man win an argument with the weather." },
        { id = "cm_hunter", when = { class = "HUNTER" }, text = "They gurgle up the beach at night and rattle my door, and then they go away again. A hunter could thin them out, I suppose, but I've grown used to them, the way you grow used to rain." } },
      choices = {
        { text = "Leave them be, then. They're doing no real harm.", next = "coast", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll clear the beach for you, whether you like it or not.", next = "coast", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Back to the coast.", next = "coast" },
      },
    },
    coast_supply = {
      lines = { { id = "cs_default", text = "Ships put in now and then, when the captains are brave or lost, and peddlers come up the road with a cart. I buy by feel and I pay fair, and word gets around that the blind man at North Tide's Run won't cheat you, which is better than a sign over the door." } },
      choices = {
        { text = "Has anyone ever tried to cheat you?", next = "coast_cheat" },
        { text = "Back to the coast.", next = "coast" },
      },
    },
    coast_cheat = {
      lines = { { id = "cc_default", text = "Once, with a sword that was painted to look like steel and weighed like a fence post. I told him what it was and what it was made of and which smith in Lordaeron had botched it, and he left without his cart, so I've had a wheelbarrow ever since." } },
      choices = {
        { text = "Ha! That's a fair trade, Wallace.", next = "coast", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Back to the coast.", next = "coast" },
      },
    },
    coast_sepulcher = {
      lines = {
        { id = "cse_default", text = "Their deathstalkers come by on their way north, quiet as cats, and they buy whetstones more than blades. They tell me about the worgen and the gnolls and the wizards at Ambermill, and I listen, because a man who lives alone collects news the way other men collect coins." },
        { id = "cse_scourge", when = { race = "Scourge" }, text = "Your sort come by on their way north, quiet as cats and smelling of the grave, and they buy whetstones more than blades. They're good customers and better gossips, and I'd not trade them for any living ones I've known." },
      },
      choices = {
        { text = "What news have they brought lately?", next = "coast_news" },
        { text = "Back to the coast.", next = "coast" },
      },
    },
    coast_news = {
      lines = {
        { id = "cn_default", text = "That the worgen are thick around Pyrewood and thin everywhere else, and that High Executor Hadrec hasn't smiled since he died. I'd say that last part was a joke, friend, except they all said it the same way." },
        { id = "cn_cleared", when = { cleared = "Shadowfang Keep" }, text = "That somebody went up to the keep on the hill and came back down again, which they say nobody does. They all said it in the same voice, the one folk use when they're glad and don't want to jinx it." },
      },
      choices = {
        { text = "Back to the coast.", next = "coast", fx = { learn = "worgen" } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've sold blades on this coast a long while, and I've been blind longer. That's as much story as I keep handy." } },
    advice = { { id = "tp_ad", text = "Listen to the steel before you buy it, friend. Your eyes will lie to you about a blade long before your ears do." } },
    forsaken = { { id = "tp_forsaken", text = "I can't see the Forsaken who come to my door, but I can smell them, and they smell like old earth. Doesn't bother me, as long as their coin's good." } },
    scourge = { { id = "tp_scourge", text = "The Scourge walks past my door on the coast road sometimes, and I can hear them shuffling. They don't buy anything, so I don't mind them much." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans sealed their wall long before I lost my sight, and I've never heard a single word from the other side. Strange folk, by every account." } },
    shadowfang = { { id = "tp_shadowfang", text = "I hear the worgen howling from Shadowfang Keep every night, and it's the one sound that still raises the hair on my neck. Blind or not, I know what that means." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Folk tell me about plenty, but not about that." } },
  },
}
