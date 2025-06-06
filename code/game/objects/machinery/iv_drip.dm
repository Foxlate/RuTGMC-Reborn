/obj/machinery/iv_drip
	name = "\improper IV drip"
	icon = 'icons/obj/iv_drip.dmi'
	icon_state = "iv_drip"
	anchored = FALSE
	density = FALSE
	drag_delay = 1
	var/mob/living/carbon/human/attached = null
	/// 1 is injecting, 0 is taking blood.
	var/mode = 1
	var/obj/item/reagent_containers/beaker = null
	var/datum/beam/current_beam

/obj/machinery/iv_drip/update_icon_state()
	. = ..()
	if(attached)
		icon_state = "iv_drip_hooked"
	else
		icon_state = "iv_drip"

/obj/machinery/iv_drip/update_overlays()
	. = ..()

	if(!beaker)
		return

	var/datum/reagents/reagents = beaker.reagents
	if(!reagents?.total_volume)
		return

	var/image/filling = image('icons/obj/iv_drip.dmi', src, "reagent")

	var/percent = round((reagents.total_volume / beaker.volume) * 100)
	switch(percent)
		if(0 to 9)
			filling.icon_state = "reagent0"
		if(10 to 24)
			filling.icon_state = "reagent10"
		if(25 to 49)
			filling.icon_state = "reagent25"
		if(50 to 74)
			filling.icon_state = "reagent50"
		if(75 to 79)
			filling.icon_state = "reagent75"
		if(80 to 90)
			filling.icon_state = "reagent80"
		if(91 to INFINITY)
			filling.icon_state = "reagent100"

	filling.color = mix_color_from_reagents(reagents.reagent_list)
	. += filling

/obj/machinery/iv_drip/proc/update_beam()
	if(current_beam && !attached)
		QDEL_NULL(current_beam)
	else if(!current_beam && attached && !QDELETED(src))
		current_beam = beam(attached, "iv_tube", 'icons/effects/beam.dmi')

/obj/machinery/iv_drip/MouseDrop(over_object, src_location, over_location)
	. = ..()

	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		if(H.stat || get_dist(H, src) > 1 || is_blind(H) || H.lying_angle)
			return

		if(attached)
			H.visible_message("[H] detaches \the [src] from \the [attached].", \
			"You detach \the [src] from \the [attached].")
			attached = null
			update_beam()
			update_icon()
			STOP_PROCESSING(SSobj, src)
			return

		if(in_range(src, usr) && ishuman(over_object) && get_dist(over_object, src) <= 1)
			H.visible_message("[H] attaches \the [src] to \the [over_object].", \
			"You attach \the [src] to \the [over_object].")
			attached = over_object
			update_beam()
			update_icon()
			START_PROCESSING(SSobj, src)

/obj/machinery/iv_drip/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/reagent_containers))
		if(beaker)
			to_chat(user, span_warning("There is already a reagent container loaded!"))
			return

		if((!istype(I, /obj/item/reagent_containers/blood) && !istype(I, /obj/item/reagent_containers/glass)) || istype(I, /obj/item/reagent_containers/glass/bucket))
			to_chat(user, span_warning("That won't fit!"))
			return

		if(!user.transferItemToLoc(I, src))
			return

		beaker = I

		var/reagentnames = ""
		for(var/datum/reagent/R in beaker.reagents.reagent_list)
			reagentnames += ";[R.name]"

		to_chat(user, "You attach \the [I] to \the [src].")
		update_icon()
		update_beam()

/obj/machinery/iv_drip/process()
	if(!attached)
		return

	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		visible_message("The needle is ripped out of [attached], doesn't that hurt?")
		attached.apply_damage(3, BRUTE, pick("r_arm", "l_arm"))
		attached = null
		update_beam()
		update_icon()
		STOP_PROCESSING(SSobj, src)
		return

	if(!beaker)
		return

	if(mode) // Give blood
		if(beaker.volume > 0)
			var/transfer_amount = REAGENTS_METABOLISM
			if(istype(beaker, /obj/item/reagent_containers/blood))
				// speed up transfer on blood packs
				transfer_amount = 4
			attached.inject_blood(beaker, transfer_amount)
			update_icon()

	else // Take blood
		var/amount = beaker.reagents.maximum_volume - beaker.reagents.total_volume
		amount = min(amount, 4)
		// If the beaker is full, ping
		if(amount == 0 && !TIMER_COOLDOWN_CHECK(src, COOLDOWN_IV_PING))
			visible_message("\The [src] pings.")
			TIMER_COOLDOWN_START(src, COOLDOWN_IV_PING, 2 SECONDS)
			return

		var/mob/living/carbon/human/T = attached

		if(!istype(T))
			return
		if(!T.blood_type)
			return

		if(T.species?.species_flags & NO_BLOOD)
			return

		// If the human is losing too much blood, beep.
		if(T.blood_volume < BLOOD_VOLUME_SAFE && !TIMER_COOLDOWN_CHECK(src, COOLDOWN_IV_PING))
			visible_message("\The [src] beeps loudly.")
			TIMER_COOLDOWN_START(src, COOLDOWN_IV_PING, 2 SECONDS)

		T.take_blood(beaker, amount)
		update_icon()

/obj/machinery/iv_drip/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(beaker)
		beaker.loc = get_turf(src)
		beaker = null
		update_icon()

/obj/machinery/iv_drip/verb/toggle_mode()
	set category = "IC.Object"
	set name = "Toggle Mode"
	set src in view(1)

	if(!isliving(usr))
		return

	if(usr.stat || usr.lying_angle)
		return

	mode = !mode
	to_chat(usr, "The IV drip is now [mode ? "injecting" : "taking blood"].")

/obj/machinery/iv_drip/examine(mob/user)
	. = ..()
	. += "The IV drip is [mode ? "injecting" : "taking blood"]."

	if(beaker)
		if(beaker.reagents && length(beaker.reagents.reagent_list))
			. += span_notice("Attached is \a [beaker] with [beaker.reagents.total_volume] units of liquid.")
		else
			. += span_notice("Attached is an empty [beaker].")
	else
		. += span_notice("No chemicals are attached.")
	. += span_notice("[attached ? attached : "No one"] is attached.")

/obj/machinery/iv_drip/Destroy()
	attached = null
	update_beam()
	return ..()
