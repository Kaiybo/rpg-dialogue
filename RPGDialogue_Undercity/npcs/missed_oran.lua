-- Oran Snakewrithe, moved here from the Hinterlands roster (a later-era placement). Voice: bibles/missed_oran.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Oran Snakewrithe: Forsaken scholar of the Witherbark, in the Undercity's Magic Quarter.
P:NPC {
  key = "hl_oran_snakewrithe", id = TODO_NPC("Oran Snakewrithe"), name = "Oran Snakewrithe", gender = "female",
  bible = "bibles/missed_oran.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "dry", "curious" }, values = { "knowledge", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Oran Snakewrithe keeps to the Magic Quarter of the Undercity and is known as the scholar to ask about the Witherbark trolls of the Hinterlands. She examined me as if I were a tablet that she had not yet decided was genuine.",
    third = "{name} met Oran Snakewrithe, the Undercity's scholar of the Witherbark trolls.",
  },
  greetings = {
    { id = "g_default", text = "Yes? If you have brought me something to read, set it down gently, and if you have not, tell me why you are here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust that you have been somewhere interesting, since you were of little use standing here." },
    { id = "g_tablet", when = { questActive = TODO_QUEST("Rin'ji's Secret") }, text = "Well, now, what is this that you are carrying? Do not hold it by the edge like that, for it has survived the trolls and I should hate for it to perish of you." },
    { id = "g_thanks", when = { questDone = TODO_QUEST("Oran's Gratitude") }, text = "Ah, the finder of the tablet. I have not finished with it yet, and I have you to thank for a good many sleepless nights, which is no hardship to me." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. You will tell me that your tribe is nothing like the Witherbark, and you will be correct, and I shall ask you questions about them anyway." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of our own. Then you know that the dead have time for scholarship, and you will not ask me why I bother." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "You have had some schooling, I perceive. Then I may use words of more than two syllables without stopping to explain them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Oran Snakewrithe. I study the Witherbark trolls, their script, their rites and their unpleasant habits, because the Dark Lady has interests in the Hinterlands and it is unwise to walk into a country knowing nothing of who lives in it." },
        { id = "h_tablet", when = { questActive = TODO_QUEST("Rin'ji's Secret") }, text = "This tablet is quite unusual, and it is covered in Witherbark markings of a kind I have seldom seen. Where did you find it, {class}, and who gave it up?" },
        { id = "h_done", when = { questDone = TODO_QUEST("Oran's Gratitude") }, text = "You found that tablet on a deserted island below the Overlook Cliffs, and I have thought of little else since. Our Dark Lady was pleased by the discovery, and she is not easily pleased." },
      },
      again = {
        { id = "h_again", text = "What else? I can spare a few more minutes from the dead languages." },
        { id = "h_again2", text = "Ask, then." },
      },
      choices = {
        { text = "Who are the Witherbark?", next = "witherbark" },
        { text = "How do you study trolls from a cellar?", next = "study" },
        { text = "What does the Dark Lady want with the Hinterlands?", next = "lady" },
        { text = "I met a Witherbark named Rin'ji.", next = "rinji", when = { questDone = TODO_QUEST("Rin'ji's Secret") } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },
    witherbark = {
      lines = { { id = "w_default", text = "A tribe of forest trolls, kin to the Amani who once ruled all this northland. They hold villages in the Hinterlands and in Arathi, they worship a spider loa, and they have declined every invitation to rejoin the Horde.", fx = { learn = { "revantusk" } } } },
      choices = {
        { text = "A spider loa?", next = "spider" },
        { text = "Why did they refuse the Horde?", next = "refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spider = {
      lines = { { id = "sp_default", text = "Shadra, whom they call the Venom Queen, and to whom they have raised an altar in the eastern Hinterlands. Their priests milk her children for poison, which tells you a good deal about the Witherbark notion of piety." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refuse = {
      lines = { { id = "r_default", text = "They followed the old Horde in the Second War and felt abandoned when it fell, so now they trust no one. Only the Revantusk on the coast kept faith with the orcs, and the other tribes despise them for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    study = {
      lines = { { id = "s_default", text = "By reading what others risk their necks to bring me. A scholar who visits the Witherbark in person contributes one skull to their collection and nothing to mine, so I remain here and reward the couriers." } },
      choices = {
        { text = "So I take the risk and you take the credit.", next = "credit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    credit = {
      lines = { { id = "c_default", text = "Precisely, and I am glad that we understand each other. You will find that I write the finder's name in the margin, which is more immortality than most of the living ever get." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lady = {
      lines = { { id = "l_default", text = "It is not my place to say, nor yours to ask so loudly. I will observe only that the Forsaken have few friends, and that a land full of the Alliance's dwarves and elves bears watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rinji = {
      lines = { { id = "ri_default", text = "A Witherbark in distress will do nearly anything to get out of it, including handing a secret to a stranger. Whether he meant to give away something valuable or merely something heavy, I am still determining." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a scholar of Lordaeron before the plague. I see no reason why death should interrupt my reading." } },
    revantusk = { { id = "tp_rv", text = "The one forest troll tribe that kept faith with the Horde. They have a village on the Hinterlands coast." } },
    _none = { { id = "tp_none", text = "That is outside my study, and I do not offer opinions on what I have not read." } },
  },
}
