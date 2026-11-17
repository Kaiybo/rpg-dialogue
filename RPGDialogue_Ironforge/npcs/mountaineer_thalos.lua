-- Mountaineer Thalos, at the Coldridge Valley mouth of Coldridge Pass. Voice: bibles/mountaineer_thalos.md
-- Keeps the tunnel; turns back anyone without good reason to brave the troggs inside.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mountaineer_thalos", id = TODO_NPC("Mountaineer Thalos"), name = "Mountaineer Thalos",
  title = "Mountaineer",
  bible = "bibles/mountaineer_thalos.md", role = "soldier", tier = "quest",
  communities = { "coldridge" }, temper = { "steady" }, values = { "duty", "careful" },
  notices = { "greenness", "kit" },

  impression = {
    first = "Mountaineer Thalos keeps the mouth of Coldridge Pass and turns back anyone without good reason to go through. He judged me with one long look, and I was glad to pass it.",
    third = "{name} met Mountaineer Thalos, who guards the Coldridge end of the trogg-infested pass to Kharanos.",
  },

  greetings = {
    { id = "g_pass", text = "Hold there. Nobody goes through the pass without a reason, an' a good one." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see, which is more than I can say fer some who've gone through." },
    { id = "g_obs", when = { questActive = TODO_QUEST("Senir's Observations") }, text = "Grelin's report fer Senir? Then ye've a reason, an' I'll no' stand in yer way." },
    { id = "g_adv", when = { questActive = TODO_QUEST("The Adventurer") }, text = "Ye've got the bundle, then. The fellow's camped just outside Kharanos, an' he'll be glad o' it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the tunnel hasn't got any friendlier. Welcome back tae the valley." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "I near turned ye back the first time ye came up tae this pass, an' now I'd send ye through it alone. Funny how that goes." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word from Anvilmar is ye've been doin' good work in the valley. That counts fer somethin' at this tunnel." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "They tell me ye spun somebody a tale. Ye'll find I'm harder tae fool than most, so give me the plain truth." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Ye're too green fer that tunnel yet. Come back when ye've a few more scrapes on ye." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer armor's in tatters, an' the troggs in there hit harder than the ones in the hills. Get it mended first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mountaineer Thalos. My job's tae keep folk out o' Coldridge Pass unless their business is worth the risk, for the troggs in there have no hesitation at all about attackin' travellers." },
        { id = "h_obs_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Senir's Observations"), days = 3 } },
          text = "So Grelin's report went through after all. Just keep followin' the road out the far side, an' it'll run right intae Kharanos." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome headin' fer Kharanos, eh? Most o' yer folk are there now, since Gnomeregan. The tunnel's no worse than what ye left behind, I'd guess." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Keep yer beast close in the tunnel, for it's narrow an' dark an' the troggs come at ye from the side passages." },
      },
      again = {
        { id = "h_again", text = "Anythin' else before ye go in?" },
        { id = "h_again2", text = "Ask away. The tunnel's no' goin' anywhere." },
      },
      choices = {
        { text = "What's waiting in the pass?", next = "pass" },
        { text = "What's on the other side?", next = "kharanos" },
        { text = "Who decides what counts as a good reason?", next = "reason" },
        { text = "Grelin's report. Is it trouble?", next = "report", when = { questActive = TODO_QUEST("Senir's Observations") } },
        { text = "Any errands before I go through?", next = "BUSINESS" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    pass = {
      lines = { { id = "p_default", text = "Troggs, dug intae the walls like ticks in a hide. The tunnel was built fer carts an' travellers, an' now it's full o' the ugly beasts, comin' up from somewhere deeper." },
      },
      choices = {
        { text = "Why not clear them out?", next = "pass_clear" },
        { text = "How do I get through alive?", next = "pass_alive" },
      },
    },
    pass_clear = {
      lines = { { id = "pc_default", text = "We do, an' they come back. There's only so many mountaineers, an' most o' them are needed on the roads further east. So I stand here an' turn back the ones who'd only feed the troggs." },
      },
      choices = {
        { text = "Then the ones you let through should clear as they go.", next = "pass_duty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass_duty = {
      big = true,
      lines = { { id = "pd_default", text = "I'll no' ask it of anybody, but I'll no' complain if they do. Some go through quiet an' fast, an' some fight every step, an' I've seen both come out the other side." },
      },
      choices = {
        { text = "Every trogg I leave alive hurts the next traveller.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll go quiet and fast. The troggs aren't my problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass_alive = {
      lines = { { id = "pa_default", text = "Keep tae the middle o' the tunnel, don't stop, an' don't go pokin' down the side passages, however curious ye are. Once ye see daylight, ye've made it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kharanos = {
      lines = { { id = "k_default", text = "Kharanos, an' a warm fire at the Thunderbrew, an' the road on tae Ironforge. Senir Whitebeard's there, an' Ragnar Thunderbrew, an' half the gnomes o' Gnomeregan, it feels like." },
      },
      choices = {
        { text = "Who's Senir Whitebeard?", next = "kharanos_senir" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kharanos_senir = {
      lines = { { id = "ks_default", text = "Grelin's brother, an' a wiser head than most in the Senate, though he'd never say so. He'll pour ye a drink an' complain about the cold, an' then he'll listen." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    reason = {
      lines = { { id = "r_default", text = "I do. If ye've a message, an errand, or the look o' somebody who can handle a trogg, ye go through. If ye're just curious, ye stay an' grow a bit first." },
      },
      choices = {
        { text = "That's fair. The rules keep people alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's my life to risk, not yours to judge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    report = {
      lines = { { id = "rp_default", text = "I didn't read it, an' I'll no' start now. But Grelin's been watchin' the Frostmane fer weeks, an' I doubt he's writin' that all's well." },
      },
      choices = { { text = "Then I'll get it to Senir quickly.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A mountaineer o' Ironforge, posted where the troggs are thickest. That's all the story I need." } },
    advice = { { id = "tp_ad", text = "Don't stop in the tunnel. Whatever ye hear, keep walkin' toward the light." } },
    troggs = { { id = "tp_troggs", text = "They're in the walls o' the pass, an' they'll be in the walls o' yer dreams after." , next = "pass" } },
    _none = { { id = "tp_none", text = "Not my business, friend. My business is this tunnel." } },
  },
}
