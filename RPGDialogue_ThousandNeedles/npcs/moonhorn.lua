-- Brave Moonhorn, standing watch at the top of the Great Lift. Voice: bibles/moonhorn.md
-- An urgent, plain-spoken brave with bad news for Freewind and a bad feeling about the Grimtotem.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "moonhorn", id = TODO_NPC("Brave Moonhorn"), name = "Brave Moonhorn",
  bible = "bibles/moonhorn.md", role = "soldier", tier = "quest",
  temper = { "earnest" }, values = { "dutiful", "protective" },
  notices = { "race", "travel" },
  impression = {
    first = "Brave Moonhorn watches the top of the Great Lift and stops travelers with urgent news for Freewind Post. The centaur raids worry him, but the way the Grimtotem have started looking at other tauren worries him more.",
    third = "{name} met Brave Moonhorn at the top of the Great Lift, a tauren brave carrying warnings of centaur raids to Freewind Post.",
  },

  greetings = {
    { id = "o_grim_lost", when = { opinion = { grimtotem = "lost" } }, text = "Word at Freewind is you've no time for the Grimtotem at all. Good, because the looks they've been giving us at the lift lately aren't friendly ones." },
    { id = "g_lift", text = "You came up the lift? Good, then you've seen the drop. Stay away from the edge, traveler; the Earth Mother made the canyon deep for a reason." },
    { id = "g_active", when = { questActive = TODO_QUEST("Message to Freewind Post") }, text = "Freewind Post, to the southeast. Give the message to Cliffwatcher Longhorn, and no one else." },
    { id = "g_done", when = { questDone = TODO_QUEST("Message to Freewind Post") }, text = "Longhorn has my message, then. Good. I can watch the lift without worrying about the road." },
    { id = "g_away", when = { away = 14 }, text = "You're back, after {away}! The lift's kept running, and the centaur have kept raiding, so not much has changed." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You're stronger than when you carried my message. The centaur would think twice about you now." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the shu'halo, far from Mulgore. Mind the Grimtotem if you meet them; they don't greet kin the way they used to." },
    { id = "n_travel", cat = "travel", when = { mounted = true },
      text = "Get down before the lift, or that beast will have a long fall. Nobody built that platform with kodos in mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brave Moonhorn. I watch the top of the Great Lift for Freewind Post, and lately I've had more to watch than I'd like." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Message to Freewind Post") },
          text = "Traveler, wait! The centaur have stepped up their attacks around here, and Freewind Post needs to know at once. Take this message to Cliffwatcher Longhorn to the southeast, and stay clear of the Grimtotem on the way; they've been acting strangely toward us." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Message to Freewind Post"), days = 3 } },
          text = "Longhorn got my message? And a caravan of his was slaughtered too? Then the centaur aren't raiding anymore, they're making war." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Galak", min = 20 } }, text = "The Galak scouts don't come as close to the lift as they did. I don't know your name in Freewind yet, but I know your work." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've still got a lift to watch." },
        { id = "h_again2", text = "Ask quickly. The centaur don't wait for us to finish talking." },
      },
      choices = {
        { text = "What are the centaur doing?", next = "centaur" },
        { text = "What do you make of the Grimtotem?", next = "grimtotem" },
        { text = "Tell me about the Great Lift.", next = "lift" },
        { text = "The Grimtotem are tauren. Why fear them?", next = "kin", when = { race = "Tauren" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Stay safe, Moonhorn.", next = "END" },
      },
    },
    centaur = {
      lines = { { id = "c_default", text = "The Galak used to keep to the canyons below, raiding a caravan now and then. Now they come up onto the mesas in bands, and they don't run when we come out to meet them." } },
      choices = {
        { text = "Something must have changed.", next = "changed" },
        { text = "Something else, Moonhorn.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "ch_default", text = "I don't know, and that's what frightens me. Something's given the centaur confidence, or something's driven them out of the canyons, and I don't like either answer, Earth Mother help us." } },
      choices = {
        { text = "Then we find out which.", next = "changed_end" },
        { text = "Maybe they're just hungry.", next = "changed_end" },
      },
    },
    changed_end = {
      big = true,
      lines = { { id = "ce_default", text = "Maybe. But Freewind can't wait to find out, so Longhorn has to get my message and decide. If they're hungry, we hold, and if they're being pushed, we need to know who's doing the pushing." } },
      choices = {
        { text = "Hold the line. Let Longhorn decide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait for orders. Strike them first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimtotem = {
      lines = { { id = "g_default", text = "They're tauren, but they keep to themselves, and they've never liked the Horde much. Lately they look at us from the ridges like we're trespassing, and some of the braves say they've drawn weapons on travelers." } },
      choices = {
        { text = "Then I'll keep clear of them.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "grimtotem" } } },
        { text = "If they draw on me, they'll regret it.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    lift = {
      lines = { { id = "l_default", text = "It's the only quick way between the Barrens and the Needles, unless you'd like to climb a cliff. The lift's keepers below see to the ropes, and I keep the top of it safe, and between us nobody's fallen yet this season." } },
      choices = { { text = "Long may that last.", next = "BACK", fx = { affinity = 1 } } },
    },
    kin = {
      lines = { { id = "k_default", text = "Because they don't think like us anymore. Cairne brought the tribes together, and the Grimtotem came because they had to, and they've been waiting ever since for a reason to leave." } },
      choices = {
        { text = "The tribes should stay united.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, learn = { "grimtotem" } } },
        { text = "Let them go, if they want to.", next = "BACK", fx = { align = { light = -1 }, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a brave of Freewind Post, posted to the lift. It isn't glorious, but it's needed." } },
    advice = { { id = "tp_ad", text = "Never stand with your back to a canyon in the Needles. Something's always climbing up it." } },
    grimtotem = { { id = "tp_grim", text = "Tauren who'd rather we weren't here. Watch them, and don't let them get behind you." } },
    centaur = { { id = "tp_centaur", text = "The Galak raid from the south, and they grow bolder every season. I warn every traveller who comes up the lift, and I hope they listen." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the High Chieftain, and he trusts Freewind to hold the Needles. I mean to prove him right, even if the Grimtotem make it harder." } },
    razorfen = { { id = "tp_razorfen", text = "The Razorfen Downs lie to the north, and the quilboar there have grown strange and cold. I don't know what has happened to them, and I'd rather not find out." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the Needles tall so that her children could see far. I watch from the top of the lift, and I see more than I'd like." } },
    _none = { { id = "tp_none", text = "I only know the lift and the road, traveler. Ask at Freewind, and may the Earth Mother keep the centaur off your trail." } },
  },
}
