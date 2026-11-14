-- High Elder Talaanis Shadowsong, Zephras Isle. Voice: bibles/talaanis.md
-- Everything here comes from the Skyborne lore brief (build prompt §10). Where it is silent,
-- she is silent too.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "talaanis", id = TODO_NPC("Talaanis Shadowsong"), name = "Talaanis Shadowsong", title = "High Elder",
  bible = "bibles/talaanis.md", role = "noble", tier = "major",
  communities = { "zephras_isle" }, temper = { "steady" }, values = { "honest", "lawful" },
  notices = { "kin", "stranger" },

  greetings = {
    { id = "g_winds", text = "Winds be with you." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "A guest. We have few. Winds be with you all the same." },
    { id = "g_back", when = { metBefore = true, race = "Skyborne" }, text = "Back again, child. The Council can spare me a moment. Barely." },
  },

  notice = {
    { id = "n_druid", cat = "kin", when = { race = "Skyborne", class = "DRUID" },
      text = "A druid. There are so few of you. Your faith leans to the elements before Elune; don't let anyone on the mainland tell you that's backwards." },
    { id = "n_shaman", cat = "kin", when = { race = "Skyborne", class = "SHAMAN" },
      text = "A Windshaper. You've passed your trials, then. Good. The elements will need more friends than ever, now our patrons are gone." },
    { id = "n_mage", cat = "kin", when = { race = "Skyborne", class = "MAGE" },
      text = "The High Order's newest. Your ancestors were magisters. Remember it, and remember what Prince Tortheldrin did with power like theirs." },
    { id = "n_stranger", cat = "stranger", when = { ["not"] = { race = "Skyborne" } },
      text = "You're the first of your people I've spoken with. I find I have more questions than manners. Forgive me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Talaanis Shadowsong, High Elder, by the Council's choice and much against my own. Ask what you need to." },
        { id = "h_alliance", when = { race = "Skyborne", faction = "Alliance" },
          text = "The High Order has gone to the Kirin Tor. Elaadrin Evengale leads them from the Sky Enclave in Dalaran. Go with my blessing, and with your temper in hand." },
        { id = "h_horde", when = { race = "Skyborne", faction = "Horde" },
          text = "Ayessa Dawnsinger has taken the Windshapers to the Horde, to Camp Gev'rek in Mulgore. Go with my blessing. Don't go looking for the High Order's people. Not yet." },
        { id = "h_young", when = { race = "Skyborne", maxLevel = 5 },
          text = "You'll have been given your heirloom not long ago. Someone carried it before you, and someone will after. Remember that when you're tempted to be reckless with it." },
        { id = "h_died", when = { race = "Skyborne", deaths = { min = 3 } },
          text = "You've fallen more than once already. We scatter our dead to the wind, child. Don't make me stand on a cliff for you." },
      },
      choices = {
        { text = "Why did we leave Skywall?", next = "skywall", when = { race = "Skyborne" } },
        { text = "Who are the Skyborne?", next = "who", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Why do the two orders quarrel?", next = "orders" },
        { text = "What became of the Shal'nan?", next = "shalnan" },
        { text = "Winds be with you, Elder.", next = "END" },
      },
    },
    skywall = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "Our patrons fell silent, then vanished. The pylons failed. The islands began to drift. Then the Al'Aketh lit a beacon for the Windlord's faithful, and Rohash threatened to tell him we were there." },
      },
      choices = {
        { text = "And so we left.", next = "windlord" },
        { text = "Will Al'Akir come for us?", next = "windlord" },
      },
    },
    windlord = {
      lines = {
        { id = "w_default", key = true,
          text = "I told the Council the Windlord might take years to act. Decades, even. I did not say never. Everyone heard the first part." },
      },
      choices = {
        { text = "Then we have time.", next = "END", fx = { trait = { brave = 1 } } },
        { text = "Then we should be ready.", next = "END", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Shen'dorei. The hidden people. Our ancestors left Eldre'Thalas ten thousand years ago rather than kneel to a prince who drank from the Nether. We hid. Now we've stopped hiding." },
      },
      choices = {
        { text = "Welcome back to Azeroth.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Why stop now?", next = "skywall" },
      },
    },
    orders = {
      big = true,
      lines = {
        { id = "o_default", text = "The High Order wants back what the magisters knew. The Windshapers feel they owe the spirits everything. Both are right. There have been deaths over sacred places. Both remember them." },
      },
      choices = {
        { text = "Someone has to make peace.", next = "END", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then let them settle it.", next = "END", fx = { trait = { stern = 1 } } },
      },
    },
    shalnan = {
      lines = {
        { id = "sh_default", text = "Our first leader. The Shal'nan gave up the seat and vanished along with the spirits. Where, I don't know. Nobody knows. That's why we have a Council." },
      },
      choices = { { text = "I hope they're found.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    al_aketh = { { id = "tp_aketh", text = "Grey robes, shaved heads, and worship for a Windlord our own patrons would hardly speak of. Ansirem Runeweaver and Muln Earthfury helped us break them once. Once may not be enough." } },
    two_orders = { { id = "tp_orders", text = "Two roads out of the same house. I'd like them both to come home for dinner, someday." } },
    shal_nan = { { id = "tp_shalnan", text = "Gone with the spirits. If you hear anything, anything at all, you bring it to me first." } },
    windstones = { { id = "tp_windstones", text = "They light our lamps and fill our purses. When they fail, I suspect we'll learn which mattered more." } },
    _none = { { id = "tp_none", text = "The Council has many questions and fewer answers. That's one of the many." } },
  },
}
