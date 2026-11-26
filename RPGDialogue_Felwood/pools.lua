-- Bloodvenom Post's tauren braves, on the cliffs above the poisoned river.
local P = RPGDialogueAPI:Pack("rpgd.felwood")

P:Pool {
  id = "guard_bloodvenom", role = "guard", community = "bloodvenom_post",
  barks = {
    { id = "yb0", text = "The air smells of rot again today. It always does, but today it smells worse." },
    { id = "yb1", text = "Another corrupted bear on the cliff path. Somebody send a hunter up there before it eats someone." },
    { id = "b_river", text = "Don't drink from the river, don't wash in it, and don't look at it too long. The Earth Mother has turned her face from that water." },
    { id = "b_laugh", text = "The Forsaken alchemist is laughing again. Earth Mother, give me patience." },
  },
  greetings = {
    { id = "yg0", when = { race = "Orc" }, text = "Lok'tar, warrior. Keep your weapon close. The forest here is sick, and sick things bite." },
    { id = "g_post", text = "This is Bloodvenom Post, the only Horde fire in Felwood, so keep close to it, and upwind of the latrine trench if you can manage both." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A long way from Mulgore's grass, cousin. Here even the grass would bite you." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest chewed on you, so get mended, and wash your hands before you eat, because everything here is tainted." },
  },
  react = { { id = "r_form", on = "form", when = { form = { "bear", "cat", "travel" } }, text = "Careful in that shape, because the corrupted beasts here look a lot like you, and we shoot first." } },
  lines = {
    { id = "yl0", text = "I came to Felwood with Trull Failbane's braves, three seasons ago. We were twelve when we came, and we are eight now. The forest has taken the rest, one by one." },
    { id = "yl1", text = "The druids say the corruption comes from the demons who walked here in the war. They say it can be cleansed, but I have seen nothing get cleaner in three seasons." },
    { id = "yl2", text = "My mother in Thunder Bluff writes to ask when I am coming home. I tell her soon, because I do not know what else to tell her." },
    { id = "yl3", when = { class = "DRUID" }, text = "A druid! Can you feel it, the sickness in the ground? I feel it through my hooves, and I am no druid. It is like walking on a wound." },
    { id = "l_x1", text = "The Emerald Circle druids at Talonbranch Glade may share the cleansing work, but they don't share their tea. Not with us, anyway." },
    { id = "l_x2", text = "I've seen a deer walk out of the woods with eyes like green coals. I let it go. Some things you don't want to know the taste of." },
    { id = "l_x3", when = { race = "Orc" }, text = "Orc, you of all people know what fel does to a land. Look around, and remember why we turned from it." },

    { id = "l_default", text = "Demons poisoned this forest in the war, and the poison stayed when they left. So do we, for now." },
  },
  choices = {
    { text = "The forest can be healed. Have faith.", next = "END", reply = "I hope you are right. I will keep standing here, then, and hope with you.", fx = { align = { light = 1 } } },
    { text = "Burn the corruption out. Some things can't be saved.", next = "END", reply = "Hard words. But I have thought them too, on the worst nights.", fx = { align = { light = -1 } } },
    { text = "Stay safe.", next = "END", fx = { standing = { bloodvenom_post = 1 } } } },
  topics = {
    trull_failbane = { { id = "tp_ytrull_failbane", text = "Our leader at the post. He sends us into the trees, and he counts us when we come back." } },
    demons = { { id = "tp_ydemons", text = "The demons poisoned this forest in the war. Their poison stays, even though they are gone." } },
    felwood = { { id = "t_xfelwood", text = "Ashenvale's twin, once. The demons made it sick, and it stays sick out of spite." } },
    jaedenar = { { id = "t_xjaedenar", text = "Shadow Council and their pets, down south. Stay clear unless you've an army." } },

    cenarion_circle = { { id = "t_circle", text = "The druids at the sanctuary think they can heal this place. I hope they're right. I'd hate to be standing here for nothing." } },
    _none = { { id = "t_none", text = "Ask Trull; he's the one who sends people into the trees." } },
  },
}
