-- Darkshire's other households. Voice: bibles/darkshire_folk.md
-- The Carevins and Calor, the historian, the stargazer, the cook, the councilman,
-- the innkeeper and the smith who hates being crept up on.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jonathan", id = TODO_NPC("Jonathan Carevin"), name = "Jonathan Carevin",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "stern" }, values = { "devout", "wary" },
  notices = { "form", "stranger" },

  impression = {
    first = "Jonathan Carevin watched my hands before he watched my face. His household goes out past the lamps after the dead, and he has the stillness of someone who does that often.",
    third = "{name} met Jonathan Carevin, whose household hunts demons and the walking dead beyond Darkshire's lamps.",
  },

  greetings = {
    { id = "g_wary", text = "You're new here. State your business, and keep your hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, I see, and in Duskwood that counts as a reference." },
    { id = "g_answered", when = { questDone = TODO_QUEST("Answered Questions") }, text = "Sit down; you've earned a chair in this house, and I don't offer many." },
    { id = "g_light", when = { class = { "PRIEST", "PALADIN" } }, text = "Glory under the Light, {class}. Come in." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and still breathing. In Duskwood that's worth a nod, so here's mine." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you first came to my door, and I can see it in how you stand. The dead out there will notice it too." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone in town caught you lying. I watch hands and I watch faces, so keep yours honest in this house." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word is you've set someone in Darkshire against you. We stand together here or we don't stand at all, so mend it." },
  },

  notice = {
    { id = "n_beast", cat = "form", place = "replace", when = { form = { "bear", "cat" } },
      text = "Change back, now. In this town anything that walks in on four legs gets a crossbow bolt before it gets a greeting." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A shapechanger. I know your kind isn't the curse, but I also know the curse looks a great deal like your kind in the dark." },
    { id = "n_horde", cat = "stranger", when = { faction = "Horde" },
      text = "The Watch let you through, and I'd like to know why, along with a great many other things about you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I don't know, and that's what worries me. The dead out there aren't resting. If your spirits can tell a restless soul from a hungry one, you'll be useful." } },
      choices = {
        { text = "I'll follow your lead out there, Jonathan. Discipline keeps us alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt them my own way. Spirits know the dead best.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone who'll hold the ground while the rest of us do the burning. Skeletons and ghouls come in numbers out of Raven Hill, and they don't tire, so I need a fighter who doesn't either." } },
      choices = {
        { text = "I'll hold the ground. Nothing gets past me to your people.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight, but I won't die covering anyone's retreat.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jonathan.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Living things, yes, and the worgs leave tracks a child could follow, which worries me more than if they hid them. The dead are harder, because they wander, but they all wander back toward Raven Hill sooner or later, like drunks finding their own doorstep." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} on the near side of the lamps after dark. The things out there have learned to take a beast first and its master after." },
      },
      choices = {
        { text = "I'll track them to their lairs and finish them there.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll track them, but I'll choose my own fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jonathan.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "So can the things we hunt, which is why I watch hands before faces. If you mean to come out with my household, you'll stay where I can see you, because a shadow I can't account for gets an arrow." } },
      choices = {
        { text = "I'll stay where you can see me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt my own way, Carevin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who do you hunt out there?", next = "hunt_who" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It does, and the Light works better, but I'll not turn away fire from someone willing to stand beside us at Raven Hill. Only keep your flames off the grave markers, because the families still come to read them." } },
      choices = {
        { text = "Careful fire, then. I'll spare the markers.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fire doesn't choose. The dead must burn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do you hunt the dead?", next = "hunt" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Skeletal", min = 30 } }, text = "The patrols say the cemetery road is quieter, and that the bones lying in the grass were put down by one hand. I'd guess whose hand that was, and I'd thank it, if the Watch said such things." },
        { id = "h_default", key = true,
          text = "I am Jonathan Carevin. The Watch keeps the lamps lit, while my household goes out past them after demons, the walking dead, and worse, because the Light asks it of someone." },
        { id = "h_calor", when = { heardLine = "calor.h_default" },
          text = "Calor sent you, then. He recruits quickly and I trust slowly, and between the two of us we find about one useful person a year." },
        { id = "h_woods", when = { questActive = TODO_QUEST("Worgen in the Woods") },
          text = "Calor has you hunting, which is good. Come back with your blade wet and his note in your hand, and then we'll talk properly." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("The Carevin Family") },
          text = "A night elf priestess, staying in Darkshire? No, I'd know if one had. What I'd like to know is why a stranger asks me that, and then about wolf-men, in the same breath." },
        { id = "h_scythe", when = { questActive = TODO_QUEST("The Scythe of Elune") },
          text = "You've asked your questions, so now answer mine with your blade, and then we'll see what you've earned." },
        { id = "h_answered", when = { questDone = TODO_QUEST("Answered Questions") },
          text = "I have more to go on than I did, and I like it less, which is how answers usually go." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're elf-kin, but not of any cut I know. Where your people come from is your own business; what you do in my woods is mine." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, so you know what we fight for. Glory under the Light: say it with me, or tell me why you won't." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, and the Light walks with you, so walk it out past the lamps where it's needed. The Watch has candles enough." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good. What walks past the lamps doesn't care for speeches, only for steel, and you look as though you carry plenty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know a track when you see one, then, and that's worth more out here than a dozen lanterns." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Show me your hands. We hunt the dead past the lamps, and I want to know whether your spirits will help or get in the way." },
      },
      again = {
        { id = "h_again", text = "Well? I haven't all night, and nobody in this house has." },
        { id = "h_again2", text = "Ask, then, but be brief about it." },
      },
      choices = {
        { text = "What does your household do?", next = "hunt" },
        { text = "Why are you so suspicious?", next = "wary" },
        { text = "You fight under the Light?", next = "light" },
        { text = "What do you make of the Night Watch?", next = "watch" },
        { text = "Glory under the Light.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'm a druid, not a beast.", next = "druid", when = { class = "DRUID" } },
        { text = "I wear the Light into battle, Carevin.", next = "paladin", when = { class = "PALADIN" } },
        { text = "My arts could serve your hunt.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I can move past the lamps unseen, Jonathan.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Fire works well on the dead, I hear.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does your household need from a warrior, Jonathan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can anything living be tracked in this wood, Jonathan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do spirits help or hinder when you hunt the dead, Jonathan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    hunt = {
      lines = {
        { id = "hu_default", text = "We hunt, and there's nothing more mysterious to it than that. The Watch waits for the dark to come to them, but we go to it." },
      },
      choices = {
        { text = "I'd like to help.", next = "BACK", fx = { affinity = 1, learn = { "carevins" } } },
        { text = "Sounds like a good way to die.", next = "die" },
        { text = "Who hunts with you?", next = "hunt_who" },
      },
    },
    die = {
      lines = { { id = "d_default", text = "It is, but so is staying home, here, and at least we pick the ground." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    hunt_who = {
      lines = {
        { id = "hw_default", text = "My family, and the few Calor vouches for. Elaine keeps our supplies moving, and Sven Yorgen's camp eats because of her, but the other names are ours to keep.",
          fx = { learn = { "carevins" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wary = {
      big = true,
      lines = {
        { id = "w_default", text = "The worgen came out of nowhere, and nothing comes out of nowhere, so someone brought them, and someone knows. Until I find out who, everyone is a question to me." },
      },
      choices = {
        { text = "Including me.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "worgen" } } },
        { text = "I'll help you find out.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hunting for traitors will tear Darkshire apart faster than any worgen.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Who would help such things?", next = "wary_aid" },
      },
    },
    wary_aid = {
      lines = {
        { id = "wa_default", text = "Those who give aid to demons and the dead, and they do exist. A man of this town sold Raven Hill's dead to a necromancer, and there's always someone willing to sell.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Trust no one, then?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "li_default", text = "Always, against evil and against heresy both. The Watch guards against the first, and somebody has to root out the second." },
      },
      choices = {
        { text = "What counts as heresy?", next = "light_heresy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_heresy = {
      lines = {
        { id = "lh_default", text = "Anything that bargains with the dark: grave robbers, cultists, and old men with too many books about the dead. I keep a list, and it isn't short." },
      },
      choices = {
        { text = "Who's on it?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "That's a dangerous list to keep.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Good. Someone in Darkshire ought to keep that list.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    watch = {
      lines = {
        { id = "wt_default", text = "They're good people who have learned how to lose slowly. Calor stood with them for years, so ask him why he stopped." },
      },
      choices = {
        { text = "He left them for you?", next = "watch_calor" },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    watch_calor = {
      lines = {
        { id = "wc_default", text = "He left them for the work, and I happened to be doing it. Don't let him tell you otherwise, or he'll make me sound like a saint." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "...You said that as if you meant it, which is more than most visitors manage. Calor will want to test you, and you should let him." },
      },
      choices = {
        { text = "And if I fail his test?", next = "priest_test" },
        { text = "The Light doesn't need tests.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Let him test me, then; I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    priest_test = {
      lines = {
        { id = "pt_default", text = "Then you'll have learned what the woods are, which is worth something, and Calor will say the words over you. He's better at it than he looks." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "I know it, and I said as much, but it doesn't change what my crossbow sees in the dark. Change where there's light, and we'll get along." },
      },
      choices = { { text = "Then I'll keep to the lamplight.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Many wear it, and few keep it on once the dead come close enough to smell. Ride out past Raven Hill with my household one night, and then tell me what you wear." } },
      choices = {
        { text = "I'll ride, and the Light will ride with me.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Faith or no faith, the dead fall to a hammer.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "My hunt is for the things your arts call up, so no, I don't think they could. Leave Darkshire with the same shadow you came in with, and we'll have no quarrel." } },
      choices = {
        { text = "You fight fire with water. I fight it with fire.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Fair. I'll stay out of your way.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My household hunts whatever hunts this town, and that's all of my story a stranger needs." } },
    advice = { { id = "tp_ad", text = "Trust none who won't stand with you against the dead. It's a short test, and it hasn't failed me yet." } },
    night_watch = { { id = "tp_watch", text = "They're brave people with lanterns, and I don't fault them, but I won't wait with them." } },
    worgen = { { id = "tp_worgen", text = "They didn't wander here, because packs that size don't wander. Something called them." } },
    carevins = { { id = "tp_carevins", text = "We're a family that keeps its own counsel, and that's all the town needs to know, whatever they say about us." } },
    ladimore = { { id = "tp_ladimore", text = "Sirra will tell you the story, and I'll tell you the end of it: it walks at Raven Hill and doesn't care who you are." } },
    stalvan = { { id = "tp_stalvan", text = "Those are old murders, and I hunt the ones still happening." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer on a hill, and a town that let him buy its dead. He's on my list, near the very top." } },
    _none = { { id = "tp_none", text = "If it isn't hunting us, I haven't made time for it." } },
  },
}

P:NPC {
  key = "calor", id = TODO_NPC("Calor"), name = "Calor",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "fierce" }, values = { "devout", "proud" },
  notices = { "form", "trophy" },

  impression = {
    first = "Calor asked whether I'd ever swung a blade at something that swung back. He stood a Night Watch post for years before joining Carevin, and it shows in how he watches the trees.",
    third = "{name} met Calor, a former Night Watch guard who now hunts the dark of Duskwood alongside Jonathan Carevin.",
  },

  greetings = {
    { id = "g_hunt", text = "You have the look of someone who's swung a blade, but have you swung it at anything that swung back?" },
    { id = "g_back", when = { metBefore = true }, text = "Out of the trees again, are you? Count your fingers, and then tell me what you killed." },
  },

  notice = {
    { id = "n_beast", cat = "form", place = "replace", when = { form = { "bear", "cat" } },
      text = "Stand still, I said stand still! ...A druid, by the Light, and you nearly had a bolt in you, so don't come into Darkshire on four legs." },
    { id = "n_paladin", cat = "trophy", when = { class = "PALADIN" },
      text = "A paladin, good! The Light should be out in the trees, not polishing pews in Stormwind." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I saw years of them, standing my post, and they don't stop coming. A shaman with steady nerves would be welcome on the line." } },
      choices = {
        { text = "I'll stand on the line with you, Calor. I won't freeze.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hang back and strike from range. That's smarter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the worgs circle a post three times before they rush it, and the spiders hang their webs just above head height. A hunter with sharp eyes could have saved me a few good men." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watches the trees the way I used to. Trust it, because a beast's nose is better than any watchman's eyes out here." },
      },
      choices = {
        { text = "I'll put those lessons to use and keep the roads safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll put them to use for myself first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Calor.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then you've the sense to stay alive, which is more than half the Watch I served with. Just know the dead at Raven Hill don't turn their backs, so you'll need another trick." } },
      choices = {
        { text = "Then I'll face them like a soldier.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There's always another trick.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why did you leave the Watch?", next = "watch" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Spells serve fine until a ghoul gets inside your reach, and then you'll wish you'd learned to swing something. I watched a Stormwind mage go down at the Raven Hill gate because his hands were shaking too hard to cast." } },
      choices = {
        { text = "I'll learn the blade too. Discipline matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My hands don't shake, Calor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do I prove myself to you?", next = "prove" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Say that again in front of Jonathan and you'll have an arrow for an answer, friend. We lay the dead down, and we don't take them up again for ourselves, whatever they teach you in the cellars of Stormwind." } },
      choices = {
        { text = "You're right. The dead deserve their rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Laid down or taken up, they're useful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Have you seen anything strange out there?", next = "ravenhill" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "When I was a boy it was Brightwood, and we picked mushrooms under trees that let the sun through. Something came over it years ago, and the old hands in the Watch will tell you the trees went dark first and the dead followed after." } },
      choices = {
        { text = "Then the Watch must hold until the forest can be healed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the dark trees out and let something new grow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Nightbane", min = 40 } }, text = "The Nightbane don't howl as close as they did, and I've a fair idea why. I've been shooting at them for years and never thinned them like you have, so I'll stop counting my arrows and start counting yours." },
        { id = "h_default", key = true,
          text = "I'm Calor. I stood a Night Watch post for years and watched the dark take a little more each season, until I joined Master Carevin, and now we take some of it back." },
        { id = "h_woods", tags = { "news" }, when = { questActive = TODO_QUEST("Worgen in the Woods") },
          text = "Brightwood Grove, the Rotting Orchard, and the mine down south past them. The small ones weave shadows, the big ones run in packs, and the worst ones sit by their fires near Roland's Doom." },
        { id = "h_woods_done", when = { questDone = TODO_QUEST("Worgen in the Woods") },
          text = "Kill one, and two more come out of the trees. I don't understand where they come from, but Master Carevin will, and I have faith in that." },
        { id = "h_ravenhill", when = { questDone = TODO_QUEST("Raven Hill") },
          text = "So Raven Hill's ghost was one frightened man with a lamp? By the Light, I'd have put a bolt through that window, and it's a good thing Elaine sent you instead." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "An elf, with good eyes, I'd guess, so use them in the trees. The worgen are grey on grey, and they'll be on you before you've drawn breath." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Out here the Light needs hands as much as it needs voices, so have you got hands?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, then, and not a soldier. That's fine; in this wood the one who sees the worg first lives longer than the one who swings hardest." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a night elf at that. Have you ever fought something that ought to be dead and wasn't, or only the honest beasts of your forest?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Have you ever swung a blade at something that swung back? Spirits won't save you if you freeze when the dead come." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, because I'm due back out." },
        { id = "h_again2", text = "Go on; I'm sharpening, and I can listen and sharpen at the same time." },
      },
      choices = {
        { text = "Why did you leave the Night Watch?", next = "watch" },
        { text = "How do I prove myself?", next = "prove" },
        { text = "What do you know about the worgen?", next = "worgen" },
        { text = "Seen anything strange out there lately?", next = "ravenhill" },
        { text = "Do you pray before you hunt?", next = "priest", when = { class = "PRIEST" } },
        { text = "Let me ride out with you.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I've stood a watch or two myself.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I've swung at plenty, Calor, usually from behind.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've never needed a blade, Calor. Spells serve me fine.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What did you learn about the wood from your Watch post, Calor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The dead out there could serve me instead.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did this forest always feel so wrong, Calor?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did you see many dead on Night Watch, Calor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later, Calor.", next = "END" },
      },
    },
    watch = {
      big = true,
      lines = {
        { id = "w_default", text = "They're good people who've made their peace with losing slowly, and I couldn't. Standing under a lamp all night isn't a fight; it's a wait." },
      },
      choices = {
        { text = "Somebody has to hold the town.", next = "hold", fx = { trait = { kind = 1 } } },
        { text = "I'd rather fight too.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Do you miss it?", next = "watch_miss" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "Somebody does, but somebody else. I didn't say they were wrong; I said I couldn't do it." } },
      choices = { { text = "No shame in that. Somebody has to hold the gate.", next = "BACK" } },
    },
    watch_miss = {
      lines = {
        { id = "wm_default", text = "I miss the people, though not the waiting. I still drink with them at the Raven when they'll have me, and some of them won't." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    prove = {
      lines = { { id = "p_default", text = "Not with talk, you won't. Go out to the grove, kill what's there and come back to tell me what you saw, and then we'll talk about Master Carevin." } },
      choices = {
        { text = "I'll be back.", next = "BACK", fx = { learn = { "carevins", "worgen" } } },
        { text = "Which grove?", next = "prove_where" },
      },
    },
    prove_where = {
      lines = {
        { id = "pw_default", text = "Brightwood Grove, north of the road, and somebody had a sense of humour once, naming it 'bright'. The shadow weavers nest there and in the Rotting Orchard." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      lines = {
        { id = "wo_default", text = "They seemed to appear out of thin air, and when you kill one, two step out of the trees. What draws them here I can't say, but Master Carevin will find out." },
      },
      choices = {
        { text = "And if he doesn't?", next = "worgen_doubt" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    worgen_doubt = {
      lines = {
        { id = "wd_default", text = "Then we keep killing them until he does. Faith isn't knowing the answer, it's keeping on until someone finds it, and those who stand in the Light don't fall." },
      },
      choices = {
        { text = "I hope you're right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Plenty of good people fall.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    ravenhill = {
      lines = {
        { id = "rh_default", text = "Shadows moving in the houses two nights running, and a light in a window the night before that. Raven Hill's been empty for years, and empty houses don't light lamps." },
      },
      choices = {
        { text = "Did you go in?", next = "ravenhill_in" },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },
    ravenhill_in = {
      lines = {
        { id = "ri_default", text = "No, because Elaine said to send someone careful, and I'm not careful. I'd have burned the place down and asked my questions of the ashes." },
        { id = "ri_done", when = { questDone = TODO_QUEST("Raven Hill") },
          text = "No, and I thank the Light for it, because it was one poor, hiding wretch. I'd have shot him through the window and called it a ghost." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Every time, and they're short ones: 'Let me see it first.' The Light's been good about that so far." },
      },
      choices = {
        { text = "That's a soldier's prayer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Pray for the worgen too, sometimes.", next = "priest_them" },
      },
    },
    priest_them = {
      lines = {
        { id = "pt_default", text = "For them? ...You're a better priest than I'd ever be. I'll think on it, but don't tell Master Carevin I said that." },
      },
      choices = {
        { text = "I won't.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "I'll make no promises, because Carevin deserves to hear it.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Gladly! Bring that hammer to Brightwood and let them hear the Light ring off it, because a few more like you and we'd outnumber the Watch." },
      },
      choices = { { text = "Lead on.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 }, learn = { "carevins" } } } },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Then you know the difference between standing a post and walking into the trees after what's beyond it. I did the first for six years, and the Carevins taught me the second in a month." } },
      choices = {
        { text = "Which was harder?", next = "watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light lets me see more of Duskwood's troubles than I'd like. Ask me about any of this, and I'll answer as straight as I can." },
    },
    background = { { id = "tp_bg", text = "I stood a Watch post for years, and now I hunt with Master Carevin, which is the only part of me worth knowing." } },
    advice = { { id = "tp_ad", text = "Count your fingers when you come out of the trees, because that's how you know you won." } },
    night_watch = { { id = "tp_watch", text = "I wore the lamp myself, so I don't speak against them, but I don't stand with them anymore." } },
    worgen = { { id = "tp_worgen", text = "They appeared out of nowhere, near enough. One season the woods were only dark, and the next they were hungry." } },
    carevins = { { id = "tp_carevins", text = "Master Carevin is the only man in Darkshire with a plan that isn't waiting, and I'll back that over another month of prayers and shutters." } },
    _none = { { id = "tp_none", text = "Ask someone who sits still, because I'm going back out." } },
  },
}

P:NPC {
  key = "sirra", id = TODO_NPC("Sirra Von'Indi"), name = "Sirra Von'Indi",
  bible = "bibles/darkshire_folk.md", role = "scholar", tier = "quest",
  communities = { "darkshire" }, temper = { "fussy" }, values = { "curious", "careful" },
  notices = { "lore", "arcane" },

  impression = {
    first = "Sirra Von'Indi lives under a landslide of papers and seems happiest when a visitor stands perfectly still. If it happened in Darkshire and someone wrote it down, he has read it twice.",
    third = "{name} met Sirra Von'Indi, Darkshire's historian, who knows the town's old scripts and older families.",
  },

  greetings = {
    { id = "g_busy", text = "Hm? Yes, yes, come in, and mind the papers, and those papers too... actually, just stand there, would you?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you; I remember you, because you stood very still last time, and I appreciated that." },
    { id = "g_wait", when = { questActive = TODO_QUEST("Wait for Sirra to Finish") }, text = "Not yet, not yet, you can't rush a dead hand! Sit down; there's a stool under the books." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You've read The Seven Kingdoms; don't look so surprised, you have the look. Good, because the town's history is in there, if you read between the reigns." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! You'll read three tongues at least, surely? Only two? Well, they teach you all the wrong things in Stormwind now." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Many times, though mostly ghosts and worse. If your spirits remember anything of Duskwood's history, I'd write it down twice." } },
      choices = {
        { text = "Write it carefully, Sirra. Records keep the truth alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some things are better left unrecorded.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, plenty, and I've read about every one of them twice. The Ebonlockes held this town against trolls long before the Watch existed, and most of them died with a sword in their hand, which the records consider very proper." } },
      choices = {
        { text = "Then I'll try to earn a line in your histories.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Histories are for the dead. I'd rather stay out of them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Sirra.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Deer and boar, mostly, and Elwynn-sized wolves, according to the old game rolls. Then the wood went dark, the wolves grew larger and meaner, and the deer simply stopped appearing in anyone's accounts." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is staring at my bookshelf with the look of something hungry, {class}. Please assure me it doesn't eat vellum." },
      },
      choices = {
        { text = "I'll help the wood recover what it lost.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The wood's changed. I'll hunt what's in it now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sirra.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Easy to take and impossible to find again, since I'm the only one who knows where anything is. If you steal a page from this pile, you'll have stolen the one thing in Darkshire nobody else wants." } },
      choices = {
        { text = "Your papers are safe. Knowledge belongs to its keeper.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Knowledge is always worth stealing, scholar.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the oldest thing you have?", next = "oldest" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Morbent Fel isn't history yet, more's the pity; he's current events. But the older records speak of others who meddled with the dark in these woods long before Darkshire had a council, and none of them ended well." } },
      choices = {
        { text = "Their mistakes were ignorance. I'll do better.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll learn from their ends and stay careful.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tell me Darkshire's history.", next = "history" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Years ago, one stopped here on the road north and left a note in the town register asking that Raven Hill's dead be watched. We've watched them faithfully ever since, which, I'm sorry to say, isn't at all the same as stopping them." } },
      choices = {
        { text = "Then I'll finish what that paladin started.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "An old note doesn't bind me. Raven Hill isn't my charge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's go back to something else, Sirra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They call it Brightwood and fill whole ledgers with timber sales and harvest fairs, and then the entries simply stop. I've read the last year of them twice, looking for the day the light went, but the clerks never wrote it down." } },
      choices = {
        { text = "Keep reading. Somewhere a record holds the answer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things never get written down. Ask the forest instead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Do you know, the founding of the Silver Hand is written up in three of my books, and they disagree on nearly everything?" },
        { id = "h_default", text = "I'm Sirra Von'Indi, historian to the town: languages, old scripts and older families. If it happened in Darkshire and someone wrote it down, I've read it twice." },
        { id = "h_note", tags = { "news" }, when = { questActive = TODO_QUEST("Translate Abercrombie's Note") },
          text = "Let me see the hermit's note... oh dear, that's an old script, older than the hermit himself, so whatever is he doing with it?" },
        { id = "h_note_ack", when = { heardLine = "abercrombie.h_note" },
          text = "Did he tell you not to read it? You couldn't have, because it's in a hand nobody's used here in a very long while, which is precisely why he used it." },
        { id = "h_ello", tags = { "news" }, when = { questActive = TODO_QUEST("Translation to Ello") },
          text = "Take this to Lord Ello, and quickly, please. Don't stop to talk to anyone on the way; I mean it." },
        { id = "h_grave", when = { questActive = TODO_QUEST("The Weathered Grave") },
          text = "A grave at Raven Hill with a name half worn away? Tell me the letters you could read, and slowly, please." },
        { id = "h_morgan", tags = { "news" }, when = { questActive = TODO_QUEST("Morgan Ladimore") },
          text = "So you've seen the grave and you've heard the name, and you know what walks there. Put him to rest, because it's long past time." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Shen'dorei! Do you know, I've no books on your people at all, not one? I'd be terribly grateful for a word or two of your tongue, if you'd allow it." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Do they still teach the old liturgies at the abbey? Some of the older stones at Raven Hill quote them, and nobody but me reads them now." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you've got the shoulders for it. Do try not to knock anything over; the shelf behind you holds three centuries of Darkshire." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Do keep that beast away from my papers, I beg you; the last one ate a land deed from the reign of King Barathen." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid! Stand still a moment, please, because the books I own say almost nothing true about your people, and I'd like to correct them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Hold still, please. A shaman, you say? Hmm, I've read about shamans, but only in Horde accounts. You'd be a footnote worth adding." },
      },
      again = {
        { id = "h_again", text = "Yes? Another question? Splendid, since questions are the only thing in this town that keep." },
        { id = "h_again2", text = "Go on; I've lost my place anyway." },
      },
      choices = {
        { text = "What's the saddest story in your books?", next = "morgan" },
        { text = "What's the oldest thing you've read?", next = "oldest" },
        { text = "Tell me Darkshire's history.", next = "history" },
        { text = "What languages do you read?", next = "languages" },
        { text = "Who said the rites over Morgan?", next = "priest", when = { class = "PRIEST", topicKnown = "ladimore" } },
        { text = "Test me. Give me a script.", next = "mage", when = { class = "MAGE" } },
        { text = "I came home from Lordaeron myself, after the plague.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Ironforge's explorers would kill for your library.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I'll give you a word of my people's tongue.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Your papers would be easy to slip a page from.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has Darkshire ever had warriors of note, Sirra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What did Duskwood's wildlife look like before the darkness came?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your histories must mention necromancers in these woods.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Have any paladins come to Darkshire before, Sirra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do Darkshire's records say about the forest before it darkened?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do Darkshire's records mention spirits, Sirra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    morgan = {
      big = true,
      lines = {
        { id = "m_default", key = true,
          text = "Morgan Ladimore's. He was a knight of this town, back when it was Grand Hamlet. He rode to war under Uther and came home to graves, and his grief did a terrible thing before he did a worse one to himself." },
      },
      choices = {
        { text = "And now?", next = "now", fx = { learn = { "ladimore" } } },
        { text = "That's a hard story.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "ladimore" } } },
        { text = "You knew him?", next = "morgan_knew" },
      },
    },
    now = {
      lines = { { id = "n_default", text = "Now he doesn't rest. His grave is in a quiet corner of Raven Hill, and I'd not go there after dark, and I don't much like it at noon." } },
      choices = {
        { text = "Who deals with him?", next = "now_althea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    now_althea = {
      lines = {
        { id = "na_default", text = "Althea has been handling the... trouble, mostly with pikes. Pikes are not a historian's instrument, but I concede they have their uses." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    morgan_knew = {
      lines = {
        { id = "mk_default", text = "Before the war, yes, and he was a noble, good man; that's the man I keep on my shelf. The other one I leave to the Watch, and I try not to think about him." },
      },
      choices = {
        { text = "That's a kind way to remember him.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldest = {
      lines = { { id = "o_default", text = "Town ledgers from before the First War, full of births, deaths and a long argument about a fence. It's the fence I love, because nobody fights about fences in a dying town." } },
      choices = {
        { text = "That's oddly hopeful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Before the First War? Was it Grand Hamlet then?", next = "oldest_hamlet" },
      },
    },
    oldest_hamlet = {
      lines = {
        { id = "oh_default", text = "Grand Hamlet, yes. The orcs burned it in the First War and the Alliance rebuilt it after the Second, and then the dark came, and someone renamed it without asking me." },
      },
      choices = {
        { text = "That bothers you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    history = {
      lines = {
        { id = "hi_default", text = "Which history, the founding, the fires or the fog? I'd recommend the fires, because the fog is very poorly documented." },
      },
      choices = {
        { text = "The fog.", next = "history_fog" },
        { text = "The fires.", next = "oldest_hamlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_fog = {
      lines = {
        { id = "hf_default", text = "It came slowly, the old families say, and it never lifted. Some say it's a curse and some blame the tower in Deadwind Pass, but I say I need a primary source." },
      },
      choices = {
        { text = "Has anyone gone to look?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    languages = {
      lines = {
        { id = "la_default", text = "Common in all its old forms, a little Dwarven, and the dead scripts nobody else in Darkshire bothers with, which is why people bring me things." },
      },
      choices = {
        { text = "What sort of things?", next = "languages_things" },
        { text = "Something else.", next = "BACK" },
      },
    },
    languages_things = {
      lines = {
        { id = "lt_default", text = "Gravestones, mostly, and letters from the dead now and then, and once a hermit's note, which I'd rather not discuss." },
        { id = "lt_after", when = { questDone = TODO_QUEST("Translation to Ello") },
          text = "That hermit's note... I read it aloud, slowly, and felt the air go heavy around me. I'd rather not discuss it further, ever." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "No one did. They buried him quickly, without ceremony, on the edge of the cemetery, and while I understand why, I've never been comfortable with it." },
      },
      choices = {
        { text = "Then I'll say them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "They were right to bury him quickly and be done with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Did a priest send him to the graves?", next = "priest_priest" },
      },
    },
    priest_priest = {
      lines = {
        { id = "pp_default", text = "A priest in Darkshire told him to look for a gravestone at Raven Hill, and it was kindly meant. He refused to believe it, and then he went, but don't carry that, because nobody should." },
      },
      choices = {
        { text = "Someone had to tell him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A kinder priest would have kept quiet about that gravestone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Very well, try this one... no, that's a laundry list in old Common, and I was testing your honesty rather than your eyes. You failed charmingly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    lordaeron = {
      lines = {
        { id = "lo_default", text = "Then you've seen what he saw, the plague and the Silver Hand broken, and Morgan came home from all that to graves. Did you come home to anything?" },
      },
      choices = {
        { text = "Nothing that was still standing.", next = "BACK", fx = { affinity = 2 } },
        { text = "To strangers. And Stormwind.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "They'd have to dig through it first, and I warn you, the bottom layer hasn't seen daylight since the Second War. Tell your Explorers' League I'll trade a Darkshire parish roll for one good rubbing of a Titan rune." } },
      choices = {
        { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1 } },
        { text = "What's in the bottom layer?", next = "oldest" },
      },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "You will? Wait, wait, let me find a clean page, which may take a moment. Now, say it slowly, and then tell me whether it's a word for every day or a word for best." } },
      choices = {
        { text = "Shen'dorei. It means the hidden people.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "On second thought, some words stay ours.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm historian to Darkshire. I read what the town wrote down and correct what it got wrong, and the second takes much longer." } },
    advice = { { id = "tp_ad", text = "Read the gravestones at Raven Hill before you fight anything there, because half the names will tell you what you're about to meet." } },
    night_watch = { { id = "tp_watch", text = "Founded in a hurry and recorded in a hurry; half the rosters are in pencil, and that tells you all you need to know." } },
    worgen = { { id = "tp_worgen", text = "There's nothing in the records, not one mention before these last few years, which is the most interesting thing anyone's told me in ages." } },
    stalvan = { { id = "tp_stalvan", text = "The Mistmantles are in the old registers, yes, and then there's a gap. I hate a gap, and Smitts hates it even more." } },
    ladimore = { { id = "tp_ladimore", text = "There's a book on him; the library in Stormwind keeps a copy, and so do I. It tells the tale better than I can, though I knew him." } },
    carevins = { { id = "tp_carevins", text = "They're a Darkshire family who don't care for being written about, so I write about them quietly." } },
    embalmer = { { id = "tp_embalmer", text = "It was a nursery tale until I translated a certain note, and I've had to move it to the history shelf, where I don't like it at all." } },
    _none = { { id = "tp_none", text = "It's not in my papers, which means either it never happened or nobody here could spell it." } },
  },
}

P:NPC {
  key = "viktori", id = TODO_NPC("Viktori Prism'Antras"), name = "Viktori Prism'Antras",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "eager" }, values = { "curious", "rational" },
  notices = { "craft", "arcane" },

  impression = {
    first = "Viktori Prism'Antras studies the stars from the darkest forest I know, and he is entirely aware of the joke. His delight over twenty minutes of open sky was catching.",
    third = "{name} met Viktori Prism'Antras, an astronomer who studies the stars through a single gap in Duskwood's canopy.",
  },

  greetings = {
    { id = "g_sky", text = "Ah! Did you know there's a gap in the canopy right above this hut? Some nights it gives me twenty minutes of sky, and I don't waste them." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, good! The fog lifted for nearly an hour last night, and I saw three stars I'd never charted." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer, bless you! Can you turn a bronze tube, a true one, with no bends? Cog's plans say it must be true." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. I mean no offense, but I don't think the answer here is magic; I think it's something you can measure." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not in words, but in patterns. Your spirits might read them differently, but we're both looking up, aren't we?" } },
      choices = {
        { text = "Keep looking up, Viktori. Someone in Darkshire ought to.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The stars don't care about us. Look down where the danger is.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need a guard when I breathe in this forest, friend. The worgs think my lens is a shiny thing worth stealing, and I can't tell a star's position and a wolf's at the same time." } },
      choices = {
        { text = "I'll stand watch while you work. Science deserves a guard.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stargazing in Duskwood is your problem, not mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Viktori.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The worgs do, I'm almost certain of it, because they howl loudest on the nights the clouds part. I've half a theory that the dark changed the animals here, and I'd dearly love a hunter's notes to prove it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps looking up when I do, and I find that wonderful. Perhaps beasts remember the sky better than the townsfolk." },
      },
      choices = {
        { text = "I'll keep notes for you. Your theory deserves an answer.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt beasts, Viktori. I don't study them for anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Viktori.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Valuable, delicate and quite useless to anyone who doesn't know the stars, so I'd thank you to keep your hands in your pockets. If you're curious, I'll show you how it works, and that's more than a thief ever gets." } },
      choices = {
        { text = "I'm curious, not a thief. Show me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Delicate things fetch the best prices.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What does the device do?", next = "device" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I've read the old warnings, yes, the ones about eyes in the dark between the stars, and I don't care for them. I watch the sky to learn its patterns, not to wave at whatever might be watching back." } },
      choices = {
        { text = "Wise. Some things shouldn't be waved at.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever watches back might teach you something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why study stars here, of all places?", next = "why" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Perhaps the Light made the stars, I couldn't say, but it didn't make the fog, and I'd rather measure what's in front of me than guess. Hold the lamp for me some night and we'll see which of us learns more." } },
      choices = {
        { text = "The Light shows more than any lens ever will, Viktori.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Measure away, then. Faith can wait for your results.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Viktori.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and you'll tell me the Light is the only lamp I need. I'd still like a better lens, if it's all the same to you." },
        { id = "h_default", text = "I'm Viktori Prism'Antras, and I study the stars, in Duskwood, yes, I know. Everyone laughs, but then everyone in Duskwood hasn't seen the sun in years, so who's laughing?" },
        { id = "h_tube", tags = { "news" }, when = { questActive = TODO_QUEST("Look To The Stars") },
          text = "I need a bronze tube made by an engineer, the first piece of Cog's design. Herble down the hill sells a few, if he hasn't run out." },
        { id = "h_cog", when = { questDone = TODO_QUEST("Look To The Stars") },
          text = "Cog's a gnome and a dear friend, and the only person who ever answered my letters with drawings. His blueprints are the reason I'm still sane." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! You'll tell me it's spirits, or the moon, and fine, perhaps it is, but spirits leave marks, and marks can be measured. That's all I'm after." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Do you know Cog Glitzspinner? No, of course you don't, there must be thousands of you, so forgive me, I get excited about gnomes." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, and I expect you'll tell me the dark is a test of faith. Maybe it is, but tests have instruments, and I'm building one." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lived above the clouds, really? What did the stars look like with nothing in the way... no, don't tell me, yes, tell me!" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll be no use to my telescope, but you might keep the worgs off it while I use it, and I'd count that a fine collaboration." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I'd wager you can see further in the dark than most. Tell me, do the beasts here still notice the stars?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, out in the dark with me! Do your spirits ever look at the stars? Twenty minutes of open sky here is a gift." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, if there's cloud coming." },
        { id = "h_again2", text = "Go on, go on, I'm only polishing a lens, and I'm always polishing a lens." },
      },
      choices = {
        { text = "What are you building?", next = "device" },
        { text = "Why the stars, here?", next = "why" },
        { text = "Did you design all this yourself?", next = "cog" },
        { text = "What can you see through the fog?", next = "fog" },
        { text = "Show me Cog's drawings.", next = "gnome", when = { race = "Gnome" } },
        { text = "Maybe the dark is a matter for faith.", next = "priest", when = { class = "PRIEST" } },
        { text = "I can turn you a true tube.", next = "engineer", when = { profession = "Engineering" } },
        { text = "My people have watched these stars for ages.", next = "nightelf", when = { race = "NightElf" } },
        { text = "That device of yours looks valuable.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you need a guard when you watch the stars, Viktori?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the beasts of Duskwood still follow the moon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Some of what's up there isn't stars at all.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light have any place in your stargazing, Viktori?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the stars speak to you, Viktori?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the fog.", next = "END" },
      },
    },
    device = {
      lines = {
        { id = "d_default", text = "A way to see far things close! Cog drew it and I'm only the hands: lenses, tubes, and a mount that doesn't wobble, and the wobbling is the hard part." },
      },
      choices = {
        { text = "I'll keep an eye out for parts.", next = "BACK", fx = { affinity = 1 } },
        { text = "What parts, exactly?", next = "device_parts" },
      },
    },
    device_parts = {
      lines = {
        { id = "dp_default", text = "A true bronze tube, something that reflects light, and a lens big enough to be worth the trouble. I know where one lens is, but it's on an ogre." },
      },
      choices = {
        { text = "On an ogre?", next = "device_monocle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    device_monocle = {
      lines = {
        { id = "dm_default", text = "Zzarc'Vul, in the ogre mound to the south, wears a monocle. What an ogre needs with a monocle I can't imagine, but it's exactly the right size." },
      },
      choices = {
        { text = "You want me to rob an ogre of his monocle.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because something changed this forest, and everyone says 'magic' and stops thinking. I don't want to stop thinking; I want to look up and find a reason." },
      },
      choices = {
        { text = "I hope you find it.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things don't have reasons.", next = "reasons" },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Then I'll have wasted some time and learned a great deal about lenses, and I can live with that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cog = {
      lines = {
        { id = "cg_default", text = "Cog Glitzspinner is a gnome and a friend, who sends blueprints the way other people send their regards. I show him every step, and he says he's impressed." },
      },
      choices = {
        { text = "Is he?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fog = {
      lines = {
        { id = "fo_default", text = "Mostly fog, but the gap above this hut opens some nights and the fog thins, and then I get twenty minutes of sky. I've charted three new stars that way." },
      },
      choices = {
        { text = "Twenty minutes isn't much.", next = "fog_gap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fog_gap = {
      lines = {
        { id = "fg_default", text = "It's twenty more than anyone else in Duskwood bothers with, because everybody here looks down, at graves mostly. Somebody ought to look up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Would you look? Here, do you see that? He drew the mount three times, because he knows the wobble is the enemy, and I wonder whether all gnomes think in mounts." },
      },
      choices = {
        { text = "Only the good ones.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Maybe it is, but then let faith look through the glass too. If the Light made the stars, it won't mind being measured, will it?" },
      },
      choices = {
        { text = "It won't mind.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things aren't for measuring.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    engineer = {
      lines = {
        { id = "en_default", text = "You can, a true one? Herble sells a few, but his are dear and his opinions come free, so if you make me one, astronomy in Duskwood will owe you everything." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    nightelf = {
      lines = { { id = "ne_default", text = "Ages! I've been at it for eleven years and I already feel ancient. Tell me, do the kaldorei name the bright one that rises over Raven Hill in autumn, because I've been calling it Cog's Lantern and I suspect that's wrong." } },
      choices = {
        { text = "We have a name. Cog's Lantern is better.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The stars are Elune's, not a gnome's.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I study the stars, in Duskwood, yes, I know. Laugh if you like, and then ask me something real." } },
    advice = { { id = "tp_ad", text = "Look up now and then, because everything that wants to eat you is down here." } },
    worgen = { { id = "tp_worgen", text = "Either they came with the dark or the dark came with them, and I'd give my last lens to know which was cause and which effect." } },
    night_watch = { { id = "tp_watch", text = "Lovely people, but they keep asking me to put out my lamp, and I keep asking them to put out theirs, because of the light pollution, you see." } },
    _none = { { id = "tp_none", text = "That's not my field, I'm afraid; my field is roughly forty miles straight up." } },
  },
}

P:NPC {
  key = "grual", id = TODO_NPC("Chef Grual"), name = "Chef Grual",
  bible = "bibles/darkshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "cheerful" }, values = { "proud", "generous" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Chef Grual runs the Scarlet Raven's kitchen with a cleaver and a grin, and calls every customer his favourite. It's the warmest place in Darkshire, in every sense.",
    third = "{name} met Chef Grual, who cooks for the Scarlet Raven and insists it is the best food in Darkshire.",
  },

  greetings = {
    { id = "g_kitchen", text = "Come in, come in, the kitchen's warm and the pot's on! Mind the cleaver, though, because it's got a mind of its own." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer! Don't tell the others, because I say that to all of them." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, so there's proper respect between us! You want to know my secret? No, you don't, and nobody does, trust me." },
    { id = "n_thin", cat = "hunger", when = { race = "Skyborne" },
      text = "Look at you, you're a twig! Sit down, sit down, because nobody leaves my kitchen that thin." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I call every one of them that, and I mean it each time. A warm meal keeps the dark out better than any lamp." } },
      choices = {
        { text = "A warm meal is a kindness, Grual. Keep the fire going.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Flattery's cheap. Your food had better be good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Everybody gets fed at the Raven, friend, because an empty belly is the one curse I know how to lift. Your imp, now, your imp eats in the yard, since the last time somebody's pet came into my kitchen I lost a whole pan of fritters and a good deal of my eyebrows." },
        { id = "xlock_more1", text = "And don't tell the Night Watch what you are while you're eating, because they argue with their mouths full and it puts the other customers off." },
      },
      choices = {
        { text = "The imp eats in the yard, then. Your kitchen, your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp goes where I go, Grual, kitchen or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Grual.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something hot, something heavy, and something you can still taste the next morning, so stew, friend! I've fed the Night Watch for years, and the ones who eat well come back more often than the ones who don't." } },
      choices = {
        { text = "Then feed the Watch first. I'll eat what's left.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Feed me first. I'm the one doing the killing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grual.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Ah, now that's a secret, my favourite, and even a quiet one like you won't sneak it out of my kitchen. Let's say it's mostly meat and a little bit of courage, and leave it there." } },
      choices = {
        { text = "Your secret's safe. A chef's recipes are his own.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find out the next time you're asleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is there a secret, then?", next = "secret" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "A perfect loaf! And what would I do then, with my ovens and my flour and my secrets? No, my favourite, keep your magic for the wolves and let me feed the people who come in shivering." } },
      choices = {
        { text = "Your kitchen, your rules, Grual.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your loss. Magic bread never burns.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's cooking tonight?", next = "tonight" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every one of them, and twice on cemetery nights, because a hungry watcher sees things that aren't there and misses things that are. I feed them on credit, mostly, and the credit's never once come due." } },
      choices = {
        { text = "Then I'll pay for my supper, and a watcher's besides.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Cooking on credit? You're a soft touch, Grual.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grual.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Mushrooms, when the Watch lets anyone pick them, and the odd wolf, though the wolves here have gone too strange to trust in a pot. Mostly I cook what comes up the road from Stormwind, and I make it taste like Darkshire anyway." } },
      choices = {
        { text = "Wise to trust the Stormwind wagons over this wood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Cook what the forest gives. Its gifts are still gifts.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll eat first and pray second in my kitchen, and the Light won't mind, because I've asked it." },
        { id = "h_default", text = "Grual's the name, and I cook for the Scarlet Raven! It's the best food in Darkshire, and I'll fight anyone who says it's only the best because it's the only food in Darkshire." },
        { id = "h_crab", tags = { "news" }, when = { questActive = TODO_QUEST("Dusky Crab Cakes") },
          text = "Crab cakes, the house favourite! I need a few bits for the recipe, but don't ask which bits, because it's a family secret and the family's very private." },
        { id = "h_kabob", when = { questActive = TODO_QUEST("Seasoned Wolf Kabobs") },
          text = "I need wolf flanks, and lean ones. Duskwood wolves are all gristle and grudge, but with enough pepper anything's a supper." },
        { id = "h_jitters", tags = { "news" }, when = { questActive = TODO_QUEST("Jitters' Growling Gut") },
          text = "Someone's hungry up in the hills and too scared to come down? The poor soul! Fetch me the makings and I'll send something hot." },
        { id = "h_jitters_ack", when = { heardLine = "jitters.s_default" },
          text = "That fellow up the hill watched something awful, didn't he? You can tell by how a man eats, and he ate like it was the last thing he'd ever be sure of." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Would you bless the stew? It's had a long week, the poor stew." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want a double helping, then, because nobody swings a sword in this wood on an empty stomach, not twice anyway." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You're my new favourite customer, and you've arrived just as the stew's ready, which is a sign if ever I saw one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You're my favourite customer tonight, so long as that little demon of yours keeps its claws out of my crab cakes." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My favourite customer! Sit down, eat; my kitchen's the warmest place in Darkshire, spirits or no." },
      },
      again = {
        { id = "h_again", text = "What else? Taste this while you think, and no, don't ask what it is." },
        { id = "h_again2", text = "Go on! The pot needs stirring, and I need talking to." },
      },
      choices = {
        { text = "What's in the crab cakes?", next = "secret" },
        { text = "What's good tonight?", next = "tonight" },
        { text = "Who do you cook for, out here?", next = "customers" },
        { text = "Where do you get anything, in Duskwood?", next = "ingredients" },
        { text = "Cook to cook: what's the trick?", next = "cook", when = { profession = "Cooking" } },
        { text = "I'll bless the stew.", next = "priest", when = { class = "PRIEST" } },
        { text = "I could bring you fresh game from the woods.", next = "hunter", when = { class = "HUNTER" } },
        { text = "What's really in the stew, Grual?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could conjure you a perfect loaf, Grual.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a warrior eat before facing Duskwood's dead, Grual?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does your kitchen feed the Night Watch too, Grual?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you cook anything that grows wild in these woods?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks get fed at the Scarlet Raven, Grual?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you really call everyone your favourite, Grual?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just smelling, thanks.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "s_default", text = "Crab, mostly, or crab-adjacent, let's say. Look, does it taste good? Then that's what's in it." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not reassuring.", next = "worry" },
        { text = "Crab-adjacent?", next = "secret_adjacent" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "It's not meant to be reassuring, it's meant to be delicious, and that's a different job entirely." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    secret_adjacent = {
      lines = {
        { id = "sa_default", text = "Things with legs, a good many legs, and crabs have legs! I'm not saying anything that isn't technically true about crabs." },
      },
      choices = {
        { text = "How many legs, Grual?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I don't want to know.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    tonight = {
      lines = { { id = "t_default", text = "Stew, because it's always stew by the end of the week. Everything that didn't get eaten goes in, and it comes out tasting like it meant to." } },
      choices = {
        { text = "Stew it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "What went in this week?", next = "tonight_week" },
      },
    },
    tonight_week = {
      lines = {
        { id = "tw_default", text = "Wolf, and more wolf, and a turnip that put up a fight, with pepper from Stormwind, which is more than Stormwind's soldiers ever managed." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    customers = {
      lines = {
        { id = "cu_default", text = "Watchers at all hours, and travellers, though fewer every year. Now and then there's somebody who can't come down to eat, so the food goes up to them." },
      },
      choices = {
        { text = "Like the man at Raven Hill?", next = "customers_jitters", when = { questDone = TODO_QUEST("Jitters' Growling Gut") } },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    customers_jitters = {
      lines = {
        { id = "cj_default", text = "That's him. I send a little up whenever someone's going that way, and he never sends the plate back, but I don't ask for it." },
      },
      choices = { { text = "That's kind of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    ingredients = {
      lines = {
        { id = "in_default", text = "The woods provide: wolves, mostly, and things that, er, skitter... mushrooms, I mean, mushrooms! The rest comes down the road from Stormwind, slowly." },
      },
      choices = {
        { text = "What comes from Stormwind?", next = "ingredients_stormwind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ingredients_stormwind = {
      lines = {
        { id = "is_default", text = "Herbs, from Felicia Gump's flower shop on the canals. A wolf without Stormwind seasoning is only a wolf, but with it, it's a kabob." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "co_default", text = "The secret is that I never tell anyone! Fetch me the makings for the crab cakes, though, and I'll show you something nearly as good, nearly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Would you? Here, over the pot... it smells better already, and whether that's faith or the onions catching up, thank you all the same." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Fresh game, he says, as if it walked in on its own! My favourite customer, that one, but I'll warn you that half of what's out there has been dead a while already, so sniff it before you skin it." } },
      choices = {
        { text = "I know a fresh kill, Grual.", next = "BACK", fx = { affinity = 1 } },
        { text = "What do you need most?", next = "ingredients" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Grual, and I cook, and that's the whole of it, because a man is what he feeds people." } },
    advice = { { id = "tp_ad", text = "Eat before you go into the woods, because nobody fights well hungry and nobody runs well full, so aim for the middle." } },
    worgen = { { id = "tp_worgen", text = "They're not on my menu. I've been asked, and I've said no, because there are some lines a cook doesn't cross." } },
    night_watch = { { id = "tp_watch", text = "They eat at odd hours and tip in apologies, and I feed them anyway, because you don't let the lamp-holders go hungry." } },
    stalvan = { { id = "tp_stalvan", text = "That's Smitts's business, so ask him, and bring a chair, because it's a long one." } },
    _none = { { id = "tp_none", text = "I can't help you there, but can I interest you in a crab cake?" } },
  },
}

P:NPC {
  key = "millstipe", id = TODO_NPC("Councilman Millstipe"), name = "Councilman Millstipe",
  bible = "bibles/darkshire_folk.md", role = "noble", tier = "quest",
  communities = { "darkshire" }, temper = { "indignant" }, values = { "just", "proud" },
  notices = { "status", "soldier" },

  impression = {
    first = "Councilman Millstipe keeps a list of grievances for anyone who looks remotely like Stormwind. He is angry in the patient, documented way of a man who's written too many letters.",
    third = "{name} met Councilman Millstipe of the Council of Darkshire, who has given up waiting for Stormwind to read his letters.",
  },

  greetings = {
    { id = "g_council", text = "If you're from Stormwind, I have a list for you, and if you're from anywhere else, a shorter one." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, good, which is more than the last three Stormwind envoys managed." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Real armour, at last! Is the Crown finally sending soldiers, or did you come on your own? On your own, of course." },
    { id = "n_status", cat = "status", when = { townStanding = { town = "darkshire", min = 30 } },
      text = "The Watch speaks well of you, and do you know how rarely the Watch speaks well of anything? I'm putting it in the minutes." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Unanswered letters, unpaid soldiers, and a forest full of the dead. If your spirits could carry a message to the king, I'd write another." } },
      choices = {
        { text = "Keep writing, Councilman. The kingdom must be held accountable.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget Stormwind. Darkshire must save itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not one, and I have the replies to prove it, all six of them politely declining. The Night Watch is shopkeepers and farmers, so one trained warrior here does more good than every letter the House of Nobles ever sealed." } },
      choices = {
        { text = "Then I'll fight for Darkshire, since Stormwind won't.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stormwind has its reasons. I won't speak against the crown.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Councilman.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It would if the treasury held anything but moths, I'm sorry to say. Stormwind's taxes leave us little enough for lamp oil, but the farmers would thank you, and their thanks costs the council nothing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours is a better watchman than half the council, {class}, and I'd say so in a letter if anyone in Stormwind still read mine." },
      },
      choices = {
        { text = "I'll hunt them anyway. The farmers need it more than I need coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "No bounty, no hunt. Tell the council that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Councilman.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Quieter routes! I've tried the loud ones and the polite ones and the ones with wax seals the size of my palm. If you know a way to put a letter on a nobleman's pillow, I'll pretend I never asked how." } },
      choices = {
        { text = "I'll deliver it the proper way, Councilman.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The pillow, then. Nobles read what frightens them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What troubles should Stormwind hear about?", next = "troubles" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "They've been asked, mage, in a letter that's sitting in a drawer in the Mage Quarter alongside a great many others, I suspect. If you've a friend in those towers, tell them Darkshire is still here and still waiting." } },
      choices = {
        { text = "I'll carry the message properly, through channels.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Channels failed you. Act without them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who in Stormwind ignores you?", next = "stormwind_who" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "That's a dangerous thing to say in a town hall, and I'm afraid I rather like it. But Darkshire wants soldiers, not more things in the dark, so I'll take your sympathy and leave your offer on the table." } },
      choices = {
        { text = "Fear gets answers where letters don't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll stand for Darkshire in the light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What does the council actually do?", next = "council" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bishop Farthing writes, I'll give him that, and he's the only one in Stormwind who does. But a letter of comfort to a widow isn't a company of soldiers, and Darkshire has a great many widows." } },
      choices = {
        { text = "Comfort matters too. I'll pray for every one of those widows.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Prayers won't save Darkshire; soldiers will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Next item, Councilman.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stand in the square where people can see you, for a start, so they believe Stormwind still remembers them. Then go and do something about Raven Hill, so they've a reason to go on believing it." } },
      choices = {
        { text = "I'll stand for Stormwind, even if Stormwind's been slow.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm not here for Stormwind. I'm here for Darkshire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Councilman.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We've asked Stormwind for soldiers, priests, mages and a new roof for the town hall, and I'll admit druids never made the list. If the Cenarion Circle reads letters, I'll write one tonight, and probably a second to complain the first went unanswered." } },
      choices = {
        { text = "Write it properly, through the right channels. That's how it's done.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Letters are useless. Act first and ask permission after.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The Cathedral answers our letters with prayers, which is kind of it, though a prayer has never yet held a pike." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If you've come from the Cathedral, tell them the council of Darkshire has a long memory and a longer list." },
        { id = "h_default", text = "I'm Councilman Millstipe, of the Council of Darkshire. We govern this town, and we'd govern it better if Stormwind ever read our letters past the first line." },
        { id = "h_ello", when = { heardLine = "ello.h_default" },
          text = "The mayor told you about his petitions? I drafted half of them, with stronger language every time, and now they've stopped replying to the strong ones too." },
        { id = "h_ward", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Crime and Punishment") },
          text = "Dextren Ward sold our dead to Morbent Fel, and Lord Ebonlocke sentenced him to die for it. The nobles in Stormwind took him instead, and he's alive in their Stockade." },
        { id = "h_ward_done", tags = { "news" }, when = { questDone = TODO_QUEST("Crime and Punishment") },
          text = "So it's done, and the families can visit the graves without wondering. Somewhere in Stormwind, a noble has been reminded that Darkshire still exists." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "Your people are with the Alliance now? Then you'll learn soon enough how it goes: you write to Stormwind, and you wait, and then you write again." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "A noble's child, in my town hall! Do sit, because I've waited years to say a few things to one of you, and I'll be brief, though I won't be kind." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I'd write to Stormwind asking for a hundred of you, and I have, and they sent nobody, so I'll take the one who walked in." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! The wolves are taking our livestock and Stormwind is taking our taxes, and I know which one I'd rather you hunted." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the night elves, here in Darkshire. I don't suppose your people have a council that answers its letters, because ours in Stormwind does not." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Do you look like Stormwind? No? Good, then I won't read you my list of grievances. Not yet." },
      },
      again = {
        { id = "h_again", text = "Next item, then, and you understand I'm putting all this in the minutes." },
        { id = "h_again2", text = "Go on. The council's in recess, as it always seems to be, lately." },
      },
      choices = {
        { text = "What's wrong with Stormwind?", next = "stormwind" },
        { text = "What does the Council do?", next = "council" },
        { text = "Has Darkshire caught any criminals lately?", next = "ward" },
        { text = "What would you do, in Stormwind's place?", next = "place" },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Ward's dead. Was that justice, or a message?", next = "justice", when = { questDone = TODO_QUEST("Crime and Punishment") } },
        { text = "Have you written to Ironforge as well?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Your letters could reach the nobles by quieter routes.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Stormwind's mages could help Darkshire, if anyone asked them.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has Stormwind really sent no soldiers to Darkshire, Councilman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the council pay for worg pelts, Councilman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your council could use someone who frightens Stormwind.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Have Stormwind's priests done anything for Darkshire, Councilman?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would the council have a paladin do, Councilman?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Has the council ever asked druids to look at the sick forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What grievances do you have against Stormwind, Councilman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Councilman.", next = "END" },
      },
    },
    stormwind = {
      big = true,
      lines = {
        { id = "s_default", text = "Nothing at all, if you live there. They pulled the soldiers out, let the nobles overrule our courts, and send back letters about patience, but patience doesn't hold a pike." },
      },
      choices = {
        { text = "They've got troubles of their own.", next = "troubles" },
        { text = "Darkshire deserves better.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Who decided to pull the soldiers out?", next = "stormwind_who" },
      },
    },
    troubles = {
      lines = { { id = "t_default", text = "So does everyone, but ours have teeth and theirs have committees, so forgive me if I don't weep." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    stormwind_who = {
      lines = {
        { id = "sw_default", text = "Someone at court, after the king went missing. The orders came signed and sealed, and nobody would say whose idea they were, so ask yourself who gains when a town is left alone." },
      },
      choices = {
        { text = "Who does gain?", next = "BACK", fx = { trait = { curious = 1 }, opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Taxes, roads, graves and quarrels, and mostly graves, lately. We judge our own crimes too, when we're allowed to." } },
      choices = {
        { text = "When you're allowed to?", next = "ward" },
        { text = "I see.", next = "BACK" },
      },
    },
    ward = {
      lines = {
        { id = "wd_default", text = "A grave robber, who dug up our dead at Raven Hill and sold them to the necromancer on the hill. We sentenced him, and the House of Nobles said no.",
          fx = { learn = { "morbent_fel" } } },
      },
      choices = {
        { text = "Why would they stop it?", next = "ward_stockade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ward_stockade = {
      lines = {
        { id = "ws_default", text = "Jurisdiction, they said. He eats their bread in their Stockade, while the families here still can't stand at a grave without wondering if it's empty." },
      },
      choices = {
        { text = "Someone should finish what you started.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The law is the law.", next = "BACK", fx = { affinity = -1, align = { order = 2 } } },
      },
    },
    place = {
      lines = {
        { id = "pl_default", text = "I'd send fifty soldiers. Not an army, mind you, just fifty, with a priest and one clerk who reads our letters past the first line." },
      },
      choices = {
        { text = "And if they still won't?", next = "place_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    place_break = {
      big = true,
      lines = {
        { id = "pb_default", text = "Then Darkshire learns to want nothing from Stormwind, and that's a dangerous lesson for a town to learn. I'd rather not be the one teaching it." },
      },
      choices = {
        { text = "Let's make sure it never comes to that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe Darkshire would do better without Stormwind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then tell them this, word for word: Darkshire's dead are being sold, and you're keeping the man who sold them warm. Will you remember that?" },
      },
      choices = {
        { text = "Word for word.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, standing = { darkshire = 1 } },
          journal = { first = "Councilman Millstipe gave me a message for the House of Nobles, about Darkshire's stolen dead.",
                      third = "{name} carried Councilman Millstipe's message for the House of Nobles." } },
        { text = "I'll soften it a little, or they'll stop listening.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "They won't listen to me either.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    justice = {
      lines = {
        { id = "ju_default", text = "Both, justice for the families and a message for the nobles, and I don't lose much sleep over which mattered more." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Of course I have, and to Menethil, and to the Earl of somewhere I've since forgotten. Ironforge at least answered within the year, which puts it well ahead of the Stormwind House of Nobles." } },
      choices = {
        { text = "Darkshire should look after itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Alliance will answer. Keep writing.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "As a member of the council, I am obliged to be informed on a great many matters, and I take that obligation seriously. Ask me about any of these." },
    },
    background = { { id = "tp_bg", text = "I'm a councilman of Darkshire: I sit, I argue, and I draft letters. Some days that feels like fighting, though most days it doesn't." } },
    advice = { { id = "tp_ad", text = "Write everything down and sign it, because when Stormwind finally asks what happened here, I want the answer in our own hand." } },
    night_watch = { { id = "tp_watch", text = "The Council funds them with what we have, which is gratitude and leftover pikes." } },
    worgen = { { id = "tp_worgen", text = "They're on the agenda every week, and every week the agenda loses." } },
    stalvan = { { id = "tp_stalvan", text = "That was before my time on the Council, and the file is thin. I suspect someone wanted it that way." } },
    morbent_fel = { { id = "tp_morbent", text = "A necromancer who buys corpses and a grave robber who sold them, and Stormwind protects one of them. You can guess which." } },
    _none = { { id = "tp_none", text = "Write it down and submit it to the Council, and we'll lose it properly." } },
  },
}

P:NPC {
  key = "trelayne", id = TODO_NPC("Innkeeper Trelayne"), name = "Innkeeper Trelayne",
  bible = "bibles/darkshire_folk.md", role = "innkeeper", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "practical", "kind" },
  notices = { "weary", "kit" },

  impression = {
    first = "Innkeeper Trelayne checks the shutters twice and told me not to stand in a lit doorway. In Darkshire that counts as hospitality, and I was grateful for it.",
    third = "{name} took a room from Innkeeper Trelayne, who keeps Darkshire's guests indoors and its shutters firmly closed after dark.",
  },

  greetings = {
    { id = "g_beds", text = "Beds are upstairs and blankets are in the chest, and the shutters stay closed. If something scratches at them in the night, it's the wind, and you're not to check." },
    { id = "g_home", when = { homeInn = { "Darkshire", "Scarlet Raven Tavern" } }, text = "Your room's just as you left it, and I checked the shutters twice, out of habit." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "In you come, quickly, and don't stand in the doorway with the light behind you, because they notice that." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 2 } },
      text = "You look like the woods chewed on you and spat you out, twice by the look of it. Sit down, and I'll bring something hot." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your kit's in ribbons, and the Gnarltrees up the road will patch it. Do it before you sleep, because nobody sleeps well with holes in their mail around here." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because things outside can see you there, and they come. I check the shutters twice. Your spirits might see them coming, though." } },
      choices = {
        { text = "Then I'll keep away from the door, Trelayne. Caution is wise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them come. I'm not afraid of the dark.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Once, two winters back, and Smitts held the door with a chair until the Watch came. We sleep easier with a fighter under the roof, so if you're staying, I'd put you nearest the door." } },
      choices = {
        { text = "Put me by the door. Your guests will sleep sound.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I paid for a bed, not a watch post.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Trelayne.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Into the edges, yes, sniffing round the stables and the bins behind the kitchen. A good beast that barks at them is worth more to me than another lock on the door." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can have the rug by the fire, {class}, so long as it warns us before the wolves do." },
      },
      choices = {
        { text = "I'll hunt the ones that come too close to town.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Watch can deal with wolves. I'm here to rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Trelayne.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "It suits the worgen too, which is why I tell folk to stay out of the lit doorways and the dark ones both. Sit by the fire with your back to the wall like everybody else, and you'll sleep easier." } },
      choices = {
        { text = "I'll take the dark doorway. Nobody sees me there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll sit with the others and watch the door.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Can anyone sleep here?", next = "sleep" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "And when your spell gives out at the second bell, I'll have a room full of guests in the dark and the shutters rattling. Candles I can count, mage, and I count them every night." } },
      choices = {
        { text = "Fair. Candles you can count.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A spell holds if you trust it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why check the shutters twice?", next = "sleep_shutters" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Safer from the worgen, maybe, and a good deal less safe from their own nightmares. I'll thank you to keep whatever it is in your room with the shutters shut, same as everyone else." } },
      choices = {
        { text = "In my room, then. Your guests come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nightmares are cheaper than wolves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who stays here?", next = "guests" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough to sleep, mostly, which is all I promise anyone. Smitts's old murders still keep a few of the older guests awake, and the new ones wake when the wolves start, so a paladin by the door would do us all good." } },
      choices = {
        { text = "The room by the door, then. Let them sleep.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take a quiet room upstairs, thank you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Trelayne.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the worgen come right up to the edge of town on a clear night, and the dead walk the road from Raven Hill, and neither one knocks first. I've lost two guests who thought the stars were worth looking at, and I'll not lose a third." } },
      choices = {
        { text = "Your rules keep people alive. I'll keep to them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A night elf belongs under the stars, whatever walks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your room's the one by the door, if you'll take it, because my guests sleep better knowing who's nearest the night." },
        { id = "h_default", text = "I'm Trelayne. Smitts keeps the bar and I keep the beds, and between us we keep people indoors after dark, which is the whole job here." },
        { id = "h_smitts", when = { heardLine = "smitts.m_default" },
          text = "So Smitts told you about the murders; he tells everyone eventually, so let him. It's the only thing he's never been able to put down." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You're welcome to a bed, but leave the blade where you can reach it, because in Darkshire the night doesn't always knock." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast can sleep by the hearth if it's clean, and it can keep an ear on the shutters while it's there." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll want to sleep out under the trees, I expect, and I'm telling you now that in Duskwood you won't." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't stand in the lit doorway, please. Come inside, and keep your spirits away from the shutters." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've beds to turn down." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How do you sleep here?", next = "sleep" },
        { text = "Who stays here, these days?", next = "guests" },
        { text = "Shall I bless the shutters?", next = "priest", when = { class = "PRIEST" } },
        { text = "A dark doorway suits me fine, Trelayne.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could light the whole inn without a single candle.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has anything ever broken into the inn, Trelayne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the wolves come into Darkshire at night, Trelayne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your guests would sleep safer with something of mine at the door.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your guests feel safe under this roof, Trelayne?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do you keep guests indoors after dark, Trelayne?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why must I avoid the lit doorway, Trelayne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    sleep = {
      lines = { { id = "s_default", text = "Badly, and with a poker by the bed. You get used to the howling, but you never get used to it stopping." } },
      choices = {
        { text = "Why the shutters?", next = "sleep_shutters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep_shutters = {
      lines = {
        { id = "ss_default", text = "Because something out there calls names on some nights. Never open a shutter because you heard yours, because nobody you'd want is calling." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    guests = {
      lines = {
        { id = "gu_default", text = "Watchers between shifts, the odd brave traveller and the odd foolish one, and I can't tell which is which till morning." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Would you? I'll take any help that keeps them shut, so bless the hinges too, because the hinges are where it all goes wrong." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the beds at the Raven, and that's my story; a short one's safer, in Duskwood." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots where you can find them in the dark, because you never know." } },
    night_watch = { { id = "tp_watch", text = "Half of them sleep here between shifts, and I don't charge, since they never stay long enough to count." } },
    worgen = { { id = "tp_worgen", text = "They don't come into the square, not yet, and I keep the shutters closed in case 'yet' turns up." } },
    _none = { { id = "tp_none", text = "Ask Smitts, because he knows everything, though he'll make you pay for it in listening." } },
  },
}

P:NPC {
  key = "clarise", id = TODO_NPC("Clarise Gnarltree"), name = "Clarise Gnarltree",
  bible = "bibles/darkshire_folk.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "practical", "craft" },
  notices = { "craft", "stealth" },

  impression = {
    first = "Clarise Gnarltree teaches the craft with a heavy hammer and very little patience for anyone standing where the sparks go. There's a Gnarltree for every part of a fighter, she says.",
    third = "{name} met Clarise Gnarltree, who teaches smithing in Darkshire alongside Gavin and Morg Gnarltree.",
  },

  greetings = {
    { id = "g_forge", text = "The forge is hot and the hammer's heavy, and you're standing right where the sparks go, so step left." },
    { id = "g_back", when = { metBefore = true }, text = "More lessons, or more burns? Usually it's both." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Show me your hands... hm, fewer burns than mine, so either you're very good or you haven't tried anything hard yet." },
  },

  react = {
    { id = "r_stealth", on = "stealth",
      text = "Light's sake, don't come out of the dark at me like that! Next time cough, or whistle, or something." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every fighter does, spirits or no. When the dead get close, it's steel that matters." } },
      choices = {
        { text = "Steel and spirits both. I'll gear up properly, Clarise.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My spirits are enough. I don't need steel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Cloth folk like you don't wear my steel, but I'll sharpen a dagger for you and put a proper edge on it, and I'll not ask what it cuts. I've had Morbent Fel's sort described to me by men who barely got away, so I'd ask you, quite plainly, not to go turning into that." },
      },
      choices = {
        { text = "I won't. My arts have limits, and I keep them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fel was clumsy, Clarise. I won't be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Clarise.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You oil it every night, because Duskwood's damp eats steel faster than the ghouls eat flesh, and you sharpen it after every fight whether it needs it or not. Gavin will sell you the blade and Morg the plate, but the care is on you." } },
      choices = {
        { text = "I'll tend it every night. A warrior's gear is his life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll just buy new when it rusts. Coin's easier than care.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Clarise.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Broad and heavy at the tip, with a good barb, and I've made hundreds for the Watch's bowmen. A worg takes three soft arrows to drop, but one good one in the right place does the job." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours has better claws than anything I could forge, {class}, though I'd not tell Morg I said so." },
      },
      choices = {
        { text = "One good arrow, cleanly placed. That's how I hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take three soft ones. Quantity wins most fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Clarise.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Every blade needs the hammer, whatever size it ends up, and a dagger you didn't beat out properly will snap in a worgen's ribs. Stand back from the sparks and watch how it's done." } },
      choices = {
        { text = "I'll learn it properly, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take whatever's sharp and go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How's the work these days?", next = "work" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you need a carpenter, not a Gnarltree, though if you've any sense you'll wear a bit of mail under that robe. The worgen don't care how clever you are when they're chewing on you." } },
      choices = {
        { text = "Robes are the discipline of my craft.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fine, mail under the robe. Survival comes first.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Can anyone sleep, with the worgen so close?", next = "sleep" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Watch bring me their blades to sharpen, and half of them ask me to say something over the edge while I'm at it. I'm no priest, so I say 'cut true', but I'd not stop you saying something better." } },
      choices = {
        { text = "Then I'll bless them. Every edge here guards someone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A sharp edge needs no blessing, Clarise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Clarise.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I could, and I'd rather you learned than walked in here every week with a cracked haft. The dead are hard on a mace, harder than living bone, and a hammer that breaks out past the lamps is no use to anyone." } },
      choices = {
        { text = "Teach me properly, then, the slow way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll just buy a new one when it breaks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Clarise.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It did once, from the hills past the Yorgen farm, but nobody's dug there since the dead came up. Now it comes down the road from Lakeshire in carts the Watch has to escort, and every bar costs me twice what it should." } },
      choices = {
        { text = "The Watch guards those carts with their lives. Pay it gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Twice the price? Buy it off a smuggler instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, at the forge? Mind your robes near the sparks, because I've singed better cloth than yours without meaning to." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Bring that hammer here and let me see the head, because a paladin's hammer takes more punishment than any blade in Darkshire." },
        { id = "h_default", text = "I'm Clarise Gnarltree, and I teach the craft. Gavin does the blades and Morg does the armour, so between the three of us there's a Gnarltree for every bit of you." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elf-built, with a light frame and a long reach. If you ever take up the hammer, choke up on the handle, and you'll thank me for it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and a proper one by the look of you! Mind where the sparks land, and show me that blade before you get yourself killed with it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting arrowheads that bite into worg hide, then, and they've a thick hide, I promise you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my forge. Mind the sparks, because I don't care how close you are with nature, a hot coal still burns." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at my forge. Keep your little friend out of the coals; it'll want to bathe in them, and I want them for steel." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't stand where the sparks fly. There's a Gnarltree for every part of a fighter, and you'll need all of us." },
      },
      again = {
        { id = "h_again", text = "Something else? Talk over the hammer, because I won't stop." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS" },
        { text = "You don't look like you've slept.", next = "sleep" },
        { text = "What do you make, mostly?", next = "work" },
        { text = "Daggers don't need a heavy hammer, Clarise.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I don't need armour, Clarise. I need a staff.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How do you keep a warrior's gear alive in this wood, Clarise?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you forge arrowheads that'll pierce worg hide, Clarise?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does a smith's work ever need a blessing, Clarise?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could you teach me to keep my own hammer sound?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Darkshire's iron come from these woods, Clarise?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can you make anything for one of my calling, Clarise?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think a shaman needs proper arms, Clarise?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    sleep = {
      big = true,
      lines = {
        { id = "s_default", text = "Not much. Some nights the wind brings screaming down off the hills, and it could be wolves or it could be anything, so I just work till it stops." },
      },
      choices = {
        { text = "That sounds hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What does it sound like?", next = "sleep_lambs" },
      },
    },
    sleep_lambs = {
      lines = {
        { id = "sl_default", text = "Like lambs, and that's the worst of it. It sounds just like lambs, and I've never once found a lamb in the morning." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = {
        { id = "wk_default", text = "Pike heads for the Watch, nails for the shutters, and hinges that hold. Pretty work's for Stormwind; here we make things that keep you alive." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Gnarltree at a forge in Darkshire, and that's the whole story, which is how I like it." } },
    advice = { { id = "tp_ad", text = "Mend your mail before you sleep, not after, because holes have a way of getting bigger in the dark." } },
    worgen = { { id = "tp_worgen", text = "Claws like that go through cheap mail like wet paper, so don't buy cheap mail; buy ours." } },
    night_watch = { { id = "tp_watch", text = "I keep their pikes sharp for free, because it's the least I can do... well, the least I could do is nothing, so this is a bit more." } },
    _none = { { id = "tp_none", text = "If you can't hit it or wear it, I'm no help to you." } },
  },
}
