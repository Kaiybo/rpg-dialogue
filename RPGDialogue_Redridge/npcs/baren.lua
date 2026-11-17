-- Dockmaster Baren, Lakeshire docks. Voice: bibles/baren.md
-- The murlocs are out-fishing his fishermen.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baren", id = TODO_NPC("Dockmaster Baren"), name = "Dockmaster Baren",
  bible = "bibles/baren.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "witty" },
  notices = { "craft", "swim" },

  impression = {
    first = "Dockmaster Baren counts the boats out and back, and now he counts murlocs as well. He warned me about the loose planks like a man who's fallen through every one.",
    third = "{name} met Dockmaster Baren on the Lakeshire docks, where murlocs have been fouling the nets and outnumbering the boats.",
  },

  greetings = {
    { id = "g_dock", text = "Mind the planks; the third one's loose, and the fourth too, now I think of it." },
    { id = "g_fins", when = { questActive = TODO_QUEST("Murloc Poachers") }, text = "Fins? Bring me fins, because every fin's a fish saved." },
    { id = "g_after", when = { questDone = TODO_QUEST("Murloc Poachers") }, text = "The nets came up full this morning, full! I'd half forgotten what that looked like." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Then you'll understand. Lake Everstill was the best water in the kingdom, and now it's the best water in the kingdom for murlocs." },
    { id = "n_wet", cat = "swim", when = { questObjective = { TODO_QUEST("Murloc Poachers"), left = { max = 3 } } },
      text = "You smell like the east shore. That's a compliment, out here. It means you've been working." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Right up onto the planks, bold as you like, and they take nets, fish, and once a whole rowboat. If you'd stand the end of the dock at dusk with a blade, I'd count fewer of them and more of my boats." } },
      choices = {
        { text = "I'll stand the dock at dusk. Your boats will come home.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Murlocs are a fisherman's problem. I've orcs to fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Baren.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Ha! If you can creep into a murloc camp and come out with my nets and all your fingers, I'll tell the whole dock it was you. They've taken six nets since the thaw and a rowboat besides, and I'd like the boat back most." } },
      choices = {
        { text = "I'll get them back, and take a little extra.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Your nets and your boat, nothing more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Why have the murlocs moved inland?", next = "inland" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Freeze Lake Everstill? You'd freeze my boats in with them, and then I'd have to explain to the Magistrate why the mail's sat at the dock till spring. Thin them out on the shore, if you please, and leave my water wet." } },
      choices = {
        { text = "Careful work, then. Your boats stay safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A frozen lake would end it faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's wrong with the lake?", next = "lake" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Aye, there is. They come up thin, and the murlocs have taken the good spawning grounds along the east shore. My lads blame the orcs upstream, though nobody's walked up there to check." } },
      choices = {
        { text = "I'll walk up there and see to it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The murlocs have as much right to those waters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've the look of someone who'd sooner swim the lake as a seal than wait on my ferry." },
        { id = "h_default", text = "Baren, dockmaster. I count the boats out and count them back, and these days I count murlocs too, and there are more of them." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Murloc Poachers") },
          text = "They've packed the shore in bigger groups than I've ever seen, fishing like they're paid for it. At this rate there won't be a fish left in the lake." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Murloc Poachers") },
          text = "The east camp's the worst of them. Bring me their fins, as proof and as a warning to the rest." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Murloc Poachers"), days = 3 } },
          text = "The east shore's quiet now, and the fish don't know what to do with themselves." },
        { id = "h_sunfish", when = { questActive = TODO_QUEST("Selling Fish") },
          text = "Spotted sunfish, a good batch. Catch them yourself or take them off the murlocs. The fish won't mind which." },
        { id = "h_daniels", when = { heardLine = "daniels.h_default" },
          text = "Daniels told you his troubles? He's dry and I'm empty; Lakeshire's a lovely place for a holiday." },
        { id = "h_boats", when = { metBefore = true }, text = "Counted the boats this morning, and they're all there; counted the nets, and they're all there too. Something's about to go wrong, I can feel it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and just in time, because the murlocs have started coming up onto the docks at dusk, and I've only got a boathook." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'd say the tide's out, but it's a lake, so nothing's ever out. Ask away." },
        { id = "h_again2", text = "Go on, then; the boats can count themselves for a minute." },
      },
      choices = {
        { text = "Something is wrong with the fish in your lake.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Is the lake really that bad?", next = "lake" },
        { text = "Tell me about the sunfish.", next = "sunfish" },
        { text = "Who crosses on your boats?", next = "boats" },
        { text = "I fish. Where's the best water?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I've had my brew. Let's talk.", next = "brew", when = { drunk = { min = 1 } } },
        { text = "My pet could chase the murlocs off your docks.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Murlocs stole your nets. I could steal them back.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could freeze the lake around the murlocs.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the murlocs come right onto the docks, Dockmaster?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'll leave you to your boats.", next = "END" },
      },
    },

    lake = {
      lines = {
        { id = "l_default", text = "Murlocs in the shallows, orcs on the far shore, and the fishermen tell stories about something big in the deep. I don't believe them, though I don't swim out far, either." },
      },
      choices = {
        { text = "Something big?", next = "big" },
        { text = "Why are murlocs this far from the sea?", next = "inland" },
      },
    },
    big = {
      lines = { { id = "b_default", text = "Every lake has a monster if you drink enough. Lake Everstill has a lot of drinkers." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    inland = {
      big = true,
      lines = { { id = "in_default", text = "That's what keeps me up. Murlocs belong on a coast. Either they walked a long way to eat my fish, or something drove them here." } },
      choices = {
        { text = "What could drive off a murloc?", next = "chase" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    chase = {
      lines = { { id = "ch_default", text = "Ask the deep water east of the bridge, because I won't. Whatever lives out there, Oslow's toolbox is keeping it company." } },
      choices = {
        { text = "Maybe I'll swim out and see.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sunfish = {
      lines = { { id = "sf_default", text = "Spotted sunfish are Lake Everstill's pride, and there's always a buyer for them. I'm short, though, because the murlocs eat my stock before it's caught." } },
      choices = {
        { text = "I could bring you some.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boats = {
      lines = { { id = "bo_default", text = "With the bridge out, everyone does: guards, grain, Oslow's crew. One boat went down under a catapult stone with Oslow's tools aboard, and I still hear the crack some nights." } },
      choices = {
        { text = "Can the orcs reach the docks?", next = "docks" },
        { text = "You should charge for passage.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    docks = {
      lines = { { id = "dk_default", text = "They can see them, which is worse some days. I count my boats out under their eyes. They count them too, I reckon." } },
      choices = {
        { text = "Then I'll give them something else to count.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fisher = {
      lines = { { id = "fi_default", text = "Off the end of this dock, if you like fish. Off the east shore past the murloc camps, if you like your fish to bite back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    brew = {
      lines = { { id = "br_default", text = "Ha! You took me at my word. Sit on that crate, then, and ask me anything that isn't about fish. I'll answer about fish anyway." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Could it, now? The last dog that tried came back without its tail and spent a week barking at the water. Keep {pet} away from the edge, because those murlocs drag down anything that splashes." } },
      choices = {
        { text = "{pet} can handle a murloc.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll keep to the planks.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the dockmaster of Lakeshire: boats, nets and weather. I've never wanted a bigger job; this one's big enough." } },
    advice = { { id = "tp_ad", text = "Don't swim east of the bridge. Whatever's in the deep doesn't care who you are." } },
    murlocs_east = { { id = "tp_murlocs", text = "Elwynn's got them too? They must be breeding in the rivers, then, which is lovely." } },
    blackrock = { { id = "tp_blackrock", text = "They don't fish. That's the only good thing I can say about them." } },
    everstill_bridge = { { id = "tp_bridge", text = "Until it's done, I'm the bridge, since every guard crosses on my boats. I really should charge." } },
    _none = { { id = "tp_none", text = "Fish, boats and weather I can tell you about, but not that." } },
  },
}
