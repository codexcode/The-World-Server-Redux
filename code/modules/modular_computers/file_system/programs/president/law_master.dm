/datum/computer_file/program/law_master
	filename = "law_master"
	filedesc = "Presidential Law Master"
	extended_desc = "Official NTgov program for handling colony laws as a president."
	size = 8
	requires_ntnet = 1
	available_on_ntnet = 1
	required_access = access_president
	usage_flags = PROGRAM_ALL
	nanomodule_path = /datum/nano_module/program/law_master/
  
/datum/nano_module/program/law_master/
	name = "Presidential Law Master"
	var/max_laws = 40
	var/max_title_length = 25
	var/max_law_desc = 100

/datum/nano_module/program/law_master/New()
	..()
	if(!presidential_laws.len)
		instantiate_laws()

/datum/nano_module/program/law_master/proc/add_law()
	if(presidential_laws.len >= max_laws)
		to_chat(user, "<b>It is not possible to add more than [max_laws] laws.</b>")
		return	
	var/addlaw = input("Please add a name for this law.", "Add a law", null, null) as text
	if(!addlaw)
		return FALSE	
	addlaw = sanitize(addlaw)
	for(var/X in presidential_laws)
		var/datum/president/laws/law/check = X
		if(check.name == addlaw)
			to_chat(user, "A law already exists with the name '[addlaw]', please pick another name!")
			return FALSE
	var/lawdesc = input("Please input the description of the law.", "Write Law Description", null, null) as message
	if(!lawdesc)
		return

/datum/nano_module/program/law_master/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = default_state)
	var/list/data = list()
	if(program)
		data = program.get_header_data()



	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "digitalwarrant.tmpl", name, 500, 350, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
