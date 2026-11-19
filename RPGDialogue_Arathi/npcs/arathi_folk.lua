-- Arathi folk we'd missed: Field Marshal Oslight (League of Arathor, Refuge Pointe), Deathmaster Dwire (the Defilers, Hammerfall),
-- Doctor Gregory Victor (Horde Trauma, Hammerfall), Narj Deepslice (butcher, Refuge Pointe), Tharlidun (stable master) and Keena (trade goods), Hammerfall.
-- Voice: bibles/arathi_folk.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_AB = TODO_QUEST("The Battle for Arathi Basin!")
local Q_CTRL4 = TODO_QUEST("Control Four Bases")
local Q_CTRL5 = TODO_QUEST("Control Five Bases")
local Q_TAKE4 = TODO_QUEST("Take Four Bases")
local Q_TAKE5 = TODO_QUEST("Take Five Bases")
local Q_TRAUMA = TODO_QUEST("Horde Trauma")
local Q_TRIAGE = TODO_QUEST("Triage")

---------------------------------------------------------------------------
-- Field Marshal Oslight
---------------------------------------------------------------------------
P:NPC {
  key = "ar_oslight", id = TODO_NPC("Field Marshal Oslight"), name = "Field Marshal Oslight",
  bible = "bibles/arathi_folk.md", role = "soldier", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "proud", "steady" }, values = { "dutiful", "honor" },
  prejudice = { class = "WARLOCK", amount = 11, why = "Arathi officer; his family's farm burned under orcish warlock fire in the Second War." },
  notices = { "race", "class", "reputation" },

  impression = {
    first = "He speaks of Stromgarde's lost farms the way men speak of children.",
    third = "{name} met Field Marshal Oslight, who leads the League of Arathor's fight to retake Arathi Basin for Stromgarde and the Alliance.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I know a warlock when one walks into my camp. You'll find no welcome here from me." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I fought the Horde when its warlocks burned the Arathi farms in the Second War. Say your business quickly." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've fought for the League without bringing your arts to my table, and I've noticed. Stand at the map, then, but I'll keep an eye on you." },
    { id = "g_default", text = "Another sword for Arathi? Stand easy, soldier, and look at this map with me." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the table, I see. The Basin has changed hands twice since you were last here." },
    { id = "g_honored", when = { reputation = { faction = "League of Arathor", min = "honored" } }, text = "One of the League's own, and a name I've heard at this table more than once. Welcome back, soldier." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You've a nerve walking into Refuge Pointe. Say what you came to say and then leave the way you came." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Arathi blood, or near enough. Every human in this camp is fighting for a grandfather's field, whether they know it or not." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "League of Arathor", min = "exalted" } },
      text = "The League has no higher friend than you, and I'll say so to anyone who asks." },
  },

  start = "hello",
  nodes = {
    dd_rep = {
      lines = { { id = "dd_rep_default", text = "Every name, living or fallen, goes in the League's rolls, and the rolls go back to Stromgarde when the day's done. Arathor was the first kingdom of men, {class}, and we mean to remember who helped it stand up again." } },
      choices = {
        { text = "I fight for Arathor's memory, Field Marshal, not for the rolls.", next = "BACK", reply = "Then you're the sort the rolls were made for. Keep fighting, and keep your head down at the stables.", fx = { align = { honor = 1 } } },
        { text = "I fight for the League's gear. The memory is a bonus.", next = "BACK", reply = "Honest, at least, and the quartermaster won't argue. Just make sure you earn it in the Basin.", fx = { align = { honor = -1 } } },
        { text = "Something else, Field Marshal.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "My father's farm was burned by orcish warlocks in the Second War, and I saw what their fire left behind. I'll take your sword for the League, but not your company at my table." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've bled in the Basin for Arathor, and I'll not deny it. Speak, then, though I've not forgotten what you are." },
        { id = "h_default", key = true,
          text = "The League of Arathor has sworn to retake Arathi for the humans of Stromgarde and for the Alliance. It is a hard fight, and a fight worth having, and I mean to see it won before I'm too old to ride." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_AB },
          text = "You've your orders: take the Basin's holdings and hold them, the mine, the mill, the smithy, the stables and the farm. Bring me word of the fight and I'll see you rewarded for it." },
        { id = "h_done", when = { questDone = Q_AB },
          text = "You've fought in the Basin and come back, which is more than some can say. The Defilers felt it, and so did their masters in Undercity." },
        { id = "h_five", when = { questActive = Q_CTRL5 },
          text = "Now take all five at once, soldier, and put the Defilers' banners down across the whole Basin. It's never been done lightly, so pick your companions well." },
        { id = "h_rank", when = { pvpRank = 6 },
          text = "A ranked officer of the Alliance, by your insignia. Good, for the Basin needs leaders as much as it needs blades." },
        { id = "h_dd_rep", tags = { "news" }, when = { reputation = { faction = "League of Arathor", min = "honored" } },
          text = "The League has a long memory for those who fight in the Basin, and your name is written high in it. Stromgarde's old banners fly over the farms again, and you helped raise them." },
      },
      again = {
        { id = "h_again", text = "What else, soldier? The map's not going anywhere, more's the pity." },
        { id = "h_again2", text = "Speak. I've a report to write for the Marshal, and any excuse to put it off is a welcome one." },
      },
      choices = {
        { text = "What is the League of Arathor?", next = "league" },
        { text = "Tell me about the Basin.", next = "basin" },
        { text = "Who are the Defilers?", next = "defilers" },
        { text = "How do I take four bases at once?", next = "tactics", when = { questActive = Q_CTRL4 } },
        { text = "My grandfather farmed near Stromgarde.", next = "kin", when = { race = "Human" } },
        { text = "I'll be on my way, Marshal.", next = "END" },
        { text = "Does the League remember all who fought in the Basin?", next = "dd_rep", when = { reputation = { faction = "League of Arathor", min = "honored" } } },
      },
    },

    league = {
      lines = { { id = "le_default", text = "Stromgarde's soldiers, what's left of them, and every Alliance volunteer willing to stand with them. Stromgarde was the heart of old Arathor, and when its king died and its walls broke, the rest of the Alliance was too busy to notice." } },
      choices = {
        { text = "Too busy? Or just unwilling?", next = "league_alliance" },
        { text = "Who leads Stromgarde now?", next = "league_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_alliance = {
      big = true,
      lines = { { id = "la_default", text = "Stromgarde left the Alliance after the Second War, and Stormwind has a long memory for slights. I'd not say it so plainly in Stormwind, but in Refuge Pointe we say it every night over supper." } },
      choices = {
        { text = "The Alliance owed Stromgarde. It should have come when called.", next = "BACK", reply = "It should have, and I'll go on saying so in every letter I send. Thank you for agreeing.", fx = { align = { order = -1 } } },
        { text = "Stromgarde walked away first. The Alliance kept its word.", next = "BACK", reply = "We did, and we've paid for it with every farm in the Highlands. Perhaps you're right, but it's a hard truth to swallow.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_lead = {
      lines = { { id = "ll_default", text = "The old king is dead and his heirs are scattered, so the crown is a question nobody here can answer. Until there's a king, the League fights in Stromgarde's name, and I'll take my orders from the flag." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    basin = {
      lines = { { id = "ba_default", text = "The richest valley in Arathi: a gold mine, a lumber mill, a smithy, the stables and the great farm. Whoever holds them feeds and arms an army, and right now the Forsaken mean it to be theirs." } },
      choices = {
        { text = "Why does the Horde care about farmland?", next = "basin_why" },
        { text = "What's it like down there?", next = "basin_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_why = {
      lines = { { id = "bw_default", text = "The Forsaken don't eat, soldier, so it isn't the grain they want. They want the mine and the timber for their war, and they want the land empty of the living, and that frightens me more than any army." } },
      choices = {
        { text = "Then we stop them in the Basin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_fight = {
      big = true,
      lines = { { id = "bf_default", text = "Fast and bloody and never finished, because a base held at dawn is lost by noon. Some of my officers say we should burn what we can't hold, and I've not yet decided if they're wise or only tired." } },
      choices = {
        { text = "Burn nothing. We're here to take it back whole.", next = "BACK", reply = "That's my view as well, and I'll keep my officers to it. Arathor deserves to be retaken, not razed.", fx = { align = { light = 1 } } },
        { text = "Burn it. I'd rather see ash than a Forsaken granary.", next = "BACK", reply = "Some of my officers would cheer you, and I'm not sure they're wrong. I'll take it under advisement.", fx = { align = { light = -1 } } },
      },
    },

    defilers = {
      lines = { { id = "df_default", text = "The Dark Lady's own, sent out of Hammerfall to claim the Basin for Undercity. They wear black and they don't tire, and their Deathmaster is said to have been an Arathi woman once." } },
      choices = {
        { text = "An Arathi woman? Do you know her name?", next = "defilers_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defilers_name = {
      lines = { { id = "dn_default", text = "If I did, I'd not say it. Whoever she was died with this land, and what walks in Hammerfall wearing her face doesn't deserve to have her name in its mouth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tactics = {
      lines = { { id = "ta_default", text = "Don't spread thin, soldier, that's how the Defilers win. Take the stables and the mill on the high ground, hold them hard, and send your fastest riders for the rest when the enemy commits." } },
      choices = { { text = "Understood, Marshal.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },

    kin = {
      lines = { { id = "ki_default", text = "Then you're fighting for his field as much as for the Alliance. I hope you'll see it ploughed again, and I hope I'll be there to see it with you." } },
      choices = { { text = "So do I, Marshal.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Basin, the League, Stromgarde, and every farm between here and Thoradin's Wall." } },
    background = { { id = "tp_bg", text = "A Stromgarde soldier since I was old enough to lift a shield, and a marshal since there were few enough left to make me one.", next = "league" } },
    _none = { { id = "tp_none", text = "That's not the war, soldier, and the war takes all my thinking these days." } },
  },
}

---------------------------------------------------------------------------
-- Deathmaster Dwire
---------------------------------------------------------------------------
P:NPC {
  key = "ar_dwire", id = TODO_NPC("Deathmaster Dwire"), name = "Deathmaster Dwire",
  bible = "bibles/arathi_folk.md", role = "soldier", tier = "quest",
  communities = { "hammerfall" }, temper = { "sharp", "proud" }, values = { "loyal", "ruthless" },
  notices = { "race", "reputation" },

  impression = {
    first = "She calls Refuge Pointe a weed she hasn't had time to pull.",
    third = "{name} met Deathmaster Dwire, who leads the Defilers' campaign for Arathi Basin on behalf of the Dark Lady.",
  },

  greetings = {
    { id = "g_default", text = "Another of the living come to fight for the dead. Good, the Defilers take all sorts." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Either the Basin spat you out, or you've come for more." },
    { id = "g_honored", when = { reputation = { faction = "The Defilers", min = "honored" } }, text = "One of ours, and a useful one. The Dark Lady keeps a list of those who serve her well, and your name is on it." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You'll understand the Basin better than the orcs do, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "We must not allow the Alliance to swell their foothold in Arathi, and that tiny camp at Refuge Pointe will grow if nobody stamps on it. The Basin's mines and fields belong to the Dark Lady now, and the Defilers are here to make the living understand it." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_AB },
          text = "You've been sent into the Basin. Take the holdings, hold them, and leave the League's banners in the mud where they belong." },
        { id = "h_take5", when = { questActive = Q_TAKE5 },
          text = "Take all five bases at once and leave the League scattered and howling. Do that and even the orcs will remember your name." },
        { id = "h_done", when = { questDone = Q_AB },
          text = "You fought in the Basin and came back to tell me, and the League buried some of its own because of it. That pleases me more than it should." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, come to fight in the hills where Doomhammer fell. I'm told that means something to your people." },
        { id = "h_dd_rep", tags = { "news" }, when = { reputation = { faction = "The Defilers", min = "honored" } },
          text = "The Defilers know your name well by now, and the living in the Basin have begun to learn it. That's the right order of things." },
      },
      again = {
        { id = "h_again", text = "What else? The dead are patient, but I am not." },
      },
      choices = {
        { text = "Why does Undercity want the Basin?", next = "why" },
        { text = "Tell me about the League of Arathor.", next = "league" },
        { text = "What were you, before?", next = "before" },
        { text = "Any advice for taking four bases?", next = "tactics", when = { questActive = Q_TAKE4 } },
        { text = "Your fight is my fight, Deathmaster.", next = "loyal", when = { race = "Scourge" } },
        { text = "Farewell, Deathmaster.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Ore from the mine, timber from the mill and iron from the smithy, enough to arm Undercity for a generation. And because every acre the living hold is an acre that will one day send soldiers against us." } },
      choices = {
        { text = "What happens to the farmers?", next = "why_farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_farmers = {
      big = true,
      lines = { { id = "wf_default", text = "There are none, only League soldiers in farmers' coats. Those who stay and lay down their arms may live, I suppose, though Undercity would find a use for them either way." } },
      choices = {
        { text = "Spare whoever surrenders. We're not the Scourge.", next = "BACK", reply = "We are not, and we do not pretend to be. Spare them, then, and I'll put them to work in the stables.", fx = { align = { light = 1 } } },
        { text = "A use either way. That sounds like the Dark Lady's mercy.", next = "BACK", reply = "You understand her mercy precisely. The living ones dig our ditches, and the dead ones go to the apothecaries, and none of it is wasted.", fx = { align = { light = -1 } } },
      },
    },

    league = {
      lines = { { id = "le_default", text = "Stromgarde's leftovers and whatever Alliance volunteers they can shame into joining them. They fight hard for land their king couldn't hold, and I respect it the way I'd respect a dog that bites." } },
      choices = {
        { text = "Do they ever win?", next = "league_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_win = {
      lines = { { id = "lw_default", text = "Some days, and on those days I write a letter to Undercity that nobody enjoys reading. Then we take it back, because they have to sleep and we do not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    before = {
      lines = { { id = "be_default", text = "Something I don't discuss with the living, or with orcs, or with anyone who asks with that tone. I knew these fields once, and that's all you'll have from me." } },
      choices = {
        { text = "Does it hurt, fighting over your own fields?", next = "before_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_hurt = {
      big = true,
      lines = { { id = "bh_default", text = "Hurt is a word for the living. I feel something when I see the old farm wall by the stables, and I've decided it's anger, because anger is useful." } },
      choices = {
        { text = "Anger's useful. Keep it close.", next = "BACK", reply = "I intend to, and to aim it at the League's farms. They took mine first.", fx = { align = { order = -1 } } },
        { text = "Set the anger down. Duty serves the Dark Lady better.", next = "BACK", reply = "Duty, then, and the anger can wait. It waits better than I do.", fx = { align = { order = 1 } } },
      },
    },

    tactics = {
      lines = { { id = "ta_default", text = "The League always rushes the stables because it's nearest to their gate. Let them, then take the mine and the blacksmith while they're busy feeling clever." } },
      choices = { { text = "Understood.", next = "BACK", fx = { trait = { cunning = 1 } } } },
    },

    loyal = {
      lines = { { id = "lo_default", text = "Good. The orcs fight for glory and the trolls for their spirits, but we fight because the living will never let us rest. Remember that when they plead." } },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Basin, the League, and the Dark Lady's will. Ask." } },
    background = { { id = "tp_bg", text = "I was Arathi once, and now I am the Dark Lady's, and that is all of it.", next = "before" } },
    _none = { { id = "tp_none", text = "That doesn't concern the Defilers, so it doesn't concern me." } },
  },
}

---------------------------------------------------------------------------
-- Doctor Gregory Victor
---------------------------------------------------------------------------
P:NPC {
  key = "ar_victor", id = TODO_NPC("Doctor Gregory Victor"), name = "Doctor Gregory Victor",
  title = "Trauma Surgeon",
  bible = "bibles/arathi_folk.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "sharp", "brisk" }, values = { "craft", "care" },
  notices = { "craft", "kit", "race" },

  impression = {
    first = "Pass his examination and he calls you doctor, otherwise you are patient.",
    third = "{name} met Doctor Gregory Victor, head trauma surgeon of Horde Trauma in Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "Greetings, {name}. I am Doctor Gregory Victor, head trauma surgeon of Horde Trauma. Are you bleeding, or are you here to learn?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and walking upright. Excellent, that's one fewer patient cluttering up my tent." },
    { id = "g_doctor", when = { questDone = Q_TRIAGE }, text = "Doctor {name}, welcome back to Horde Trauma. Wash your hands before you touch anything." },
  },

  notice = {
    { id = "n_aid", cat = "craft", when = { profession = { name = "First Aid", min = 225 } },
      text = "Your bandaging is very nearly competent. Very nearly." },
    { id = "n_hurt", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor is in pieces, which tells me whatever was under it is also in pieces. Sit on that cot." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Horde Trauma takes the best healers of bandage and splint and teaches them to save lives that the Light and the spirits have given up on. If you've the skill, I'll test you, and if you pass, you'll be a doctor." },
        { id = "h_trauma", tags = { "news" }, when = { questActive = Q_TRAUMA },
          text = "Your trainer sent you, did they? Then you've reached the end of what bandages alone can teach, and it's time for an examination." },
        { id = "h_triage", when = { questActive = Q_TRIAGE },
          text = "Treat the critically injured first, then the badly injured, then the merely injured. Lose six and you fail, and I shan't be gentle with you about it." },
        { id = "h_done", when = { questRecent = { Q_TRIAGE, days = 7 } },
          text = "Miraculous work, doctor, simply miraculous. You've joined the most exclusive company in the Horde, and the only one that does any good." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and your people are gentle with the sick, which I appreciate. Gentleness is wasted on a man bleeding out, however, so I'll teach you to be quick." },
      },
      again = {
        { id = "h_again", text = "What else? Speak while I sterilise these tools." },
      },
      choices = {
        { text = "What's the examination?", next = "exam", when = { questBefore = Q_TRIAGE } },
        { text = "A Forsaken doctor? Who were you before?", next = "past" },
        { text = "Why does the Horde need you?", next = "need" },
        { text = "Do you heal the Forsaken differently?", next = "forsaken" },
        { text = "Goodbye, Doctor.", next = "END" },
      },
    },

    exam = {
      lines = { { id = "ex_default", text = "A field full of wounded soldiers and a bag of triage bandages, and fifteen of them must live. It's the closest thing to a real battle I can arrange without starting one." } },
      choices = {
        { text = "Real soldiers?", next = "exam_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exam_real = {
      big = true,
      lines = { { id = "er_default", text = "Real enough to bleed, and the ones you don't reach in time will not get up again. Some of my students think that's cruel, and I think a doctor who has never lost a patient isn't a doctor yet." } },
      choices = {
        { text = "You're right. Better to learn it here than in the field.", next = "BACK", reply = "It is, and the ones who learn it here live longer in the field. You'll do well in my class.", fx = { align = { order = 1 } } },
        { text = "That's cruel, Doctor. Surely there's a better way.", next = "BACK", reply = "There is a better way, and it's called being quick. Learn it, and nobody dies on my table.", fx = { align = { order = -1 } } },
      },
    },

    past = {
      lines = { { id = "pa_default", text = "A surgeon in Lordaeron, before the plague, with a practice and a lecture hall and a brass plate on the door. I taught young men to cut cleanly, and then I spent the plague cutting more than I'd ever imagined." } },
      choices = {
        { text = "Do you remember your patients?", next = "past_patients" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_patients = {
      lines = { { id = "pp_default", text = "Every one, and that's my curse and my qualification. The Dark Lady's apothecaries remember nothing but their formulae, and you can tell from their bedside manner." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },

    need = {
      lines = { { id = "ne_default", text = "Because the Horde fights in Arathi, in Ashenvale, in Alterac, and its shamans can't be everywhere. A grunt with a clean bandage lives long enough for a healer to find him, and that is what I teach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    forsaken = {
      lines = { { id = "fo_default", text = "Stitch and pray, essentially, though prayer doesn't do much for us. Our flesh doesn't mend on its own, so a Forsaken soldier with a cut is a Forsaken soldier with a cut forever, unless somebody sews it shut." } },
      choices = {
        { text = "That's grim.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Wounds, bandages, triage, and a good deal of old Lordaeron anatomy." } },
    background = { { id = "tp_bg", text = "Surgeon in Lordaeron, then in the plague, and now head of Horde Trauma, which is the only promotion I ever wanted.", next = "past" } },
    _none = { { id = "tp_none", text = "Not a medical question, so I have no medical answer." } },
  },
}

---------------------------------------------------------------------------
-- Narj Deepslice
---------------------------------------------------------------------------
P:NPC {
  key = "ar_narj", id = TODO_NPC("Narj Deepslice"), name = "Narj Deepslice",
  title = "Butcher",
  bible = "bibles/arathi_folk.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "hearty", "brisk" }, values = { "practical" },
  notices = { "hunger", "race" },

  impression = {
    first = "He complains about feeding the soldiers, loudly and fondly.",
    third = "{name} met Narj Deepslice, the dwarf who sells meat at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course ye are, everyone in this camp's hungry. Step up." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more! I knew ye would, my sausages have that effect." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A proper dwarf! At last, somebody who'll appreciate a well-salted haunch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Narj Deepslice, butcher, an' the only reason half these soldiers can still lift a sword. Haunches, chops, sausage, the lot, all good Highland meat." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! If ye've any boar or raptor in yer bags, I'll no' say no tae a trade, but I'll still sell ye supper." },
      },
      again = {
        { id = "h_again", text = "What else? I've a carcass waitin' on me, so quick now." },
      },
      choices = {
        { text = "Let me see your meat.", next = "BUSINESS" },
        { text = "Where does it come from?", next = "meat" },
        { text = "How do the soldiers eat?", next = "soldiers" },
        { text = "Thanks, Narj.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "me_default", text = "Highland boar an' mountain goat, mostly, an' whatever the scouts drag in. Raptor if I'm desperate, though it tastes like an old boot fried in vinegar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    soldiers = {
      big = true,
      lines = { { id = "so_default", text = "Not as well as they should. The League pays me late, an' the soldiers eat on credit, an' I've stopped keepin' count o' who owes me what." } },
      choices = {
        { text = "Keep counting. A debt's a debt, whoever owes it.", next = "BACK", reply = "I'd like tae, but every time I tally it up I end up feelin' worse. I'll keep a rough count in chalk on the block, at least.", fx = { align = { honor = -1 } } },
        { text = "Good. Men holding the line shouldn't owe for their supper.", next = "BACK", reply = "That's what I keep sayin' tae the League, an' they keep payin' late. Well, I'll keep feedin' them.", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Meat, salt, an' who in this camp eats the most, which is Jannos the macecrafter." } },
    _none = { { id = "tp_none", text = "I cut meat, friend, I don't cut gossip." } },
  },
}

---------------------------------------------------------------------------
-- Tharlidun
---------------------------------------------------------------------------
P:NPC {
  key = "ar_tharlidun", id = TODO_NPC("Tharlidun"), name = "Tharlidun",
  title = "Stable Master",
  bible = "bibles/arathi_folk.md", role = "stablemaster", tier = "service",
  communities = { "hammerfall" }, temper = { "steady" }, values = { "loyal", "practical" },
  notices = { "pet", "race" },

  impression = {
    first = "He is proud of every wolf bite on his arms.",
    third = "{name} met Tharlidun, the orc stable master of Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "Bring your beast. I'll see it fed." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your beast remembers me, even if you don't." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "{pet} has good eyes. Keep them sharp, and your beast will keep you alive." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Tharlidun, and I keep the beasts of Hammerfall. Wolves, raptors, the hunters' pets, all of them eat before I do, so tell me what you need and let me get back to them." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Good. Leave your beast with me and I'll treat it as my own, which is better than I treat most people." },
      },
      again = {
        { id = "h_again", text = "Something more? Speak plainly; the wolves are listening." },
      },
      choices = {
        { text = "I need to stable my pet.", next = "BUSINESS" },
        { text = "How did you get those bites?", next = "bites" },
        { text = "Does Hammerfall mean anything to you?", next = "hammerfall" },
        { text = "Farewell, Tharlidun.", next = "END" },
      },
    },
    bites = {
      lines = { { id = "bi_default", text = "Wolves, every one, and each bite was a lesson. A wolf bites the hand that's afraid of it, so I stopped being afraid, and they stopped biting, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hammerfall = {
      big = true,
      lines = { { id = "ha_default", text = "This was a camp where the humans kept our people in cages, and Doomhammer died breaking them open. I keep my wolves where the cages stood, so that every morning something free wakes up there." } },
      choices = {
        { text = "That's fitting. Let the past be remembered.", next = "BACK", reply = "It is. My wolves sleep where the cages stood, and they're free, and so are we.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Tear it all down. Nothing of the camps should remain.", next = "BACK", reply = "And forget why we fight? No, young one. The camp stays, so our children know what Thrall freed us from.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know beasts, and wolves best of all." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask the wolves; they know as much as I do." } },
  },
}

---------------------------------------------------------------------------
-- Keena
---------------------------------------------------------------------------
P:NPC {
  key = "ar_keena", id = TODO_NPC("Keena"), name = "Keena",
  title = "Trade Goods",
  bible = "bibles/arathi_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "shrewd", "brisk" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "She counts coin faster than anyone and won't let you forget it.",
    third = "{name} met Keena, who sells trade goods in Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye, flux, salt. Buy something or step aside, because there's a line behind you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. What did you run out of this time?" },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Enchanting" } },
      text = "A crafter, good. Crafters always come back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Keena, and I sell what crafters need: thread, dye, flux and salt, all of it shipped from Orgrimmar and carried over the hills. It costs what it costs, so don't haggle." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it; I've customers." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "How do the goods get here?", next = "supply" },
        { text = "Who buys the most?", next = "buyers" },
        { text = "Goodbye, Keena.", next = "END" },
      },
    },
    supply = {
      lines = { { id = "su_default", text = "Ship to the Undercity, wagon down through the Foothills, and then a long walk past Southshore's patrols. Every crate that reaches me has been shot at at least once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      big = true,
      lines = { { id = "bu_default", text = "The Forsaken buy salt by the barrel, and I don't ask what for. Their coin is good, and my grandmother would have said a trader who asks questions starves." } },
      choices = {
        { text = "Your grandmother was right. Coin is coin.", next = "BACK", reply = "She was a wise woman, and so am I. The coin buys bread for Hammerfall, and bread doesn't ask where it came from either.", fx = { align = { light = -1 } } },
        { text = "Ask them. You should know what you're selling into.", next = "BACK", reply = "And what would I do with the answer? I'd still need the coin. Better not to know, I think.", fx = { align = { light = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know prices, roads, and who owes me money." } },
    _none = { { id = "tp_none", text = "If it's not for sale, I don't know about it." } },
  },
}
