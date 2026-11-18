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
  { id = "s2", text = "Hm. I'll grant you that's one way of looking at it, though I've heard plenty of others." },
  { id = "s3", text = "Maybe so. Time usually tells, and it tells everyone they were a little bit wrong." },
  { id = "s4", when = { faction = "Horde" }, text = "You speak your mind, and that's no bad thing in the Horde. Just be ready for someone to speak theirs back." },
  { id = "s5", when = { faction = "Alliance" }, text = "Fair enough, {g:lad|lass}. Say it a little quieter in a crowded street, though, because not everyone's as patient as me." },
} } } }

-- Every topic without views of its own.
P:Views { topic = "_any", views = {
  { id = "thanks", text = "Thank you. That's worth knowing.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "It's nothing, {class}. Somebody told me once, and it's only right I pass it along.", fx = { affinity = 1 } },
    { id = "b", text = "Glad to be of use. Folk don't often thank you for what's free.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "Don't make a habit of thanking me. It doesn't change anything between us." },
  } },
  { id = "doubt", text = "I've heard it told differently, and I'm not sure who to believe.", fx = { trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then you've heard it from someone who wasn't there. Believe who you like, but I know what I know." },
    { id = "b", text = "Good. Doubt everything you hear, and doubt it twice when it sounds likely; it'll keep you alive." },
    { id = "c", when = { disposition = { min = 60 } }, text = "Fair enough. I only know what reached me, and stories grow legs on the road." },
  } },
  { id = "go", text = "Sounds like something I ought to see for myself.", fx = { trait = { brave = 1 } }, replies = {
    { id = "a", text = "I thought you might say that. Go carefully, {class}, and come back and tell me if I had it right." },
    { id = "b", text = "Of course you should. Your kind always does, and somebody has to come back with the truth of it." },
    { id = "c", when = { maxLevel = 15 }, text = "Give it a few more seasons first. There's no shame in growing into a thing before you walk into it." },
  } },
} }

-- "Their story": what the player says back to someone's life.
P:Views { topic = "background", views = {
  { id = "sorry", text = "That's a hard road. I'm sorry it went that way.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "Don't be. It's mine, and I'd not trade it for an easier one, most days.", fx = { affinity = 1 } },
    { id = "b", text = "Kind of you to say. Not many stop long enough to hear any of it.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "I didn't tell you for your pity, {class}. You asked, and I answered." },
  } },
  { id = "respect", text = "You've done well, considering where you started.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "I've done what I could, which is all anyone does. Kind of you to notice, though.", fx = { affinity = 1 } },
    { id = "b", text = "Well enough, maybe. Ask me again in ten years and I'll tell you if it was worth it." },
  } },
  { id = "mine", text = "Mine's not so different, if I'm honest.", fx = { trait = { honest = 1 } }, replies = {
    { id = "a", text = "No, I don't suppose it is. Nobody ends up out here because things went smoothly back home.", fx = { affinity = 1 } },
    { id = "b", when = { metBefore = false }, text = "Is that so? Then you'll understand why I don't tell it often." },
  } },
  { id = "bored", text = "Everyone's got a sad story. Yours isn't the worst.", fx = { trait = { cruel = 1 } }, replies = {
    { id = "a", text = "No, it isn't, and I never said it was. You asked, {class}, and next time I'll remember not to answer.", fx = { affinity = -1 } },
    { id = "b", text = "That's a cold thing to say to someone's face. True, maybe, but cold.", fx = { affinity = -1 } },
  } },
} }

-- "Their work".
P:Views { topic = "trade", views = {
  { id = "admire", text = "Honest work, and you seem good at it.", fx = { trait = { kind = 1 } }, replies = {
    { id = "a", text = "I'd better be, after all these years. It's nice to hear it from someone who isn't buying.", fx = { affinity = 1 } },
    { id = "b", text = "Good enough to eat on, anyway. That's all most of us ask of a trade." },
  } },
  { id = "learn", text = "I'd like to learn a trade like that someday.", fx = { trait = { curious = 1 } }, replies = {
    { id = "a", text = "Then find someone patient and do as they say for a few years. That's the whole secret, and nobody likes hearing it." },
    { id = "b", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } }, text = "You? With hands like that, you'd have it broken by supper. Still, everyone starts clumsy." },
  } },
  { id = "dull", text = "Sounds dull. I'd go mad doing that every day.", fx = { trait = { brave = 1 } }, replies = {
    { id = "a", text = "Dull pays, and dull doesn't get you killed in a ditch. Ask me which of us sleeps better.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe so, but somebody has to do it, or you'd have nothing to buy on your way to your adventures." },
  } },
} }

-- "A little advice".
P:Views { topic = "advice", views = {
  { id = "heed", text = "I'll remember that. Thank you.", fx = { trait = { cautious = 1 } }, replies = {
    { id = "a", text = "See that you do. Advice is only free the first time; after that you pay for it in bruises.", fx = { affinity = 1 } },
    { id = "b", text = "Good. I'd rather say it once and be heeded than say it at your grave." },
  } },
  { id = "own_way", text = "I'll find my own way, but thanks all the same.", fx = { trait = { brave = 1 } }, replies = {
    { id = "a", text = "Everyone does, in the end. Just don't be too proud to turn back when the way runs out." },
    { id = "b", when = { disposition = { max = 44 } }, text = "Then why did you ask? Go on, then, and learn it the hard way like the rest of us.", fx = { affinity = -1 } },
  } },
  { id = "heard", text = "I've heard that before, from people who're dead now.", fx = { trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then they didn't listen to all of it, did they? The trick is in doing it, not in hearing it." },
    { id = "b", text = "Grim, {class}. True, maybe, but grim. Good advice won't save everyone; it just saves more of them." },
  } },
} }

-- "Latest rumors".
P:Views { topic = "rumors", views = {
  { id = "more", text = "I'll keep my ears open for more of that.", fx = { trait = { curious = 1 } }, replies = {
    { id = "a", text = "Do, and bring me back anything good. A rumor's worth more when it's shared.", fx = { affinity = 1 } },
    { id = "b", text = "You'll hear plenty, and half of it will be wrong. The trick is guessing which half." },
  } },
  { id = "gossip", text = "People talk too much. Most of it's nonsense.", fx = { trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Most of it, aye, but not all. The day you stop listening is the day the true one goes past you." },
    { id = "b", text = "Then you'll not mind if I stop telling you any. Suit yourself.", fx = { affinity = -1 } },
  } },
  { id = "trouble", text = "Sounds like trouble. Good; I could use the work.", fx = { trait = { brave = 1 } }, replies = {
    { id = "a", text = "Ha! There's always trouble for those who go looking. Mind it doesn't find you first." },
    { id = "b", when = { class = { "PALADIN", "PRIEST" } }, text = "Work, you call it? I'd hoped your sort would call it duty. Still, I'll take the help either way." },
  } },
} }
