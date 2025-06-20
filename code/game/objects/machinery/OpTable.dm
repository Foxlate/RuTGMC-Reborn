/obj/machinery/optable
	name = "Operating Table"
	desc = "Used for advanced medical procedures."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "table2_idle"
	base_icon_state = "table2"
	density = TRUE
	coverage = 10
	layer = TABLE_LAYER
	anchored = TRUE
	resistance_flags = UNACIDABLE
	allow_pass_flags = PASS_LOW_STRUCTURE|PASSABLE|PASS_WALKOVER
	use_power = IDLE_POWER_USE
	idle_power_usage = 1
	active_power_usage = 5
	buckle_flags = CAN_BUCKLE
	buckle_lying = 90
	light_power = 0.2
	light_range = 0.4
	var/mob/living/carbon/human/victim = null
	var/strapped = 0
	var/obj/item/tank/anesthetic/anes_tank
	var/obj/machinery/computer/operating/computer = null

/obj/machinery/optable/Initialize(mapload)
	. = ..()

	var/static/list/connections = list(
		COMSIG_OBJ_TRY_ALLOW_THROUGH = PROC_REF(can_climb_over),
		COMSIG_FIND_FOOTSTEP_SOUND = TYPE_PROC_REF(/atom/movable, footstep_override),
		COMSIG_TURF_CHECK_COVERED = TYPE_PROC_REF(/atom/movable, turf_cover_check),
	)
	AddElement(/datum/element/connect_loc, connections)

	return INITIALIZE_HINT_LATELOAD

/obj/machinery/optable/LateInitialize()
	for(dir in list(NORTH, EAST, SOUTH, WEST))
		computer = locate(/obj/machinery/computer/operating, get_step(src, dir))
		if(computer)
			computer.table = src
			break

/obj/machinery/optable/Destroy()
	computer = null
	return ..()

/obj/machinery/optable/update_icon_state()
	. = ..()

	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		set_light(0, 0)
	else
		set_light(initial(light_range), initial(light_power))

/obj/machinery/optable/update_overlays()
	. = ..()
	if(machine_stat & (BROKEN|DISABLED|NOPOWER))
		return
	. += emissive_appearance(icon, "[icon_state]_emissive", alpha = src.alpha)
	. += mutable_appearance(icon, "[icon_state]_emissive", alpha = src.alpha)

/obj/machinery/optable/ex_act(severity)
	if(prob(severity * 0.3))
		qdel(src)

/obj/machinery/optable/examine(mob/user)
	. = ..()
	if(get_dist(user, src) > 2 && !isobserver(user))
		return
	if(anes_tank)
		. += span_information("It has an [anes_tank].")

/obj/machinery/optable/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(anes_tank)
		user.put_in_active_hand(anes_tank)
		to_chat(user, span_notice("You remove \the [anes_tank] from \the [src]."))
		playsound(loc, 'sound/effects/air_release.ogg', 25, 1)
		anes_tank = null

/obj/machinery/optable/user_buckle_mob(mob/living/buckling_mob, mob/user, check_loc = TRUE, silent)
	if(!ishuman(buckling_mob))
		return FALSE
	if(buckling_mob == user)
		return FALSE
	if(!ishuman(user)) //xenos buckling humans into op tables and applying anesthetic masks? no way.
		to_chat(user, span_xenowarning("We don't have the manual dexterity to do this."))
		return FALSE
	if(buckling_mob != victim)
		to_chat(user, span_warning("Lay the patient on the table first!"))
		return FALSE
	if(!anes_tank)
		to_chat(user, span_warning("There is no anesthetic tank connected to the table, load one first."))
		return FALSE
	buckling_mob.visible_message(span_notice("[user] begins to connect [buckling_mob] to the anesthetic system."))
	if(!do_after(user, 2.5 SECONDS, IGNORE_HELD_ITEM, src, BUSY_ICON_GENERIC))
		if(buckling_mob != victim)
			to_chat(user, span_warning("The patient must remain on the table!"))
			return FALSE
		to_chat(user, span_notice("You stop placing the mask on [buckling_mob]'s face."))
		return FALSE
	if(!anes_tank)
		to_chat(user, span_warning("There is no anesthetic tank connected to the table, load one first."))
		return FALSE
	var/mob/living/carbon/human/buckling_human = buckling_mob
	if(buckling_human.wear_mask && !buckling_human.dropItemToGround(buckling_human.wear_mask))
		to_chat(user, span_danger("You can't remove their mask!"))
		return FALSE
	if(!buckling_human.equip_to_slot_or_del(new /obj/item/clothing/mask/breath/medical(buckling_human), SLOT_WEAR_MASK))
		to_chat(user, span_danger("You can't fit the gas mask over their face!"))
		return FALSE
	buckling_human.visible_message("[span_notice("[user] fits the mask over [buckling_human]'s face and turns on the anesthetic.")]'")
	to_chat(buckling_human, span_information("You begin to feel sleepy."))
	addtimer(CALLBACK(src, PROC_REF(knock_out_buckled), buckling_human), rand(2 SECONDS, 4 SECONDS))
	buckling_human.setDir(SOUTH)
	return ..()

///Knocks out someone buckled to the op table a few seconds later. Won't knock out if they've been unbuckled since.
/obj/machinery/optable/proc/knock_out_buckled(mob/living/buckled_mob)
	if(!victim || victim != buckled_mob)
		return
	ADD_TRAIT(buckled_mob, TRAIT_KNOCKEDOUT, OPTABLE_TRAIT)

/obj/machinery/optable/user_unbuckle_mob(mob/living/buckled_mob, mob/user, silent)
	. = ..()
	if(!.)
		return
	if(!silent)
		buckled_mob.visible_message(span_notice("[user] turns off the anesthetic and removes the mask from [buckled_mob]."))

/obj/machinery/optable/post_unbuckle_mob(mob/living/buckled_mob)
	if(!ishuman(buckled_mob)) // sanity check
		return
	var/mob/living/carbon/human/buckled_human = buckled_mob
	var/obj/item/anesthetic_mask = buckled_human.wear_mask
	buckled_human.dropItemToGround(anesthetic_mask)
	qdel(anesthetic_mask)
	addtimer(TRAIT_CALLBACK_REMOVE(buckled_mob, TRAIT_KNOCKEDOUT, OPTABLE_TRAIT), rand(2 SECONDS, 4 SECONDS))
	return ..()

/obj/machinery/optable/MouseDrop_T(atom/A, mob/user)
	if(istype(A, /obj/item))
		var/obj/item/I = A
		if (!istype(I) || user.get_active_held_item() != I)
			return
		if(user.drop_held_item())
			if (I.loc != loc)
				step(I, get_dir(I, src))
	else if(ismob(A))
		return ..(A, user)

/obj/machinery/optable/proc/check_victim()
	if(locate(/mob/living/carbon/human, loc))
		var/mob/living/carbon/human/M = locate(/mob/living/carbon/human, loc)
		if(M.lying_angle)
			victim = M
			icon_state = M.handle_pulse() ? "[base_icon_state]_active" : "[base_icon_state]_idle"
			update_icon()
			return TRUE
	victim = null
	stop_processing()
	icon_state = "[base_icon_state]_idle"
	update_icon()
	return FALSE

/obj/machinery/optable/process()
	check_victim()

/obj/machinery/optable/proc/take_victim(mob/living/carbon/C, mob/living/carbon/user)
	if (C == user)
		user.visible_message(span_notice("[user] climbs on the operating table."), span_notice("You climb on the operating table."), null, null, 4)
	else
		visible_message(span_notice("[C] has been laid on the operating table by [user]."), null, null, 4)
	C.set_resting(TRUE)
	C.forceMove(loc)

	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		victim = H
		start_processing()
		icon_state = H.handle_pulse() ? "[base_icon_state]_active" : "[base_icon_state]_idle"
	else
		icon_state = "[base_icon_state]_idle"
	update_icon()

/obj/machinery/optable/verb/climb_on()
	set name = "Climb On Table"
	set category = "IC.Mob"
	set src in oview(1)

	if(usr.stat || !ishuman(usr) || usr.restrained() || !check_table(usr))
		return

	take_victim(usr,usr)

/obj/machinery/optable/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/tank/anesthetic))
		if(anes_tank)
			return
		user.transferItemToLoc(I, src)
		anes_tank = I
		to_chat(user, span_notice("You connect \the [anes_tank] to \the [src]."))
	
	if(istype(I, /obj/item/riding_offhand))
		var/obj/item/riding_offhand/carry_obj = I
		if(carry_obj.is_rider(user))
			return
		if(victim)
			balloon_alert(user, "already has patient!")
			return
		if(!take_victim(carry_obj.rider, user))
			return
		qdel(carry_obj)

/obj/machinery/optable/grab_interact(obj/item/grab/grab, mob/user, base_damage = BASE_OBJ_SLAM_DAMAGE, is_sharp = FALSE)
	. = ..()
	if(.)
		return

	if(victim && victim != grab.grabbed_thing)
		to_chat(user, span_warning("The table is already occupied!"))
		return
	var/mob/living/carbon/grabbed_mob
	if(iscarbon(grab.grabbed_thing))
		grabbed_mob = grab.grabbed_thing
		if(grabbed_mob.buckled)
			to_chat(user, span_warning("Unbuckle first!"))
			return
	else if(istype(grab.grabbed_thing, /obj/structure/closet/bodybag/cryobag))
		var/obj/structure/closet/bodybag/cryobag/cryobag = grab.grabbed_thing
		if(!cryobag.bodybag_occupant)
			return
		grabbed_mob = cryobag.bodybag_occupant
		cryobag.open()
		user.stop_pulling()
		user.start_pulling(grabbed_mob)

	if(!grabbed_mob)
		return

	take_victim(grabbed_mob, user)
	return TRUE

/obj/machinery/optable/proc/check_table(mob/living/carbon/patient as mob)
	if(victim)
		to_chat(usr, span_boldnotice("The table is already occupied!"))
		return FALSE

	if(patient.buckled)
		to_chat(usr, span_boldnotice("Unbuckle first!"))
		return FALSE

	return TRUE
/obj/machinery/optable/yautja
	icon = 'icons/obj/machines/yautja_machines.dmi'

/obj/machinery/optable/valhalla
	use_power = NO_POWER_USE
