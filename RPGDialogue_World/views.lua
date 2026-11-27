-- Speaking your mind (0.82.0): after an "Ask about..." answer, the player can say what they
-- think of it, and the NPC answers that. One P:Views per topic (views_*.lua hold the named
-- topics). A view is a reply like any other: text (15 words or fewer), when, fx. Views with
-- fx.align are stances (statements, at least two opposing ones per topic); the player can
-- give one view per topic to each person. Its `replies` are how the NPC takes it, picked like
-- lines (conditions on the player: `faction`, `race`, `class`, `disposition`...); a reply's
-- fx (usually affinity) applies too. An NPC can add its own: `views = { [topic] = {...} }`
-- and `viewReplies = { [viewId] = { lines } }` on the NPC.
--
-- Here: "_shrug" (the fallback answer when no reply fits), "_any" (for every topic with no
-- views of its own) and the "Ask anyone" topics.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Views { topic = "_shrug", views = { { id = "shrug", text = "", replies = {
  { id = "s1", text = "Well, you're entitled to think so, {class}. Most folk have an opinion on it, and few of them agree." },
  { id = "s2", text = "Hm, that's one way of looking at it. I've heard it put a dozen other ways over the years, mind, and they can't all be right." },
  { id = "s3", text = "Maybe so, {class}, but time has a way of settling these things, and it usually tells everyone they were a little bit wrong." },
  { id = "s4", when = { faction = "Horde" }, text = "You speak your mind, and that's no bad thing in the Horde. Just be ready for someone to speak theirs back." },
  { id = "s5", when = { faction = "Alliance" }, text = "Speak your mind, {g:lad|lass}, but say it a little quieter in a crowded street, because not everyone's as patient as me." },
} } } }

-- Every topic without views of its own.
P:Views { topic = "_any", views = {
  { id = "thanks", text = "Thank you for that; it's worth knowing.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "Think nothing of it, {class}. Somebody told me once when I needed it, and it's only right I pass it along.", fx = { affinity = 1 } },
    { id = "b", text = "Glad to be of use, friend. Folk don't often thank you for what costs them nothing, so I'll take it gladly.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "Don't make a habit of thanking me, because it doesn't change what's between us." },
  } },
  { id = "doubt", text = "I've heard it told differently, and I'm not sure who to believe.", fx = { trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then you heard it from someone who wasn't there. Believe whoever you like, {class}, but I know what I saw and what I was told by those who did." },
    { id = "b", text = "Good. Doubt everything you hear, and doubt it twice when it sounds likely; it'll keep you alive." },
    { id = "c", when = { disposition = { min = 60 } }, text = "Fair enough, and I'd not swear to every word of it. I only know what reached me, and stories grow legs on a long road." },
  } },
  { id = "go", text = "Sounds like something I ought to see for myself.", fx = { trait = { brave = 1 } }, replies = {
    { id = "a", text = "I thought you might say that. Go carefully, {class}, and come back and tell me if I had it right." },
    { id = "b", text = "Of course you should, since your sort always does. Somebody has to walk out there and come back with the truth of it, and it may as well be you." },
    { id = "c", when = { maxLevel = 15 }, text = "Give it a few more seasons first. There's no shame in growing into a thing before you walk into it." },
  } },
} }

-- "Their story": what the player says back to someone's life.
P:Views { topic = "background", views = {
  { id = "sorry", text = "That's a hard road. I'm sorry it went that way.", fx = { align = { light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Don't be sorry, {class}. It's my road, and most days I'd not trade it for an easier one.", fx = { affinity = 1 } },
    { id = "b", text = "That's kind of you to say. Not many stop long enough to hear the half of it, let alone the end.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "I didn't tell you for your pity, {class}; you asked, and I answered, and that's the end of it." },
  } },
  { id = "respect", text = "You've done well, considering where you started.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "I've done what I could, which is all anyone does, but it's kind of you to notice.", fx = { affinity = 1 } },
    { id = "b", text = "Well enough, perhaps, though ask me again in ten years and I'll tell you whether it was worth the trouble." },
  } },
  { id = "mine", text = "Mine's not so very different, as it happens.", fx = { trait = { honest = 1 } }, replies = {
    { id = "a", text = "No, I don't suppose it is, because nobody ends up out here when things went smoothly back home.", fx = { affinity = 1 } },
    { id = "b", when = { metBefore = false }, text = "Is that so? Then you'll understand why I don't tell mine often, and why I'll not ask you to tell yours." },
  } },
  { id = "bored", text = "Everyone's got a sad story. Yours isn't the worst.", fx = { align = { light = -1 }, trait = { cruel = 1 } }, replies = {
    { id = "a", text = "I never said it was the worst. You asked, {class}, and next time I'll remember not to answer.", fx = { affinity = -1 } },
    { id = "b", text = "That's a cold thing to say to someone's face, and it may be true, but it's cold all the same.", fx = { affinity = -1 } },
  } },
} }

-- "Their work".
P:Views { topic = "trade", views = {
  { id = "admire", text = "Honest work, and you seem good at it.", fx = { align = { order = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "I'd better be, after all these years at it. It's nice to hear from someone who isn't trying to talk the price down.", fx = { affinity = 1 } },
    { id = "b", text = "Good enough to keep food on the table, anyway, and that's all most of us ask of a trade." },
  } },
  { id = "learn", text = "I'd like to learn a trade like that someday.", fx = { trait = { curious = 1 } }, replies = {
    { id = "a", text = "Then find someone patient and do as they say for a few years. That's the whole secret, and nobody likes hearing it." },
    { id = "b", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } }, text = "You? With hands like those you'd have the tools broken by supper, though I suppose everyone starts out clumsy." },
  } },
  { id = "dull", text = "Sounds dull. I'd go mad doing that every day.", fx = { align = { order = -1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Dull pays, {class}, and dull doesn't leave you dead in a ditch, so ask me which of us sleeps better.", fx = { affinity = -1 } },
    { id = "b", text = "Somebody has to do it, or you'd have nothing to buy on your way out to your adventures." },
  } },
} }

-- "A little advice".
P:Views { topic = "advice", views = {
  { id = "heed", text = "I'll remember that, and thank you for it.", fx = { align = { order = 1 }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "See that you do. Advice is only free the first time you hear it, and after that you pay for it in bruises.", fx = { affinity = 1 } },
    { id = "b", text = "Good, because I'd rather say it once and be heeded than say it again over your grave." },
  } },
  { id = "own_way", text = "I'll find my own way, but thanks all the same.", fx = { align = { order = -1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Everyone does in the end, so go on and find it. Just don't be too proud to turn back when the way runs out." },
    { id = "b", when = { disposition = { max = 44 } }, text = "Then why did you ask me? Go on and find it out for yourself, the way the rest of us had to.", fx = { affinity = -1 } },
  } },
  { id = "heard", text = "I've heard that before, from people who're dead now.", fx = { trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then they didn't listen to all of it, did they? The trick was always in the doing, never in the hearing." },
    { id = "b", text = "That's grim, {class}, though I'll grant it may be true. Good advice won't save everyone, but it saves more of them than none at all." },
  } },
} }

-- "Latest rumors".
P:Views { topic = "rumors", views = {
  { id = "more", text = "I'll keep my ears open for more of that.", fx = { trait = { curious = 1 } }, replies = {
    { id = "a", text = "Do, and bring me back anything good you hear, because a rumor's worth twice as much once it's shared.", fx = { affinity = 1 } },
    { id = "b", text = "You'll hear plenty, and most of it wrong, so the trick is guessing which bits are true before anyone else does." },
  } },
  { id = "gossip", text = "People talk too much, and most of it's nonsense.", fx = { align = { order = 1 }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Most of it, aye, but not all of it. The day you stop listening is the day the true one walks right past you." },
    { id = "b", text = "Then you'll not mind if I keep the next one to myself, {class}, and save my breath for somebody who wants it.", fx = { affinity = -1 } },
  } },
  { id = "trouble", text = "Sounds like trouble. Good; I could use the work.", fx = { align = { honor = -1, order = -1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Ha! There's always trouble for those who go looking, {class}, so mind it doesn't come looking for you first." },
    { id = "b", when = { class = { "PALADIN", "PRIEST" } }, text = "Work, you call it? I'd hoped your sort would call it duty, but I'll take the help whatever name you give it." },
  } },
} }
