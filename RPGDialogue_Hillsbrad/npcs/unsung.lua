-- Southshore's shopkeepers with nothing to say until now, and the goblin peddler on the road to Tarren Mill. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lindea", id = TODO_NPC("Lindea Rabonne"), name = "Lindea Rabonne",
  title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "wry", "patient" }, values = { "practical", "loyal" },
  notices = { "craft", "weary" },

  impression = {
    first = "Lindea Rabonne sells hooks and line on the Southshore docks and keeps a straight face better than anyone in Hillsbrad. Whatever she and Donald are to each other, she enjoys keeping it secret.",
    third = "{name} met Lindea Rabonne, who sells fishing supplies on the docks of Southshore.",
  },

  greetings = {
    { id = "g_dock", text = "Hooks, line, bait and poles, everything but the patience, and I can't sell you that." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the docks? The fish have missed you, or so they tell me." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You smell of the sea and you've a hook in your hat brim, so you're one of us. Mind you don't get it caught on the door frame like Donald does." },
    { id = "n_wet", cat = "weary", when = { deathCause = "drowning" },
      text = "You've the look of someone the bay nearly kept, love. Sit a moment before you go back out; the water's colder than it looks." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd rather you bought a good line first and asked the fish after, so we both come out of it well. Donald would tell you it's about patience and respect for the bay, and he'd be right, though I'd add that it's also about my rent." } },
      choices = {
        { text = "Then I'll fish the honest way, with hook and line.", next = "BACK", reply = "Donald will be thrilled to hear it, and he'll probably want to buy you a drink and tell you about his best catch. I'd run, if I were you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the spirits can save me the wait, I'll use them.", next = "BACK", reply = "I won't tell Donald, then, because he'd take it personally. Just buy your line from me first, so the spirits aren't the only ones paid.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There was a time I'd have laughed at the question, but the catches are smaller every year, and the murlocs are fighting us for what's left. I don't know if it's us or them, but somebody's taking too much." } },
      choices = {
        { text = "Then set limits. The bay won't feed you if it's empty.", next = "BACK", reply = "Limits, is it? You try telling that to a fisherman with five mouths at home, but you're not wrong, and I'll say so at the next town meeting.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "People need to eat. The bay will manage.", next = "BACK", reply = "I'd like to think so, and so would every fisherman on the pier. Still, I've noticed the bay doesn't seem to have heard about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One or two, for the fields toward Tarren Mill, where the Forsaken patrol by night. I sell it as fishing line and they buy it as fishing line, and Donald thinks we've had a very good season for anglers." } },
      choices = {
        { text = "Tripwires are a coward's trick. Fight them face to face.", next = "BACK", reply = "Maybe it is, but a farmer with a pitchfork can't fight a Deathguard face to face, so he does what he can. I'll not judge him for it.", fx = { align = { honor = 1 } } },
        { text = "Whatever brings down a Forsaken patrol. Sell them more.", next = "BACK", reply = "Don't let Donald hear you, or he'll start asking where all his good line went. I'll put a little extra by, all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, since the hills are thin this year and the bay never quite is. Donald says a hunter who fishes is only being sensible, and I say a hunter who fishes couldn't find a lion, and we both enjoy the argument." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} will want the fish, I suppose, which is fair, since your beast is the only one in Southshore who'll eat Donald's catch without complaining about the bones." },
      },
      choices = {
        { text = "I share what I catch. That's how a town survives.", next = "BACK", reply = "That's the way of it, and it's why Southshore's still standing. Bring the extra to the inn, and Neema will see it gets to someone hungry.", fx = { align = { honor = 1 } } },
        { text = "I keep what I catch. Others can find their own.", next = "BACK", reply = "Suit yourself, love, but this is a small town, and folk remember who shared and who didn't when the winter comes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once or twice, to see the refugee boats in after the plague, and they carried children up the pier in their arms as if they weighed nothing. Donald still talks about it, though he pretends he doesn't." } },
      choices = {
        { text = "That's what the Light's knights are for, Lindea.", next = "BACK", reply = "I know it, and I'd never seen it done before then. I'll not forget it, nor will the children, I expect.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Carrying children was easy. They should have stopped the plague.", next = "BACK", reply = "Easy to say from here, and I'll not pretend I know what they could have done. They did what they could on my pier, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The old ones touch the post at the end of the pier and say a word to the Light, and the young ones laugh at them until their first storm. I sell them all the same line, but I notice it's the praying ones who keep coming back for more." } },
      choices = {
        { text = "Faith keeps them steady when the sea doesn't.", next = "BACK", reply = "It does, and I've seen it work on the worst nights. I touch that post myself, though I'd never admit it to the young ones.", fx = { align = { light = 1 } } },
        { text = "Good line keeps them alive. The praying's just comfort.", next = "BACK", reply = "That's what I tell them too, but I notice they all touch the post after their first storm. Comfort's not nothing on a dark sea.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than you'd think, and none of them have ever fished in their lives. Donald says I should ask what it's for, but I find it's better business not to know, and the bay doesn't mind either way." } },
      choices = {
        { text = "Smart of you not to ask. Keep it that way.", next = "BACK", reply = "That's the plan, and it's served me well for twenty years. A shopkeeper who asks too many questions soon has no customers.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should ask. Line can strangle as well as fish.", next = "BACK", reply = "You sound like Donald, and he's usually right about such things. I'll ask the next one, then, and see what they say.", fx = { align = { order = 1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He'd be heartbroken, though he'd never show it, since he believes fishing is about patience, not power. I tell him the fish don't care how they're caught, and he tells me that's why I'll never understand fishing." } },
      choices = {
        { text = "Donald is right. Patience is the real reward.", next = "BACK", reply = "You'll make his day if you tell him that yourself. Mind you, he'll keep you talking about patience till the tide comes in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The fish don't care how they're caught. Neither do I.", next = "BACK", reply = "That's what I keep telling him! Don't let him hear you, though, or I'll never hear the end of it.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One, a few summers back, and he tried to use his imp as bait, and Donald still tells the story at the bar. The imp came back up angry and singed, and the fish were none the wiser, so I sold him a proper lure and some advice, and he did better after that." } },
      choices = {
        { text = "A proper lure it is. I'll do this honestly.", next = "BACK", reply = "Bless you for that. Donald can keep his one story, and I'll keep my customers dry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp could use a swim, frankly.", next = "BACK", reply = "Ha, maybe it could, though I'd rather it did its swimming elsewhere. Donald's still not forgiven the last one.", fx = { align = { order = -1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, buying hooks? I'd have thought you could just ask the fish to jump into the basket, {class}, but I suppose that would put me out of business." },
        { id = "h_default", key = true,
          text = "Lindea Rabonne, fishing supplies. Donald teaches the lessons, I sell the gear, and between us we've put a pole in the hands of half of Southshore. The other half are soldiers, and they never have the time." },
        { id = "h_coast", when = { questDone = TODO_QUEST("Down the Coast") },
          text = "You're the one who cleared the Torn Fin off the strand, aren't you? The nets are coming back full again, and I've sold more line this week than all last month, so you have my thanks." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want fishing line, I suppose, though I suspect you'll use it to trip someone rather than catch a fish, and I'll not ask which." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll not need a pole, I suppose, since your kind just freeze the fish where they swim, and Donald will be very disappointed to hear it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest buying fishing line? Well, I suppose even the Light's servants want a quiet evening, and the docks are the quietest place in Southshore." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, and in all that plate! If you fall off my dock you'll sink like an anchor, so mind the loose board by the third post." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll not want fishing line, I expect, though it makes a handy bowstring in a pinch, and a handier tripwire." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want snares and line, I suppose, and maybe a hook or two in case the hills turn out stingy." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! Donald says your people fish with a spear and a prayer. I sell only one of those, but I've plenty of spears." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock buying fishing gear, now I've seen everything. You'll want the sturdy line, I'd guess, because something tells me you won't be patient with the snags." },
      },
      again = {
        { id = "h_again", text = "What else, love? The tide waits for no one, but I can." },
        { id = "h_again2", text = "Go on, ask, and I'll keep sorting hooks while you do." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "How are you and Donald related?", next = "donald" },
        { text = "Something must be biting in the bay today.", next = "fish" },
        { text = "Southshore seems tense these days.", next = "tense" },
        { text = "I'd guess the murlocs trouble the docks.", next = "murlocs", when = { questBefore = TODO_QUEST("Down the Coast") } },
        { text = "Do rogues often buy fishing line from you, Lindea?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would Donald really be disappointed in me, Lindea?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the fishermen pray before they sail, Lindea?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did knights of the Silver Hand ever come down to the docks?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have soldiers bought your line for tripwires, Lindea?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters buy fishing gear from you, Lindea?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the fishermen take too much from the bay?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I doubt many warlocks buy fishing gear from you, Lindea.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would you rather I didn't ask the fish, Lindea?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing to you.", next = "END" },
      },
    },
    donald = {
      lines = {
        { id = "d_default", text = "Oh, he told you to ask me, did he? He won't say, and I won't either, and we've had all of Southshore guessing for years. It's the cheapest entertainment in Hillsbrad, friend." },
      },
      choices = {
        { text = "Married, surely.", next = "donald_guess" },
        { text = "Your business, then. I won't pry.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    donald_guess = {
      lines = {
        { id = "dg_default", text = "That's what Bilger thinks, and Kelly thinks we're brother and sister, and the magistrate once asked me in court, which I didn't answer either. Keep guessing; it does you credit." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    fish = {
      lines = {
        { id = "f_default", text = "Mostly mackerel and a good few longjaw mud snappers in the shallows, and further out you'll land something bigger if your line holds. The fish come in close in the evenings, so that's when you'll see Donald and me out at the end of the pier." },
      },
      choices = {
        { text = "What bait works best?", next = "fish_bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_bait = {
      lines = {
        { id = "fb_default", text = "Shiny lures in the morning when the water's clear, and plain worms when it's churned up after a storm. Don't believe anyone who swears by one bait for every day; the fish never read their books." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tense = {
      lines = {
        { id = "t_default", text = "It's the Forsaken in Tarren Mill, love, just up the hill. They came out of nowhere and took the town, and now the farms in the fields are sickening and the marshal has every man who can hold a spear standing at the walls." },
      },
      choices = {
        { text = "Tarren Mill should be taken back.", next = "BACK", reply = "A lot of folk here say the same, and the Marshal hears it every night. I only hope it's somebody else's son who goes to take it.", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Fighting over a hill won't heal those farms.", next = "BACK", reply = "That's what I keep thinking, and nobody wants to hear it. Swords don't plant crops, and the farmers need help more than glory.", fx = { align = { order = -1 } } },
        { text = "It must have hurt your trade.", next = "tense_trade" },
      },
    },
    tense_trade = {
      lines = {
        { id = "tt_default", text = "Not as much as you'd think, because frightened people still have to eat, and fish don't care who holds the hill. The soldiers buy more than you'd guess, too; there's nothing like a long watch to make a man want to sit on a pier." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    murlocs = {
      lines = {
        { id = "m_default", text = "The Torn Fin have come up the strand to the west and chased the fishermen off their own nets. Lieutenant Farren's meant to be dealing with it, but he spends more time at the inn than on the beach, so someone else might have to." },
      },
      choices = {
        { text = "I'll go and see to it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born in Southshore and I've never wanted to leave. There's no fish in Stormwind half as good as ours." } },
    advice = { { id = "tp_ad", text = "Keep your line dry when you're not using it, love, and it'll keep you fed for years." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got hooks that'll catch anything, and line that'll hold a shark, so the sailors say. I'd sell them here, if I could get them up the coast." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill don't fish, which is a pity, since they've got all the patience in the world for it. Donald says I shouldn't joke about them, and I tell him I'm not joking." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet sends hooks up the coast now and then, and they rust in a week, because that's goblin goods for you." } },
    _none = { { id = "tp_none", text = "That's not something they talk about on the docks, dear. Ask the loremaster; he knows all sorts." } },
  },
}

P:NPC {
  key = "nandar", id = TODO_NPC("Nandar Branson"), name = "Nandar Branson",
  title = "Alchemy Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "earnest" }, values = { "careful", "kind" },
  notices = { "craft", "race" },

  impression = {
    first = "Nandar Branson sells vials and reagents in Southshore and worries aloud about what the Forsaken are brewing up the hill. He seemed like a man who reads every label twice and still doesn't sleep.",
    third = "{name} met Nandar Branson, who sells alchemy supplies in Southshore.",
  },

  greetings = {
    { id = "g_shop", text = "Vials, reagents and the odd tincture, all properly labelled. Do come in, but mind the glass." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again, good. I was hoping for a customer who knows what they're buying." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist, or at least a picker, I can see the green on your fingers. Hillsbrad's a good place for herbs, friend, as long as you know which fields to stay out of." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Light above, one of them, here! Please, I don't want any trouble, and I've nothing in this shop worth stealing for your apothecaries." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A plague, I think, a new one worse than the last, and every barrel that rolls past Southshore on its way up that hill makes me read my labels twice. If you ever ask the earth what's buried under Tarren Mill, I'd rather you didn't tell me the answer before bed." } },
      choices = {
        { text = "Then it must be stopped before it leaves that hill.", next = "BACK", reply = "Stopped, aye, and soon, and by somebody braver than me. I'll keep my labels straight and my antidotes ready for whoever goes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them brew. A plague can be turned on its makers.", next = "BACK", reply = "Turned on its makers? You make it sound easy, friend, and I've seen what plague does to the hands that carry it. Be careful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Freely? Never, for the hills are full of ogres and Syndicate. If you mean whether we should pick everything we find, I've seen fields of briarthorn stripped bare in a season, and they never came back." } },
      choices = {
        { text = "Leave the roots and take only some. That's the way.", next = "BACK", reply = "That's the only way I know to keep the briarthorn coming back. I'll pay a little more for herbs picked that way, and gladly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whoever picks first earns it. That's how trade works.", next = "BACK", reply = "Then the hills will be bare in five years, and we'll all be trading in empty sacks. I hope you'll pick carefully, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "None that I can promise, though I've a draught that helps against the common poisons and buys time against the worse ones. I read every label twice and still lie awake wondering whether it's enough." } },
      choices = {
        { text = "I'll trust your draught and the Light. Both will see me through.", next = "BACK", reply = "I hope they do, both of them, because I lie awake over every vial I sell. Come back and tell me how it went, if you can.", fx = { align = { light = 1 } } },
        { text = "Antidotes are guesswork. I'll trust my blade and nothing else.", next = "BACK", reply = "Then take one anyway, friend, and keep it in your boot. Even a good blade won't help once the poison's in your blood.", fx = { align = { light = -1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The ones running down from Tarren Mill, by the smell, and the ones near the Hillsbrad farms, by the dead fish. A gatherer brought me a bundle from the lower banks last month, and I burned the lot, because I'll not sell anything that might have drunk the plague." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Don't let {pet} drink from those streams, please, because a beast can't read a warning, and I'd hate to dig a grave that size." },
      },
      choices = {
        { text = "Better burned than risked. You were right to be careful.", next = "BACK", reply = "Thank you; it was a hard thing to do, with herbs as dear as they are. I'd still rather lose the bundle than a customer.", fx = { align = { order = 1 } } },
        { text = "You burned good herbs on a guess. That's waste.", next = "BACK", reply = "Perhaps it was waste, but I'll take a wasted bundle over a poisoned soldier. You'd do the same if you'd seen what I've seen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the Syndicate holds most of the hills, the ogres hold the rest, and the Forsaken have been poisoning the springs. I pay a premium for anything a gatherer manages to bring down alive, and they don't always come back." } },
      choices = {
        { text = "Then I'll gather what I need myself. Easier on everyone.", next = "BACK", reply = "You'd save me a fortune, and I'd buy what you can spare. Stay clear of the springs near the Mill, though.", fx = { align = { order = -1 } } },
        { text = "The Syndicate must be driven out of the hills. I'll help.", next = "BACK", reply = "Would you? Every gatherer in Southshore would bless your name, and so would I. Mind the ogres while you're up there.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Candles and chalk and a few herbs that go into the less unpleasant rituals, but nothing more. I've watched what the apothecaries up the hill brew in their cauldrons, and I'll not have Southshore's name on anything that goes into a summoning." } },
      choices = {
        { text = "Then I'll buy my reagents from someone less fussy.", next = "BACK", reply = "I'll not stop you, friend, though I'd ask you not to tell me where. Some things I'd rather not know about.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your fear is foolish. Reagents are just tools.", next = "BACK", reply = "Tools, perhaps, but I've seen what they're used for. I'll stay a foolish apothecary and keep my conscience clean.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Empty vials are only glass, and I tell myself that every time I wrap one. What frightens me isn't a rogue with a vial, it's the apothecaries at Tarren Mill with whole cauldrons of the stuff, and none of them ever came in to buy anything from me." } },
      choices = {
        { text = "A blade's poison harms one. A cauldron harms everyone. You're right.", next = "BACK", reply = "Glad someone sees it. I'll keep wrapping my vials and keep my eye on the hill.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Poison is poison, Nandar, whoever pours it.", next = "BACK", reply = "You're right, I suppose, and it's a hard thing to hear. I sell to soldiers and I tell myself it's different, and some days I believe it.", fx = { align = { light = -1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I don't suppose the spirits can tell you what the Forsaken are mixing up at Tarren Mill, {class}, because I've been reading the wind for weeks and it only smells of rot." },
        { id = "h_default", key = true,
          text = "Nandar Branson, alchemy supplies. I keep the vials clean and the reagents dry, and I try not to think too much about what the apothecaries in Tarren Mill are mixing up there in their cauldrons." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want reagents for your spells, and I'll warn you that the good ones come from the Alterac hills, which means they're expensive and hard won." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll want soul shards, I suppose, and I'll tell you now that I don't sell them, and I'd rather not know where you get them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be one of those who goes up toward Tarren Mill, then, and I'd beg you to carry an antidote, because what they're brewing up there won't care how thick your armour is." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're out in the hills, I'd pay well for herbs from the higher slopes, so long as you pick them above the streams the Forsaken have been fouling." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a night elf one! I've a hundred questions about herbs and no one to ask, so do forgive me if I follow you around." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want the poison vials, I suppose, and the clean ones, and I'll sell you those, but please don't tell me what goes in them, because I sleep badly enough already." },
      },
      again = {
        { id = "h_again", text = "Yes? Is there something else, friend?" },
        { id = "h_again2", text = "Ask what you like. I'm only sorting stock, and it calms the nerves." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "They're mixing something foul in Tarren Mill.", next = "tarren" },
        { text = "What herbs grow in Hillsbrad?", next = "herbs" },
        { text = "A town like this must go through a lot of potions.", next = "buyers" },
        { text = "The Light could help those sick farms.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Why are reagents from Alterac so hard to come by, Nandar?", next = "xmage", when = { class = "MAGE" } },
        { text = "What reagents do you sell to warlocks, Nandar?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What antidote would protect me from the Forsaken, Nandar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which streams have the Forsaken fouled, Nandar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should herbs be gathered freely in the hills?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You seem to sell poison vials to anyone who asks, Nandar.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do you think they're brewing up there, Nandar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    tarren = {
      lines = {
        { id = "t_default", text = "Plague, friend, or something near enough that it makes no difference. The farmers in Hillsbrad Fields have seen the undead out among the crops at night, and now their livestock are sickening, and their families after them." },
      },
      choices = {
        { text = "Have you seen it yourself?", next = "tarren_seen" },
        { text = "Then someone has to stop them.", next = "BACK", reply = "Aye, someone does, and I'd sleep better knowing it was someone like you. Come back to me for antidotes before you go.", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "That's the farmers' trouble, not mine.", next = "BACK", reply = "It's everyone's trouble, friend, the minute it reaches the wells. You'll find that out if you drink downstream.", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
    tarren_seen = {
      lines = {
        { id = "ts_default", text = "A farmer brought me a sick calf's blood in a jar and asked what it was, and I couldn't tell him, and I've studied alchemy for twenty years. Whatever they're making up there, it isn't anything a living alchemist would recognize." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    herbs = {
      lines = {
        { id = "h_herbs", text = "Briarthorn and Bruiseweed along the roads, Wild Steelbloom up near the mountains, and Kingsblood if you're lucky. Stay out of the fields round the Hillsbrad farms, though, because I wouldn't trust anything growing in that soil now." },
      },
      choices = {
        { text = "Why not the farms?", next = "herbs_farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_farms = {
      lines = {
        { id = "hf_default", text = "Because whatever's making the cattle sick is in the ground or the water, and herbs drink both. I've thrown out two batches already that came from there, and one of them was black at the root." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The marshal's men, mostly, because they buy healing draughts by the crate before every patrol to Alterac. And the mages from Dalaran who pass through, though they turn their noses up at everything and buy it anyway." },
      },
      choices = {
        { text = "I didn't know Dalaran's mages came this way.", next = "buyers_dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_dalaran = {
      lines = {
        { id = "bd_default", text = "Now and again, friend, from the camps around their city up north. They've only lately opened the gates, but some still come down for supplies, and they always want the finest crystal vials, which of course I keep for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Bless you for saying it, friend. Prayer and potions together might do what neither can alone, and the farmers would take any help at all, so go and see them in the fields if you can bear it." },
      },
      choices = {
        { text = "I'll go to the farms.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied under an alchemist in Lordaeron, before the plague, and came south when the north went bad. I didn't think it would follow me here." } },
    advice = { { id = "tp_ad", text = "Never drink anything you didn't see bottled, friend. Not in Hillsbrad, not anymore." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are brewing something up the hill, and I'd give a great deal to know what. Every vial I sell is a vial that might save someone from it." } },
    scourge = { { id = "tp_scourge", text = "The plague came from somewhere, and someone brewed it, and I think about that every day. I read every label twice, and I still can't sleep." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a mage of Dalaran before he turned necromancer, and he brewed the plague himself, or so the tales say. I read everything I can find on him, and it never helps me sleep." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, I wouldn't know. I keep to my shelves and my labels." } },
  },
}

P:NPC {
  key = "micha", id = TODO_NPC("Micha Yance"), name = "Micha Yance",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "brisk", "friendly" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Micha Yance keeps Southshore's crafters in thread, flux and dye, and knows what everyone in town is working on. Talking to Micha felt like hearing the town's business told through what it buys.",
    third = "{name} met Micha Yance, who sells trade supplies in Southshore.",
  },

  greetings = {
    { id = "g_shop", text = "Thread, flux, salt and dye for whatever you're making. Have a look round." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again! What are you making this time?" },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Engineering" } },
      text = "A crafter, I can always tell by the calluses, and Southshore always needs more of you. Most of my customers are soldiers patching their own boots, and badly." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not a thing until today, and some of the town says I shouldn't, because they remember orc totems from the war. I told them coin is coin and wood is wood, and a dwarf's money spends as well as anyone's." } },
      choices = {
        { text = "Old fears aren't foolish, Micha. Listen to the town.", next = "BACK", reply = "They're not foolish, no, and I lost an uncle to that war myself. Still, a totem never burned a farm, and I'll think on it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Coin is coin. Don't let the town tell you otherwise.", next = "BACK", reply = "That's what I said! And a dwarf's money spends the same as a man's, as the Wildhammer remind me every time they come through.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the hills, mostly, and from the hunters who bring in the deer and the bears. There are fewer of both these days, and the price is going up, which is good for me and bad for everyone else." } },
      choices = {
        { text = "Then hunt fewer. The hills need their beasts.", next = "BACK", reply = "Fewer hunters means fewer hides, and fewer hides means a hungry trader, but I see what you mean. Maybe I'll pay more and buy less.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "People need leather. The hunters should take what they need.", next = "BACK", reply = "That's what I say, and so do the soldiers who need the jerkins. The hills have been giving for a long time; they'll keep giving.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The careful ones do, and the rest wait until something falls off in the middle of a fight. Kundric swears a lost buckle once decided a battle in these hills, and I don't believe him, but I've sold more buckles since he started telling it." } },
      choices = {
        { text = "Mend your gear every night. Discipline keeps you alive.", next = "BACK", reply = "Kundric would agree with you, and he'd tell you about the buckle for an hour. I sell needle and thread right here, if you want them.", fx = { align = { order = 1 } } },
        { text = "Gear breaks. A good fighter adapts and keeps swinging.", next = "BACK", reply = "That's what they all say until it's their strap that snaps. Still, you've the look of someone who'd keep swinging regardless.", fx = { align = { order = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bear and lion, mostly, since the soldiers want sturdy jerkins and the farmers want gloves that won't tear on a fence. I keep a list of who's waiting on what, and it's longer than the Magistrate's list of Syndicate camps." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a lovely coat, and before you glare at me, I only mean someone's clearly been brushing it. I'd never sell a hunter's companion, I promise." },
      },
      choices = {
        { text = "I'll take only what the crafters need. Waste is a sin.", next = "BACK", reply = "You're the kind of hunter I like to deal with. Bring me what you can and I'll see it goes to the right hands.", fx = { align = { light = 1 } } },
        { text = "Every hide is coin. I'll skin whatever I find.", next = "BACK", reply = "Every hide's coin to me too, but I'll want them clean. Bring me a mangled one and you'll get a mangled price.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hardly any since the Silver Hand broke, and I used to sell more buckles and polish than anything else on the cart. Now it's mostly Stormwind soldiers passing through, and they don't keep their kit half so well." } },
      choices = {
        { text = "The order's discipline deserves remembering.", next = "BACK", reply = "It does, and I miss them, buckles and all. They were the tidiest customers I ever had.", fx = { align = { order = 1 } } },
        { text = "Polish never won a war. The soldiers fight just as well.", next = "BACK", reply = "Maybe not, but it won a good many sales for me. I'll stock less of it, then, and more rope.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The soldiers up north at Chillwind Camp, mostly, and the order grows every month, which tells you all you need to know about how the fighting goes. I pack it myself and I try not to think about it, though I don't always manage." } },
      choices = {
        { text = "Every shroud is a soul given proper rest.", next = "BACK", reply = "I like to think so, and I pack each one carefully. It's little enough to do for them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to send more blades and fewer shrouds.", next = "BACK", reply = "I'd send blades if I had them, but I'm a trader in cloth, and shrouds are what they order. I wish it were otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every week, from people who say they've lost their keys, and I tell every one of them to see the Magistrate. Southshore's a small town, and if a lock gets picked, everyone knows who bought the tools." } },
      choices = {
        { text = "You're right. A small town needs honest traders.", next = "BACK", reply = "It does, and I've seen what happens when trust breaks in a place like this. I'll keep sending them to the Magistrate.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A lockpick is just a tool. You could sell it honestly.", next = "BACK", reply = "Honestly to whom, though? I'll leave that to the dwarves, and keep my good name.", fx = { align = { order = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Enough that I keep a shelf of purple dye just for the ones who came down from Dalaran. They're particular about the shade, and I've learned to stock three kinds of violet, which is more than any town this size should need." } },
      choices = {
        { text = "The violet matters. It's a sign of who we are.", next = "BACK", reply = "It does to them, I'll grant you, and they'd walk out the door if I sold them the wrong shade. I'll keep all three in stock.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dalaran's colors are a vanity. Any cloth will do.", next = "BACK", reply = "Don't tell them that, or they'll take their business to Menethil. I make more from that shelf than from anything else.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Runecloth and silk, mostly, for robes, and dyes so dark I've had to send to Menethil for them twice. Nobody in Southshore asks what the robes are for, and I don't either, since a sale's a sale and the cart from Menethil doesn't run on curiosity." } },
      choices = {
        { text = "Honest robes for honest coin. I've nothing to hide.", next = "BACK", reply = "Then you'll be my favourite sort of customer. Pay in silver and nobody here will ask a thing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Best not to ask, Micha. Keep it that way.", next = "BACK", reply = "I'd planned to, friend. What folk wear in the privacy of their own homes is none of a trader's business.", fx = { align = { honor = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! If you're carving totems, {class}, I've good chisels and better varnish, and I'll not ask what the spirits think of either." },
        { id = "h_default", key = true,
          text = "Micha Yance, trade supplies. If you're stitching, tanning, smithing or tinkering, I've got the bits you need, and if I don't, it's on the next cart from Menethil." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want leather, thread and maybe a lockpick or two, though I'll say I only sell the first two, and I'd prefer you didn't ask about the third." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want silk thread and maybe a little dye, since I've noticed your robes need patching after a few weeks in the hills." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You'll be wanting linen, I expect, because the camp up in the Plaguelands buys it by the bolt for bandages and shrouds, and I can never keep enough of it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want oil and polish for that plate, I'd wager, because the damp in Hillsbrad will rust a buckle overnight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want leather strips and heavy thread for those straps, I'd guess, since every soldier who comes back from the fields has something torn." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Bring me good hides from the hills and I'll find a crafter who needs them, since half of Southshore's leatherworkers are short on everything but complaints." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid. Do your people use thread and leather, or do you just grow your clothes on trees? I'm only partly joking." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I sell to every trade that walks in, but I'll say now that I've no use for anything that whispers, so if you're selling, I'm not buying." },
      },
      again = {
        { id = "h_again", text = "Ask on; I've a cart to unload, but my tongue works fine while I do." },
        { id = "h_again2", text = "Anything else you need? Mind the left wheel, for it's squealed since Hillsbrad and the mule hates it more than I do." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "I'd guess the soldiers keep you in business.", next = "sells" },
        { text = "Your carts must have a hard road to get here.", next = "carts" },
        { text = "I'm a tailor. Where's the good cloth?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Has anyone asked you for lockpicks before, Micha?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do many mages buy cloth and dye in Southshore, Micha?", next = "xmage", when = { class = "MAGE" } },
        { text = "Shrouds by the bolt? Who orders them, Micha?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you outfit many knights these days, Micha?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The soldiers here must mend their own gear, Micha.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What hides do Southshore's crafters need most, Micha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Where does Southshore's leather come from, Micha?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does a warlock buy from a trade supplier, Micha?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I doubt Southshore sells much to shamans, Micha.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "That's all.", next = "END" },
      },
    },
    sells = {
      lines = {
        { id = "s_default", text = "Heavy thread and leather patches for the soldiers, because they wear through everything on the walls. The fishermen buy salt by the barrel, and the mages passing through buy fine thread and complain about the price." },
      },
      choices = {
        { text = "The soldiers keep you busy, then.", next = "sells_soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_soldiers = {
      lines = {
        { id = "ss_default", text = "Busier than I'd like, because it means there's fighting. Every time the marshal sends a patrol up toward Tarren Mill or into Alterac, they come back in rags, and I'd trade it all for a quiet year." },
      },
      choices = {
        { text = "So would I.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts = {
      lines = {
        { id = "c_default", text = "Up over the Thandol Span and west across Arathi, with a guard or two if I can afford them. The road through the hills is the danger, because the Syndicate watch it from Durnholde, and they love a merchant's cart." },
      },
      choices = {
        { text = "The Syndicate?", next = "carts_syndicate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts_syndicate = {
      lines = {
        { id = "cs_default", text = "Alterac's old nobility and the thieves who work for them, holed up in the old keep. They call it reclaiming their lands, and everyone else calls it banditry, and I call it a tax I never voted for." },
      },
      choices = {
        { text = "They're no better than bandits.", next = "BACK", reply = "That's what Southshore says too, and they're none of them wrong. I just wish the bandits would stop robbing my carts.", fx = { align = { order = 1 } } },
        { text = "Maybe they have a claim, after what Alterac lost.", next = "BACK", reply = "A claim, maybe, but they sold their kingdom to the orcs, and that's a hard thing to forgive. Not that they'd ask me.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = {
        { id = "k_default", text = "Not from the farms anymore, friend, because nobody will touch Hillsbrad wool since the sickness came to the fields. I've linen and wool off the Menethil carts instead, and the soldiers' old uniforms if you're not proud." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I took over the shop when the last keeper went north and never came back. I've done my best to keep it running ever since." } },
    advice = { { id = "tp_ad", text = "Buy your thread before a battle, not after. Afterwards, everyone needs it." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill don't buy thread or dye, so I've no idea what they're working on. I wish I did, and I'm glad I don't." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire buys dye by the barrel for its banners, and I sold them a cartload once. They paid in Darkmoon tickets, and I've still got most of them." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys fine silk from the south, and I'd love to see it. Pirates dress better than you'd think, I'm told." } },
    _none = { { id = "tp_none", text = "Not my trade, friend. Ask Loremaster Dibbs; he'll tell you more than you wanted to know." } },
  },
}

P:NPC {
  key = "zixil", id = TODO_NPC("Zixil"), name = "Zixil",
  title = "Merchant Supplier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore", "tarren_mill" }, temper = { "breezy", "sly" }, values = { "greedy", "practical" },
  notices = { "purse", "race" },

  impression = {
    first = "Zixil peddles odd goods along the road between Southshore and Tarren Mill, guarded by a pair of clanking robots. The goblin sells to both sides of the war and finds the whole arrangement very funny.",
    third = "{name} met Zixil, the goblin peddler who walks the road between Southshore and Tarren Mill.",
  },

  greetings = {
    { id = "g_road", text = "Ho there, customer, step right up! Don't mind the robots, buddy; they only shoot people who don't pay, and hardly ever the ones who do." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer, back again! Well, one of my favourites, 'cause I got a few, and I keep 'em all in the ledger by how much they spend." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now there's a purse that jingles in all the right places! Step this way, friend, and let me show you the good stock, the stuff I don't show the soldiers 'cause soldiers haggle." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Go on, have a look at the Overwatch units, buddy, I know you're itchin' to. Don't open the panels, though, 'cause they bite, and the last fella who tried is still payin' for his eyebrows." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Southshore buys my lamp oil, Tarren Mill buys my rope, and Dun Garok buys whatever's shiny, so yes, customer, and gladly, 'cause a war with two sides is twice the market. I don't see why a dwarf who talks to the wind should mind, either, since the wind blows on both towns the same." } },
      choices = {
        { text = "The Alliance should hold these hills, and you should pick a side.", next = "BACK", reply = "Pick a side? Sweetheart, picking sides is how you end up with half the customers and twice the overhead. I'll stay neutral and solvent.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sides are for people who can't count coin.", next = "BACK", reply = "Now there's a customer after my own heart! You ever want a job keepin' my books, you come see Zixil.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only what's lyin' about and nobody's usin', buddy, like fallen branches, dropped arrows and the odd lost boot, and every one of 'em's pure profit. I'm a merchant, not a logger, and I'd never cut down a tree when there's one already lyin' on the ground." } },
      choices = {
        { text = "The dead don't need their boots. Scavenge away.", next = "BACK", reply = "That's what I tell the guards every time, pal. Boots don't care who wore 'em, and the profit margin on a free boot is fantastic.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Even fallen wood feeds the forest. Leave it be.", next = "BACK", reply = "Feeds the forest, huh? The forest ain't payin' me, buddy, but I'll leave a few sticks for it, outta professional courtesy.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whetstones, rivets, and a little somethin' to stop the shakes after a long fight, and I sell the same to both towns, which keeps the prices honest, or at least even. Tarren Mill buys the heavy stuff and Southshore buys the cheap stuff, and I'll let you guess who's winnin'." } },
      choices = {
        { text = "Selling arms to both sides is no better than treason.", next = "BACK", reply = "Treason, says you, but treason needs a crown, and I don't owe nobody a crown. I owe the Cartel a percentage, and I pay it on time.", fx = { align = { honor = 1 } } },
        { text = "Smart business. War's good for anyone with a wagon.", next = "BACK", reply = "Finally, someone who understands economics! War's a terrible thing, kid, and it keeps me in rivets all year round.", fx = { align = { honor = -1 } } },
        { text = "Something else, Zixil.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scare it? They chase it, pal, and then they walk into trees, which is how I lost a perfectly good Overwatch unit to a bear last spring, and those units ain't cheap. The bear's fine, in case you're wonderin', and it's still got one of my gears." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the robots, will ya, buddy, 'cause they got a thing about anything with fur, and I'm still payin' off the last one." },
      },
      choices = {
        { text = "Your machines should stay on the road where they belong.", next = "BACK", reply = "Where they belong is wherever I tell 'em, but I take your point, and I've been lookin' at better legs. Expensive legs.", fx = { align = { order = 1 } } },
        { text = "Let them roam. A little chaos keeps the road interesting.", next = "BACK", reply = "A little chaos, he says! That bear cost me fifty gold in parts, pal, and you can come pay the invoice if you like it so much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell wares to customers, pal, and the customers decide what's a weapon. Tarren Mill buys rope and lamp oil, Southshore buys rope and lamp oil, and what either side does with it is a moral question for folk in better armour and worse ledgers than mine." } },
      choices = {
        { text = "Arming the Forsaken makes you part of their war.", next = "BACK", reply = "Their war, my wagon, and the only thing I'm part of is the Cartel. You'd be surprised how many paladins buy rope from me too.", fx = { align = { honor = 1 } } },
        { text = "Rope's rope. A merchant can't answer for every buyer.", next = "BACK", reply = "Exactly what I tell the Marshal every week, buddy. A rope's only a weapon if somebody's on the other end of it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest in Southshore, technically, 'cause I left a sack of it outside the chapel durin' a service and nobody can prove the blessin' didn't reach it, which is good enough to print on the label. Tarren Mill won't buy it, of course, since the Forsaken don't care for holy anything, so you're my only market, customer." } },
      choices = {
        { text = "Selling false blessings is a sin, Zixil.", next = "BACK", reply = "A sin? Bah, the customers are happy, the priest's none the wiser, and the Light ain't sent me a bill yet. I'll call that a blessing.", fx = { align = { light = 1 } } },
        { text = "Folk find comfort either way, and I see no harm in it.", next = "BACK", reply = "That's what I keep sayin', pal! Comfort's a product like any other, and I've got a whole sack of it out back.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A few scrolls, a lantern that might've been enchanted, and a box of somethin' I bought cheap off a fella from Dalaran who was in a real hurry. I don't ask what my customers do with things, and you shouldn't ask what Southshore does with 'em either, 'cause that's how I stay in business." } },
      choices = {
        { text = "Arming our enemies is shameful, Zixil.", next = "BACK", reply = "Shameful, maybe, but profitable, which outweighs shame on any ledger I ever kept. I'll mark your complaint down in the margin.", fx = { align = { honor = 1 } } },
        { text = "Sell them the duds at full price, then.", next = "BACK", reply = "Ha! Now that's a business plan, kid, and I like the way you think. The box goes on sale tomorrow, no returns.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, they ain't put in an order yet, and I'd sell to 'em too, at a fair markup plus spirit handlin'. Southshore buys my lamp oil and Tarren Mill buys my rope, and the hills don't seem to mind either one, so I don't see why I should." } },
      choices = {
        { text = "The Horde should win here, and you should pick a side.", next = "BACK", reply = "Pick a side and lose half my customers? Not on my mother's ledger, pal, but I'll sell you a Horde banner at cost plus margin.", fx = { align = { order = 1 } } },
        { text = "Smart goblin. Sides are for people who can't do arithmetic.", next = "BACK", reply = "You and me, chum, we oughta go into business together. I'll do the selling and you can do the arithmetic.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Of course, pal, 'cause gold don't care which side of the war it's on, and neither do I. The Overwatch units keep the road safe enough, and both towns pay me to keep their secrets, which is the best kind of business there is, since you get paid twice for doin' nothin'." } },
      choices = {
        { text = "Selling to both sides is smart. Gold is gold.", next = "BACK", reply = "That's the spirit! Both towns pay, I take my cut, and everybody's happy, more or less.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Playing both sides will catch up with you someday.", next = "BACK", reply = "Maybe it will, kid, and when it does I'll have a fast wagon and a full purse. That's what the profits are for.", fx = { align = { honor = 1 } } },
        { text = "Something else, Zixil.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It climbed inside lookin' for somethin' shiny and set fire to the wiring, and the robot walked straight into Lordamere Lake smokin' like a chimney before I could stop it. I fished it out the next mornin', and it still clanks funny, so imps are banned from the stall, by sparks and sprockets they are." } },
      choices = {
        { text = "I'll keep my imp away from your robots.", next = "BACK", reply = "Good, 'cause I'm still payin' off the last one, and the lake's charging me interest. Keep that little fella on a short leash.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps go where they want. Build better robots.", next = "BACK", reply = "Better robots cost money, buddy, and somebody's imp already sank the budget. You wanna fund the next prototype, you come see me.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! I don't sell totems, before you ask, 'cause carved wood weighs a ton, the margins are lousy and the Overwatch units won't carry anything that might get struck by lightning." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, and a customer, I hope! Holy water, unholy water, plain water with a nice label on it, I don't judge, buddy, I just price." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage! You can conjure your own bread and water, which is murder on my business, so I hope you've come for somethin' you can't make out of thin air." },
        { id = "h_default", key = true,
          text = "Zixil, merchant supplier to the hills! I walk from Southshore to Tarren Mill and back again sellin' a little of this and a little of that, and the two Overwatch units keep the road very polite and the customers very prompt with payment." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Zixil, merchant supplier to the hills, and yes, I was in Southshore an hour ago, and no, I won't tell you what they're up to, buddy. A goblin who carries tales doesn't carry goods for long." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now there's a customer who appreciates a good deal and a quiet exchange, pal, and I got both, if you know what to ask for and how much to bring." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I got a few things that might interest you, pal, though I'll ask you not to let the imp near my robots, 'cause one shorted out last month and the repair bill nearly sank me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest from the Southshore side! I got holy candles, blessed salt and a very convincin' reliquary, and I'll swear on my robots that the salt is blessed." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I've had knights try to arrest me before, buddy, so let's get it out of the way: everything I sell is legal in at least one of the two towns I sell it in." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, pal! You look like you break a lot of things, and I sell a lot of things to replace 'em, so I think we're gonna be real good friends." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You got the look of somebody who needs ammo, and I got the look of somebody who sells it, so let's skip the hagglin' and go straight to the payin'." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You walk the road between the hills too, I bet, so you know how lonely it gets out there, buddy, and lonely roads mean nobody undercuttin' my prices." },
      },
      again = {
        { id = "h_again", text = "What else, customer? Talk while you walk, 'cause I got a schedule and the schedule's got a schedule." },
        { id = "h_again2", text = "Anything else, buddy? The robots are gettin' bored, and a bored robot is how my last cart caught fire." },
      },
      choices = {
        { text = "Do the spirits care who wins in Hillsbrad, Zixil?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Ever sold anything magical to Southshore, Zixil?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me what you're carrying.", next = "BUSINESS" },
        { text = "So you trade with both towns.", next = "both" },
        { text = "Tell me about your robots.", next = "robots" },
        { text = "Your wares look like a bit of everything.", next = "goods" },
        { text = "A gnome machine seems an odd guard for a goblin.", next = "gnome", when = { race = "Gnome" } },
        { text = "Do you really sell to both Southshore and Tarren Mill, Zixil?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How did an imp short out your robot, Zixil?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who blessed your salt, Zixil?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you sell weapons to the Forsaken, Zixil?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does a goblin sell a warrior, Zixil?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your robots must scare off all the game, Zixil.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you take anything from the land you walk, Zixil?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Would you really sell to both sides of this war, Zixil?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Safe travels.", next = "END" },
      },
    },
    both = {
      lines = {
        { id = "b_default", text = "Course I do! Southshore buys from me, Tarren Mill buys from me, and both of 'em pretend the other doesn't, so I charge 'em both for the pretendin'. Gold's the same colour on either end of the road, and that's the only side I'm on." },
      },
      choices = {
        { text = "That makes you a traitor to both, by my count.", next = "both_traitor" },
        { text = "Smart business.", next = "BACK", fx = { trait = { greedy = 1 }, affinity = 1 } },
      },
    },
    both_traitor = {
      lines = {
        { id = "bt_default", text = "A traitor has to belong to somebody first, friend, and I belong to the Cartel and my ledger, in that order on a good day. Neither town's ever asked me to choose, 'cause then they'd both have to walk to Booty Bay for their goods." },
      },
      choices = {
        { text = "Neutral's neutral. Your coin spends like anyone's.", next = "BACK", reply = "There you go, a customer who gets it! Neutral coin spends the same as Alliance coin, and it don't get anybody killed.", fx = { align = { honor = -1 } } },
        { text = "Sooner or later, everyone picks a side.", next = "BACK", reply = "Maybe so, pal, and when that day comes I'll be on whichever side has the best wagon outta here. Until then, the ledger's my king.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robots = {
      lines = {
        { id = "r_default", text = "Overwatch Mark I, the finest bodyguards money can rent! They don't sleep, they don't drink and they don't ask for a share, which is more than you can say for any mercenary I ever hired, and they only exploded the once." },
      },
      choices = {
        { text = "Do they ever have to fight?", next = "robots_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robots_fight = {
      lines = {
        { id = "rf_default", text = "Now and then a bear comes out of the woods, or a Syndicate type thinks he's clever, and then they fight very loudly and somethin' usually catches fire. Nobody tries it twice, buddy, and that's what I'm payin' for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goods = {
      lines = {
        { id = "g_default", text = "Whatever I picked up last, friend, and whatever folk on this road need: a recipe here, a bit of kit there, things you won't find on any shop shelf. Stock changes every trip, so if you see somethin' you like, buy it now, 'cause next week it's somebody else's bargain." },
      },
      choices = {
        { text = "That's what every merchant says.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Let me have a look.", next = "BUSINESS" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Bought 'em used, buddy, and asked no questions about where they came from, which knocks a good third off the price. Maybe your folk built the first ones; I couldn't say, but they hold their own on this road better than any guard I ever hired." },
      },
      choices = {
        { text = "They're good work, I'll admit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came north from Booty Bay with a cart and a plan, and the cart blew up outside Refuge Pointe, but the plan's workin' beautifully." } },
    advice = { { id = "tp_ad", text = "Never travel the hills alone, friend, 'cause the bears up there don't haggle, and they don't pay either." } },
    forsaken = { { id = "tp_forsaken", text = "The dead are fine customers, pal, since they never haggle about the price of food and they never ask what's in the vials. I'd sell them sunlight if I could bottle it, and believe me, I've tried." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best market in the world, friend, and I'd be there now if the overhead weren't murder. Out here my rent's nothing and my robots are paid in oil, so you do the math." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got cousins of mine on every corner, and every one of 'em owes me money. Tell 'em Zixil says hello, and that the interest's still running." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's orcs buy good, and they pay in gold, which is all I ask of any warchief. Southshore's lot pay in gold too, so I don't see what the fuss is about." } },
    _none = { { id = "tp_none", text = "Don't know it, can't sell it, so I ain't interested. Next question, customer, and make it a profitable one!" } },
  },
}
