-- The Odd Child, a girl hiding in a barn in Moonbrook (World of Warcraft: Forever only), who wants
-- to be an alchemist like her daddy. Quests: My First Alchemy Set, My First Real Potion.
-- Voice: bibles/odd_child.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q1 = TODO_QUEST("My First Alchemy Set")
local Q2 = TODO_QUEST("My First Real Potion")

P:NPC {
  key = "odd_child", id = TODO_NPC("Odd Child"), name = "Odd Child",
  bible = "bibles/odd_child.md", role = "child", tier = "quest",
  communities = {}, temper = { "eager" }, values = { "curious", "stubborn" },
  notices = { "craft", "race", "class" },
  impression = {
    first = "A little girl hides in a barn in Moonbrook, in the middle of bandit country, and wants more than anything to be an alchemist like her daddy. She never gave her name, and she mixes murloc eyes into potions with alarming enthusiasm.",
    third = "{name} met a strange little girl hiding in a Moonbrook barn, who dreams of being an alchemist.",
  },

  greetings = {
    { id = "g_default", text = "Erm... 'ello, {g:mister|miss}. I'm not supposed to talk to strangers, but you don't look very strange." },
    { id = "g_back", when = { metBefore = true }, text = "'Ello again! You came back! Nobody ever comes back, they just walk past the barn." },
    { id = "g_q1", when = { questActive = Q1 }, text = "'Ello again! Did you bring back alchemy stuff?" },
    { id = "g_q2", when = { questActive = Q2 }, text = "Don't worry about me, I'm a big girl. Have you got the eyes yet?" },
    { id = "g_done", when = { questDone = Q2 }, text = "It's my alchemy friend! I've been practising, but I'm not allowed to tell you what with." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Hey, what are those shiny bottles sticking out of your backpack for? Are you an alchemist? That's the best thing anybody can be!" },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism", ["not"] = { profession = "Alchemy" } },
      text = "You smell like flowers! Did you pick them yourself? Can I have one? Just a small one?" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're so small! You're nearly as small as me, and you're a grown-up! Are you magic?" },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Oh! You're one of the scary ones Daddy told me about. You don't look so scary up close, though, only big." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I live here, sort of, only nobody knows I'm in the barn. When I grow up I want to be an alchemist, like my daddy, only he won't let me play with any of his herbs, because he says they're too dangerous." },
        { id = "h_alch", when = { profession = "Alchemy", questBefore = Q1, faction = "Alliance" },
          text = "Could you maybe get some supplies for me, pretty please? Five empty vials, and five silverleaf and five peacebloom, so I can start learning now instead of waiting till I'm old." },
        { id = "h_q1", tags = { "news" }, when = { questActive = Q1 },
          text = "Five empty vials, five silverleaf and five peacebloom! I wrote it down so I wouldn't forget, only I can't find where I wrote it." },
        { id = "h_q1done", tags = { "news" }, when = { questDone = Q1, questBefore = Q2 },
          text = "Wow, my very first potion! Did you know that mixing those two herbs together turns it bright red? But it doesn't seem like the kind of alchemy Daddy does, because he uses other things too." },
        { id = "h_q2", tags = { "news" }, when = { questActive = Q2 },
          text = "Three murloc eyes! It sounds so gross, but I bet something will happen. Just don't tell anyone I'm hiding here, it's our little secret." },
        { id = "h_q2done", tags = { "news" }, when = { questRecent = { Q2, days = 3 } },
          text = "It went orange! Sickly orange, like a pumpkin that's gone off! I wouldn't drink it, but I was right, something happened, and it's all because of you." },
        { id = "h_done", when = { questDone = Q2 },
          text = "I've got a whole shelf of bottles now, hidden under the hay. Some of them are red and some are orange and one of them is a colour I don't have a name for yet." },
      },
      again = {
        { id = "h_again", text = "What else? You can ask me anything, except where Daddy is." },
        { id = "h_again2", text = "Do you want to talk more? Nobody ever wants to talk more." },
      },
      choices = {
        { text = "What are you doing in a barn?", next = "hiding" },
        { text = "Tell me about your daddy.", next = "daddy" },
        { text = "Why do you want to be an alchemist?", next = "alchemy" },
        { text = "Isn't Moonbrook dangerous for a little girl?", next = "moonbrook" },
        { text = "I'll get your supplies.", next = "BUSINESS", when = { profession = "Alchemy", faction = "Alliance", any = { { questBefore = Q1 }, { questActive = Q1 }, { questDone = Q1, questBefore = Q2 }, { questActive = Q2 } } } },
        { text = "What happened with the orange potion?", next = "orange", when = { questDone = Q2 } },
        { text = "Stay safe, little one.", next = "END" },
      },
    },

    hiding = {
      lines = {
        { id = "hi_default", text = "I'm not hiding, I'm practising, only the grown-ups wouldn't understand, so I practise where they can't see me. The loft's my laboratory, and the hay's my bed when I'm too tired to go home." },
      },
      choices = {
        { text = "Who are you hiding from?", next = "hiding_who" },
        { text = "Does anybody know you're here?", next = "secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hiding_who = {
      lines = {
        { id = "hw_default", text = "From the grown-ups downstairs and outside, the ones who shout and wear masks. They're not mean to me, exactly, but they say a barn's no place for a little girl, and then they tell Daddy." },
      },
      choices = {
        { text = "Men in red masks?", next = "masks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masks = {
      lines = {
        { id = "ma_default", text = "Red ones, like bandanas, over their noses. They walk round the village all day with swords and they don't let anybody in unless they know them. Daddy says I'm not to ask questions about grown-up things, so I don't.",
          fx = { learn = { "defias", "moonbrook" } } },
      },
      choices = {
        { text = "Those men are bandits. You shouldn't be near them.", next = "masks_bandits" },
        { text = "Is your daddy one of them?", next = "masks_daddy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masks_bandits = {
      lines = {
        { id = "mb_default", text = "Bandits? Like in stories, with treasure and caves? They don't look like they've got any treasure, they look tired and hungry, and one of them gave me a bit of his bread once." },
      },
      choices = {
        { text = "Hungry men can still be dangerous.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    masks_daddy = {
      lines = {
        { id = "md_default", text = "I'm not allowed to talk about Daddy's work, it's a rule, the biggest rule. He works very hard, and he's very busy, and he says one day things will be better for everybody, whatever that means." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = {
        { id = "se_default", text = "Nobody, only you now. You won't tell, will you? If anyone finds out I'll be sent home and I'll never get to make a real potion, not ever." },
      },
      choices = {
        { text = "I'll keep your secret. Cross my heart.", next = "secret_keep", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Someone should know where you are. It isn't safe.", next = "secret_tell", fx = { affinity = -2, align = { order = 1 } } },
      },
    },
    secret_keep = {
      lines = {
        { id = "sk_default", text = "Promise? Pinky promise? Then you're my best friend, and when I'm a famous alchemist I'll name a potion after you, a good one, not an orange one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_tell = {
      lines = {
        { id = "st_default", text = "No! Then I'll just hide somewhere else and you'll never find me. I'm a big girl, I can take care of myself, I've been doing it for ages." },
      },
      choices = {
        { text = "All right. Our secret.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    daddy = {
      lines = {
        { id = "da_default", text = "He's very clever and he knows everything about herbs, and he's got bottles of things that bubble and smoke. He uses other ingredients too, not just flowers, but he won't tell me which ones." },
      },
      choices = {
        { text = "Where is he now?", next = "daddy_where" },
        { text = "Does he know you want to be an alchemist?", next = "daddy_knows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daddy_where = {
      lines = {
        { id = "dw_default", text = "Working. He's always working, and he comes home late smelling of smoke and lamp oil. I'm not supposed to say where, though, so I won't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    daddy_knows = {
      lines = {
        { id = "dk_default", text = "He says I can be anything I want, only not yet, and only when it's safe. But it's never safe, and I'm tired of waiting, so I'm going to learn on my own and surprise him." },
      },
      choices = {
        { text = "He's right. Wait until you're older.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Don't wait for anyone. Learn it yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alchemy = {
      lines = {
        { id = "al_default", text = "Because you put boring things in a bottle and they turn into something new! Flowers become medicine, and water turns red, and sometimes things fizz, and you never know what'll happen until you try." },
        { id = "al_alch", when = { profession = "Alchemy" }, text = "You know, because you're one! Isn't it the best feeling when it changes colour? I nearly fell off the hay the first time." },
      },
      choices = {
        { text = "What have you made so far?", next = "made" },
        { text = "Something else.", next = "BACK" },
      },
    },
    made = {
      lines = {
        { id = "mm_default", text = "Nothing yet, only mud soup and a potion that was really just water with a leaf in it. I need proper supplies, real vials and real herbs, but I can't get them myself without someone seeing." },
        { id = "mm_q1", when = { questDone = Q1 }, text = "A red one, a real healing potion, with your herbs! And then I thought, what if I put something gross in it, and that's when I had the idea about murloc eyes." },
      },
      choices = {
        { text = "Murloc eyes? Why?", next = "eyes", when = { questDone = Q1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes = {
      lines = {
        { id = "ey_default", text = "Because Daddy uses other ingredients, and murlocs are the strangest thing I've ever seen on the beach. I don't know what they'll do, so let's try the first thing that comes to mind, that's how you discover things!" },
      },
      choices = {
        { text = "That's how real alchemists work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orange = {
      lines = {
        { id = "or_default", text = "It heals you, I think, but then it makes you sick for a bit, like it's taking some of the healing back. I named it Discolored, because it is, and I wrote the recipe down for you." },
      },
      choices = {
        { text = "A potion that hurts you is no good. Make better.", next = "orange_better", fx = { align = { light = 1 } } },
        { text = "Every potion has a price. That's alchemy.", next = "orange_better", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orange_better = {
      lines = {
        { id = "ob_default", text = "I'm going to keep trying, all the way up to big potions, the biggest. Come back when you're a better alchemist, and I'll show you how to make the orange ones even stronger." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    moonbrook = {
      lines = {
        { id = "mo_default", text = "It's only dangerous if they see you, and they never see me. I know all the places to hide, under the porches and behind the old schoolhouse and up in the loft." },
      },
      choices = {
        { text = "What was Moonbrook like before?", next = "moonbrook_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonbrook_before = {
      lines = {
        { id = "mob_default", text = "I don't know, I wasn't born, or I was very little. Daddy says there used to be farmers and a school and a market, before the nobles took everything away." },
      },
      choices = {
        { text = "The nobles didn't take everything. The bandits did.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your daddy's right. The nobles failed Westfall.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I live in Moonbrook, sort of, and in the barn, mostly. That's all I'm allowed to say." } },
    advice = { { id = "tp_ad", text = "Try the first thing that comes to mind! Sometimes it's gross, but something always happens." } },
    _none = { { id = "tp_none", text = "I don't know that one. Is it a grown-up thing? Daddy says I'm not to listen to grown-up things." } },
  },
}
-- The Odd Child: a little girl hiding in the barn at Moonbrook who wants to be an alchemist like her
-- daddy (WoW Forever only). Nobody says who her daddy is; she isn't supposed to talk to strangers.
-- Voice: bibles/odd_child.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "odd_child", id = TODO_NPC("Odd Child"), name = "Odd Child",
  bible = "bibles/odd_child.md", role = "child", tier = "quest",
  communities = {}, temper = { "eager", "secretive" }, values = { "family", "curiosity" },
  notices = { "craft", "class" },

  impression = {
    first = "A little girl in the Moonbrook barn, of all places, with grubby hands and a head full of potions. She isn't supposed to talk to strangers, and she doesn't say who her daddy is, only that he won't let her touch his herbs.",
    third = "{name} met an odd child in the barn at Moonbrook who dreams of becoming an alchemist like her father.",
  },

  greetings = {
    { id = "g_default", text = "Erm... 'ello. I'm not supposed to talk to strangers, so you didn't see me, all right?" },
    { id = "g_back", when = { metBefore = true }, text = "'Ello again! Did you bring back alchemy stuff? Please say yes." },
    { id = "g_set", when = { questActive = TODO_QUEST("My First Alchemy Set") }, text = "Did you find the vials, and the silverleaf, and the peacebloom? Five of each, I counted on my fingers twice." },
    { id = "g_eyes", when = { questActive = TODO_QUEST("My First Real Potion") }, text = "Murloc eyes! Three of them! It sounds so gross, but I just know something will happen." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Hey, what are those shiny bottles sticking out of your backpack for? Are you an alchemist? That's so cool!" },
    { id = "n_soldier", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You look like a soldier. Daddy says soldiers aren't allowed in Moonbrook, so you'd better be quiet, or the men downstairs will hear." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "When I grow up, I want to be an alchemist. Daddy won't let me play with any of his herbs, too dangerous, he says, but I want to start learning now, not when I'm old like twelve." },
        { id = "h_set_done", when = { questDone = TODO_QUEST("My First Alchemy Set") },
          text = "My very first potion turned bright red when we mixed it! But mixing flowers doesn't seem like the kind of alchemy Daddy does. He uses other things too, icky things." },
        { id = "h_real_done", when = { questDone = TODO_QUEST("My First Real Potion") },
          text = "It went a sickly orange, just like I said! I wouldn't drink it, but I wrote the recipe down, and I'm going to make a whole shelf of them before Daddy finds out." },
        { id = "h_alch", when = { profession = "Alchemy" },
          text = "You're a real alchemist, aren't you? Could you maybe get some supplies for me, pretty please? I'll be ever so careful." },
      },
      again = {
        { id = "h_again", text = "What else? Talk quiet, though." },
        { id = "h_again2", text = "Ask me something! Nobody ever asks me anything." },
      },
      choices = {
        { text = "What are you doing in this barn?", next = "barn" },
        { text = "Who is your daddy?", next = "daddy" },
        { text = "What do you need for your potions?", next = "potions", when = { profession = "Alchemy" } },
        { text = "Who are the men downstairs?", next = "downstairs" },
        { text = "You shouldn't be here alone.", next = "alone" },
        { text = "I have to go.", next = "END" },
      },
    },

    barn = {
      lines = { { id = "ba_default", text = "It's my secret laboratory! Nobody comes up here except the chickens, and they don't tell. I found some empty vials downstairs, and I've been practising." } },
      choices = {
        { text = "Practising what?", next = "ba_practise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ba_practise = {
      lines = { { id = "bap_default", text = "Mixing! Mostly water and mud so far, and one time a beetle, but the beetle didn't do anything except crawl out. I need real herbs, and I can't buy them, because I haven't got any coppers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    daddy = {
      lines = { { id = "da_default", text = "I'm not supposed to say. He's very important, and very busy, and the men listen to him, even the big ones with the masks. He tucks me in every night, even when he comes home late and smells like smoke." } },
      choices = {
        { text = "Men with masks?", next = "da_masks" },
        { text = "He sounds like he loves you.", next = "da_love", fx = { trait = { kind = 1 } } },
      },
    },
    da_masks = {
      lines = { { id = "dam_default", text = "Red ones, like bandanas. They're playing a game, Daddy says, about the people in Stormwind who didn't pay what they owed. I don't really understand it, but everybody takes it very seriously." } },
      choices = {
        { text = "That's not a game.", next = "da_game", fx = { learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    da_game = {
      big = true,
      lines = { { id = "dag_default", text = "It isn't? Daddy says the people in Stormwind were mean to him and his friends, and they're just getting back what's theirs. Is that wrong? It doesn't sound wrong, when he says it." } },
      choices = {
        { text = "Taking what isn't yours is wrong, whatever they say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe Stormwind did cheat them. It's complicated.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Never mind. Tell me about your potions.", next = "potions" },
      },
    },
    da_love = {
      lines = { { id = "dal_default", text = "He does, he says I'm the only thing he ever built that came out right. I don't know what that means, but he always looks sad when he says it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    potions = {
      lines = { { id = "po_default", text = "Five empty vials, five silverleaf and five peacebloom, for a start! Did you pick the herbs yourself? You have to tell me where they grow, so I can sneak out and get more." } },
      choices = {
        { text = "And after that?", next = "po_eyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    po_eyes = {
      lines = { { id = "poe_default", text = "Something gross, like Daddy uses! Murloc eyes, maybe, from the murlocs on the beach. That's the first thing that came to my mind, and Daddy says the first thing that comes to your mind is usually the right one." } },
      choices = {
        { text = "Murloc eyes. I'll see what I can do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    downstairs = {
      lines = { { id = "dw_default", text = "Daddy's friends. They go down into the ground and come back up dirty, and they don't let me go with them. I'm not supposed to go down past the second ladder, ever, so I don't, mostly." } },
      choices = {
        { text = "What's down there?", next = "dw_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_more = {
      lines = { { id = "dwm_default", text = "I don't know! Hammering, and voices, and sometimes a really big bang. Once I heard a parrot, I'm sure of it, but nobody believes me." } },
      choices = { { text = "I believe you.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },

    alone = {
      lines = { { id = "al_default", text = "I'm not alone, I've got the chickens, and the men are just downstairs. And Daddy says nobody in the world would dare hurt me, because they'd have to answer to him." } },
      choices = {
        { text = "Then be careful anyway.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Potions! And chickens. And secrets, but I can't tell those." } },
    background = { { id = "tp_bg", text = "I live here with Daddy. That's all I'm allowed to say." } },
    advice = { { id = "tp_ad", text = "Never drink a potion that's orange. Trust me." } },
    defias = { { id = "tp_defias", text = "The men in red masks? They're Daddy's friends. They're nice to me." } },
    _none = { { id = "tp_none", text = "I don't know that one. Is it a potion?" } },
  },
}
