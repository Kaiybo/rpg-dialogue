-- Zor Lonetree, Elder Far Seer in Grommash Hold. Voice: bibles/zorlonetree.md
-- A patient shaman who hears the land's complaints and has studied the Alliance more closely than most orcs care to.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zorlonetree", id = TODO_NPC("Zor Lonetree"), name = "Zor Lonetree", title = "Elder Far Seer",
  bible = "bibles/zorlonetree.md", role = "priest", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "He knows more about human politics than he lets on.",
    third = "{name} met Zor Lonetree, the Elder Far Seer in Grommash Hold, who listens to the spirits and studies the Alliance's politics.",
  },

  greetings = {
    { id = "g_hold", text = "Be welcome, {class}. Stand a while; the spirits are in no hurry, and neither am I." },
    { id = "g_stonetalon", when = { questActive = TODO_QUEST("The Spirits of Stonetalon") }, text = "Seereth waits in the Greatwood Vale. Follow the road west from the Crossroads, and listen to the trees as you go." },
    { id = "g_away", when = { away = 21 }, text = "You have been away {away}. The land has been speaking of someone with your step, out in the wide places." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "The spirits notice you more than they did, {class}. Strength draws their eyes, so be sure you are worth the watching." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear warm words about you in the hall. The spirits hear warm words as plainly as we do, and they like them nearly as much." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The elements walk with you. I can feel the earth shift a little when you stand still." },
    { id = "n_ghostwolf", cat = "form", when = { form = "ghostwolf" },
      text = "You come to the Warchief's hall wearing the wolf's spirit. Let it rest here a while; it has carried you far." },
  },

  start = "hello",
  nodes = {
    w2thrall = {
      lines = {
        { id = "w2th_shaman", when = { class = "SHAMAN" }, text = "That he listens, which you will know is rarer than it ought to be among us. The spirits came back to our people through him, young shaman, and they watch him the way an old wolf watches a pup that has learned to hunt." },
        { id = "w2th_default", text = "That he listens, which is rarer than it ought to be among orcs. The spirits came back to our people through him, and they watch him the way an old wolf watches a pup that has learned to hunt." },
      },
      choices = {
        { text = "Do they ever warn him?", next = "w2thrall2" },
        { text = "Watched like a pup? He is Warchief.", next = "w2thrall2" },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    w2thrall2 = {
      lines = { { id = "w2th2_default", text = "Often, and he does not always heed them, which is as it should be. A warchief who obeys every whisper is a puppet, and Thrall weighs what I tell him against what his people need. I would not have it otherwise." } },
      choices = { { text = "That is a wise balance.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "The spirits say very little about anyone, {class}, but I remember what the camps did to us. When the demon blood left our veins, many orcs simply sat down in the mud and stopped, and the humans thought it was their walls that held us." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "You were human once, so perhaps you will hear this without anger. When the demon blood left our veins, many orcs sat down in the camps' mud and stopped, and your old people thought it was their walls that held us." },
      },
      choices = {
        { text = "What held you, then?", next = "hu_stance" },
        { text = "That sickness was called the lethargy, wasn't it?", next = "BACK", reply = "It was, and the humans gave it the name, as they give everything a name. We had no word for it, only a silence where the spirits used to be.", fx = { learn = { "humans" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Our own shame held us, and the empty place where our shamans had been before Gul'dan. The humans were cruel jailers, but they did not make us sick; we did that ourselves, and Thrall cured it by bringing the spirits back, not by killing humans." },
      },
      choices = {
        { text = "Then the healing matters more than vengeance.", next = "BACK", reply = "It does, and the spirits answer those who think so. Go gently through Stonetalon, and you'll hear them answer you.", fx = { align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "They still built the camps. I won't excuse that.", next = "BACK", reply = "Nor should you, young one, and I don't. I only ask you to remember who was sick, and who merely held the key.", fx = { align = { light = -1 }, opinion = { humans = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zor Lonetree, Elder Far Seer of this hall. I listen to the spirits for the Warchief, and lately they have been complaining very loudly." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Spirits of Stonetalon") },
          text = "The spirits of the Stonetalon Mountains are angry, {class}. Goblins and their servants are cutting and burning the forests, the land has cried out, and those who listen for such things have heard it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Spirits of Stonetalon"), days = 5 } },
          text = "Seereth sends word that you came. The mountains are still wounded, but a wound that is tended is not the same as a wound left to fester." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman, and young. The Warchief brought the old ways back to our people, and every one of you who walks them makes the spirits a little less wary of orcs." },
      },
      again = {
        { id = "h_again", text = "Ask what else troubles you. There is time." },
        { id = "h_again2", text = "The spirits are still talking, and so may you. What more would you have from an old far seer?" },
      },
      choices = {
        { text = "What do the spirits say of humans?", next = "hu_view" },
        { text = "Something seems to be wrong in Stonetalon.", next = "stonetalon" },
        { text = "They say you know the Alliance well.", next = "alliance" },
        { text = "I've never known what a far seer does.", next = "farseer" },
        { text = "Teach me to listen to the land, Far Seer.", next = "listen", when = { class = "SHAMAN" } },
        { text = "What would you have of me?", next = "BUSINESS" },
        { text = "What do the spirits say of the Warchief?", next = "w2thrall" },
        { text = "Spirits guide you, Far Seer.", next = "END" },
      },
    },
    stonetalon = {
      lines = { { id = "s_default", text = "The Venture Company has come to the mountains with machines that eat trees, and they leave stumps and smoke from the Charred Vale to the Greatwood. Seereth Stonebreak, a promising shaman, went to see, and she asks for aid." } },
      choices = {
        { text = "Why should the Horde care about trees?", next = "trees", fx = { learn = { "venture_company" } } },
        { text = "Who is Seereth?", next = "seereth", fx = { learn = { "venture_company" } } },
      },
    },
    trees = {
      lines = { { id = "t_default", text = "Because the land remembers, {class}. We came to Durotar from the camps with nothing, and the spirits of this land took us in when they had every reason to refuse, so when the land cries out, the Horde is not free to shrug." } },
      choices = {
        { text = "Then the Horde should answer.", next = "trees_end" },
        { text = "The goblins are allies. We need their trade.", next = "trees_end" },
      },
    },
    trees_end = {
      big = true,
      lines = { { id = "te_default", text = "Trade is a good thing, and I would not end it. But no bargain is worth a mountain that hates us, and the goblins of the Venture Company answer to no one but their own purses." } },
      choices = {
        { text = "The land comes before any bargain.", next = "BACK", reply = "It does, and I'm glad to hear a young voice say it. The mountain remembers every tree, and it will remember who spoke for them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Horde needs what the goblins bring. Be practical.", next = "BACK", reply = "Practical is what the goblins call it, too, right before the hills burn. I'll not forbid trade, but I'll not forget the cost.", fx = { align = { order = 1 } } },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    seereth = {
      lines = { { id = "se_default", text = "A young orc with a good ear and a short temper, which is the right mix for the work. She is camped near the Greatwood Vale, west along the road from the Crossroads, and she will be glad of anyone who comes." } },
      choices = { { text = "I'll look for her. Something else.", next = "BACK" } },
    },
    alliance = {
      lines = { { id = "al_default", text = "I have read what I could of their kings and their councils, because a people should know its neighbors, even the ones it fought. Humans argue among themselves more than they fight us, and that is worth knowing." } },
      choices = {
        { text = "Why study our enemies so closely?", next = "alliance_why" },
        { text = "What do you make of Theramore?", next = "theramore" },
      },
    },
    alliance_why = {
      big = true,
      lines = { { id = "aw_default", text = "Because the Warchief seeks peace with some of them, and peace is built on knowing what the other side fears. A warrior learns his enemy's sword arm, and a far seer learns his enemy's heart." } },
      choices = {
        { text = "Knowing them may yet save lives.", next = "BACK", reply = "They may, and that is the hope I carry into every council. A heart understood is a war that may never need fighting.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their hearts don't matter. Their walls do.", next = "BACK", reply = "Walls fall, and hearts remain, young one. Learn both, and you'll see further than most warriors ever do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore = {
      lines = { { id = "th_default", text = "Lady Proudmoore keeps her word to the Warchief, and her own soldiers do not always keep hers. A treaty between two leaders is only as strong as the angriest soldier on either side." } },
      choices = { { text = "That's a grim truth. Something else.", next = "BACK" } },
    },
    farseer = {
      lines = { { id = "fs_default", text = "We listen, mostly, and we tell the Warchief what we hear, even when he would rather not. A far seer who only says pleasant things has stopped listening." } },
      choices = {
        { text = "That can't make you popular in this hall.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "li_default", text = "Be quiet longer than feels right, and then a little longer. The spirits speak softly to those who only want something from them, and clearly to those who simply want to know them." } },
      choices = {
        { text = "I'll practice the quiet, Far Seer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a shaman before the Horde forgot shamans, and I am one again now that it remembers. The years between are not worth the telling." } },
    advice = { { id = "tp_ad", text = "Listen first. Most mistakes are made by people who have not finished hearing." } },
    venture_company = { { id = "tp_vc", text = "Goblins who would sell the mountain itself if they could find a buyer. The spirits do not bargain, and they will learn that." } },
    thrall = { { id = "tp_thrall", text = "Thrall is a shaman, and that is why I trust him. A chieftain who listens to the land will not lead his people off a cliff, at least not on purpose." } },
    forsaken = { { id = "tp_forsaken", text = "The dead of Lordaeron are bound to this world by something that should have let them go. I pity them, and I watch them, and I pray the land will forgive us for taking them in." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore is a human with a long view, and that is rarer than you would think. She and the Warchief understand each other, and I hope their people learn to do the same." } },
    prestor = { { id = "tp_prestor", text = "The humans' king is gone, and a boy sits on the throne, and a noblewoman named Prestor whispers in his court. I know only what the traders say, but the land in the east is uneasy, and I do not know why." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of Stonetalon are screaming as the goblins cut the forest down. I hear them even here, and I fear what will happen if no one answers." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great leader and a great friend to the Horde. He listens to the land as I do, and he hears it more clearly." } },
    _none = { { id = "tp_none", text = "The spirits have said nothing to me of that, and I will not guess on their behalf." } },
  },
}
