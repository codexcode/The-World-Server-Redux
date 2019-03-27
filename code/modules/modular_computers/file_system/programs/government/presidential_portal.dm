/datum/computer_file/program/pres_portal
	filename = "pres_portal"					// File name, as shown in the file browser program.
	filedesc = "Presidential Portal"				// User-Friendly name. In this case, we will generate a random name in constructor.
	extended_desc = "The software that signs enactments made by the president."		// A nice description.
	size = 5								// Size in GQ. Integers only. Smaller sizes should be used for utility/low use programs (like this one), while large sizes are for important programs.
	requires_ntnet = 1
	available_on_ntnet = 0					// ... but we want it to be available for download.
	usage_flags = PROGRAM_ALL
	required_access = access_president
	nanomodule_path = /datum/nano_module/program/president/


/datum/nano_module/program/president/
	name = "Presidential Portal Assistant"

/*
/datum/nano_module/program/president/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = default_state)
	var/list/data = list()
	if(program)
		data = program.get_header_data()

*/


