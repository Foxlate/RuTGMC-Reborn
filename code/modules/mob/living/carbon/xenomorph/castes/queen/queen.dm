/mob/living/carbon/xenomorph/queen
	caste_base_type = /datum/xeno_caste/queen
	name = "Queen"
	desc = "A huge, looming alien creature. The biggest and the baddest."
	icon = 'icons/Xeno/castes/queen/basic.dmi'
	icon_state = "Queen Walking"
	effects_icon = 'icons/Xeno/castes/queen/effects.dmi'
	rouny_icon = 'icons/Xeno/castes/queen/rouny.dmi'
	attacktext = "bites"
	attack_sound = null
	friendly = "nuzzles"
	health = 300
	maxHealth = 300
	plasma_stored = 300
	pixel_x = -16
	mob_size = MOB_SIZE_BIG
	drag_delay = 6 //pulling a big dead xeno is hard
	tier = XENO_TIER_FOUR //Queen doesn't count towards population limit.
	upgrade = XENO_UPGRADE_NORMAL
	bubble_icon = "alienroyal"
	footstep_type = FOOTSTEP_XENO_STOMPY
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/hijack,
	)

// ***************************************
// *********** Init
// ***************************************
/mob/living/carbon/xenomorph/queen/Initialize(mapload)
	RegisterSignal(src, COMSIG_HIVE_BECOME_RULER, PROC_REF(on_becoming_ruler))
	. = ..()
	hive.RegisterSignal(src, COMSIG_HIVE_XENO_DEATH, TYPE_PROC_REF(/datum/hive_status, on_queen_death))
	playsound(loc, 'sound/voice/alien/queen/command.ogg', 75, 0)

// ***************************************
// *********** Mob overrides
// ***************************************

/mob/living/carbon/xenomorph/queen/handle_special_state()
	if(is_charging >= CHARGE_ON)
		icon_state = "[xeno_caste.caste_name] Charging"
		return TRUE
	return FALSE

/mob/living/carbon/xenomorph/reset_perspective(atom/A)
	if (!client)
		return

	if(observed_xeno && !stat)
		client.perspective = EYE_PERSPECTIVE
		client.eye = observed_xeno
		return

	if (ismovableatom(A))
		client.perspective = EYE_PERSPECTIVE
		client.eye = A
		return

	if (isturf(loc))
		client.eye = client.mob
		client.perspective = MOB_PERSPECTIVE
		return

	client.perspective = EYE_PERSPECTIVE
	client.eye = loc

/mob/living/carbon/xenomorph/queen/upgrade_xeno(newlevel, silent = FALSE)
	. = ..()
	hive?.update_leader_pheromones()

// ***************************************
// *********** Name
// ***************************************
/mob/living/carbon/xenomorph/queen/generate_name()
	var/playtime_mins = client?.get_exp(xeno_caste.caste_name)
	var/prefix = "[hive.prefix ? "[hive.prefix] " : ""][xeno_caste.upgrade_name ? "[xeno_caste.upgrade_name] " : ""]"
	if(!client?.prefs.show_xeno_rank || !client)
		name = prefix + "Queen ([nicknumber])"
		real_name = name
		if(mind)
			mind.name = name
		return
	switch(playtime_mins)
		if(0 to 300)
			name = prefix + "Young Queen ([nicknumber])"
		if(301 to 1500)
			name = prefix + "Mature Queen ([nicknumber])"
		if(1501 to 4200)
			name = prefix + "Elder Empress ([nicknumber])"
		if(4201 to 9000)
			name = prefix + "Ancient Empress ([nicknumber])"
		if(9001 to INFINITY)
			name = prefix + "Primal Empress ([nicknumber])"
		else
			name = prefix + "Young Queen ([nicknumber])"

	real_name = name
	if(mind)
		mind.name = name


// ***************************************
// *********** Death
// ***************************************
/mob/living/carbon/xenomorph/queen/death_cry()
	playsound(loc, 'sound/voice/alien/queen/died.ogg', 75, 0)

/mob/living/carbon/xenomorph/queen/xeno_death_alert()
	return


// ***************************************
// *********** Larva Mother
// ***************************************

/mob/living/carbon/xenomorph/queen/proc/is_burrowed_larva_host(datum/source, list/mothers, list/silos)
	if(!incapacitated(TRUE))
		mothers += src //Adding us to the list.
