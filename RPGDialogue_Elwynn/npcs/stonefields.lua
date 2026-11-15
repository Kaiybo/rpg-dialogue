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

  greetings = {
    { id = "g_pie", text = "Mind the sill, there's pies cooling. Hands off." },
    { id = "g_necklace", when = { questActive = TODO_QUEST("Lost Necklace") }, text = "Well? Did that Maclure boy confess?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "My necklace, safe round my neck where it belongs. You're welcome in this kitchen any time." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know a pork belly pie wants patience and good boar. Most folk rush the crust. Don't rush the crust." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bernice Stonefield. Everyone calls me Auntie, whether they're kin or not. I bake, I mend, and I keep an eye on that vineyard." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Lost Necklace") },
          text = "My necklace is gone. And the Maclure boy's been hanging round the fence all week. You do the arithmetic." },
        { id = "h_pie", tags = { "news" }, when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "He wants a pie. The thief wants a pie, before he'll talk. Fine. Bring me good boar meat and I'll bake it. I'll hate every minute." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Goldtooth"), days = 3 } },
          text = "A kobold had it, down the Fargodeep Mine. A kobold! And how it got from my neck to a mine, nobody can tell me. I have my suspicions." },
        { id = "h_bread", when = { metBefore = true }, text = "Bread rose proper this morning. First time all week. Don't you dare let the door slam." },
        { id = "h_billy_pie", when = { questActive = TODO_QUEST("Back to Billy") },
          text = "There. Take it to him. Tell him it's poisoned. No, don't. Tell him it's good. It is good, and that's the worst of it." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I knead. I can do both." },
        { id = "h_again2", text = "Still here? Then make yourself useful and hand me that bowl." },
      },
      choices = {
        { text = "What about the Maclures?", next = "maclures" },
        { text = "Tell me about the necklace.", next = "necklace" },
        { text = "What goes in a pork belly pie?", next = "pie" },
        { text = "Billy let slip he dropped it.", next = "billy_slip", when = { heardLine = "billy.s_slip" } },
        { text = "You said those were your husband's.", next = "husband", when = { questDone = TODO_QUEST("Goldtooth") } },
        { text = "I'll leave you to your baking.", next = "END" },
      },
    },

    maclures = {
      lines = { { id = "m_default", text = "We don't speak to them. They don't speak to us. It's worked for years. Ask Gramma if you want a sermon on it." } },
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
          text = "Back now, thanks to you, and it's not leaving this neck again. I sleep in it. Don't tell anyone." },
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
        { text = "He does look guilty.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    pie = {
      lines = {
        { id = "p_default", text = "Boar belly, simmered slow in the right spices. Wild boar's bland until you coax it. And patience. Patience is the ingredient nobody buys." },
      },
      choices = {
        { text = "Will you teach me?", next = "pie_teach" },
        { text = "I cook too.", next = "pie_cook", when = { profession = "Cooking" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pie_teach = {
      lines = {
        { id = "pt_default", text = "Teach? Watch. Teaching's for people who'll rush the crust the minute I turn my back." },
      },
      choices = { { text = "I'll watch, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    pie_cook = {
      lines = {
        { id = "pc_default", text = "Then you know. Low fire, long wait. A pie that's rushed is a pie that's wasted, and a cook who rushes is no cook of mine." },
      },
      choices = { { text = "Yes, Auntie.", next = "BACK", fx = { affinity = 2 } } },
    },

    billy_slip = {
      lines = {
        { id = "bs_default", text = "Did he now. Dropped it. Off my neck, into his pocket, out at the mine. All by itself, I suppose. That boy." },
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
        { id = "hp_default", text = "I've said all mine. But it would be nice to hear one in a voice that isn't mine. Go on. I'll keep kneading." },
      },
      choices = {
        { text = "Light keep him, wherever the campaign ended.", next = "BACK", fx = { affinity = 3, align = { light = 2 } },
          journal = { first = "Said a prayer for Bernice Stonefield's husband, who never came home from his last campaign. She kept kneading.",
                      third = "{name} prayed for Auntie Bernice's husband in the Stonefield kitchen." } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Stonefield by marriage, and a widow these years. I bake. That's the rest of it." } },
    advice = { { id = "tp_ad", text = "Don't rush the crust. It's good advice for more than pies." } },
    maybell_tommy = { { id = "tp_lovers", text = "What about them? Nothing about them. Why? What have you heard?" } },
    kobolds = { { id = "tp_kobolds", text = "Thieving little candle-heads. Worse than Maclures. Nearly." } },
    _none = { { id = "tp_none", text = "No idea. Ask me about pie." } },
  },
}

-- Ma Stonefield: the Brackwells' prize pig has been eating her crop. (Classic: Princess lives at
-- the Brackwell Pumpkin Patch, east beyond the Maclures, with her entourage; the Brackwells are gone.)
P:NPC {
  key = "ma_stonefield", id = TODO_NPC("Ma Stonefield"), name = "Ma Stonefield",
  bible = "bibles/ma_stonefield.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "trophy" },

  greetings = {
    { id = "g_field", text = "If you're here for the vegetables, there aren't many left. Ask the pig." },
    { id = "g_princess", when = { questActive = TODO_QUEST("Princess Must Die!") }, text = "Is she dead? Is that great sow dead yet?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Princess Must Die!") }, text = "My cabbages thank you. I thank you. Wherever the Brackwells are, I hope they never hear of it." },
  },

  notice = {
    { id = "n_collar", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Princess Must Die!") },
      text = "Is that her collar? The brass one? Give it here. I'm hanging it over the door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ma Stonefield. This is my field. Was my field. Then the Brackwells' prize pig found it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Princess Must Die!") },
          text = "Princess, they call her. Princess! She's the size of a cart and she eats like a regiment. She'll have the whole crop by harvest." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Princess Must Die!") },
          text = "She's over at the Brackwell patch, east past the Maclures, with two hogs trailing her like courtiers. Get her before she's hungry again." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Princess Must Die!"), days = 3 } },
          text = "First carrot I've pulled whole all season. I nearly cried. I'm not a crier." },
        { id = "h_billy", when = { metBefore = true }, text = "Tommy Joe's mooning by the fence again. Over that Maclure girl. A Stonefield and a Maclure! I ask you." },
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
        { text = "Good luck with the crop.", next = "END" },
      },
    },

    brackwells = {
      lines = { { id = "b_default", text = "Talk to who? Bandits took the pumpkin patch. The Brackwells are gone, nobody knows where, and their pig stayed behind to eat my crop." } },
      choices = {
        { text = "Gone where?", next = "brackwells_gone" },
        { text = "Ha. The pig outlasted the family.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    brackwells_gone = {
      lines = {
        { id = "bg_default", text = "Nobody knows. One week there were Brackwells, the next there were men in red masks. Marshal Dughan says he's looking into it." },
        { id = "bg_manhunt", when = { questDone = TODO_QUEST("Manhunt") },
          text = "Dughan's lot got the one running that patch, they say. Still no Brackwells. I've stopped expecting any." },
      },
      choices = {
        { text = "I'll keep an eye out for them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },

    princess = {
      lines = {
        { id = "pr_default", text = "Won first prize at some fair and got a brass collar for it. It went to her head. Then to her belly. Then to my cabbages." },
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
        { id = "hu_default", text = "Could it? Then set it on her. Mind it doesn't get a taste for my carrots after." },
      },
      choices = { { text = "It prefers pork.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    farmhand = {
      lines = {
        { id = "fh_default", text = "So I hear. And here's me shouting about a pig. Still. A pig you can kill. Bandits, you need the army for, and the army's not coming." },
      },
      choices = {
        { text = "No. It isn't.", next = "BACK", fx = { affinity = 1, opinion = { westfall = "abandoned" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I farm. I've farmed since I could hold a hoe. That's the whole of it, and it's enough." } },
    advice = { { id = "tp_ad", text = "Never name a pig. Once you name it, it thinks it owns the place." } },
    maybell_tommy = { { id = "tp_lovers", text = "Tommy Joe? He's mending the east fence. He's been mending it for months. It must be a very broken fence." } },
    defias = { { id = "tp_defias", text = "Took the Brackwell farm whole. Pumpkins, house, the lot. Left the pig, which tells you they've got some sense." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, got a pig to worry about." } },
  },
}

-- Billy Maclure: Maybell's little brother; accused, hungry, and he dropped it near the mine.
P:NPC {
  key = "billy", id = TODO_NPC("Billy Maclure"), name = "Billy Maclure",
  bible = "bibles/billy.md", role = "child", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "witty" },
  notices = { "food", "wonder" },

  greetings = {
    { id = "g_kid", text = "I didn't do it. Whatever it is. I was here the whole time." },
    { id = "g_pie", when = { questActive = TODO_QUEST("Back to Billy") }, text = "Is that pie? Is that my pie? Gimme gimme." },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "Told you it wasn't me! Told everybody!" },
  },

  notice = {
    { id = "n_food", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen. Got anything? A crust? I'm not fussy. I'm a growing boy. Ma says." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = "cat" },
      text = "Kitty! A big kitty! Do you eat kobolds? You should eat kobolds." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Billy. Maclure. Everybody at the Stonefields thinks I'm a thief. I'm not. I just know things." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice thinks I took her necklace? I didn't! I might know who did. I can't remember properly. I'm too hungry to remember." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "Auntie Bernice makes the best pie in Elwynn. Don't tell my ma. Pork belly. Get boar meat. Good boar meat." },
        { id = "h_tell", tags = { "news" }, when = { questActive = TODO_QUEST("Goldtooth") },
          text = "Goldtooth's got it. I saw. He likes shiny things. Don't tell anyone I told. Don't tell anyone I was there." },
        { id = "h_denial", when = { metBefore = true }, text = "I didn't eat the pie. I didn't! Ma says I did. Ma's wrong. Mostly." },
      },
      again = {
        { id = "h_again", text = "What? I'm listening. I'm always listening. That's how I know things." },
        { id = "h_again2", text = "Ask me something else. Not about the necklace." },
      },
      choices = {
        { text = "Are you sure you didn't take it?", next = "sure" },
        { text = "Where were you playing?", next = "mine", when = { any = { { questActive = TODO_QUEST("Goldtooth") }, { questDone = TODO_QUEST("Back to Billy") } } } },
        { text = "Tell me about your sister.", next = "maybell" },
        { text = "Aren't you scared of kobolds?", next = "kobolds" },
        { text = "I could teach you to lift a purse.", next = "rogue", when = { class = "ROGUE" } },
        { text = "See you, Billy.", next = "END" },
      },
    },

    sure = {
      lines = { { id = "s_default", text = "I'm a Maclure. We don't steal from Stonefields. We just don't talk to them. That's different. Ma says." } },
      choices = {
        { text = "That's not an answer.", next = "sure_push" },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    sure_push = {
      lines = { { id = "sp_default", text = "It is too an answer. It's a Maclure answer. You just don't speak Maclure." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    mine = {
      lines = {
        { id = "s_slip", key = true,
          text = "Near Fargodeep Mine. Not in it. Near it. And I dropped- I mean I SAW the necklace there. Seeing's different." },
      },
      choices = {
        { text = "You dropped it.", next = "mine_caught", fx = { trait = { skeptical = 1 } } },
        { text = "Of course you saw it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    mine_caught = {
      lines = {
        { id = "mc_default", text = "Saw! I said saw! Don't tell Auntie Bernice. She'll bake me a pie with nails in." },
      },
      choices = {
        { text = "Your secret's safe. This time.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "You should tell her yourself.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    maybell = {
      lines = {
        { id = "m_river", key = true,
          text = "Maybell's at the river again. She's always at the river. I'm not saying anything. I'm just saying." },
      },
      choices = {
        { text = "Why the river?", next = "maybell_why" },
        { text = "Leave your sister be.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    maybell_why = {
      lines = {
        { id = "mb_default", text = "She says counting grapes. There aren't any grapes at the river. I checked. Twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } } },
    },

    kobolds = {
      lines = {
        { id = "k_default", text = "No. Well. The big one, a bit. He's got a gold tooth and he screams if you go near his candles. Kobolds are weird about candles." },
      },
      choices = {
        { text = "Stay away from the mine, Billy.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "kobolds" } } },
        { text = "Ha. Do it again.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    rogue = {
      lines = {
        { id = "ro_default", text = "Really? No. Ma would skin me. And Maybell would. And Auntie Bernice, and she's not even my auntie." },
      },
      choices = {
        { text = "Smart lad.", next = "BACK", fx = { affinity = 1 } },
        { text = "Your loss.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Billy. I live at the vineyard. That's it. That's everything. I didn't do anything." } },
    advice = { { id = "tp_ad", text = "If you're hungry, say you can't remember things. Grown-ups give you pie." } },
    maybell_tommy = { { id = "tp_lovers", text = "Maybell goes to the river a LOT. I'm not saying anything. I'm just saying." } },
    kobolds = { { id = "tp_kobolds", text = "They live in the mines and they like shiny stuff. And candles. Weird." } },
    _none = { { id = "tp_none", text = "I don't know. I'm a kid. Ask a grown-up. Not Auntie Bernice." } },
  },
}
