/datum/job/assistant
	var/hide_on_manifest = 1
	title = "Civilian"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the mayor and the city clerk"
	selection_color = "#515151"
	minimum_character_age = 1
	hide_on_manifest = 0
	wage = 10 // Ha-ha poor people (tm)
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit_type = /decl/hierarchy/outfit/job/assistant
	alt_titles = list("Tourist",
					"Expat",
					"Asylum Seeker",
					"Migrant",
					"Traveller",
					"Umemployed",
					"Homeless",
					"Visitor" = /decl/hierarchy/outfit/job/assistant/visitor,
					"Resident" = /decl/hierarchy/outfit/job/assistant/resident)

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()



