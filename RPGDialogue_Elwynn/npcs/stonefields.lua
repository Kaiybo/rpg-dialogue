-- The rest of the Stonefield farm, and the Maclure boy across the field.
-- Voices: bibles/bernice.md, bibles/ma_stonefield.md, bibles/billy.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- "Auntie" Bernice Stonefield: a lost necklace, a suspected Maclure, and a pie she resents baking.
-- A widow: her husband's last campaign is in the Goldtooth turn-in.
P:NPC {
  key = "bernice", id = TODO_NPC("\"Auntie\" Bernice Stonefield"), name = "\"Auntie\" Bernice Stonefield",
  bible = "bibles/bernice.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "proud" }, values = { "honest", "stern" },
  notices = { "craft" },
  impression = {
    first = "Auntie Bernice Stonefield guards her kitchen like a fortress and her grudges like heirlooms. She had decided who stole her necklace long before anybody asked her.",
    third = "{name} met Auntie Bernice Stonefield, a baker with strong opinions about pie crusts and the Maclure family.",
  },

  greetings = {
    { id = "g_pie", text = "Mind the sill, there's pies cooling, so keep your hands off." },
    { id = "g_necklace", when = { questActive = TODO_QUEST("Lost Necklace") }, text = "Well? Has that Maclure boy confessed yet?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "My necklace, safe round my neck where it belongs. You're welcome in this kitchen any time." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know a pork belly pie wants patience and good boar, and that most folk rush the crust. Don't you rush the crust." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I think everyone who's ever walked past this window has thought about it, and half of them have tried, including Billy Maclure. You'd be the first rogue to resist, and I'd like to see it." } },
      choices = {
        { text = "I'll leave your pie alone, Auntie. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every pie on a sill is an invitation, Auntie.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Gramma says it would, because she says magic leaves a taste, but Gramma also says the Maclures put curses on our turnips. I'm willing to try it once, if you are." } },
      choices = {
        { text = "Gramma knows best. Bake it the old way, Auntie.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's try it. Old wives' tales shouldn't stop good bread.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Bernice Stonefield. Everyone calls me Auntie, whether they're kin or not. I bake, I mend, and I keep an eye on that vineyard." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Lost Necklace") },
          text = "My necklace is gone, and that Maclure boy's been hanging round the fence all week. You do the arithmetic." },
        { id = "h_pie", tags = { "news" }, when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "So the thief wants a pie before he'll talk, does he? Fine; bring me good boar meat and I'll bake it, and I'll hate every minute." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Goldtooth"), days = 3 } },
          text = "A kobold had it, down in the Fargodeep Mine, a kobold! And how it got from my neck to a mine, nobody can tell me, though I have my suspicions." },
        { id = "h_bread", when = { metBefore = true }, text = "The bread rose proper this morning, first time all week, so don't you dare let that door slam." },
        { id = "h_billy_pie", when = { questActive = TODO_QUEST("Back to Billy") },
          text = "There, take it to him, and tell him it's poisoned. No, don't; tell him it's good. It is good, and that's the worst of it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Quick hands, I see, and I've a pie cooling on the sill, so I'll be watching both of them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Could you warm my oven a little faster, dear? The wood's damp, and the bread won't rise without heat." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I knead; I can do both." },
        { id = "h_again2", text = "Still here? Then make yourself useful and hand me that bowl." },
      },
      choices = {
        { text = "What about the Maclures?", next = "maclures" },
        { text = "Tell me about the necklace.", next = "necklace" },
        { text = "What goes in a pork belly pie?", next = "pie" },
        { text = "Billy let slip he dropped it.", next = "billy_slip", when = { heardLine = "billy.s_slip" } },
        { text = "You said those were your husband's.", next = "husband", when = { questDone = TODO_QUEST("Goldtooth") } },
        { text = "A gnome could build you a better oven, Auntie.", next = "gnome", when = { race = "Gnome" } },
        { text = "Do you really think I'd steal your pie, Auntie?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Wouldn't a spell spoil the bread somehow?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll leave you to your baking.", next = "END" },
      },
    },

    maclures = {
      lines = { { id = "m_default", text = "We don't speak to them and they don't speak to us, and it's worked for years. Ask Gramma if you want a sermon on it." } },
      choices = {
        { text = "What did they ever do to you?", next = "maclures_what" },
        { text = "Gramma doesn't seem to agree.", next = "maclures_gramma", fx = { trait = { witty = 1 }, learn = { "maybell_tommy" } } },
      },
    },
    maclures_what = {
      lines = {
        { id = "mw_default", text = "Ask me after supper and ask me again at breakfast. You'll get two answers, and I'll mean both." },
      },
      choices = {
        { text = "That's no answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    maclures_gramma = {
      lines = {
        { id = "mg_default", text = "Gramma's earned the right to be wrong. I'll keep the fence; she can keep the sermons." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    necklace = {
      lines = {
        { id = "n_default", text = "Not worth much, to anyone but me. It sat round my neck so long I still feel the cold where it was." },
        { id = "n_back", when = { questDone = TODO_QUEST("Goldtooth") },
          text = "It's back now, thanks to you, and it's not leaving this neck again. I sleep in it, so don't you tell anyone." },
      },
      choices = {
        { text = "Why blame Billy?", next = "necklace_billy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    necklace_billy = {
      lines = {
        { id = "nb_default", text = "He's always at our fence, he's a Maclure, and he looks guilty. That's three reasons more than I need." },
      },
      choices = {
        { text = "Looking guilty isn't proof.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "He does look guilty.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },

    pie = {
      lines = {
        { id = "p_default", text = "Boar belly, simmered slow in the right spices, because wild boar's bland until you coax it. And patience, which is the ingredient nobody buys." },
      },
      choices = {
        { text = "Will you teach me?", next = "pie_teach" },
        { text = "I cook too.", next = "pie_cook", when = { profession = "Cooking" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pie_teach = {
      lines = {
        { id = "pt_default", text = "Teach you? Watch, and learn by watching; teaching's for people who'll rush the crust the minute I turn my back." },
      },
      choices = { { text = "I'll watch, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    pie_cook = {
      lines = {
        { id = "pc_default", text = "Then you know it: low fire, long wait. A pie that's rushed is a pie that's wasted, and a cook who rushes is no cook of mine." },
      },
      choices = { { text = "Yes, Auntie.", next = "BACK", fx = { affinity = 2 } } },
    },

    billy_slip = {
      lines = {
        { id = "bs_default", text = "Did he, now? Dropped it, off my neck, into his pocket and out at the mine, all by itself, I suppose, the little wretch." },
      },
      choices = {
        { text = "He's only a boy.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "He did get you to bake him a pie.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    husband = {
      big = true,
      lines = {
        { id = "hu_default", text = "His lucky things. He said so every time he put them on. Then he went on his last campaign and left them on the peg." },
      },
      choices = {
        { text = "Would you like a prayer said for him?", next = "husband_priest", when = { class = "PRIEST" } },
        { text = "He'd be glad they're in use.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    husband_priest = {
      lines = {
        { id = "hp_default", text = "I've said all mine, but it would be nice to hear one in a voice that isn't mine. Go on, then, and I'll keep kneading." },
      },
      choices = {
        { text = "Light keep him, wherever the campaign ended.", next = "BACK", fx = { affinity = 3, align = { light = 2 } },
          journal = { first = "Said a prayer for Bernice Stonefield's husband, who never came home from his last campaign. She kept kneading.",
                      third = "{name} prayed for Auntie Bernice's husband in the Stonefield kitchen." } },
        { text = "I didn't know him, Bernice, so the prayer's better from you.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Could they now? My oven's older than my husband was, and it's never once exploded, which I'm told is more than gnome ovens can say." } },
      choices = {
        { text = "Only the early models.", next = "gnome2", fx = { trait = { witty = 1 } } },
        { text = "Fair. Keep your oven.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gnome2 = {
      lines = { { id = "gnome2_l", text = "Well, you build me one of the late models and I'll bake you a pie in it, and if the farm's still standing after, I'll bake you two." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Stonefield by marriage, and a widow these years. I bake, and that's the rest of it." } },
    advice = { { id = "tp_ad", text = "Don't rush the crust. It's good advice for more than pies." } },
    maybell_tommy = { { id = "tp_lovers", text = "What about them? There's nothing to tell about them, so why do you ask, and what have you heard?" } },
    kobolds = { { id = "tp_kobolds", text = "Thieving little candle-heads, and worse than Maclures, nearly." } },
    _none = { { id = "tp_none", text = "I've no idea, but you can ask me about pie." } },
  },
}

-- Ma Stonefield: the Brackwells' prize pig has been eating her crop. (Classic: Princess lives at
-- the Brackwell Pumpkin Patch, east beyond the Maclures, with her entourage; the Brackwells are gone.)
P:NPC {
  key = "ma_stonefield", id = TODO_NPC("Ma Stonefield"), name = "Ma Stonefield",
  bible = "bibles/ma_stonefield.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "trophy" },
  impression = {
    first = "Ma Stonefield is losing her whole crop to one enormous pig, and she takes it as a personal insult. She is not a crier, she says, and I believe her.",
    third = "{name} met Ma Stonefield, whose cabbages are being devoured by the Brackwells' prize sow, Princess.",
  },

  greetings = {
    { id = "g_field", text = "If you're here for the vegetables, there aren't many left. Ask the pig." },
    { id = "g_princess", when = { questActive = TODO_QUEST("Princess Must Die!") }, text = "Is she dead? Is that great sow dead yet?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Princess Must Die!") }, text = "My cabbages thank you, and so do I. Wherever the Brackwells are, I hope they never hear of it." },
  },

  notice = {
    { id = "n_collar", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Princess Must Die!") },
      text = "Is that her collar, the brass one? Give it here; I'm hanging it over the door." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd want it killed any way at all, because that sow's eaten more of my cabbages than my family has, but I'd rather it was done quietly so the neighbours don't talk. Whoever's left over there can think she wandered off." } },
      choices = {
        { text = "I'll kill her openly, Ma. No need for sneaking.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Quiet's best. Nobody needs to know who did it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Light, no, I'd rather have the pig than have that thing loose among my cabbages. Kill the sow with an honest blade, and leave your friend outside the fence." } },
      choices = {
        { text = "I'll use my own hands, Ma. The demon stays out.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon would make short work of her. Your loss.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ma Stonefield. This is my field, or it was, until the Brackwells' prize pig found it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Princess Must Die!") },
          text = "Princess, they call her, Princess! She's the size of a cart and eats like a regiment, and she'll have the whole crop by harvest." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Princess Must Die!") },
          text = "She's over at the Brackwell patch, east past the Maclures, with two hogs trailing her like courtiers. Get her before she's hungry again." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Princess Must Die!"), days = 3 } },
          text = "I pulled my first whole carrot of the season this morning and nearly cried, and I'm not a crier." },
        { id = "h_billy", when = { metBefore = true }, text = "Tommy Joe's mooning by the fence again over that Maclure girl. A Stonefield and a Maclure, I ask you!" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You could slip into the Brackwell patch and do away with that pig, couldn't you, without anyone the wiser?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Whatever that is at your heel, keep it out of my field, because I've enough trouble with one beast eating my crop." },
      },
      again = {
        { id = "h_again", text = "What else? I've weeding, and the weeds don't wait." },
        { id = "h_again2", text = "Go on. Quick, before she smells the carrots." },
      },
      choices = {
        { text = "Couldn't you talk to the Brackwells?", next = "brackwells" },
        { text = "Tell me about Princess.", next = "princess" },
        { text = "How's the rest of the farm?", next = "farm" },
        { text = "What will you do with the collar?", next = "collar", when = { questDone = TODO_QUEST("Princess Must Die!") } },
        { text = "My pet could deal with her.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Westfall lost whole farms to the Defias.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I could ask Princess to leave, the druid's way.", next = "druid", when = { class = "DRUID" } },
        { text = "Would you really want the pig killed in secret?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could my demon deal with the Brackwells' pig?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck with the crop.", next = "END" },
      },
    },

    brackwells = {
      lines = { { id = "b_default", text = "Talk to who? Bandits took the pumpkin patch, the Brackwells are gone nobody knows where, and their pig stayed behind to eat my crop." } },
      choices = {
        { text = "Gone where?", next = "brackwells_gone" },
        { text = "Ha. The pig outlasted the family.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    brackwells_gone = {
      lines = {
        { id = "bg_default", text = "Nobody knows. One week there were Brackwells, the next there were men in red masks. Marshal Dughan says he's looking into it." },
        { id = "bg_manhunt", when = { questDone = TODO_QUEST("Manhunt") },
          text = "Dughan's lot got the one running that patch, they say, but there's still no sign of the Brackwells. I've stopped expecting any." },
      },
      choices = {
        { text = "I'll keep an eye out for them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },

    princess = {
      lines = {
        { id = "pr_default", text = "She won first prize at some fair and got a brass collar for it, and it went to her head, then to her belly, and then to my cabbages." },
      },
      choices = {
        { text = "Why does she come here?", next = "princess_why" },
        { text = "She's just a pig.", next = "princess_pig", fx = { trait = { skeptical = 1 } } },
      },
    },
    princess_why = {
      lines = {
        { id = "pw_default", text = "Because my vegetables are better than anything on that pumpkin patch. I'd be flattered if I weren't starving." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    princess_pig = {
      lines = {
        { id = "pp_default", text = "Just a pig. Go and stand next to her, then come back and say 'just'." },
      },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },

    farm = {
      lines = {
        { id = "fa_default", text = "Bernice bakes, Gramma schemes, the boy moons, and I'm the only one actually farming." },
      },
      choices = {
        { text = "Gramma schemes?", next = "farm_gramma" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_gramma = {
      lines = {
        { id = "fg_default", text = "She hums. When Gramma hums, somebody's about to be surprised. I keep my head down and my hoe moving." },
      },
      choices = { { text = "Wise.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    collar = {
      lines = {
        { id = "c_default", text = "It's over the door. Any Brackwell pig that wanders this way can see it and think twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Could it? Then set it on her, but mind it doesn't get a taste for my carrots after." },
      },
      choices = { { text = "It prefers pork.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "So I hear, and here's me shouting about a pig. Still, a pig you can kill; bandits, you need the army for, and the army's not coming." },
      },
      choices = {
        { text = "No. It isn't.", next = "BACK", fx = { affinity = 1, opinion = { westfall = "abandoned" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "druid_l", text = "Ask her? That pig doesn't listen to the Brackwells, and they feed her. If you can talk sense into her, you're welcome to try, but I've my doubts, and so does the cabbage patch." } },
      choices = {
        { text = "Some beasts can't be reasoned with.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I'll try kindness first.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I farm. I've farmed since I could hold a hoe. That's the whole of it, and it's enough." } },
    advice = { { id = "tp_ad", text = "Never name a pig. Once you name it, it thinks it owns the place." } },
    maybell_tommy = { { id = "tp_lovers", text = "Tommy Joe? He's mending the east fence, and he's been mending it for months. It must be a very broken fence." } },
    defias = { { id = "tp_defias", text = "They took the Brackwell farm whole, pumpkins, house and all. They left the pig, which tells you they've got some sense." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, got a pig to worry about." } },
  },
}

-- Billy Maclure: Maybell's little brother; accused, hungry, and he dropped it near the mine.
P:NPC {
  key = "billy", id = TODO_NPC("Billy Maclure"), name = "Billy Maclure",
  bible = "bibles/billy.md", role = "child", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "witty" },
  notices = { "food", "wonder" },
  impression = {
    first = "Before I'd accused him of anything, Billy Maclure had already sworn he didn't do it, which is either very honest or very suspicious. Mostly he seems hungry.",
    third = "{name} met young Billy Maclure, accused of a theft he swears he didn't commit and hungry enough to bargain over it.",
  },

  greetings = {
    { id = "g_kid", text = "I didn't do it, whatever it is, I was here the whole time!" },
    { id = "g_pie", when = { questActive = TODO_QUEST("Back to Billy") }, text = "Is that my pie? Oh, gimme, gimme, gimme, I've been waiting all day!" },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "Told you it wasn't me! I told everybody, and nobody listened." },
  },

  notice = {
    { id = "n_food", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen; got anything, even a crust? I'm not fussy, I'm a growing boy, Ma says." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = "cat" },
      text = "Kitty, a big kitty! Do you eat kobolds, because you should, there's loads of them up at the mine." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only for a little while, just long enough for everyone to laugh, and then you could turn him back. Pa would say it's wicked, but Pa says everything's wicked when it's about Stonefields." } },
      choices = {
        { text = "Magic isn't for pranks, Billy. It's dangerous.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little prank never hurt anyone. I'll consider it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Billy Maclure, and everybody at the Stonefields thinks I'm a thief, but I'm not. I just know things." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice thinks I took her necklace? I didn't! I might know who did, only I can't remember properly, because I'm too hungry to remember." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "Auntie Bernice makes the best pie in Elwynn, but don't tell my ma I said so. It's pork belly, so get boar meat, good boar meat." },
        { id = "h_tell", tags = { "news" }, when = { questActive = TODO_QUEST("Goldtooth") },
          text = "Goldtooth's got it; I saw, and he likes shiny things. Don't tell anyone I told you, and don't tell anyone I was there." },
        { id = "h_denial", when = { metBefore = true }, text = "I didn't eat the pie, I didn't! Ma says I did, but Ma's wrong, mostly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A real mage! Can you do the thing where you turn somebody into a sheep? I know a Stonefield who'd look good as a sheep." },
      },
      again = {
        { id = "h_again", text = "What? I'm listening, I'm always listening, that's how I know things." },
        { id = "h_again2", text = "Ask me something else, only not about the necklace." },
      },
      choices = {
        { text = "Are you sure you didn't take it?", next = "sure" },
        { text = "Where were you playing?", next = "mine", when = { any = { { questActive = TODO_QUEST("Goldtooth") }, { questDone = TODO_QUEST("Back to Billy") } } } },
        { text = "Tell me about your sister.", next = "maybell" },
        { text = "Aren't you scared of kobolds?", next = "kobolds" },
        { text = "I could teach you to lift a purse.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Would you really want a Stonefield turned into a sheep?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "See you, Billy.", next = "END" },
      },
    },

    sure = {
      lines = { { id = "s_default", text = "I'm a Maclure, and we don't steal from Stonefields; we just don't talk to them, which is different. Ma says." } },
      choices = {
        { text = "That's not an answer.", next = "sure_push" },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    sure_push = {
      lines = { { id = "sp_default", text = "It is too an answer, it's a Maclure answer, and you just don't speak Maclure." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    mine = {
      lines = {
        { id = "s_slip", key = true,
          text = "Near Fargodeep Mine, not in it, near it, and I dropped- I mean I SAW the necklace there, and seeing's different." },
      },
      choices = {
        { text = "You dropped it.", next = "mine_caught", fx = { trait = { skeptical = 1 } } },
        { text = "Of course you saw it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    mine_caught = {
      lines = {
        { id = "mc_default", text = "Saw! I said saw! Don't tell Auntie Bernice, or she'll bake me a pie with nails in." },
      },
      choices = {
        { text = "Your secret's safe. This time.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "You should tell her yourself.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    maybell = {
      lines = {
        { id = "m_river", key = true,
          text = "Maybell's at the river again, she's always at the river. I'm not saying anything, I'm just saying." },
      },
      choices = {
        { text = "Why the river?", next = "maybell_why" },
        { text = "Leave your sister be.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    maybell_why = {
      lines = {
        { id = "mb_default", text = "She says she's counting grapes, but there aren't any grapes at the river, because I checked, twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "No. Well, the big one, a bit; he's got a gold tooth and he screams if you go near his candles. Kobolds are weird about candles." },
      },
      choices = {
        { text = "Stay away from the mine, Billy.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "kobolds" } } },
        { text = "Ha. Do it again.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "Really? No, Ma would skin me, and so would Maybell, and so would Auntie Bernice, and she's not even my auntie." },
      },
      choices = {
        { text = "Smart lad.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Your loss.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Billy, and I live at the vineyard, and that's everything, and I didn't do anything." } },
    advice = { { id = "tp_ad", text = "If you're hungry, say you can't remember things. Grown-ups give you pie." } },
    maybell_tommy = { { id = "tp_lovers", text = "Maybell goes to the river a LOT. I'm not saying anything, I'm just saying." } },
    kobolds = { { id = "tp_kobolds", text = "They live in the mines and they like shiny stuff, and candles, which is weird." } },
    _none = { { id = "tp_none", text = "I don't know, I'm just a kid. Ask a grown-up, only not Auntie Bernice." } },
  },
}
