-- Orendil Broadleaf, herbalist and healer at Maestra's Post (0.72.0). Voice: bibles/orendil.md
-- Classic: Bathran's Hair, Orendil's Cure (for Pelturas Whitemoon's sick child in Astranaar).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "orendil", id = TODO_NPC("Orendil Broadleaf"), name = "Orendil Broadleaf",
  bible = "bibles/orendil.md", role = "questgiver", tier = "quest",
  communities = { "maestras_post" }, temper = { "gentle", "earnest" }, values = { "healing", "nature" },
  notices = { "craft", "weary" },
  impression = {
    first = "He is not too proud to say his cure may fall short.",
    third = "{name} met Orendil Broadleaf, a healer at Maestra's Post who brewed a cure for Pelturas Whitemoon's sick daughter from Bathran's Hair.",
  },

  greetings = {
    { id = "g_hello", text = "Ashenvale is a lush forest and a pleasure to walk, friend, so long as you remember it bites." },
    { id = "g_hair", when = { questActive = TODO_QUEST("Bathran's Hair") }, text = "Bathran's Haunt lies north of here, toward Darkshore. The plant hides in the leaf litter, so look closely." },
    { id = "g_cure", when = { questActive = TODO_QUEST("Orendil's Cure") }, text = "Astranaar, friend, and quickly: the road south, then east. The child's father is waiting." },
    { id = "g_tear", when = { questDone = TODO_QUEST("Elune's Tear") }, text = "Pelturas wrote that his daughter sleeps through the night now. My cure was only the beginning of it, and I'm glad someone found the rest." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the forest has grown a little thicker since. So have the Horde's camps, I'm sorry to say." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you went into Bathran's Haunt for me, friend. I can see it in the way you stand." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reaches even Maestra's Post that you've been helping folk. A healer notices that kind of thing." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Bathran's Hair shows itself to those who know how to look, so you'll find it easier than most." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your gear is in tatters, friend, and I expect you are too underneath it. Sit a moment, and let me look at your hands at least." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Orendil Broadleaf. I gather herbs and do what healing I can for the Sentinels at the post, as my people have done since before there were posts to keep, and lately for folk further afield as well." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Bathran's Hair") },
          text = "There's a plant called Bathran's Hair that once grew in the old ruins of Bathran's Haunt, and it was known to cure ailments of the spirit. A child in Astranaar is sick, and I believe it is more than a sickness of the body, so I may need it." },
        { id = "h_hair_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bathran's Hair"), days = 3 } },
          text = "You have the hair! I'll mix the cure at once, and pray it works. And Forsaken at Bathran's Haunt, you say? That troubles me very much." },
        { id = "h_cure", tags = { "news" }, when = { questActive = TODO_QUEST("Orendil's Cure") },
          text = "The cure is ready, and I believe it will help the child. Take it to Astranaar and give it to her father, Pelturas Whitemoon." },
        { id = "h_cure_done", when = { questDone = TODO_QUEST("Orendil's Cure") },
          text = "Pelturas tells me the cure eased her, but did not end it. I feared as much; whatever has hold of her has deeper roots than any herb of mine can reach." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Then you'll know that some sicknesses grow from the land itself, and an herb can only treat what the land has not decided to keep." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I can talk while I sort leaves." },
        { id = "h_again2", text = "Go on. The herbs keep, as long as I keep them dry." },
      },
      choices = {
        { text = "What's wrong with the child?", next = "child" },
        { text = "What is Bathran's Haunt?", next = "haunt" },
        { text = "Maestra's Post looks worn thin.", next = "post" },
        { text = "I saw Forsaken at Bathran's Haunt.", next = "forsaken", when = { questDone = TODO_QUEST("Bathran's Hair") } },
        { text = "Teach me something about Ashenvale's herbs.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Could my healing help the child?", next = "heal_o", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "How can I help?", next = "BUSINESS" },
        { text = "Goodbye, Orendil.", next = "END" },
      },
    },

    child = {
      lines = {
        { id = "ch_default", text = "She has fevers that come and go, and nightmares that leave her shaking in the morning. Pelturas has tried every remedy the priestesses could offer, and none of them reach whatever it is." },
      },
      choices = {
        { text = "You must have some idea what it is.", next = "child_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    child_think = {
      lines = {
        { id = "ct_default", text = "Something of the spirit, I believe, the kind of sickness that grows in a land where too much has gone wrong. Ashenvale has seen fighting and worse, and children feel it before the rest of us." },
      },
      choices = {
        { text = "Then the forest itself is sick.", next = "child_forest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    child_forest = {
      big = true,
      lines = {
        { id = "cf_default", text = "Parts of it, yes, where the Horde's axes and the furbolgs' madness have been. I don't say that to frighten you, friend, only so that you know why I go looking for old cures in old ruins." },
      },
      choices = {
        { text = "Then the Horde must be driven out of the forest.", next = "BACK", reply = "Perhaps, and the Sentinels are trying, Elune knows. But the forest can't wait for the war to end before it heals.", fx = { align = { light = -1 } } },
        { text = "Then we heal what we can, where we can.", next = "BACK", reply = "That's all I ask of anyone, friend, and it's more than most give. Thank you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    haunt = {
      lines = {
        { id = "ha_default", text = "They're old ruins to the north, near the Darkshore border, named for Bathran, who lived there long ago. The plant grew among the stones and nobody has gathered it in years, because few go there willingly now." },
      },
      choices = {
        { text = "Why does no one go there?", next = "haunt_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    haunt_why = {
      lines = {
        { id = "hw_default", text = "The name, partly, and the stories about it, which grow with every telling. I don't believe in haunts, friend, but I do believe in the things that like to live where others are afraid to go." },
      },
      choices = {
        { text = "I'll go carefully.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Goodbye, Orendil.", next = "END" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "We hold the road between Darkshore and Astranaar, and the Sentinels here are tired. I bind their cuts and brew them teas and try not to count how many of them come back each week." },
      },
      choices = {
        { text = "That must be hard.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "fo_default", text = "The Undercity's dead, digging about in our ruins this far north? Whatever they want there, it isn't Bathran's Hair. I'll send word to Astranaar tonight." },
      },
      choices = {
        { text = "Let me drive them out before they settle in.", next = "BACK", reply = "Thank you, and be careful, for they don't fight like the living. Astranaar will want to know what you find.", fx = { align = { honor = -1 } } },
        { text = "Find out what they want before anyone strikes.", next = "BACK", reply = "That's wise, and the Sentinels will be grateful for it. Knowing what they want might save a great deal of blood.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Look for briarthorn along the shaded banks and mageroyal where the sun breaks through. And if a plant here smells sweet and wrong at once, leave it, because something has been at the soil." },
      },
      choices = {
        { text = "Sweet and wrong. I'll remember.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_o = {
      lines = {
        { id = "ho_default", text = "You might ease her for a night, and that is worth doing, so go if you can. But if I'm right about her sickness, it will take more than any one of us to lift it." },
      },
      choices = {
        { text = "Then I'll try, at least.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an herbalist with a healer's habits. I've spent more years kneeling in leaf litter than standing up, and I don't regret it." } },
    advice = { { id = "tp_ad", text = "Never pick a plant you can't name, friend. Ashenvale is generous, but it isn't always kind." } },
    sentinels = { { id = "tp_sentinels", text = "They're brave, all of them, and too few. Bring them your bandages if you've any to spare." } },
    elune = { { id = "tp_elune", text = "I pray to Elune while I work, mostly for patience with the roots. She seems to answer that prayer more than others." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids tell me herbs in the Dream grow without blight. I'd like to see that, though I doubt I'd ever want to come back." } },
    green_dragons = { { id = "tp_green_dragons", text = "There's a grove south of here where a green dragon sleeps, and the herbs there grow strangely. I gather near it carefully, and I don't stay long." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss creeps into the wrong places and kills what it touches. I pull it out where I can, and wash my hands three times after." } },
    _none = { { id = "tp_none", text = "That's beyond my herb bag, friend. Ask in Astranaar, where the Sentinels keep longer memories than mine." } },
  },
}
