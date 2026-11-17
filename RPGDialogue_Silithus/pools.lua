-- The Cenarion Hold Infantry: night elf sentinels of the Circle, keeping neutral ground neutral in the middle of the desert.
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_QUEST = P.TODO_QUEST

P:Pool {
  id = "guard_cenarion_hold", role = "guard", community = "cenarion_hold",
  barks = {
    { id = "b_hum", text = "Do you hear that hum? Larksbane says it's the crystals, and I wish she'd stop telling us." },
    { id = "b_sand", text = "Sand in my boots, sand in my bow, sand in my supper. Elune, grant me one night by a river." },
  },
  greetings = {
    { id = "g_hold", text = "Cenarion Hold is neutral ground, stranger, by the Circle's word and Elune's. Keep your quarrels outside the walls and your blade for the silithid." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls till sunrise. The hives send their hunters out when the moon is up, and even a Sentinel's eyes can't see beneath the sand." },
    { id = "g_known", when = { townStanding = { town = "cenarion_hold", min = 30 } }, text = "Welcome back, friend of the Hold. The Commander will be glad you're safe." },
  },
  notice = {
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde colours, inside a Circle fort. You're welcome as long as you remember that, and so are they, over there." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance, are you? Then you'll see some Horde here, and you'll nod politely, and that will be the end of it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The hives chewed on you, by the look of it. Vargus at the forge will mend that, and the inn will mend the rest." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Report to the Commander when you've had some water; he wants every one of you he can get." },
  },
  react = { { id = "r_stealth", on = "stealth", text = "Show yourself. Sneaking about inside the Hold is a good way to meet my blade by accident." } },
  lines = {
    { id = "l_default", text = "We hold this fort for the Cenarion Circle, and we hold it for everyone. Spill blood on neutral ground and you'll wish you hadn't been born, and the bugs will thank you for the meal." },
    { id = "l_maralith", when = { questDone = TODO_QUEST("Into The Maw of Madness") },
      text = "The Commander's been quieter since you came back from Hive'Regal. We don't ask him about it, and I'd thank you not to either." },
  },
  choices = {
    { text = "I'll keep the peace.", next = "END", fx = { standing = { cenarion_hold = 1 } } },
  },
  topics = {
    silithid = { { id = "t_silithid", text = "They don't stop and they don't sleep. We take turns doing both." } },
    twilights_hammer = { { id = "t_hammer", text = "Cultists, out west, chanting at stones. The Wildmane brothers watch them; ask Bor, he'll talk your ear off." } },
    cenarion_circle = { { id = "t_circle", text = "Tauren and kaldorei, druids and sentinels, standing between the hives and the rest of the world. That's us." } },
    _none = { { id = "t_none", text = "I keep the gate, not the gossip, as the Sentinels taught me. The innkeeper hears more than I do." } },
  },
}
