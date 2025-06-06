/mob/living/carbon/xenomorph/sentinel
	caste_base_type = /datum/xeno_caste/sentinel
	name = "Sentinel"
	desc = "A slithery, spitting kind of alien."
	icon = 'icons/Xeno/castes/sentinel/basic.dmi'
	icon_state = "Sentinel Walking"
	effects_icon = 'icons/Xeno/castes/sentinel/effects.dmi'
	bubble_icon = "alienleft"
	health = 150
	maxHealth = 150
	plasma_stored = 75
	pixel_x = -12
	tier = XENO_TIER_ONE
	upgrade = XENO_UPGRADE_NORMAL
	pull_speed = -2
	bubble_icon = "alien"
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

/mob/living/carbon/xenomorph/sentinel/retrograde
	icon = 'icons/Xeno/castes/sentinel/retrograde.dmi'
	caste_base_type = /datum/xeno_caste/sentinel/retrograde
