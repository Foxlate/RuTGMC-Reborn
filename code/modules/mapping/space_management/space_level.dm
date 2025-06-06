/datum/space_level
	var/name = "NAME MISSING"
	var/list/neigbours = list()
	var/list/traits
	var/z_value = 1 //actual z placement
	var/linkage = SELFLOOPING
	/// Bounds at time of loading the map
	var/bounds

/datum/space_level/New(new_z, new_name, list/new_traits = list())
	z_value = new_z
	name = new_name
	traits = new_traits
	if(islist(new_traits))
		for(var/trait in new_traits)
			SSmapping.z_trait_levels[trait] += list(new_z)
	else // in case a single trait is passed in
		SSmapping.z_trait_levels[new_traits] += list(new_z)
	//Lazy Init value, will be hopefully changed by SSmapping
	bounds = list(1, 1, z_value, world.maxx, world.maxy, z_value)

	if(length(GLOB.default_lighting_underlays_by_z) < z_value)
		GLOB.default_lighting_underlays_by_z.len = z_value
	GLOB.default_lighting_underlays_by_z[z_value] = mutable_appearance(LIGHTING_ICON, "transparent", new_z, LIGHTING_PLANE, 255, RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM)
