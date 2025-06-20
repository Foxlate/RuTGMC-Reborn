/obj/item/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	worn_icon_state = "utility"
	worn_icon_state_worn = TRUE
	equip_slot_flags = ITEM_SLOT_BELT
	attack_verb = list("whips", "lashes", "disciplines")
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt

/obj/item/storage/belt/equipped(mob/user, slot)
	if(slot == SLOT_BELT)
		mouse_opacity = 2 //so it's easier to click when properly equipped.
	return ..()

/obj/item/storage/belt/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	return ..()

/obj/item/storage/belt/vendor_equip(mob/user)
	. = ..()
	return user.equip_to_appropriate_slot(src)

/obj/item/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	worn_icon_state = "champion"
	storage_type = /datum/storage/belt/champion

/*============================//MARINE BELTS\\==================================
=======================================================================*/

/obj/item/storage/belt/utility
	name = "\improper M276 pattern toolbelt rig" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version lacks any combat functionality, and is commonly used by engineers to transport important tools."
	icon_state = "utilitybelt"
	worn_icon_state = "utility"
	storage_type = /datum/storage/belt/utility

/obj/item/storage/belt/utility/full/PopulateContents()
	new /obj/item/tool/screwdriver (src)
	new /obj/item/tool/wirecutters (src)
	new /obj/item/tool/weldingtool (src)
	new /obj/item/tool/wrench (src)
	new /obj/item/tool/crowbar (src)
	new /obj/item/stack/cable_coil(src, 30, pick("red", "yellow", "orange"))
	new /obj/item/tool/multitool(src)

/obj/item/storage/belt/utility/atmostech/PopulateContents()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/t_scanner(src)

/obj/item/storage/belt/medical_small
	name = "\improper M276 pattern light medical rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This lightweight configuration is often used for bulk carrying of medical supplies by marines."
	icon_state = "medicalbelt_small"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/medical_small

/obj/item/storage/belt/lifesaver
	name = "\improper M276 pattern lifesaver bag"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. This configuration mounts a duffel bag filled with a range of injectors and light medical supplies and is common among medics."
	icon_state = "medicalbag"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/lifesaver

/obj/item/storage/belt/lifesaver/full/PopulateContents()  //The belt, with all it's magic inside!
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/imialky(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/quick/PopulateContents()  //quick load for combat patrol
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/imialky(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/beginner/PopulateContents() //For beginner vendor
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/imialky(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/full/upp
	name = "\improper Type 41 pattern lifesaver bag"
	desc = "The Type 41 load rig is the standard-issue LBE of the UPP military. This configuration mounts a satchel filled with a range of injectors and light medical supplies, common among medics and partisans."
	icon_state = "medicbag_upp"
	worn_icon_state = "medicbag_upp"

/obj/item/storage/belt/lifesaver/som
	name = "\improper S17 lifesaver bag"
	desc = "A belt with heavy origins from the belt used by paramedics and doctors in the old mining colonies."
	icon_state = "medicbag_som"
	worn_icon_state = "medicbag_som"

/obj/item/storage/belt/lifesaver/som/ert/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/som/quick/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/imialky(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/dexalinplus(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/lifesaver/icc
	name = "\improper Modelle/129 lifesaver bag"
	desc = "A medical belt made from synthetic tan fibres, carries just about anything you would need to respond to traumatic injury in combat."
	icon_state = "medicbag_icc"
	worn_icon_state = "medicbag_icc"

/obj/item/storage/belt/lifesaver/icc/ert/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/storage/pill_bottle/meralyne(src)
	new /obj/item/storage/pill_bottle/dermaline(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/rig
	name = "\improper M276 pattern medical storage rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version is a less common configuration, designed to transport medical supplies and heavier medical tools."
	icon_state = "medicalbelt"
	worn_icon_state = "medical"
	storage_type = /datum/storage/belt/rig

/obj/item/storage/belt/rig/medical/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/imialky(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/roller(src)
	new /obj/item/defibrillator(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/rig/research/PopulateContents()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/isotonic(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/defibrillator(src)
	new /obj/item/tool/research/excavation_tool(src)
	new /obj/item/tool/research/xeno_analyzer(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/hypospraybelt
	name = "\improper M276 pattern hypospray belt"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version is a less common configuration, designed to transport hyposprays and reagent containers. You could probably fit a syringe case too."
	icon_state = "hypospraybelt"
	worn_icon_state = "medicbag"
	storage_type = /datum/storage/belt/hypospraybelt

/obj/item/storage/belt/hypospraybelt/full/PopulateContents()
	new /obj/item/reagent_containers/glass/bottle/bicaridine(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/glass/bottle/combatmix(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/kelotane(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tramadol(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/combatmix(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dylovene(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/isotonic(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/advanced/imialky(src)
	new /obj/item/reagent_containers/hypospray/advanced/hypervene(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/hypospraybelt/beginner/PopulateContents()
	new /obj/item/reagent_containers/glass/bottle/bicaridine(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/kelotane(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tramadol(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/combatmix(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dylovene(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/isotonic(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/quickclot(src)
	new /obj/item/reagent_containers/hypospray/advanced/imialky(src)
	new /obj/item/reagent_containers/hypospray/advanced/hypervene(src)
	new /obj/item/reagent_containers/hypospray/advanced/peridaxon(src)
	new /obj/item/reagent_containers/hypospray/advanced/quickclot(src)
	new /obj/item/storage/syringe_case/meraderm(src)
	new /obj/item/storage/syringe_case/meraderm(src)
	new /obj/item/reagent_containers/hypospray/advanced/meraderm(src)

/obj/item/storage/belt/security
	name = "\improper M276 pattern security rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This configuration is commonly seen among TGMC Military Police and peacekeepers, though it can hold some light munitions."
	icon_state = "securitybelt"
	worn_icon_state = "security"//Could likely use a better one.
	storage_type = /datum/storage/belt/security

/obj/item/storage/belt/security/tactical
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swatbelt"
	worn_icon_state = "swatbelt"
	storage_type = /datum/storage/belt/security/tactical

/obj/item/storage/belt/security/mp/PopulateContents()
	new /obj/item/explosive/grenade/flashbang(src)
	new /obj/item/explosive/grenade/chem_grenade/teargas(src)
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/flash(src)
	new /obj/item/weapon/baton(src)

/obj/item/storage/belt/marine
	name = "\improper M276 pattern ammo load rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version is the standard variant designed for bulk ammunition-carrying operations."
	icon_state = "marinebelt"
	worn_icon_state = "marinebelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/marine

/obj/item/storage/belt/marine/auto_catch
	name = "\improper M344 pattern ammo load rig"
	desc = "The M344 is the modern load-bearing equipment of the TGMC. It consists of a modular belt with various clips. Allows you to quickly obtain and use equipment during combat operations."
	icon_state = "autocathbelt"
	storage_type = /datum/storage/belt/marine/auto_catch

/obj/item/storage/belt/marine/auto_catch/Initialize(mapload, ...)
	. = ..()
	AddComponent(/datum/component/magazine_catcher)
	AddComponent(/datum/component/easy_restock)

/obj/item/storage/belt/marine/ar12/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/ar12(src)

/obj/item/storage/belt/marine/ar18/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/ar18(src)

/obj/item/storage/belt/marine/ar21/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/ar21(src)

/obj/item/storage/belt/marine/br64/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/br64(src)

/obj/item/storage/belt/marine/t90/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/smg/smg90(src)

/obj/item/storage/belt/marine/secondary/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/smg/m25(src)

/obj/item/storage/belt/marine/antimaterial/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/sniper(src)

/obj/item/storage/belt/marine/tx8/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/tx8(src)

/obj/item/storage/belt/marine/combat_rifle/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/ar11(src)

/obj/item/storage/belt/marine/alf_machinecarbine/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/alf_machinecarbine(src)

/obj/item/storage/belt/marine/auto_shotgun/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/ammo_magazine/rifle/sh15_slug(src)
	for(var/i in 1 to 3)
		new /obj/item/ammo_magazine/rifle/sh15_flechette(src)

/obj/item/storage/belt/marine/te_cells/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cell/lasgun/lasrifle(src)

/obj/item/storage/belt/marine/oicw/PopulateContents()
	new /obj/item/ammo_magazine/rifle/ar12(src)
	new /obj/item/ammo_magazine/rifle/ar12(src)
	new /obj/item/ammo_magazine/rifle/tx54/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx54/incendiary(src)
	new /obj/item/ammo_magazine/rifle/tx54(src)
	new /obj/item/ammo_magazine/rifle/tx54(src)

/obj/item/storage/belt/marine/smartgun/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/sg29(src)

/obj/item/storage/belt/marine/sg62/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/sg62(src)

/obj/item/storage/belt/marine/upp
	name = "\improper Type 41 pattern load rig"
	desc = "The Type 41 load rig is the standard-issue LBE of the USL pirates. The primary function of this belt is to provide easy access to mags for the Type 71 during operations. Despite being designed for the Type 71 weapon system, the pouches are modular enough to fit other types of ammo and equipment."
	icon_state = "upp_belt"
	worn_icon_state = "upp_belt"

//version full of type 71 mags
/obj/item/storage/belt/marine/upp/full/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/type71(src)

/obj/item/storage/belt/marine/som
	name = "\improper S18 ammo belt"
	desc = "A belt with origins traced to the M276 ammo belt and some old colony security."
	icon_state = "som_belt"
	worn_icon_state = "som_belt"

/obj/item/storage/belt/marine/som/som_rifle/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/som(src)

/obj/item/storage/belt/marine/som/som_rifle_ap/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/som/ap(src)

/obj/item/storage/belt/marine/som/som_smg/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/smg/som(src)

/obj/item/storage/belt/marine/som/som_smg_ap/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/smg/som/ap(src)

/obj/item/storage/belt/marine/som/volkite/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/cell/lasgun/volkite(src)

/obj/item/storage/belt/marine/som/mpi_plum/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/mpi_km/plum(src)

/obj/item/storage/belt/marine/som/mpi_black/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/mpi_km/black(src)

/obj/item/storage/belt/marine/som/carbine/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/mpi_km/carbine(src)

/obj/item/storage/belt/marine/som/carbine_black/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/ammo_magazine/rifle/mpi_km/carbine/black(src)

/obj/item/storage/belt/marine/icc
	name = "\improper Modello/120 ammo belt"
	desc = "A belt purpose made to carry ammo, made with a tan synthetic fibre."
	icon_state = "icc_belt"

/obj/item/storage/belt/marine/sectoid
	name = "\improper strange ammo belt"
	desc = "A belt made of a strong but unusual fabric, with clips to hold your equipment."
	icon_state = "swatbelt"
	worn_icon_state = "swatbelt"
	storage_type = /datum/storage/belt/marine/sectoid

/obj/item/storage/belt/marine/sectoid/full/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/ammo_magazine/rifle/sectoid_rifle(src)
	new /obj/item/tool/crowbar/red(src)

/obj/item/storage/belt/shotgun
	name = "\improper shotgun shell load rig"
	desc = "An ammunition belt designed to hold shotgun shells or individual bullets."
	icon_state = "shotgunbelt"
	worn_icon_state = "shotgunbelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/shotgun

/obj/item/storage/belt/shotgun/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/M = I
		if(CHECK_BITFIELD(M.magazine_flags, MAGAZINE_HANDFUL))
			return ..()
		if(M.magazine_flags & MAGAZINE_REFILLABLE)
			if(!M.current_rounds)
				to_chat(user, span_warning("[M] is empty."))
				return

			if(length(contents) >= storage_datum.storage_slots)
				to_chat(user, span_warning("[src] is full."))
				return

			to_chat(user, span_notice("You start refilling [src] with [M]."))
			if(!do_after(user, 1.5 SECONDS, NONE, src, BUSY_ICON_GENERIC))
				return

			for(var/x in 1 to (storage_datum.storage_slots - length(contents)))
				var/cont = storage_datum.handle_item_insertion(M.create_handful(), 1, user)
				if(!cont)
					break

			playsound(user.loc, SFX_RUSTLE, 15, TRUE, 6)
			to_chat(user, span_notice("You refill [src] with [M]."))
			return TRUE
	return ..()

/obj/item/storage/belt/shotgun/flechette/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/mixed/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/buckshot(src)
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/som
	desc = "An ammunition belt designed to hold shotgun shells or individual bullets. Made with traditional SOM leather."
	icon_state = "shotgunbelt_som"

/obj/item/storage/belt/shotgun/som/flechette/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/som/mixed/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/buckshot(src)
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/icc
	name = "\improper Modelle/121 shell load rig"
	desc = "An ammunition belt designed to hold shotgun shells or individual bullets, made with a synthetic tan fibre."
	icon_state = "shotgunbelt_icc"

/obj/item/storage/belt/shotgun/icc/flechette/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_magazine/handful/flechette(src)

/obj/item/storage/belt/shotgun/icc/mixed/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/heavy_buckshot(src)
	for(var/i in 1 to 7)
		new /obj/item/ammo_magazine/handful/barrikada(src)

/obj/item/storage/belt/shotgun/martini
	name = "martini henry ammo belt"
	desc = "A belt good enough for holding all your .577/400 ball rounds."
	icon_state = "martini_belt"
	atom_flags = DIRLOCK
	storage_type = /datum/storage/belt/shotgun/martini

/obj/item/storage/belt/shotgun/martini/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/storage/belt/shotgun/martini/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/new_mag = I
		if(new_mag.caliber != CALIBER_557)
			to_chat(user, span_notice("[src] can only be filled with .557/440 ball rifle rounds."))
			return
	. = ..()
	update_icon()

/obj/item/storage/belt/shotgun/martini/attack_hand(mob/living/user)
	if (loc != user)
		. = ..()
		for(var/mob/watcher_mobs in storage_datum.content_watchers)
			storage_datum.close(watcher_mobs)

	if(!storage_datum.draw_mode || !ishuman(user) && !length(contents))
		storage_datum.open(user)

	if(!length(contents))
		return

	var/obj/item/I = contents[length(contents)]
	if(!istype(I, /obj/item/ammo_magazine/handful))
		return

	var/obj/item/ammo_magazine/handful/existing_handful = I

	if(existing_handful.current_rounds == 1)
		user.put_in_hands(existing_handful)
		return

	existing_handful.create_handful(user, 1)
	update_icon()

/obj/item/storage/belt/knifepouch
	name = "\improper M276 pattern knife rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version is specially designed with six holsters to store throwing knives. Not commonly issued, but kept in service."
	icon_state = "knifebelt"
	worn_icon_state = "knifebelt"
	storage_type = /datum/storage/belt/knifepouch

/obj/item/storage/belt/knifepouch/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/stack/throwing_knife(src)

/obj/item/storage/belt/grenade
	name = "\improper M276 pattern M40 HEDP rig"
	desc = "The M276 is the standard load-bearing equipment of the TGMC. It consists of a modular belt with various clips. This version is designed to carry bulk quantities of M40 HEDP Grenades."
	icon_state = "grenadebelt"
	worn_icon_state = "grenadebelt"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/grenade

/obj/item/storage/belt/grenade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/tac_reload_storage)

/obj/item/storage/belt/grenade/standard/PopulateContents()
	new /obj/item/explosive/grenade/incendiary(src)
	new /obj/item/explosive/grenade/incendiary(src)
	for(var/i in 1 to 6)
		new /obj/item/explosive/grenade(src)

/obj/item/storage/belt/grenade/som
	name = "\improper S16 pattern grenade rig"
	desc = "A simple harness system available in many configurations. This version is designed to carry bulk quantities of grenades."
	icon_state = "grenadebelt_som"

/obj/item/storage/belt/grenade/som/standard/PopulateContents()
	new /obj/item/explosive/grenade/incendiary/som(src)
	new /obj/item/explosive/grenade/incendiary/som(src)
	for(var/i in 1 to 6)
		new /obj/item/explosive/grenade/som(src)

/obj/item/storage/belt/grenade/b17
	name = "\improper M276 pattern M40 HEDP rig Mk II"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/grenade/b17

/obj/item/storage/belt/grenade/b17/PopulateContents()
	for(var/i in 1 to 8)
		new /obj/item/explosive/grenade/incendiary(src)
	for(var/i in 1 to 8)
		new /obj/item/explosive/grenade(src)

/obj/item/storage/belt/sparepouch
	name = "\improper G8 general utility pouch"
	desc = "A small, lightweight pouch that can be clipped onto Armat Systems M3 Pattern armor or your belt to provide additional storage for miscellaneous gear or box and drum magazines."
	w_class = WEIGHT_CLASS_BULKY
	icon_state = "sparepouch"
	worn_icon_state = "sparepouch"
	storage_type = /datum/storage/belt/sparepouch

/obj/item/storage/belt/sparepouch/som
	name = "standard utility pouch"
	desc = "A small, lightweight pouch that can be clipped onto armor or your belt to provide additional storage for miscellaneous gear or box and drum magazines. Made from genuine SOM leather."
	icon_state = "sparepouch_som"
	worn_icon_state = "som_belt"

/obj/item/storage/belt/protein_pack
	name = "\improper protein pack load rig"
	desc = "A storage belt designed to hold mass amounts of protein packs for those particuarly hungry marines."
	icon_state = "p_belt"
	worn_icon_state = "shotgunbelt"
	storage_type = /datum/storage/belt/protein_pack

/obj/item/storage/belt/protein_pack/PopulateContents()
	for(var/i in 1 to storage_datum.storage_slots)
		new /obj/item/reagent_containers/food/snacks/protein_pack(src)

/obj/item/storage/belt/mortar_belt
	name = "TA-10 mortar belt"
	desc = "A belt that holds a TA-10 50mm Mortar, rangefinder and a lot of ammo for it."
	icon_state = "kneemortar_holster"
	worn_icon_state = "m4a3_holster"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/belt/mortar_belt

/obj/item/storage/belt/mortar_belt/full/PopulateContents()
	new /obj/item/mortar_kit/knee(src)
	new /obj/item/binoculars/tactical/range(src)
