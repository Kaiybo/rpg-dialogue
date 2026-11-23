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
    { id = "g_done", when = { questDone = TODO_QUEST("Starsong the Elder") }, text = "Your coin carries my blessing now. Go gently, and may Elune light your way out of this sunken place." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = { _none = { { id = "tp_none", text = "That is beyond an old spirit's knowledge, young one." } } },
}
