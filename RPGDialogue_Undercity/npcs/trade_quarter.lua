-- The Trade Quarter and its edges: Jeremiah Payson the cockroach vendor, Alessandro Luca's odd goods,
-- Ophelia Montague at the bank, and the craft teachers and suppliers: Graham Van Talen and Franklin Lloyd (engineering),
-- Arthur Moore (leatherworking), Bowen Brisboise (tailoring). Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jeremiah Payson: the cockroach vendor, once Jeremiah Felstone. Rude, ashamed, and attached to his roaches.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_payson", id = TODO_NPC("Jeremiah Payson"), name = "Jeremiah Payson", title = "Cockroach Vendor",
  bible = "bibles/uc_payson.md", role = "vendor", tier = "quest",
  communities = { "undercity" }, temper = { "surly", "nervous" }, values = { "practical" },
  notices = { "race", "purse" },
  impression = {
    first = "Jeremiah Payson sells cockroaches under a walkway by the bank and treats every customer as an intrusion. Under the rudeness there's a man who would very much prefer not to be asked who he used to be.",
    third = "{name} met Jeremiah Payson, the Undercity's cockroach vendor, who was once Jeremiah Felstone.",
  },

  greetings = {
    { id = "g_default", text = "What? You want a roach or not? I haven't got all night, and neither have they." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last roach die? They don't, usually; they're tougher than you." },
    { id = "g_blues", when = { questActive = TODO_QUEST("The Jeremiah Blues") }, text = "Who sent you? Bauhaus? That census-counting busybody needs to keep my old name out of his mouth." },
    { id = "g_charm", when = { questActive = TODO_QUEST("Good Luck Charm") }, text = "Did you get my good luck charm back from Janice's farm yet? Then why are you standing here looking at me?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Don't eat them. I've had trolls ask, and I've had a tauren look at them funny, and they're not for eating." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You haven't even got the price of a roach on you, have you? Go on, get out of my light." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jeremiah Payson, and I sell cockroaches. Good ones, healthy ones, the kind that'll follow you about and won't bite more than twice." },
        { id = "h_blues_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Jeremiah Blues"), days = 3 } },
          text = "So my sister Janice sent a parcel, years late, and you went to the trouble of finding me. I suppose I owe you something for that, though I'd rather not think about how much." },
        { id = "h_charm_done", tags = { "news" }, when = { questDone = TODO_QUEST("Good Luck Charm") },
          text = "You saw Janice, then, out at the farm. Don't tell me how she looked. I've decided to remember her the way she was, and that's my right." },
        { id = "h_scourge", when = { race = "Scourge", ["not"] = { questDone = TODO_QUEST("The Jeremiah Blues") } },
          text = "You're dead like me, so you'll understand when I say I don't want to talk about before. Buy a roach or move along." },
      },
      again = {
        { id = "h_again", text = "What now? You're scaring off customers, and I haven't got many." },
        { id = "h_again2", text = "Still here? All right, ask your question, but quickly." },
      },
      choices = {
        { text = "Why cockroaches, of all things?", next = "roaches" },
        { text = "I can't think who would buy cockroaches.", next = "buyers" },
        { text = "You were Jeremiah Felstone, weren't you?", next = "felstone", when = { questDone = TODO_QUEST("The Jeremiah Blues") } },
        { text = "What do you need, Payson?", next = "BUSINESS" },
        { text = "I'll leave you to your roaches.", next = "END" },
      },
    },

    roaches = {
      lines = { { id = "ro_default", text = "Because they're the only thing that lived through the plague without complaining. Rats got sick, dogs went mad, birds fell out of the sky, and the roaches just carried on, and I respect that." } },
      choices = {
        { text = "You seem to see something of yourself in them.", next = "roaches_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roaches_self = {
      lines = { { id = "rs_default", text = "I see something I'd like to be, which isn't the same. Nobody asks a roach where it came from or who its family was, it just gets on with being a roach." } },
      choices = {
        { text = "And that's what you want? To be left alone?", next = "roaches_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roaches_alone = {
      big = true,
      lines = { { id = "ra_default", text = "That's what all of us want down here, if we're honest, and most of us aren't. The Dark Lady gave us our minds back, and I'd like to spend mine on something that doesn't hurt." } },
      choices = {
        { text = "The past is gone. You're right to leave it.", next = "BACK", reply = "Gone, aye, and I'm happy to let it lie. The roaches don't ask me about it, which is why I like them.", fx = { align = { light = -1 } } },
        { text = "Hiding from it won't make it hurt less.", next = "BACK", reply = "Maybe not, but it hurts less down here among the roaches. I'll go back up when I'm ready, if I'm ever ready.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Rogues, mostly, who like something small that can get into places. Some of the apothecaries buy them by the jar, which I don't ask about, and a few lonely sorts who just want something to talk to." } },
      choices = {
        { text = "So the apothecaries buy them by the jar.", next = "buyers_apoth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_apoth = {
      lines = { { id = "ba_default", text = "And they never bring the jars back. I sell, they pay, and whatever happens after that happens in the Apothecarium, which is where I like it to stay." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    felstone = {
      lines = { { id = "fe_default", text = "Keep your voice down. Yes, I was, on a farm out in the west of Lordaeron with my sister Janice, and then the plague came and I wasn't anybody for a while." } },
      choices = {
        { text = "Your sister still thinks of you.", next = "felstone_sister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felstone_sister = {
      big = true,
      lines = { { id = "fs_default", text = "I know she does, and that's what I can't stand. She sent that parcel when we were both alive, and it took four years and a stranger to reach me, and now I don't know what to do with it." } },
      choices = {
        { text = "Go and see her, Jeremiah. Before it's too late.", next = "BACK", reply = "Too late was four years ago, friend, but I'll think on it. Perhaps a letter, first, to see if she'd even want me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some doors stay shut. Let her keep her memories.", next = "BACK", reply = "Perhaps that's kindest, for both of us. She can remember her brother, and I can remember the parcel.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell roaches. That's all the background anyone needs." } },
    _none = { { id = "tp_none", text = "Do I look like I'd know? I sell roaches." } },
  },
}

---------------------------------------------------------------------------
-- Alessandro Luca: seller of odd goods, a merchant with a showman's patter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_luca", id = TODO_NPC("Alessandro Luca"), name = "Alessandro Luca", title = "Blue Moon Odds and Ends",
  gender = "male",
  bible = "bibles/uc_luca.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "smooth", "cheerful" }, values = { "greedy" },
  notices = { "purse", "race" },
  impression = {
    first = "Alessandro Luca sells odds and ends in blue in the Undercity, and he sells them like heirlooms. He has a name for every shade of blue and a grudge against the colour green, and he seems to think blue is the only cheerful thing left in Lordaeron.",
    third = "{name} met Alessandro Luca, who sells blue odds and ends in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a discerning customer! I can always tell; they look at the blue things first." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer returns! Well, one of my favourites, but you're very high on the list." },
    { id = "g_green", when = { race = "Scourge" }, text = "Welcome, welcome, and you'll forgive me for saying it, but a touch of blue would do wonders against that greenish cast of yours." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "luca_fl_no" } }, text = "Ah, a customer who makes even my midnight blue look dull! Come a little closer, my dear, because the light down here is dreadful and I'd like a better look at you." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "luca_fl_yes" }, text = "My favourite customer, and this time I mean it with all my heart, or what the apothecaries left of it. I put a scarf aside that's very nearly the colour of your eyes." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "luca_fl_no" }, text = "Ah, the customer who only comes for the shirts! Quite right, and the shirts are very glad to see you, even if I'm not allowed to say so." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You've a good weight to your purse, my friend, and I've just the thing to lighten it gracefully." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Now there is a complexion! My friend, you are wearing a finer shade of blue than anything on my table, and I'm only slightly jealous." },
  },

  start = "hello",
  nodes = {
    fl = {
      lines = { { id = "fl_default", text = "Am I? Forgive me, but I've spent all day among faded grey and canal green, and then you walk in, and suddenly I remember what a summer sky over Lordaeron looked like. I'd wrap you in Capital blue myself, if it weren't so terrible for business." } },
      choices = {
        { text = "Then I'll take the compliment, and pay full price.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "luca_fl_yes" }, clear = { "luca_fl_no" } } } },
        { text = "Your heart doesn't even beat, Luca. What's all this?", next = "fl_pulse" },
        { text = "We're both dead, Luca. Isn't this a little forward?", next = "fl_dead", when = { race = "Scourge" } },
        { text = "Admiring my blue again, Luca?", next = "fl_yes", when = { race = "Troll" }, fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "luca_fl_yes" }, clear = { "luca_fl_no" } } }, reply = "Admiring it, coveting it, and writing very bad poems about it in the stockroom, yes." },
        { text = "Kind words, but I'm only here to browse.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "luca_fl_no" }, clear = { "luca_fl_yes" } } }, reply = "Browse away, my friend, and I'll keep my poetry to the price tags." },
        { text = "Save the patter for paying customers, Luca.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "luca_fl_no", "luca_fl_rebuff" }, clear = { "luca_fl_yes" } } }, reply = "Ouch! Straight between the ribs, and I've precious few left. The patter goes back in its box." },
      },
    },
    fl_pulse = {
      lines = { { id = "flp_default", text = "It hasn't beaten since the Plague, my friend, so you can be quite sure it isn't racing now. I simply have an eye for lovely things, and I've never seen the harm in saying so out loud, since the dead have so little else to say that's pleasant." } },
      choices = {
        { text = "Then say it as often as you like.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "luca_fl_yes" }, clear = { "luca_fl_no" } } } },
        { text = "I'd rather you kept your eye on the stock.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "luca_fl_no" }, clear = { "luca_fl_yes" } } }, reply = "As you wish. The stock has never once complained about being looked at." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fl_dead = {
      lines = { { id = "fld_default", text = "Forward? My dear, we've both been buried once already, and I see no reason to waste what time we've got left on modesty. Besides, you've kept your looks far better than most of us, and that deserves celebrating in blue." } },
      choices = {
        { text = "Then I'll take that as a compliment.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "luca_fl_yes" }, clear = { "luca_fl_no" } } } },
        { text = "Let's leave the celebrating to the living, Luca.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "luca_fl_no" }, clear = { "luca_fl_yes" } } }, reply = "The living never celebrate anything properly, but as you like." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Then we have an understanding, and the best of the midnight blue will sit under my counter with your name on it. Do come by often, because a merchant needs something lovely to look at between customers, and the canal does not qualify." } },
      choices = {
        { text = "I'll be back, Luca.", next = "BACK", reply = "I'll be here, among the blue, counting the hours. Well, the minutes, mostly." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alessandro Luca, purveyor of Blue Moon odds and ends. Shirts, trinkets and small comforts, all in blue, because grey is the colour of the dead and green is the colour of the canals, and I am tired of both." },
        { id = "h_woman", when = { gender = "female" }, text = "Madam, you've an eye for colour, I can tell, and blue would suit you beautifully, whatever the state of your complexion." },
      },
      again = {
        { id = "h_again", text = "Something else catch your eye? Everything here is blue, so it's an easy choice." },
        { id = "h_again2", text = "More questions, my friend? Ask away; talk is free, though the shirts are not." },
      },
      choices = {
        { text = "Why only blue?", next = "blue" },
        { text = "Isn't blue just blue?", next = "shades" },
        { text = "I'd not have guessed many folk buy this sort of thing.", next = "buyers" },
        { text = "I'm already blue, Luca.", next = "troll", when = { race = "Troll" } },
        { text = "Some of this looks rather purple to me.", next = "purple", when = { class = "MAGE" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "You're very attentive today, Luca.", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "luca_fl_rebuff" } } },
        { text = "Good day, Luca.", next = "END" },
      },
    },
    blue = {
      lines = { { id = "bl_default", text = "The sky over Lordaeron was blue, once, on a good summer day, and we can't see it from down here. So I sell a little bit of it by the yard, and people pay surprisingly well for a reminder." } },
      choices = {
        { text = "It's a kind thing to sell, Luca.", next = "BACK", reply = "Kind, perhaps, and profitable, which is the happiest combination I know. Take a yard, and think of summer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Selling nostalgia to the dead. Clever business.", next = "BACK", reply = "Clever, yes, and I'll take that as a compliment. The dead pay for memories more readily than for bread.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shades = {
      lines = { { id = "sh_default", text = "Just blue! My friend, you wound me. There's Lordamere blue, which is grey with ambition, and Capital blue, which the old guard wore on parade, and a little midnight blue I keep under the counter for customers with real taste." } },
      choices = {
        { text = "And green? What's wrong with green?", next = "shades_green" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shades_green = {
      lines = { { id = "sg_default", text = "Green is the canals, and the apothecaries' bottles, and the plague cauldrons out in the fields, and I won't have it on my table. A customer once asked for a green scarf, and I sent him to the tailor with my compliments and my deepest sympathy." } },
      choices = {
        { text = "Then tell me, what colour suits me?", next = "shades_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shades_me = {
      lines = { { id = "sm_default", text = "Ah, now that depends on you, my friend, so let me ask you a question in return. When you think of a good sky, a sky worth remembering, what colour is it?" } },
      choices = {
        { text = "Lordaeron blue, on a summer morning.", next = "shades_blue", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Red, like the dust over Durotar.", next = "shades_red", fx = { trait = { proud = 1 } } },
        { text = "Grey. I've never trusted a cheerful sky.", next = "shades_grey", fx = { trait = { skeptical = 1 } } },
      },
    },
    shades_blue = {
      lines = { { id = "sb_default", text = "Then you and I understand each other perfectly, and you're welcome at my table whenever you like. Capital blue, I think, with a little silver at the cuff." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shades_red = {
      lines = { { id = "sr_default", text = "Red! Well, I don't sell it, but I can respect a person who knows their own sky. A deep blue sets off red beautifully, so we needn't quarrel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shades_grey = {
      lines = { { id = "sy_default", text = "A grey sky! My friend, you've lived in this city too long, or not long enough. Midnight blue, then, which is as close to gloom as I'm willing to sell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    buyers = {
      lines = { { id = "bu_default", text = "The dead who want to feel dressed, the living who want a souvenir of the Undercity, and the occasional goblin who wants to buy my whole stock and sell it in Booty Bay. I tell the goblins no, because some things are art." } },
      choices = {
        { text = "Art, Luca. They are only shirts.", next = "BACK", reply = "Only shirts, he says! You may leave, and take your colourless soul with you.", fx = { align = { honor = -1 } } },
        { text = "Good. Some things shouldn't be for sale.", next = "BACK", reply = "Exactly so, and the goblins can find their own sky to sell. Mine stays in the Undercity.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "You are, and it's the finest advertisement I've ever had, so please stand near the table for a while. If anyone asks, tell them it's my Sen'jin blue, and that it's only available in very limited quantities." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    purple = {
      lines = { { id = "pu_default", text = "Purple! That is a violet-tinged Capital blue, my friend, and the only purple in this city belongs to Dalaran, which is a pile of rubble behind a magic wall. I'll thank you not to say that word near the merchandise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, my friend, but I'll wager there's a blue version of it somewhere, and that it's nicer than the original." } },
  },
}

---------------------------------------------------------------------------
-- Ophelia Montague: banker, cool and amused.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_omontague", id = TODO_NPC("Ophelia Montague"), name = "Ophelia Montague", title = "Banker",
  bible = "bibles/uc_omontague.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "cool", "wry" }, values = { "precise", "discreet" },
  notices = { "race", "class" },
  impression = {
    first = "Ophelia Montague keeps the Undercity's vaults alongside William and answers every question about their family with a smile and nothing else. She treats a secret the way other bankers treat gold, and she seems to enjoy the mystery more than the money.",
    third = "{name} met Ophelia Montague, a banker of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. Your vault, I presume, and not my life story?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your vault hasn't moved, I promise you, although nothing else in this city stays put." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "Ah, you again. I've begun to know you by what you deposit, which is far more revealing than a face." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Do mind your horns on the vault door. The last tauren took a chip out of the lintel, and William still hasn't forgiven him." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue at the bank. You'll want to look at the locks, I expect, and I'll want to watch you looking." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ophelia Montague, of the bank. I keep the vaults with William, and before you ask, yes, we share a name, and no, I'm not going to tell you what else we share." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of ours. Half the Forsaken who come to my counter have nothing in the vault from before, and the other half have nothing else, and I never ask which you are." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a ledger that's begging to be balanced, and the dead keep dreadful accounts." },
        { id = "h_again2", text = "Go on. Whatever you ask, I'll keep it as carefully as anything in the vaults." },
      },
      choices = {
        { text = "Are you and William related?", next = "william" },
        { text = "Your vaults must hold some strange things.", next = "strange" },
        { text = "What do the dead bother to keep?", next = "keep" },
        { text = "These locks wouldn't stop me for long.", next = "locks", when = { class = "ROGUE" } },
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "Good evening, Ophelia.", next = "END" },
      },
    },
    william = {
      lines = { { id = "wi_default", text = "Everyone asks that, and William and I agreed long ago that it's more fun not to say. Brother, cousin, husband, perfect stranger, it hardly matters after a plague, does it?" } },
      choices = {
        { text = "Family should still matter, even after death.", next = "BACK", reply = "Should it? Then William would be terribly pleased with you. I'll tell him you said so.", fx = { align = { light = 1 } } },
        { text = "It doesn't. Death made us all strangers.", next = "BACK", reply = "Strangers, perhaps, but very good company. William and I have done rather well out of it.", fx = { align = { light = -1 } } },
        { text = "I'll ask William, then.", next = "william_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    william_ask = {
      lines = { { id = "wa_default", text = "Please do, and tell me what he says, because he gives a different answer every time, and I keep a list. Last month I was his aunt, which I thought was rather unkind of him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "st_default", text = "A wedding dress, folded very carefully, and nothing else in the box. The owner comes in once a month to look at it, and leaves without saying a word, and I've never once asked." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    keep = {
      lines = { { id = "ke_default", text = "Not gold, mostly, since gold is easy to come by when you don't need to eat. They keep keys to houses that burned, letters they can't bring themselves to read, and once a single child's shoe, which I'll admit I filed rather quickly." } },
      choices = {
        { text = "And what do you keep, Ophelia?", next = "keep_her" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_her = {
      lines = { { id = "kh_default", text = "My own counsel, and a good deal of other people's. But you've turned the question round very neatly, so let me turn it back: if you could keep only one thing from before, what would it be?" } },
      choices = {
        { text = "A letter from someone I loved.", next = "keep_letter", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "My blade. Memories don't keep you alive.", next = "keep_blade", fx = { trait = { stern = 1 } } },
        { text = "Nothing. I'd rather travel light.", next = "keep_nothing", fx = { trait = { skeptical = 1 } } },
        { text = "I don't remember what I had before.", next = "keep_forgot", when = { race = "Scourge" }, fx = { affinity = 1 } },
      },
    },
    keep_letter = {
      lines = { { id = "kl_default", text = "A sensible choice, and a common one. Letters weigh nothing and cost nothing to store, and they're the only deposits I've ever seen anyone weep over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep_blade = {
      lines = { { id = "kb_default", text = "Practical of you, and I'd guessed as much from the look of your deposits. Still, you'd be surprised how many soldiers keep a lock of hair behind the swords." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep_nothing = {
      lines = { { id = "kn_default", text = "Then you're a poor customer for a bank, and probably a happier person than most of mine. I'll not hold it against you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep_forgot = {
      lines = { { id = "kf_default", text = "Then you've a clean vault and a clean slate, and that's a rare thing in the Undercity. If anything ever comes back to you, bring it here, and I'll keep it safe until you're ready for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    locks = {
      lines = { { id = "lo_default", text = "I'm sure they wouldn't, and that's why the locks aren't what keeps the vaults. The Dark Lady's Deathstalkers know every name on my ledger, and none of them has a sense of humour about it." } },
      choices = {
        { text = "Then I'll keep my hands where you can see them.", next = "BACK", reply = "Wise, very wise, and they'll be glad of the exercise if you don't. Shall we discuss your account?", fx = { align = { order = 1 } } },
        { text = "Every vault has a weakness, Ophelia. Even yours.", next = "BACK", reply = "Every vault does, darling, and mine is that the Deathstalkers find you first. Do try it, I could use the entertainment.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a thing I keep in the vaults, and so not a thing I know. If I did know, of course, I wouldn't tell you." } },
  },
}

---------------------------------------------------------------------------
-- Graham Van Talen: engineering trainer, a Forsaken who loves explosives a little too much.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_vantalen", id = TODO_NPC("Graham Van Talen"), name = "Graham Van Talen", title = "Engineering Trainer",
  bible = "bibles/uc_vantalen.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "eager", "scattered" }, values = { "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Graham Van Talen teaches engineering in the Undercity and is missing two fingers, which he says the plague didn't take. He measures everything in fuse lengths and is still building the clockwork dragonling that cost him those fingers, and he was the happiest person I'd met in the city until I realised why.",
    third = "{name} met Graham Van Talen, the Undercity's engineering trainer.",
  },

  greetings = {
    { id = "g_default", text = "Careful where you step! No, the other way; that one's live." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Wonderful. I've just about finished something that will either impress you or remove the eyebrows you've got left." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Come in, come in! You've no eyebrows to lose, which makes you my favourite sort of visitor." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can smell the blasting powder on you, and I mean that as the highest compliment." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Your people blow things up very well, I'm told, though rather less precisely than the goblins." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Graham Van Talen, engineer. I teach anyone who isn't afraid of a loud noise how to make one, and the Forsaken make excellent students, since we can't go deaf twice." },
        { id = "h_notengineer", when = { ["not"] = { profession = "Engineering" } }, text = "You're not an engineer, are you? Pity. Still, mind the bench, it's just been varnished, and the varnish is flammable." },
      },
      again = {
        { id = "h_again", text = "What else? I've got a fuse burning, but it's a long one." },
        { id = "h_again2", text = "Go on, ask! I can see a question burning on your face like a short fuse." },
        { id = "h_again3", text = "Where was I? Oh, yes, you were asking things, and I was answering them. Carry on!" },
      },
      choices = {
        { text = "Have you ever had an accident at that bench?", next = "fingers" },
        { text = "Why do the dead need engineers?", next = "dead" },
        { text = "What does Franklin next door think of you?", next = "franklin" },
        { text = "Gnomish or goblin engineering, Graham?", next = "school", when = { profession = { name = "Engineering", min = 200 } } },
        { text = "Why not just use magic to blow things up?", next = "magic", when = { class = "MAGE" } },
        { text = "Teach me engineering.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "I'll leave before something explodes.", next = "END" },
      },
    },
    fingers = {
      lines = { { id = "fi_default", text = "Once, with a clockwork dragonling I was building for a nephew before the plague, and it cost me two fingers. It worked, for a moment, and then it worked rather too well, and I've been trying to build a better one ever since." } },
      choices = {
        { text = "How is the new one coming along?", next = "dragonling" },
        { text = "Some things are worth losing a finger for.", next = "BACK", reply = "There! Somebody understands. I'll name the next dragonling after you, if it doesn't take a finger.", fx = { align = { order = -1 } } },
        { text = "Next time, follow the schematics exactly.", next = "BACK", reply = "Schematics are for engineers who never want to be surprised, and where's the joy in that? I'll keep my fingers crossed, what's left of them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragonling = {
      lines = { { id = "dg_default", text = "Number seven is under that sheet, and it very nearly flaps! Number six flapped beautifully, then set fire to the sheet, and Franklin's awning, and a little bit of Franklin, though he's being very dramatic about it." } },
      choices = {
        { text = "Who's it for, now your nephew's gone?", next = "dragonling_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragonling_who = {
      big = true,
      lines = { { id = "dw_default", text = "I hadn't really thought about it, which is the sort of thing Franklin says I never do. I suppose it's for whoever's standing nearby when it finally works, and I do hope they enjoy a bit of smoke. Tell me, are you the sort who runs toward a bang, or away from it?" } },
      choices = {
        { text = "Toward it, always. That's where the fun is.", next = "bang_toward", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "Away, and quickly, with my head down.", next = "bang_away", fx = { trait = { cautious = 1 } } },
        { text = "Depends who's holding the match.", next = "bang_match", fx = { trait = { witty = 1 } } },
      },
    },
    bang_toward = {
      lines = { { id = "bt_default", text = "Wonderful! Then you're welcome at my bench any time, though I'll ask you to sign something first for Franklin's peace of mind. He keeps a tally on his wall of people like us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bang_away = {
      lines = { { id = "ba_default", text = "Sensible, and you'll keep all your fingers, which I can't fault. You'll be a very dull engineer, mind, but a very complete one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bang_match = {
      lines = { { id = "bm_default", text = "Ha! If it's me, run, and if it's Franklin, there won't be a bang at all, because he'll have checked the powder twice and decided against it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dead = {
      lines = { { id = "de_default", text = "For the same reason the living do: the Scourge outnumbers us, and a well-placed explosive evens the odds. The Deathguard in Brill buy my dynamite by the crate, and they never complain about the noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    franklin = {
      lines = { { id = "fr_default", text = "That I'm going to blow us both up, and he's been saying it for six years, which shows remarkable faith in my work when you think about it. He's a dear pessimist, and he sells the driest powder in Lordaeron, so I forgive him everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    school = {
      lines = { { id = "sc_default", text = "Oh, don't make me choose! The gnomes are clever and careful and terribly smug about it, and the goblins are reckless and brilliant and terribly cheap about it. I'd say goblin, but only because a gnome would never let me near the good parts." } },
      choices = {
        { text = "Gnomish. Precision wins in the end.", next = "BACK", reply = "Precision! Oh, a gnomish soul, and I'll not hold it against you. I'll lend you my calipers sometime.", fx = { align = { order = 1 } } },
        { text = "Goblin. Bigger bangs, fewer rules.", next = "BACK", reply = "A goblin heart! You'll go far and lose eyebrows doing it. I'll keep a spare pair for you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    magic = {
      lines = { { id = "ma_default", text = "Because your fireball is gone the moment you've cast it, and my dynamite sits in a crate in Brill for months, waiting patiently for the right Scourge. Besides, anyone can say a word and make a flame, but it takes real love to build one by hand." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, but if you can show me how it works, I can probably make it explode. That's not a threat, mind, it's an offer." } },
  },
}

---------------------------------------------------------------------------
-- Franklin Lloyd: engineering supplies, gloomy salesman.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_flloyd", id = TODO_NPC("Franklin Lloyd"), name = "Franklin Lloyd", title = "Engineering Supplies",
  bible = "bibles/uc_flloyd.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gloomy", "dry" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Franklin Lloyd sells engineering supplies next to Graham Van Talen and seems to be waiting for the day his neighbour finally blows them both up. He keeps a chalk tally of customers who never came back, and he's very calm about it.",
    third = "{name} met Franklin Lloyd, who sells engineering supplies in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Blasting powder, bolts, copper tubes. Whatever you're building, I hope it works better than Graham's." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see, which puts you ahead of most of my customers." },
    { id = "g_regular", when = { timesTalked = { min = 4 } }, text = "You again, and with all your fingers, too. I may stop saving you a space on my wall of customers who never came back." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Yes, I'm open. Explosions don't keep shop hours, so I gave up keeping them myself." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Another engineer. You'll be wanting blasting powder, I expect. Everyone does, sooner or later." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Franklin Lloyd. I sell engineering supplies, and I keep the shop right next to Graham's, which is either very convenient or very foolish, depending on the day." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "An engineer, so you'll know to keep your powder dry and your bench clear. Graham knows it too; he simply doesn't believe it applies to him." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'll be here until the next explosion." },
        { id = "h_again2", text = "Go on. I've nowhere to be, and if Graham's fuse is as long as he says, neither have you." },
      },
      choices = {
        { text = "Does Graham worry you?", next = "graham" },
        { text = "Your supplies must come from a long way off.", next = "supplies" },
        { text = "What are those chalk marks on the wall?", next = "tally" },
        { text = "Any advice for a fellow engineer?", next = "advice", when = { profession = "Engineering" } },
        { text = "I've died more times than I can count, Franklin.", next = "deaths", when = { deaths = { min = 25 } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Goodbye, Franklin.", next = "END" },
      },
    },
    graham = {
      lines = { { id = "gr_default", text = "Every day for six years, and I've made my peace with it. If he blows up the quarter, at least I won't have to listen to him talk about dragonlings anymore." } },
      choices = {
        { text = "Then move your shop somewhere safer.", next = "BACK", reply = "Safer from Graham? There's no such thing in the whole of the Undercity, friend. I'll keep the shop and my eyebrows close.", fx = { align = { order = 1 } } },
        { text = "Safe is dull, Franklin. Stay where the sparks are.", next = "BACK", reply = "Spoken like one of Graham's students, and I'll be the one sweeping up after you. Mind the sparks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = { { id = "su_default", text = "Goblins, mostly, through Ratchet and the zeppelin. They charge too much and ask too few questions, which is about the right balance for this city." } },
      choices = {
        { text = "And the blasting powder?", next = "powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder = {
      lines = { { id = "po_default", text = "The powder is the one thing I'm fussy about, because the barrels sweat in the zeppelin's hold and come down here half damp. I dry every one on the rack myself, a scoop at a time, and anyone who sells you wet powder is selling you a funeral that won't even go off properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tally = {
      lines = { { id = "ta_default", text = "One mark for every customer who bought blasting powder and never came back for more. I don't assume the worst, you understand, but I've yet to be pleasantly surprised." } },
      choices = {
        { text = "That's a grim thing to keep.", next = "tally_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally_grim = {
      lines = { { id = "tg_default", text = "It's honest, which is more than you can say for most ledgers in this city. Now, since you're a customer, and I like to know which part of the wall to save for you, what is it you're building?" } },
      choices = {
        { text = "Something small and careful. I read the instructions.", next = "tally_careful", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Something very large and very loud.", next = "tally_loud", fx = { trait = { brave = 1 } } },
        { text = "That's my business, Franklin.", next = "tally_secret", fx = { trait = { discreet = 1 } } },
      },
    },
    tally_careful = {
      lines = { { id = "tc_default", text = "Instructions. I'd forgotten anyone still read those. I'll leave your bit of the wall blank a while longer, then, and that's as close to a compliment as I get." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tally_loud = {
      lines = { { id = "tl_default", text = "That's what they all say, just before the wall gets another mark. Stand twice as far back as you think you need to, and then take one more step for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tally_secret = {
      lines = { { id = "ts_default", text = "Fair enough. The ones who won't say tend to come back, in my experience, because they've thought about it long enough to be embarrassed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    advice = {
      lines = { { id = "ad_default", text = "Buy twice what you need, stand twice as far back as you think, and never let Graham hold anything you've built. That last one I learned the expensive way, and I'm still sweeping it up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deaths = {
      lines = { { id = "dt_default", text = "Then you've the right attitude for this shop, and I'll not waste my breath on warnings, which suits me, since I haven't any breath. Just try not to do it near my shelves; the spirit healers don't mend copper tubing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, and I don't care to, if it's anything Graham's interested in. Those things tend to end with me sweeping." } },
  },
}

---------------------------------------------------------------------------
-- Arthur Moore: leatherworking trainer, a tanner who works without a sense of smell.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_amoore", id = TODO_NPC("Arthur Moore"), name = "Arthur Moore", title = "Leatherworking Trainer",
  bible = "bibles/uc_amoore.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "dry" }, values = { "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Arthur Moore teaches leatherworking in the Undercity and says death was the best thing that ever happened to his trade, since he can't smell the tannery anymore. He reads a hide with his thumb the way other men read a letter, and he wasn't entirely joking.",
    third = "{name} met Arthur Moore, the Undercity's leatherworking trainer.",
  },

  greetings = {
    { id = "g_default", text = "Hides on the left, tools on the right, and don't touch either without asking." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Bring me anything worth tanning?" },
    { id = "g_skinner", when = { metBefore = true, profession = "Skinning" }, text = "Back again, and with a skinning knife on your belt. Let's hope you've been using it properly this time." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You've been skinning, I can see it on your knife. Good clean cuts, too, or near enough." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You'll want to breathe through your mouth in here. The living never get used to the smell, and I'm told it's quite something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Arthur Moore, leatherworker. I tanned hides in the capital for thirty years, and I'll tell you the truth, the worst part of the job was always the smell, and now I don't have that problem." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren, in a leatherworker's shop. I'll not ask what you think of my work, since you're the only one in here who's ever been a cow's neighbour." },
      },
      again = {
        { id = "h_again", text = "Something else? These hides won't scrape themselves." },
        { id = "h_again2", text = "Go on, then, but I'm working while you talk. A hide doesn't wait for conversation." },
      },
      choices = {
        { text = "I'd guess you miss the smell of the tannery.", next = "smell" },
        { text = "What hides do you work now?", next = "hides" },
        { text = "Why do you keep running your thumb over that hide?", next = "thumb" },
        { text = "What do you think of Brisboise, the tailor?", next = "tailor" },
        { text = "I'm a druid. I wear a bear sometimes.", next = "druid", when = { class = "DRUID" } },
        { text = "Teach me leatherworking.", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "Good day, Arthur.", next = "END" },
      },
    },
    smell = {
      lines = { { id = "sm_default", text = "Not the tannery, but I miss bread, and wet grass, and my wife's hair. Funny, the things you find you've lost when you can't smell them anymore." } },
      choices = {
        { text = "Hold on to those memories, Arthur.", next = "BACK", reply = "I'll try, though they're getting thin. My wife's hair is the hardest to keep, and I'd not let go of it for anything.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better not to dwell on what's gone.", next = "BACK", reply = "You're right, I suppose, and that's what the Society tells us too. Still, I'll dwell a little, in the quiet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Wolves from Tirisfal, bears from Silverpine, and the odd thing from the Plaguelands that I'd rather not name. The Deathguard need boots, and boots need leather, so the work's steady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thumb = {
      lines = { { id = "th_default", text = "Because I can't smell it, so I read it by hand instead. A good hide tells you how the beast lived and how it died, and a bad one tells you who skinned it, and it's usually some fool in a hurry." } },
      choices = {
        { text = "What does a bad skinner do wrong?", next = "thumb_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thumb_bad = {
      lines = { { id = "tb_default", text = "Saws at it like he's cutting firewood, and leaves holes I could put my fist through. Every hole's a boot that'll never get made, so think of a Deathguard with wet feet next time you're tempted to rush. Now, who taught you to skin, if anyone did?" } },
      choices = {
        { text = "Nobody. I learned by doing it badly.", next = "thumb_self", fx = { trait = { honest = 1 }, affinity = 1 } },
        { text = "A proper trainer, and I took my time.", next = "thumb_trained", fx = { trait = { patient = 1 } } },
        { text = "I don't skin. I leave that to others.", next = "thumb_none", fx = { trait = { proud = 1 } } },
      },
    },
    thumb_self = {
      lines = { { id = "ts_default", text = "That's how I learned too, and my old master took the cost of every ruined hide out of my wages. Honest answer, and I'll take it over a clever one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thumb_trained = {
      lines = { { id = "tt_default", text = "Good. Then you've no excuse, and I'll expect clean hides from you, and I'll know if they aren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thumb_none = {
      lines = { { id = "tn_default", text = "Then you're wearing somebody else's work and never thanking them for it, like most folk. Mind you look after those boots, at least." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tailor = {
      lines = { { id = "ta_default", text = "Bowen's a fine hand with a needle, I'll grant him that, and he knows it, too. But cloth's for people who don't expect to be hit, and down here, everyone ought to expect it." } },
      choices = {
        { text = "Leather's honest work. Cloth is for show.", next = "BACK", reply = "Ha! I'll tell Bowen you said that, and you'll have made an enemy for life. Leather keeps you alive.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A city needs both, Arthur. Make peace with him.", next = "BACK", reply = "Peace with Bowen? He'd sooner sew his own mouth shut, and I'd almost pay to see it. I'll consider it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Do you, now? Then I'll keep the bearskins out of sight while you're in here, out of respect, and you'll do me the kindness of not turning into one near my racks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. I know leather, and that's all I've ever needed to know, so ask me about a hide or ask somebody else." } },
  },
}

---------------------------------------------------------------------------
-- Bowen Brisboise: tailoring trainer, a fussy court tailor.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_brisboise", id = TODO_NPC("Bowen Brisboise"), name = "Bowen Brisboise", title = "Tailoring Trainer",
  bible = "bibles/uc_brisboise.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "proud" }, values = { "precise" },
  notices = { "craft", "gear", "class" },
  impression = {
    first = "Bowen Brisboise teaches tailoring in the Undercity and visibly winced at my clothes. He once made coats for the court, he talks about cloth as if each kind had a character, and he still judges everyone by the cut of their seams.",
    third = "{name} met Bowen Brisboise, the Undercity's tailoring trainer and a former court tailor.",
  },

  greetings = {
    { id = "g_default", text = "Oh dear. Oh dear, oh dear. Come in, and let's see what can be done." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and your hem is still crooked. Some things never change." },
    { id = "g_mended", when = { metBefore = true, durability = { max = 0.3 } }, text = "Oh, my dear, you're in tatters. Stand still, don't speak, and let me look at you for a moment before I lose my composure entirely." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Your stitches are a little loose at the shoulder, but the instinct is there." },
    { id = "n_naked", cat = "gear", when = { nearlyNaked = true },
      text = "Where are your clothes? No, don't tell me; just let me find you something before I faint." },
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "All that iron, and not a scrap of good lining under it. You must chafe terribly, and I'm sure you're too proud to say so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bowen Brisboise, tailor. I made coats for the court of Lordaeron, back when the court still needed coats, and now I teach the Forsaken to sew, which is a different sort of challenge." },
        { id = "h_woman", when = { gender = "female" }, text = "Madam, that cloak does nothing for your shoulders, and I say that with great respect. Let me show you what a proper cut can do." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Goodness, the yardage! I could dress three of the Dark Lady's guards from one of your robes, and I should very much like to try." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a robe on the table that needs its sleeves reattached." },
        { id = "h_again2", text = "Yes, my dear? Do stand up straight while you ask; it does wonders for the drape." },
      },
      choices = {
        { text = "So you made coats for the court.", next = "court" },
        { text = "Why do the dead need tailors?", next = "dead" },
        { text = "Does it matter what cloth I wear?", next = "cloth" },
        { text = "What's wrong with my clothes, exactly?", next = "outfit" },
        { text = "Cloth is all I can wear, Bowen.", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Teach me tailoring.", next = "BUSINESS", when = { profession = "Tailoring" } },
        { text = "Good day, Bowen.", next = "END" },
      },
    },
    court = {
      lines = { { id = "co_default", text = "For the King's nobles and their wives, and once, a riding coat for Prince Arthas himself, in blue and gold. I wonder sometimes whether he wore it on his way north." } },
      choices = {
        { text = "You must hate him for what he did.", next = "court_arthas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_arthas = {
      big = true,
      lines = { { id = "ca_default", text = "I hate him with every stitch I've sewn since, and there have been a great many. I hope one day someone hangs him up in that riding coat, and I hope the seams hold." } },
      choices = {
        { text = "Hate him all you like, Bowen. He earned every stitch.", next = "BACK", reply = "Every stitch and more, and I've a riding coat picked out already. May the seams hold, as I said.", fx = { align = { light = -1 } } },
        { text = "Hate won't mend anything, Bowen.", next = "BACK", reply = "No, but it gives me something to do with the needle. Mending is for those who still have something to mend.", fx = { align = { light = 1 } } },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "Because we fall apart, my dear, and someone has to hold us together. A good robe hides a great deal, and the Forsaken have a great deal to hide." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cloth = {
      lines = { { id = "cl_default", text = "Matter? My dear, cloth is character. Linen is honest and wears its creases openly, wool is loyal and a little dull, and silk is a flatterer that will leave you the moment it rains." } },
      choices = {
        { text = "And mageweave? Runecloth?", next = "cloth_magic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_magic = {
      lines = { { id = "cm_default", text = "Mageweave is clever and knows it, like a young man from Dalaran, and runecloth is the only fabric I've met that's as stubborn as I am. As for that leather Arthur Moore keeps next door, it's not cloth, it's a cow with opinions, and I'll say no more about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    outfit = {
      lines = { { id = "ou_default", text = "Where to begin, my dear? The shoulders fight the sleeves, the hem has given up entirely, and someone has mended that seam with what I can only hope was fishing line. So tell me truthfully, who chose all this?" } },
      choices = {
        { text = "I did, and I like it very much.", next = "outfit_proud", fx = { trait = { proud = 1 } } },
        { text = "Whatever the last thing I killed was wearing.", next = "outfit_loot", fx = { trait = { witty = 1 } } },
        { text = "I'd welcome your advice, Bowen.", next = "outfit_advice", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    outfit_proud = {
      lines = { { id = "op_default", text = "Well, confidence is the finest fabric of all, and you're positively draped in it. It's simply a pity about everything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outfit_loot = {
      lines = { { id = "ol_default", text = "Oh, don't, I'd guessed as much and hoped I was wrong. At least wash it first, my dear; the previous owner clearly didn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outfit_advice = {
      lines = { { id = "oa_default", text = "At last, someone who asks! Darker colours at the shoulder, a longer line at the hem, and never, ever tuck a robe into a belt. There, you already look less like a scarecrow from Brill." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    caster = {
      lines = { { id = "ca2_default", text = "Then you're my favourite sort of customer, because you can't escape me. A spellcaster's robe should move like smoke when you cast, and if yours flaps like a sail, you come and see me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know. I only know fabric, my dear, and fabric never lies, which is more than can be said for people." } },
  },
}
