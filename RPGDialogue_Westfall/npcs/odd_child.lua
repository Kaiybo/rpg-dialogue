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
