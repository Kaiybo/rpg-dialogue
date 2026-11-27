-- The Temple of Atal'Hakkar (Sunken Temple), Swamp of Sorrows: the Shade of Eranikus, the green
-- dragon set to guard the Atal'ai and slowly driven mad by the Nightmare, who speaks before fighting.
-- Voices: bibles/dg_eranikus.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Elder Starsong: Lunar Festival elder, a night elf spirit in the Pit of Sacrifice.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_elder_starsong", id = 15593, name = "Elder Starsong", role = "questgiver", tier = "quest",
  temper = { "serene", "gentle" }, values = { "tradition", "memory" },
  notices = { "race", "quest" },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. You have walked through the Atal'ai's dark halls to reach me, and the ancestors see your courage." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival lanterns burn in Moonglade, and still I come down into this drowned temple to keep my watch. Stay a little, child, and let the old ways warm you even here." },
    { id = "g_done", when = { questDone = TODO_QUEST("Starsong the Elder") }, text = "Your coin carries my blessing now. Go gently, and may Elune light your way out of this sunken place." },
  },
  start = "hello",
  nodes = {
    w8_grn = {
      lines = { { id = "w8_grn_a", text = "They do, though they do not speak to me, for they are troubled in their sleep and their eyes see something I cannot. Each festival I sing them an old kaldorei song from before the Sundering, and each year they listen a little less." } },
      choices = {
        { text = "What troubles their sleep?", next = "w8_grn2" },
        { text = "Keep singing to them, Elder.", next = "w8_grn2" },
        { text = "I know some of those songs, Elder.", next = "w8_grn2", when = { race = "NightElf" } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    w8_grn2 = {
      lines = {
        { id = "w8_grn2_a", text = "Something in the Dream, child, a shadow I feel only at the edges, like cold water under warm. I do not know its name, and I will keep singing, because a song is the only thing I have left to give them." },
        { id = "w8_grn2_ne", when = { race = "NightElf" }, text = "Then sing with me, child, softly, for two voices carry further than one in these drowned halls. Perhaps the dragons will remember a little more of the waking world if they hear it from the young as well as the old." },
      },
      choices = {
        { text = "May Elune keep them.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Starsong, an elder of my people, and each Lunar Festival I wait here for those who honour the ancestors. This temple was built for a blood god, but even here the old ways may be remembered." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "A child of Elune, so far from Teldrassil. I am Starsong, elder of our people, and it warms me to see a kaldorei face beneath these drowned stones." },
      },
      again = { { id = "h_again", text = "Ask, young one. The festival will not last forever." } },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Why wait in this cursed temple?", next = "why" },
        { text = "I have come for your blessing, elder.", next = "blessing" },
        { text = "Elune be with you, elder.", next = "nelf", when = { race = "NightElf" } },
        { text = "Do you remember the old kaldorei?", next = "yold" },
        { text = "Does Hakkar's evil touch the festival?", next = "yhakkar" },
        { text = "Do the green dragons here know you, Elder?", next = "w8_grn" },
        { text = "Farewell, elder.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the season when we honour those who came before us, when the Moonglade opens its paths and Elune's light falls on all who seek it. The elders scattered across the world wait to share their wisdom with those who seek them." } },
      choices = {
        { text = "What wisdom do you share?", next = "festival2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival2 = {
      lines = { { id = "f2_default", text = "That pride is a long fall, and the Atal'ai learned it here when the Green Dragonflight drowned their temple. Remember them, and remember your own ancestors, and you will not repeat their folly." } },
      choices = {
        { text = "The old ways keep us humble.", next = "BACK", reply = "They do, and humility has saved more lives than any sword.", fx = { align = { order = 1 } } },
        { text = "The future matters more than the past.", next = "BACK", reply = "Perhaps, but the future is built on the past, whether we wish it or not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because even the darkest places need a light, and because those who come here prove their courage. Hakkar's servants still stir in the depths, but they cannot touch an elder's spirit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    blessing = {
      lines = { { id = "b_default", text = "Then take this coin of ancestry, and carry my blessing with it. May it guide you through the new year as the stars guide travellers through the night." } },
      choices = { { text = "Thank you, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    nelf = {
      lines = { { id = "n_default", text = "And with you, child. Remember the Sentinels and the druids when you leave this place, and remember that the moon watches over all of us, even here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yold = {
      lines = {
        { id = "yo_default", text = "I remember the shores of the Well, and the songs we sang under the stars before the Sundering. I sang them myself, which is why they call me Starsong. Now I sing only once a year, and only for those brave enough to find me." },
        { id = "yo_nelf", when = { race = "NightElf" }, text = "I remember the shores of the Well and the songs before the Sundering, child, songs your grandmother's grandmother learned from mine. Will you sing one with me, softly, so the Atal'ai do not hear?" },
      },
      choices = {
        { text = "Why sing here, of all places?", next = "ysing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysing = {
      lines = { { id = "ys_default", text = "Because the green dragons who guard these halls are servants of Ysera, and I would remind them of the world they swore to protect. Some of them have begun to dream darkly. A song is a small thing, but they listen." } },
      choices = { { text = "May they listen well. Something else.", next = "BACK" } },
    },
    yhakkar = {
      narr = "The elder's glow tightens, drawing close around her like a shawl.",
      lines = { { id = "yh_default", text = "It presses on me, here, like a hand on the chest. The Atal'ai would wake a god of blood, and some say the only answer is to slay every priest in these halls. Others say the dragons should be left to contain them. What would you choose?" } },
      choices = {
        { text = "Slay the priests. Hakkar must not rise.", next = "BACK", reply = "A hard choice, but perhaps a needed one.", fx = { align = { order = -1 } } },
        { text = "Trust the dragons' watch. It has held.", next = "BACK", reply = "It has held, yes. I pray it holds a little longer.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is beyond an old spirit's knowledge, young one." } } ,
    lunar_festival = { { id = "yt_lunar", text = "Once each year the elders return, scattered across the world, to be honoured by those who seek them." } },
    atalai = { { id = "yt_atal", text = "The Atal'ai sought to summon their blood god, and the dragons drowned their temple for it. They still have not learned." } },
    elune = { { id = "yt_elune", text = "Elune's light falls even through the swamp water above us. I have watched it, every festival." } },
    green_dragons = { { id = "yt_green", text = "Ysera's children guard this temple. They are troubled in their sleep, and I do not know why." } },
  
},
}
