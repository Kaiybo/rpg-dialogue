-- Dockmaster Baren, Lakeshire docks. Voice: bibles/baren.md
-- The murlocs are out-fishing his fishermen.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baren", id = TODO_NPC("Dockmaster Baren"), name = "Dockmaster Baren",
  bible = "bibles/baren.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "witty" },
  notices = { "craft", "swim", "lock_shards" },

  impression = {
    first = "He warns about loose planks like a man who has fallen through.",
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
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "You've a bag full of shards, and I'd wager half of them were murlocs, judging by the smell off it. Keep filling it, because I've boats to count and fewer of them every week." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They have, and I count them now the way I count the boats. If your spirits can tell me why they've come up out of the Everstill, I'd write that down too." } },
      choices = {
        { text = "Keep counting, Baren. Somebody has to know who's out on the water.", next = "BACK", reply = "That's what my father told me when he handed me the book, and the lake hasn't proved him wrong yet. Mind the third plank as you go.", fx = { align = { order = 1 } } },
        { text = "Forget the counting. Drive the murlocs off and be done with it.", next = "BACK", reply = "Easy said from the dry end of the dock. Drive them off by all means, and I'll still count them, because they always come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "No, nothing frightens a Lakeshire fisherman more than a murloc, though you'd come a close second. The murlocs on the north shore have been taking catches and nets both, so if your craft can scare them back under the water, the docks would warm to you quickly enough." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "No, nothing frightens a Lakeshire fisherman more than a murloc, though that demon at your heel has half my dockhands mending nets at the far end. The murlocs on the north shore have been taking catches and nets both, so if your craft can scare them back under the water, the docks would warm to you quickly enough." },
      },
      choices = {
        { text = "I'll drive them off, and the fishermen can judge me after.", next = "BACK", reply = "Do that and they'll judge you kindly, I promise you, because a full net forgives a great deal. Just keep whatever you summon off my boats.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need the docks to like me, only to keep quiet.", next = "BACK", reply = "Silence you'll have, then, since that's mostly what fishermen give anyway. Just don't be surprised if they cross themselves when you pass.", fx = { align = { honor = -1 } } },
        { text = "Something else, Baren.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Right up onto the planks, bold as you like, and they take nets, fish, and once a whole rowboat. If you'd stand the end of the dock at dusk with a blade, I'd count fewer of them and more of my boats." } },
      choices = {
        { text = "I'll stand the dock at dusk. Your boats will come home.", next = "BACK", reply = "Then I'll put a lantern out for you and count my boats with a lighter heart tonight. The murlocs won't know what hit them.", fx = { align = { honor = 1 } } },
        { text = "Murlocs are a fisherman's problem. I've orcs to fight.", next = "BACK", reply = "Fair enough for a soldier, though the orcs don't eat our fish and the murlocs do. I'll manage with my boathook, then.", fx = { align = { honor = -1 } } },
        { text = "Something else, Baren.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Ha! If you can creep into a murloc camp and come out with my nets and all your fingers, I'll tell the whole dock it was you. They've taken six nets since the thaw and a rowboat besides, and I'd like the boat back most." } },
      choices = {
        { text = "I'll get them back, and take a little extra.", next = "BACK", reply = "I'll not ask what extra means, and I'll not want to know. Just bring the rowboat, and I'll tell the whole dock who did it.", fx = { align = { honor = -1 } } },
        { text = "Your nets and your boat, nothing more.", next = "BACK", reply = "An honest thief, now there's something I'll write in my book. The lads will hardly believe it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Why have the murlocs moved inland?", next = "inland" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Freeze Lake Everstill? You'd freeze my boats in with them, and then I'd have to explain to the Magistrate why the mail's sat at the dock till spring. Thin them out on the shore, if you please, and leave my water wet." } },
      choices = {
        { text = "Careful work, then. Your boats stay safe.", next = "BACK", reply = "Thank you, because the Magistrate has enough to shout about without a frozen lake. Fewer murlocs and wet water, that's all I ask.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A frozen lake would end it faster.", next = "BACK", reply = "Faster, aye, and then I'd be ending with it, out of a job and up before the Magistrate. Leave my water wet, if you please.", fx = { align = { order = -1 } } },
        { text = "What's wrong with the lake?", next = "lake" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Aye, there is. They come up thin, and the murlocs have taken the good spawning grounds along the east shore. My lads blame the orcs upstream, though nobody's walked up there to check." } },
      choices = {
        { text = "I'll walk up there and see to it.", next = "BACK", reply = "You'd walk all that way for fish? Then you're a better friend to Lakeshire than half the folk who live in it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The murlocs have as much right to those waters.", next = "BACK", reply = "Rights is it? Tell that to my lads with their empty nets and hungry children. The fish don't know whose water it is, but my boys do.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Two fishermen this spring, and a ferryman the year the bridge came down, and I've the dates in my book. We never found the ferryman, so I still put his name in the count every evening, out of habit or hope." } },
      choices = {
        { text = "Then I'll pray for him every time I cross the lake.", next = "BACK", reply = "That's kind, and I'll tell his widow you said it. Sometimes a stranger's prayer goes further than ours ever did.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stop counting him, Baren. The lake isn't giving him back.", next = "BACK", reply = "Maybe not, but my hand writes his name before I can stop it. A dockmaster counts every boat out and back, and his never came back.", fx = { align = { light = -1 } } },
        { text = "Something else, Dockmaster.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Me and a boathook, mostly, since the Marshal needs every guard on the north road. The murlocs know it, too, because they've started coming up the pilings the very hour the watch changes." } },
      choices = {
        { text = "Then I'll stand the dusk watch with you, Baren.", next = "BACK", reply = "That's more than I'd hoped for, and the lads will be glad of the company. Bring a lantern, and watch the pilings when the bell goes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Murlocs are your trouble, Baren. I've orcs to see to.", next = "BACK", reply = "Aye, everyone's got orcs to see to, and that's why the murlocs keep coming. Go on, then, and I'll keep my hook sharp.", fx = { align = { honor = -1 } } },
        { text = "Something else, Baren.", next = "BACK" },
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
          text = "Has Daniels told you his troubles? His cellar's dry and my nets are empty, so Lakeshire's a lovely place for a holiday." },
        { id = "h_boats", when = { metBefore = true }, text = "Counted the boats this morning, and they're all there; counted the nets, and they're all there too. Something's about to go wrong, I can feel it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and just in time, because the murlocs have started coming up onto the docks at dusk, and I've only got a boathook." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I count the boats back every evening, and when one comes back short, I'd be glad of someone who knows the words." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my docks. Mind the third plank from the end, because it doesn't care how holy you are." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock on my docks. Mind your step on the boards, and keep your pet away from the boats, because the fishermen are jumpy enough with the murlocs about." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Murloc", min = 30 } }, text = "The fishermen tell me the murlocs on the north shore are fewer than they were, and somebody's been leaving them on the rocks. I'll count that in my ledger as a good week." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, on my docks. Mind the loose planks, and if your water spirits can keep the murlocs off my boats, I'll owe you a drink." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'd say the tide's out, but it's a lake, so nothing's ever out. Ask away." },
        { id = "h_again2", text = "Go on, then; the boats can count themselves for a minute." },
      },
      choices = {
        { text = "Something is wrong with the fish in your lake.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "The lake looks peaceful enough from here.", next = "lake" },
        { text = "What do the fishermen catch here?", next = "sunfish" },
        { text = "Who crosses on your boats?", next = "boats" },
        { text = "I fish. Where's the best water?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I've had my brew. Let's talk.", next = "brew", when = { drunk = { min = 1 } } },
        { text = "My pet could chase the murlocs off your docks.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "If the murlocs steal from you, I could steal it back.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could freeze the lake around the murlocs.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the murlocs come right onto the docks, Dockmaster?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Has the lake taken any of Lakeshire's people, Dockmaster?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who keeps the docks safe after dark, Baren?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the fishermen fear warlocks more than murlocs, Baren?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The murlocs seem to have got worse on the lake, Dockmaster.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your boats.", next = "END" },
      },
    },

    lake = {
      lines = {
        { id = "l_default", text = "Murlocs in the shallows, orcs on the far shore, and the fishermen tell stories about something big in the deep. I don't believe them, though I don't swim out far, either." },
      },
      choices = {
        { text = "Something big?", next = "big" },
        { text = "Murlocs are a long way from the sea up here.", next = "inland" },
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
      lines = { { id = "ch_default", text = "I couldn't tell you, and I won't row out into the deep water east of the bridge to ask. Oslow's toolbox went down out there, and whatever lives there is welcome to it." } },
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
        { text = "The orcs can surely see these docks from the far shore.", next = "docks" },
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
      lines = { { id = "br_default", text = "Ha! Had a drop, have you? Sit on that crate, then, and ask me anything that isn't about fish. I'll answer about fish anyway." } },
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
