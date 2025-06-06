/obj/machinery/door/poddoor
	name = "\improper Podlock"
	desc = "That looks like it doesn't open easily."
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "pdoor1"
	soft_armor = list(MELEE = 50, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 50, BIO = 100, FIRE = 100, ACID = 70)
	layer = PODDOOR_OPEN_LAYER
	open_layer = PODDOOR_OPEN_LAYER
	closed_layer = PODDOOR_CLOSED_LAYER
	obj_flags = NONE
	explosion_block = 6
	smoothing_groups = list(SMOOTH_GROUP_SHUTTERS)

/obj/machinery/door/poddoor/Initialize(mapload)
	. = ..()
	var/turf/current_turf = get_turf(src)
	if(anchored && current_turf && density)
		current_turf.atom_flags |= AI_BLOCKED

/obj/machinery/door/poddoor/Destroy()
	var/turf/current_turf = get_turf(src)
	if(anchored && current_turf && density)
		current_turf.atom_flags &= ~AI_BLOCKED
	return ..()

/obj/machinery/door/poddoor/bumpopen(mob/user)
	return

/obj/machinery/door/poddoor/open()
	. = ..()
	var/turf/current_turf = get_turf(src)
	if(anchored && current_turf && density)
		current_turf.atom_flags &= ~AI_BLOCKED

/obj/machinery/door/poddoor/close()
	. = ..()
	var/turf/current_turf = get_turf(src)
	if(anchored && current_turf && density)
		current_turf.atom_flags |= AI_BLOCKED

/obj/machinery/door/poddoor/Bumped(atom/AM)
	if(!density)
		return ..()
	else
		return FALSE


/obj/machinery/door/poddoor/try_to_activate_door(mob/user)
	return

/obj/machinery/door/poddoor/update_icon_state()
	. = ..()
	if(density)
		icon_state = "pdoor1"
	else
		icon_state = "pdoor0"

/obj/machinery/door/poddoor/do_animate(animation)
	switch(animation)
		if("opening")
			flick("pdoorc0", src)
		if("closing")
			flick("pdoorc1", src)
	playsound(loc, 'sound/machines/blastdoor.ogg', 25)

/obj/machinery/door/poddoor/opened
	density = FALSE
	opacity = FALSE
	icon_state = "pdoor0"

/obj/machinery/door/poddoor/opened/bridge
	name = "Bridge Blast Doors"
	id = "bridge blast"

/obj/machinery/door/poddoor/opened/sb
	name = "Blast Doors"
	id = "sb blast"

/obj/machinery/door/poddoor/opened/port
	name = "Blast Doors"
	id = "port blast"

/obj/machinery/door/poddoor/opened/engine
	name = "Engine Room Blast Door"
	id = "EngineBlast"

/obj/machinery/door/poddoor/opened/security
	name = "Security Blast Door"
	id = "Secure Gate"

/obj/machinery/door/poddoor/opened/isolation
	name = "Isolation Cell Lockdown"
	id = "IsoLock"

/obj/machinery/door/poddoor/opened/east
	name = "Blast Door"
	id = "eastblast"

/obj/machinery/door/poddoor/telecomms
	name = "Telecomms Emergency Window"
	id = "tcomwind"
	opacity = FALSE

/obj/machinery/door/poddoor/two_tile_hor
	icon = 'icons/obj/doors/1x2blast_hor.dmi'
	dir = EAST
	width = 2

/obj/machinery/door/poddoor/two_tile_hor/execution
	icon_state = "pdoor0"
	density = FALSE
	opacity = FALSE
	id = "execution"

/obj/machinery/door/poddoor/two_tile_hor/rocinante
	name = "Rocinante Cargo Bay Door"
	icon_state = "pdoor0"
	density = FALSE
	opacity = FALSE
	id = "pirate_cargo"

/obj/machinery/door/poddoor/two_tile_hor/teleporter
	name = "teleporter chamber blast door"
	icon_state = "pdoor0"
	density = FALSE
	opacity = FALSE
	id = "tele_array"

/obj/machinery/door/poddoor/two_tile_hor/secure
	icon = 'icons/obj/doors/1x2blast_hor.dmi'
	openspeed = 17
	resistance_flags = RESIST_ALL

/obj/machinery/door/poddoor/two_tile_ver
	icon = 'icons/obj/doors/1x2blast_vert.dmi'
	dir = NORTH
	width = 2

/obj/machinery/door/poddoor/two_tile_ver/riotarmory
	icon_state = "pdoor0"
	density = FALSE
	opacity = FALSE
	id = "riot_armory"

/obj/machinery/door/poddoor/two_tile_ver/lethalarmory
	icon_state = "pdoor0"
	density = FALSE
	opacity = FALSE
	id = "lethal_armory"

/obj/machinery/door/poddoor/two_tile_ver/secure
	icon = 'icons/obj/doors/1x2blast_vert.dmi'
	openspeed = 17
	resistance_flags = RESIST_ALL

/obj/machinery/door/poddoor/four_tile_hor
	icon = 'icons/obj/doors/1x4blast_hor.dmi'
	dir = EAST
	width = 4
	resistance_flags = UNACIDABLE

/obj/machinery/door/poddoor/four_tile_hor/secure
	icon = 'icons/obj/doors/1x4blast_hor_secure.dmi'
	openspeed = 17
	resistance_flags = RESIST_ALL

/obj/machinery/door/poddoor/four_tile_ver
	icon = 'icons/obj/doors/1x4blast_vert.dmi'
	dir = NORTH
	width = 4
	resistance_flags = UNACIDABLE

/obj/machinery/door/poddoor/four_tile_ver/secure
	icon = 'icons/obj/doors/1x4blast_vert_secure.dmi'
	openspeed = 17
	resistance_flags = RESIST_ALL

//mainship poddoors
/obj/machinery/door/poddoor/mainship
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	openspeed = 4 //shorter open animation.

/obj/machinery/door/poddoor/mainship/open
	density = FALSE
	opacity = FALSE
	layer = PODDOOR_OPEN_LAYER
	icon_state = "pdoor0"

/obj/machinery/door/poddoor/mainship/ai
	name = "\improper AI Core Shutters"
	icon_state = "pdoor0"

/obj/machinery/door/poddoor/mainship/ai/exterior
	name = "\improper AI Core Shutters"
	id = "ailockdownexterior"
	icon_state = "pdoor0"

/obj/machinery/door/poddoor/mainship/ai/interior
	name = "\improper AI Core Shutters"
	id = "ailockdowninterior"
	icon_state = "pdoor0"

/obj/machinery/door/poddoor/mainship/ammo
	name = "\improper Ammunition Storage"
	id = "ammo2"

/obj/machinery/door/poddoor/mainship/droppod
	name = "\improper Drop pod Bay"
	id = "droppod"

/obj/machinery/door/poddoor/mainship/open/cic
	name = "\improper Combat Information Center Blast Door"
	id = "cic_lockdown"

/obj/machinery/door/poddoor/mainship/open/nonsmoothing
	smoothing_groups = null

/obj/machinery/door/poddoor/mainship/hangar
	name = "\improper Hangar Lockdown"
	id = "hangar_lockdown"

/obj/machinery/door/poddoor/mainship/hangar/second
	name = "\improper Hangar Shutters"
	id = "hangar_shutters"

/obj/machinery/door/poddoor/mainship/mech
	name = "\improper Mech Shutters"
	id = "mech_shutters"
	resistance_flags = PLASMACUTTER_IMMUNE

/obj/machinery/door/poddoor/mainship/vehicle
	name = "\improper Armored Vehicle Shutters"
	id = "vehicle_armored"
	resistance_flags = PLASMACUTTER_IMMUNE

/obj/machinery/door/poddoor/mainship/umbilical
	name = "Umbilical Airlock"
	resistance_flags = RESIST_ALL

/obj/machinery/door/poddoor/mainship/umbilical/north
	id = "n_umbilical"


/obj/machinery/door/poddoor/mainship/umbilical/south
	id = "s_umbilical"


/obj/machinery/door/poddoor/mainship/indestructible
	resistance_flags = RESIST_ALL


/obj/machinery/door/poddoor/timed_late
	icon = 'icons/obj/doors/mainship/blastdoors_shutters.dmi'
	name = "Timed Emergency Shutters"
	use_power = FALSE
	resistance_flags = DROPSHIP_IMMUNE|RESIST_ALL

/obj/machinery/door/poddoor/timed_late/Initialize(mapload)
	RegisterSignals(SSdcs, list(COMSIG_GLOB_OPEN_TIMED_SHUTTERS_LATE, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_CRASH), PROC_REF(open))
	return ..()

/obj/machinery/door/poddoor/timed_late/containment
	name = "Containment shutters"
	desc = "Safety shutters triggered by some kind of lockdown event."
	resistance_flags = DROPSHIP_IMMUNE|RESIST_ALL|BLOCK_PASSTHROUGH_PROJECTILES
	open_layer = UNDER_TURF_LAYER //No longer needs to be interacted with.
	closed_layer = ABOVE_WINDOW_LAYER //Higher than usual, this is only around on the start of the round.

/obj/machinery/door/poddoor/timed_late/containment/landing_zone/Initialize(mapload)
	. = ..()
	if(mapload)
		var/area/ourarea = get_area(src)
		ENABLE_BITFIELD(ourarea.area_flags, DISALLOW_WEEDING)
		ENABLE_BITFIELD(ourarea.area_flags, NEAR_FOB)


/obj/machinery/door/poddoor/timed_late/containment/landing_zone/open()
	. = ..()
	var/area/ourarea = get_area(src)
	DISABLE_BITFIELD(ourarea.area_flags, DISALLOW_WEEDING)
	DISABLE_BITFIELD(resistance_flags, BLOCK_PASSTHROUGH_PROJECTILES)

/obj/machinery/door/poddoor/timed_late/containment/landing_zone/get_explosion_resistance()
	return density ? EXPLOSION_MAX_POWER : 0

/obj/machinery/door/poddoor/timed_late/containment/landing_zone
	id = "landing_zone"
	smoothing_groups = null

/obj/machinery/door/poddoor/timed_late/containment/landing_zone/lz2
	id = "landing_zone_2"
	smoothing_groups = null
