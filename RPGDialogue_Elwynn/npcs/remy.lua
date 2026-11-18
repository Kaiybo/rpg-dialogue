-- Remy "Two Times", Goldshire. Voice: bibles/remy.md
-- Agenda: his gold-dust trade. Rumor-monger; some rumors are true (murlocs), some are
-- self-serving (nobody else buys dust).
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "remy", id = TODO_NPC("Remy \"Two Times\""), name = "Remy \"Two Times\"",
  bible = "bibles/remy.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" },
  notices = { "purse", "sneak" },

  barks = {
    { id = "b_buying", text = "Buying gold dust, buying gold dust, best price in town!" },
    { id = "b_murlocs", when = { questBefore = TODO_QUEST("A Fishy Peril") }, text = "There are murlocs in the east, I tell you, murlocs in the east!" },
  },
  impression = {
    first = "Everything Remy says, he says twice, as if the first time might not take. He would sell me anything at all, and I'd want to count my coins afterward.",
    third = "{name} met Remy, a Goldshire trader who repeats himself and always knows a fellow who knows a fellow.",
  },

  greetings = {
    { id = "g_op_goblins", when = { opinion = { topic = "goblins", stance = "fair" } }, text = "Friend, friend! You're the one who likes goblins! I've been thinking about Booty Bay ever since, thinking very hard, thinking about prices." },
    { id = "g_dust", text = "Gold dust? Got any gold dust, friend, any at all, any at all?" },
    { id = "g_friend", when = { affinity = { min = 3 } }, text = "My friend, my good friend! What news have you got for Remy, what news?" },
    { id = "g_cold", when = { affinity = { max = -3 } }, text = "Oh, it's you. You again, is it, you again." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That's a heavy purse, a heavy purse! You'll want a man who knows where to spend it, and you've found one." },
    { id = "n_rogue", cat = "sneak", when = { class = "ROGUE" },
      text = "Hands where I can see them, friend, because I know your sort. I am your sort, on Tuesdays." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Where'd you go, where'd you go? Don't do that, friend, it's bad for my heart." },
  },

  start = "hello",
  nodes = {
    op_goblins = {
      lines = {
        { id = "op_goblins_a", text = "Undercut me, undercut me! The Steamwheedle goblins sell anything to anyone, Alliance or Horde, it's all the same coin to them, and they still make more than an honest man. What's your view, friend? Are goblins good for trade or bad for it?" },
      },
      choices = {
        { text = "Good for trade. They'll sell to anyone, and that keeps prices honest.", next = "op_goblins_1", fx = { opinion = { goblins = "fair", steamwheedle = "useful" }, align = { honor = -1 } } },
        { text = "Selling to the Horde is treason. They should be barred from our ports.", next = "op_goblins_2", fx = { opinion = { goblins = "distrust", steamwheedle = "traitors" }, align = { honor = 1 } } },
        { text = "Goblins are only merchants with fewer scruples. Like you, Remy.", next = "op_goblins_3", fx = { opinion = { goblins = "contract" }, trait = { witty = 1 }, affinity = -1 } },
        { text = "Gnomes build better and sell cheaper. Goblins just shout louder.", next = "op_goblins_4", when = { race = "Gnome" }, fx = { opinion = { goblins = "distrust", gnomes = "admire" }, affinity = 1 } },
        { text = "I don't care who sells what, Remy.", next = "BACK" },
      },
    },
    op_goblins_1 = {
      lines = { { id = "op_goblins_r1", text = "Honest, he says, honest! Well, perhaps, perhaps, and perhaps I'll go to Booty Bay and learn their tricks, if I can find a cart that won't explode." } },
      choices = { { text = "Something else, Remy.", next = "BACK" } },
    },
    op_goblins_2 = {
      lines = { { id = "op_goblins_r2", text = "Barred! Yes, yes, barred, and then who'll buy my dust, I ask you? Nobody, that's who. Still, you've a fine stern face for a magistrate." } },
      choices = { { text = "Something else, Remy.", next = "BACK" } },
    },
    op_goblins_3 = {
      lines = { { id = "op_goblins_r3", text = "Like me, like me? I have scruples, friend, a great many of them, and I keep them in a little box at home, very safe. Very safe." } },
      choices = { { text = "Something else, Remy.", next = "BACK" } },
    },
    op_goblins_4 = {
      lines = { { id = "op_goblins_r4", text = "Cheaper! Is that so, is that so? Then I'll be wanting a gnome supplier, friend, and you'll tell me where to find one, and I'll tell nobody else." } },
      choices = { { text = "Something else, Remy.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Something special, something special, I promise! Totem polish, spirit charms, all sorts, so count your coins first, count them!" } },
      choices = {
        { text = "I'll pay a fair price, Remy, and count my change.", next = "BACK", reply = "Fair, fair, everything's fair at Remy's, honest! Count it twice if you like, twice, I'll not mind.", fx = { align = { honor = 1 } } },
        { text = "Charms? I'll take two. Spirits love charms.", next = "BACK", reply = "Two, two? Now that's a customer, a real customer! The spirits will love them, I'm sure, sure.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Wolf pelts, wolf pelts, and owl feathers, though I couldn't tell you whose owls, whose owls. Don't look at me like that, because I only know the fellow, and I've never once climbed a tree." } },
      choices = {
        { text = "Tell your fellow to stop, Remy. Owls aren't his to sell.", next = "BACK", reply = "Stop, stop? I'll tell him, I'll tell him, though he doesn't listen to Remy. Nobody listens to Remy.", fx = { align = { honor = 1 } } },
        { text = "A feather's a feather. If it sells, let him sell it.", next = "BACK", reply = "That's what I tell him, exactly, exactly! A feather's a feather, and coin's coin.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Anything at all, anything at all! A shield from a fellow in Stormwind, nearly new, nearly! Or a helmet that was only dropped once, from a tower, but it's barely dented." } },
      choices = {
        { text = "I'll buy my steel from an honest smith, Remy.", next = "BACK", reply = "Honest, honest? Remy's honest, mostly! But suit yourself, friend, suit yourself.", fx = { align = { honor = 1 } } },
        { text = "Show me the helmet. I'm not fussy.", next = "BACK", reply = "There's a customer with sense, sense! It's only a little dented, barely, I promise.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrows, and a collar, and a fellow's old fishing rod, if you're desperate! And murloc warnings, those are free, because nobody listens to Remy about the murlocs until somebody gets eaten." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Arrows, and a collar, and murloc warnings, those are free! And your {pet}, lovely animal, lovely! Would it like a collar? A fine collar, only slightly chewed." },
      },
      choices = {
        { text = "I'll take the murloc warning, Remy. Keep the collar.", next = "BACK", reply = "Finally, someone listens about the murlocs, finally! Stay away from the lake, I'm telling you.", fx = { align = { honor = 1 } } },
        { text = "I'll take the chewed collar. A bargain's a bargain.", next = "BACK", reply = "A bargain, a bargain! You'll not find a better chewed collar in all of Elwynn.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Old ones, old ones, from before the Second War, with pages that whisper when you turn them, or so my fellow tells me. I don't read them myself, I only know a fellow who knows a fellow who does." } },
      choices = {
        { text = "Books that whisper are best left on the shelf, Remy.", next = "BACK", reply = "That's what my fellow says too, after he turns the page, page. I'll leave them on the shelf.", fx = { align = { light = 1 } } },
        { text = "Tell your fellow I'm interested. Whispering books sound useful.", next = "BACK", reply = "I'll tell him, I'll tell him, and he'll be very pleased, pleased! Not a word to the tower, mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I am, because Farley doesn't like it spoken of, spoken of, and Farley pays me in ale when I keep quiet. I know everything that happens in Goldshire, but I only sell some of it, and the cellar's in the part I keep." } },
      choices = {
        { text = "Your secret's safe with me, Remy. I won't tell Farley.", next = "BACK", reply = "Safe, safe, that's what Remy likes to hear! Farley will keep the ale coming.", fx = { align = { honor = 1 } } },
        { text = "Your silence has a price, Remy. Mine does too.", next = "BACK", reply = "A price, a price? Now we're talking business, friend. Remy always pays, always.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Confess, confess? Remy has nothing to confess, nothing! Well, there was a chest in Westfall, and a fellow in Stormwind who paid for it twice, but that was business, business, and surely the heavens understand business." } },
      choices = {
        { text = "Make it right, Remy, and you'll sleep better for it.", next = "BACK", reply = "Right, make it right? Remy will think about it, think about it, after supper.", fx = { align = { light = 1 } } },
        { text = "Business is business. Your secret's safe with me.", next = "BACK", reply = "Business, business, exactly! You understand Remy, you do.", fx = { align = { light = -1 } } },
        { text = "Something else, Remy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stolen, stolen? Remy deals in honest goods, honest! But if a paladin wanted to know, purely to know, he might watch who buys red linen at the edge of the road after dark, because it isn't Remy, never Remy." } },
      choices = {
        { text = "Then I'll watch the road, and see the law done.", next = "BACK", reply = "The law, the law, of course, of course! Just don't tell them where you heard it.", fx = { align = { order = 1 } } },
        { text = "Keep your secrets, Remy. I'm not the Marshal.", next = "BACK", reply = "That's a relief, a relief! Remy likes you better already.", fx = { align = { order = -1 } } },
        { text = "Something else, Remy.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_necklace_r", when = { questDone = TODO_QUEST("Lost Necklace") },
          text = "You found Bernice's necklace, didn't you? I heard it, I heard it twice, and Billy Maclure's been telling every cart driver he was innocent all along." },
        { id = "dd_escape_r", tags = { "news" }, when = { questDone = TODO_QUEST("The Escape") },
          text = "The Maclure girl's gone off with the Stonefield boy, and they say you helped! That's the best news I've had to sell all week, and I'll be selling it twice." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, a priest! Bless me, then, bless me twice, because I've done nothing wrong, nothing at all, this week." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, a paladin! Remy's done nothing wrong, nothing at all, so you can keep that hammer where it is, where it is." },
        { id = "h_default", text = "Remy, at your service, at your service! Whatever you need, I know a fellow who knows a fellow." },
        { id = "q_dust_active", when = { questActive = TODO_QUEST("Gold Dust Exchange") },
          text = "The kobolds keep it in little pouches, little pouches! Bring me what you find and we'll both be happy." },
        { id = "q_dust_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gold Dust Exchange"), days = 2 } },
          text = "Lovely dust, just lovely! I knew you had an honest face, a mostly honest face, anyway." },
        { id = "q_murlocs_told", when = { questDone = TODO_QUEST("Further Concerns") },
          text = "I told you, I told you! Murlocs, and nobody listens to Remy until somebody gets eaten.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "e_thomas", tags = { "news" }, priority = 5, when = { heardLine = "thomas.h_report" },
          text = "Guard Thomas said he'd buy me a drink? A drink, for Remy, for Remy! I'll hold him to it, I'll hold him to it twice." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A sky elf! I've never sold to a sky elf, never once! What do your people buy? Whatever it is, I've probably got some." },
        { id = "q_peril_active", when = { questActive = TODO_QUEST("A Fishy Peril") },
          text = "Did you tell Marshal Dughan about the murlocs, did you tell him? Tell him twice, because he only hears things the second time." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Dwarves know gold, know gold! You wouldn't have a little dust in that beard, would you, a little dust?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, a mage! I know a fellow in Stormwind who sells books that would curl your hair, curl your hair, if that's the sort of thing you're after." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, a warlock! You'll want to speak to Remen Marcot down in the cellar, and I didn't tell you, I didn't tell you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, a warrior! I know a fellow who sells swords, two fellows, in fact, and they both owe me money." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, a hunter! I've a fellow who sells arrows, a good fellow, mostly arrows, mostly good!" },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, a night elf! I know a fellow who knows a fellow who once sold a bear's tooth to one of your people, true as I'm standing here." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, a shaman! I've got just the thing for you, friend, just the thing, if you'll step this way." },
      },
      again = {
        { id = "h_again", text = "What else, what else? Time's money, friend, and money's money too." },
        { id = "h_again2", text = "More, is it, more? I like a customer who talks." },
      },
      choices = {
        { text = "What are you buying?", next = "BUSINESS" },
        { text = "You look like a man with news, Remy.", next = "news" },
        { text = "You don't sound like you're from Goldshire, Remy.", next = "home" },
        { text = "You keep mentioning associates of yours.", next = "associates", when = { questDone = TODO_QUEST("Gold Dust Exchange") } },
        { text = "I know a fence when I see one.", next = "fence", when = { class = "ROGUE" } },
        { text = "Who else buys dust around here? Talk.", tag = "Intimidate", next = "talks",
          when = { thread = { id = "elwynn_gold", beat = "b1_dust" } },
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { band = { "Seasoned", "Veteran", "Champion" } } } } },
          fail = { next = "clams", fx = { affinity = -1 } } },
        { text = "What sort of books would curl my hair, Remy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You seem worried about telling me of the cellar, Remy.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is there anything you could get a warrior, Remy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would you sell a hunter, Remy?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You look like a man with something to confess, Remy.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who's been buying stolen goods in Goldshire, Remy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does your fellow sell that comes from the forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do you have for a shaman, Remy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Remy.", next = "END" },
      },
    },
    news = {
      lines = {
        { id = "n_default", text = "News, news! The price of eggs is a scandal, a scandal, and nobody in Goldshire talks of anything else." },
        { id = "n_murlocs", key = true, when = { questBefore = TODO_QUEST("A Fishy Peril") },
          text = "Murlocs, up the streams in the east, murlocs! Nobody believes me, but they will.",
          fx = { hear = "murlocs_in_elwynn", learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "Murlocs? Tell me more.", next = "murlocs" },
        { text = "I believe you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Murlocs, in Elwynn? Sure, Remy.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "They're swimming up the eastern streams, scaring off the fish and going for gentle folk! I told Marshal Dughan, but he's worried about gnolls and bandits, gnolls and bandits!",
          fx = { learn = { "murlocs_east" } } },
      },
      choices = {
        { text = "I'll talk to Dughan for you.", next = "murlocs_dughan", fx = { affinity = 2 } },
        { text = "Maybe Dughan's right to worry about gnolls.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    murlocs_dughan = {
      lines = {
        { id = "md_default", text = "You will, you will? Persuade him to send troops to the east! He respects me as a merchant, he says, respects me, and then he doesn't listen." },
      },
      choices = {
        { text = "Then let's make it official.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Redridge, east past the mountains. I came west looking for business, looking for business, and I found Goldshire, or Goldshire found me." },
      },
      choices = {
        { text = "Why leave Redridge?", next = "home_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_why = {
      lines = {
        { id = "hw_default", text = "Why does anybody leave anywhere? Better prices, better prices! Don't ask me about Redridge, friend; ask me about dust, because I like dust." },
      },
      choices = {
        { text = "Better prices? Do the goblins undercut you, then?", next = "op_goblins" },
        { text = "All right. Tell me about the dust.", next = "dust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = {
        { id = "du_default", text = "The kobolds pick it out of the mines, Fargodeep to the south and Jasperlode to the northeast, and carry it about in pouches. I buy it from whoever takes it off them, simple as that, simple as that!",
          fx = { learn = { "gold_dust" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    associates = {
      lines = {
        { id = "as_default", text = "Associates! Friends, and friends of friends, who send me little tokens for good customers, good customers! Don't ask what the token's for, because I don't." },
      },
      choices = {
        { text = "That's not reassuring, Remy.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'll not ask, then. Show me the goods.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fence = {
      lines = {
        { id = "fe_default", text = "A fence, me? I'm a merchant, a respectable merchant! ...What are you selling, though? I'm just asking, just asking." },
      },
      choices = {
        { text = "Nothing, Remy. Not yet, anyway.", next = "BACK", reply = "Yet, yet? Remy likes the sound of yet. Come back when it's not yet any more.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'm no thief, Remy, and I won't be selling.", next = "BACK", reply = "No, no, of course not, not you, not ever! Remy was only asking, asking.", fx = { align = { honor = 1 } } },
        { text = "Relax, Remy.", next = "BACK" },
      },
    },
    talks = {
      lines = {
        { id = "t_default", key = true,
          text = "All right, all right! Riders, night riders, out by the Brackwell pumpkin patch, and they buy from the kobolds before I can. I never sold to them, I swear it.",
          fx = { expose = "remy_only_buyer", learn = { "the_collector" }, thread = { id = "elwynn_gold", beat = "b_remy_talks" } } },
      },
      choices = { { text = "That wasn't so hard.", next = "END", fx = { trait = { stern = 1 }, affinity = -1 } } },
    },
    clams = {
      lines = { { id = "c_default", text = "Buy, me? I only sell, friend, only sell! Goodness, is that the time? I must be going, must be going." } },
      choices = { { text = "We'll talk again, Remy.", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I hear everything first, friend, always have, always have! Ask me about any of this and you'll hear it before anyone else does." },
    },
    background = { { id = "tp_bg", text = "I'm from Redridge, and I came looking for business, looking for business, and found plenty, plenty.", next = "home" } },
    advice = { { id = "tp_ad", text = "Never sell to a gnoll, because gnolls don't pay. And always count your change twice, twice!" } },
    gold_dust = { { id = "t_dust", text = "It's mine, my trade! Nobody in Elwynn buys dust but Remy, nobody but Remy!",
      fx = { hear = "remy_only_buyer" } } },
    murlocs_east = { { id = "t_murlocs", text = "The murlocs are real, real as rain! Ask the fishermen, the ones that are left." } },
    the_collector = { { id = "t_collector", text = "Never heard of him, never heard of him. Why do you ask, why?" } },
    hogger = { { id = "t_hogger", text = "Don't sell to gnolls, because gnolls don't pay, and Hogger especially doesn't pay." } },
    _none = { { id = "t_none", text = "Don't know, don't know! Ask Farley; he hears everything twice as fast as me." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire, the Faire! Best week of the year, friend, best week, and I hear more news there than anywhere. Not that I sell news, I give it away, free, free!" } },
    booty_bay = { { id = "tp_booty_bay", text = "A goblin from Booty Bay told me he'd buy all the gold dust I could carry, and then he offered half what Remy pays, half! Goblins, friend, goblins." } },
    scourge = { { id = "tp_scourge", text = "The dead walk in the north, I hear, walk and walk and never sleep! I sleep twice as much now, just to spite them, twice as much." } },
    varian = { { id = "tp_varian", text = "The king's gone, gone! Taken by pirates, I heard, or married in secret, or lost at sea, and I've heard all three in one day, all three!" } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor, Lady Prestor, very beautiful and very clever, the nobles say. I've never seen her, but I'd sell to her, I'd sell her anything!" } },
  },
}
