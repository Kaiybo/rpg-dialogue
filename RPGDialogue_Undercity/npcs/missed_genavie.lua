-- Genavie Callow, moved here from the Arathi roster (a later-era placement). Voice: bibles/missed_genavie.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Genavie Callow: Forsaken in the Undercity's Trade Quarter; her quarrel is with the Dabyries of Arathi.
P:NPC {
  key = "ar_genavie_callow", id = TODO_NPC("Genavie Callow"), name = "Genavie Callow", gender = "female",
  bible = "bibles/missed_genavie.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "bitter", "furious" }, values = { "vengeance", "status" },
  notices = { "race", "class" },
  impression = {
    first = "Genavie Callow stands in the Trade Quarter of the Undercity and seethes about a family called Dabyrie, who farm in Arathi and who robbed her after the plague took everything else. She no longer wants her things back, only their heads.",
    third = "{name} met Genavie Callow, a Forsaken noblewoman in the Undercity who wants the Dabyrie family of Arathi dead.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone who kills for a living. Good, because I have been waiting for exactly that." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me that Kenata Dabyrie is no longer breathing, or tell me nothing at all." },
    { id = "g_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "Ah, it is you. I have looked at their faces every day since, and I find I do not tire of it." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You died too, so you know what it is to wake and find that the living have helped themselves to your life." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You still have a pulse, and I shall try not to hold it against you. It is the fat, thriving, human living that I cannot bear." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A knife in the dark would do nicely, though I confess I should prefer that they see it coming." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Genavie Callow, and there was a time when that name opened doors in Lordaeron. The plague took my family, the war took our estate, and then a woman named Kenata Dabyrie took the little that was left." },
        { id = "h_active", when = { questActive = TODO_QUEST("To Steal From Thieves") }, text = "Kill them all, Kenata and her two wretched children, and bring me their heads. The farm lies northeast of the Alliance's camp at Refuge Pointe." },
        { id = "h_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "Three heads, and all of them wearing the same surprised look. I thought that revenge might feel hollow, and I am pleased to report that it does not." },
      },
      again = {
        { id = "h_again", text = "What else do you wish to pick over?" },
        { id = "h_again2", text = "Ask, then. I have nothing left but time." },
      },
      choices = {
        { text = "What did the Dabyries take from you?", next = "took" },
        { text = "Who was your family?", next = "family" },
        { text = "Where do I find these Dabyries?", next = "farm" },
        { text = "You call yourself Forsaken as if it were an insult.", next = "forsaken" },
        { text = "I woke in a grave too. Did anyone come back for you?", next = "nobody", when = { race = "Scourge" } },
        { text = "I've heard enough.", next = "END" },
      },
    },
    took = {
      lines = { { id = "t_default", text = "The last precious belongings I had, the few things saved when the estate was looted and burned. Kenata was beneath us then, and she had the audacity to carry them off while I lay dead." } },
      choices = {
        { text = "Do you want them returned?", next = "returned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    returned = {
      lines = { { id = "r_default", text = "I did, once. I no longer care for the things themselves, because I have had a long while down here to think, and what I want now is for her to have nothing either." } },
      choices = {
        { text = "Her children as well?", next = "children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Fardel and Marcel are grown, and they have eaten well off what was mine. My own family did not get the mercy of growing old, so do not ask me to weep for hers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "f_default", text = "The Callows were an old house, with land and a good name and a pew near the front. Every one of them died in the plague, and I alone got up again, which I have never been certain was a favour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    farm = {
      lines = { { id = "fa_default", text = "They keep a farmstead in the Arathi Highlands, northeast of Refuge Pointe, and I am told it is healthy and prospering. Stromgarde's riders pass that way, so do not linger over the work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nobody = {
      lines = { { id = "nb_default", text = "No one, and I waited longer than I care to admit. I clawed my way out of the family crypt alone, and the first living face I saw screamed and threw a lamp at me, so you will understand why I am done waiting on anyone's kindness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fo_default", text = "It is an accurate name, and I wear it. The Dark Lady gave us a city and a purpose, and I am grateful, but nothing she gives will make Kenata Dabyrie's good health any easier to stomach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a Callow of Lordaeron. Now I am a corpse with a grievance, and the grievance keeps me upright." } },
    _none = { { id = "tp_none", text = "I neither know nor care. Unless it concerns the Dabyries, do not trouble me with it." } },
  },
}
