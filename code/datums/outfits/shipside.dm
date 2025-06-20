/datum/outfit/job/command/captain
	name = CAPTAIN
	jobtype = /datum/job/terragov/command/captain

	id = /obj/item/card/id/gold
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/command
	shoes = /obj/item/clothing/shoes/marinechief/captain
	gloves = /obj/item/clothing/gloves/marine/techofficer/captain
	r_pocket = /obj/item/storage/pouch/general/large/command
	l_pocket = /obj/item/hud_tablet/leadership
	belt = /obj/item/storage/holster/blade/officer/sabre/full
	glasses = /obj/item/clothing/glasses/sunglasses/aviator/yellow
	head = null
	back = FALSE
	r_hand = /obj/item/weapon/gun/shotgun/double/musket
	l_hand = /obj/item/ammo_magazine/packet/musket

/datum/outfit/job/command/fieldcommander
	name = FIELD_COMMANDER
	jobtype = /datum/job/terragov/command/fieldcommander

	id = /obj/item/card/id/dogtag/fc
	belt = /obj/item/storage/holster/blade/officer/full
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/exec
	wear_suit = /obj/item/clothing/suit/modular/xenonauten
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine/officer
	head = /obj/item/clothing/head/tgmcberet/fc
	r_pocket = /obj/item/storage/pouch/general/large/command
	l_pocket = /obj/item/hud_tablet/fieldcommand
	suit_store = /obj/item/storage/holster/belt/pistol/m4a3/fieldcommander

/datum/outfit/job/command/staffofficer
	name = STAFF_OFFICER
	jobtype = /datum/job/terragov/command/staffofficer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/pistol/m4a3/officer
	ears = /obj/item/radio/headset/mainship/mcom
	r_pocket = /obj/item/storage/pouch/general/large
	l_pocket = /obj/item/binoculars/tactical
	back = FALSE
	head = null
	w_uniform = /obj/item/clothing/under/marine/whites/blacks
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/weapon/gun/shotgun/double/musketoon
	l_hand = /obj/item/ammo_magazine/packet/musket/small

/datum/outfit/job/command/transportofficer
	name = TRANSPORT_OFFICER
	jobtype = /datum/job/terragov/command/transportofficer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/pilot
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/pilot
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine/insulated
	glasses = /obj/item/clothing/glasses/welding/superior
	head = /obj/item/clothing/head/helmet/marine/pilot
	r_pocket = /obj/item/storage/pouch/construction
	l_pocket = /obj/item/hud_tablet/transportofficer
	back = /obj/item/storage/backpack/marine/engineerpack
	suit_store = /obj/item/storage/holster/belt/pistol/m4a3/vp70

	r_pocket_contents = list(
		/obj/item/stack/sheet/metal/large_stack = 1,
		/obj/item/stack/sheet/plasteel/large_stack = 1,
		/obj/item/stack/sandbags/large_stack = 1,
		/obj/item/stack/barbed_wire/full = 1,
	)

/datum/outfit/job/command/pilot
	name = PILOT_OFFICER
	jobtype = /datum/job/terragov/command/pilot

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/pistol/m4a3/vp70
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/pilot
	wear_suit = /obj/item/clothing/suit/modular/xenonauten/pilot
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/insulated
	glasses = /obj/item/clothing/glasses/sunglasses/aviator
	head = /obj/item/clothing/head/helmet/marine/pilot
	r_pocket = /obj/item/clothing/glasses/night/imager_goggles
	l_pocket = /obj/item/hud_tablet/pilot

/datum/outfit/job/command/mech_pilot
	name = MECH_PILOT
	jobtype = /datum/job/terragov/command/mech_pilot

	id = /obj/item/card/id/dogtag
	belt = /obj/item/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/mech
	wear_suit = /obj/item/clothing/suit/storage/marine/mech_pilot
	head = /obj/item/clothing/head/helmet/marine/mech_pilot
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine

/datum/outfit/job/command/mech_pilot/fallen
	ears = null

/datum/outfit/job/command/transport_crewman
	name = TRANSPORT_CREWMAN
	jobtype = /datum/job/terragov/command/transport_crewman

	id = /obj/item/card/id/dogtag
	belt = /obj/item/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/transport_crewman
	wear_suit = /obj/item/clothing/suit/storage/marine/transport_crewman
	head = /obj/item/clothing/head/helmet/marine/transport_crewman
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine

/datum/outfit/job/command/assault_crewman
	name = ASSAULT_CREWMAN
	jobtype = /datum/job/terragov/command/assault_crewman

	id = /obj/item/card/id/dogtag
	belt = /obj/item/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/assault_crewman
	wear_suit = /obj/item/clothing/suit/storage/marine/assault_crewman
	head = /obj/item/clothing/head/helmet/marine/assault_crewman
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine
	l_pocket = /obj/item/pamphlet/tank_loader

/datum/outfit/job/command/transport_crewman
	name = TRANSPORT_CREWMAN
	jobtype = /datum/job/terragov/command/transport_crewman

	id = /obj/item/card/id/dogtag
	belt = /obj/item/storage/belt/utility/full
	glasses = /obj/item/clothing/glasses/welding
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/transport_crewman
	wear_suit = /obj/item/clothing/suit/storage/marine/transport_crewman
	head = /obj/item/clothing/head/helmet/marine/transport_crewman
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/marine

/datum/outfit/job/requisitions/tech
	name = SHIP_TECH
	jobtype = /datum/job/terragov/requisitions/tech

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mainship/st
	w_uniform = /obj/item/clothing/under/marine/officer/engi
	wear_suit = /obj/item/clothing/suit/storage/marine/ship_tech
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/insulated
	glasses = /obj/item/clothing/glasses/welding/flipped
	head = /obj/item/clothing/head/tgmccap/req
	r_pocket = /obj/item/storage/pouch/general/medium
	back = /obj/item/storage/backpack/marine/engineerpack

/datum/outfit/job/requisitions/officer
	name = REQUISITIONS_OFFICER
	jobtype = /datum/job/terragov/requisitions/officer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/revolver/m44/full
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/marine/officer/ro_suit
	wear_suit = /obj/item/clothing/suit/storage/marine/officer/req
	suit_store = /obj/item/weapon/gun/energy/taser
	shoes = /obj/item/clothing/shoes/marine/full
	gloves = /obj/item/clothing/gloves/insulated
	head = /obj/item/clothing/head/tgmccap/req
	r_pocket = /obj/item/storage/pouch/general/large

/datum/outfit/job/medical/professor
	name = CHIEF_MEDICAL_OFFICER
	jobtype = /datum/job/terragov/medical/professor

	id = /obj/item/card/id
	belt = /obj/item/storage/belt/rig/medical
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/rank/medical/blue
	wear_suit = /obj/item/clothing/suit/storage/labcoat/cmo
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/latex
	glasses = /obj/item/clothing/glasses/hud/health
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/cmo
	r_pocket = /obj/item/storage/pouch/surgery
	l_pocket = /obj/item/storage/pouch/medkit/medic

	r_pocket_contents = list(
		/obj/item/tweezers = 1,
	)
	suit_contents = list(
		/obj/item/reagent_containers/glass/bottle/lemoline/doctor = 1,
	)

/datum/outfit/job/medical/medicalofficer
	name = MEDICAL_DOCTOR
	jobtype = /datum/job/terragov/medical/medicalofficer

	id = /obj/item/card/id
	belt = /obj/item/storage/belt/rig/medical
	ears = /obj/item/radio/headset/mainship/doc
	w_uniform = /obj/item/clothing/under/rank/medical
	wear_suit = /obj/item/clothing/suit/storage/labcoat
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/latex
	glasses = /obj/item/clothing/glasses/hud/health
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/surgery/green
	r_pocket = /obj/item/storage/pouch/surgery
	l_pocket = /obj/item/storage/pouch/medkit/medic


	r_pocket_contents = list(
		/obj/item/tweezers = 1,
	)
	suit_contents = list(
		/obj/item/reagent_containers/glass/bottle/lemoline/doctor = 1,
	)

/datum/outfit/job/medical/researcher
	name = FIELD_RESEARCHER
	jobtype = /datum/job/terragov/medical/researcher

	id = /obj/item/card/id
	belt = /obj/item/storage/belt/rig/research
	ears = /obj/item/radio/headset/mainship/res
	w_uniform = /obj/item/clothing/under/marine/officer/researcher
	wear_suit = /obj/item/clothing/suit/storage/labcoat/researcher
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/latex
	glasses = /obj/item/clothing/glasses/hud/health
	mask = /obj/item/clothing/mask/surgical
	r_pocket = /obj/item/storage/pouch/surgery
	l_pocket = /obj/item/storage/pouch/medkit/medic

	r_pocket_contents = list(
		/obj/item/tweezers = 1,
	)
	suit_contents = list(
		/obj/item/reagent_containers/glass/bottle/lemoline/doctor = 1,
	)

/datum/outfit/job/liaison
	name = CORPORATE_LIAISON
	jobtype = /datum/job/terragov/civilian/liaison

	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/liaison_suit
	shoes = /obj/item/clothing/shoes/laceup

/datum/outfit/job/synthetic
	name = SYNTHETIC
	jobtype = /datum/job/terragov/silicon/synthetic

	id = /obj/item/card/id/gold
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/mainship/mcom
	w_uniform = /obj/item/clothing/under/rank/synthetic
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/insulated
	r_pocket = /obj/item/storage/pouch/general/medium
	l_pocket = /obj/item/storage/pouch/general/medium

/datum/outfit/job/clown
	name = CLOWN
	jobtype = /datum/job/terragov/civilian/clown

	id = /obj/item/card/id
	ears = /obj/item/radio/headset/mainship/service
	belt = null
	mask = /obj/item/clothing/mask/gas/clown_hat
	w_uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	r_pocket = /obj/item/toy/bikehorn
	l_pocket = /obj/item/instrument/bikehorn
	gloves = /obj/item/clothing/gloves/white
	back = /obj/item/storage/backpack/clown

	backpack_contents = list(
		/obj/item/tool/soap/clown = 3,
	)

/datum/outfit/job/command/military_police
	name = MILITARY_POLICE
	jobtype = /datum/job/terragov/command/military_police

	id = /obj/item/card/id/sec
	ears = /obj/item/radio/headset/mainship/mp
	belt = /obj/item/storage/belt/security/mp
	w_uniform = /obj/item/clothing/under/marine/mp
	shoes = /obj/item/clothing/shoes/jackboots/mp
	head = /obj/item/clothing/head/beret/sec/mp
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/mp
	r_pocket = /obj/item/storage/pouch/magazine/large/laser
	l_pocket = /obj/item/storage/pouch/pistol/laserpistol
	gloves = /obj/item/clothing/gloves/marine/mp
	back = /obj/item/storage/backpack/satchel/sec
	wear_suit = /obj/item/clothing/suit/armor/bulletproof/mp
	suit_store = /obj/item/weapon/gun/energy/taser
