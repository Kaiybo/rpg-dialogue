-- Un'Goro, one an earlier pass missed: Mor'vek, the Darkspear who watches the ravasaurs in the south-east of
-- the crater. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mor'vek: jungle troll of the Ravasaur Trainers, south-eastern Un'Goro Crater.
P:NPC {
  key = "morvek", id = TODO_NPC("Mor'vek"), name = "Mor'vek", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "ungoro_wilds" }, temper = { "wry", "patient" }, values = { "nature", "cunning" },
  notices = { "pet" },
  impression = {
    first = "Mor'vek is a Darkspear troll camped in the south-east of Un'Goro, close to where the ravasaurs hunt. His arms are scarred with old bites, and he talks about the raptors' venom the way a brewer talks about a difficult ale.",
    third = "{name} met Mor'vek, a Darkspear troll who studies the ravasaurs of Un'Goro Crater.",
  },
  greetings = {
    { id = "g_default", text = "Easy, mon, and keep ya voice low. The ravasaurs be huntin' just past those ferns, and they not be likin' strangers who shout." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and with all ya fingers. Dat be more than I can say for meself some days." },
  },
  notice = {
    { id = "n_raptor", cat = "pet", when = { pet = { family = "Raptor" } },
      text = "Now dat be a fine raptor you got walkin' beside you. {pet} be lookin' at my ravasaurs like a cousin from the city, and they be lookin' back." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, all the way down in this hole! Sit, and tell me if Sen'jin Village still smells of fish, because I be missin' it." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "I got no quarrel with you down here, where everything wants to eat us both the same. Just keep ya hands off my raptors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Mor'vek, of the Darkspear. My people been ridin' raptors since before we had a name for it, and when I heard this crater be breedin' a kind with poison in the bite, I came to see if a troll could make friends with one." } },
      again = {
        { id = "h_again", text = "What else you be wantin' to know, mon?" },
        { id = "h_again2", text = "Ask it soft, and I be answerin'." },
      },
      choices = {
        { text = "What makes the ravasaurs different?", next = "different" },
        { text = "Have you made friends with one yet?", next = "friends" },
        { text = "Those are bite scars on your arms.", next = "scars" },
        { text = "How do you survive out here?", next = "survive" },
        { text = "Good hunting, Mor'vek.", next = "END" },
      },
    },
    different = {
      lines = { { id = "d_default", text = "They be bigger than the raptors of the Barrens, and smarter, and the venomhide ones carry a poison dat stops a stegodon's heart. A raptor like dat don't need a pack to bring down big prey, so she not be learnin' to follow anybody." } },
      choices = {
        { text = "Then how would you ever tame one?", next = "tame" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "Not by force, I be sure of dat much. I think it must be from the egg, so she hatches lookin' at a troll's face, and even then her rider would need the venom in his own blood first or her first love-bite be his last." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "There be one old female who lets me sit forty paces off while she eats, and last season it was sixty. At dat rate, mon, I be scratchin' her chin about the time my grandchildren be grown." } },
      choices = { { text = "Patience suits you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scars = {
      lines = { { id = "s_default", text = "Every one be a lesson, and I can tell you which raptor gave it and what I did wrong. I been takin' a little of the venom on purpose, a scratch at a time, and it don't lay me out for three days anymore, only one." } },
      choices = {
        { text = "You poison yourself deliberately?", next = "poison" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "The witch doctors been doin' it with snakes since the old days on the islands, so it not be so mad as it sounds. My wife says it be exactly as mad as it sounds, and she be the one who has to sit up with me." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    survive = {
      lines = { { id = "su_default", text = "By rememberin' dat nothin' in this crater be at the top for long. The devilsaur eats the ravasaur, the ravasaur eats the troll, and the troll stays alive by bein' too small and too quiet to be worth the walk." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A raptor handler of the Darkspear, come to Un'Goro to learn the venomhides. They be teachin' me slow." } },
    devilsaurs = { { id = "tp_dv", text = "When the ground shakes, mon, you don't look for it. You just be somewhere else." } },
    _none = { { id = "tp_none", text = "Dat I couldn't tell you, mon. Ask up at the Refuge, they write everything down." } },
  },
}
