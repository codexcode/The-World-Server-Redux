/datum/computer_file/program/nt_explorer
	filename = "nt_explorer"					// File name, as shown in the file browser program.
	filedesc = "NT Explorer"				// User-Friendly name. In this case, we will generate a random name in constructor.
	extended_desc = "The go-to browser for your everyday NTnet browsing."		// A nice description.
	size = 5								// Size in GQ. Integers only. Smaller sizes should be used for utility/low use programs (like this one), while large sizes are for important programs.
	requires_ntnet = 1
	available_on_ntnet = 1					// ... but we want it to be available for download.
	nanomodule_path = /datum/nano_module/nt_explorer/	// Path of relevant nano module. The nano module is defined further in the file.
	usage_flags = PROGRAM_ALL

var/list/website_list = list()

/datum/nano_module/nt_explorer
	var/datum/website/current_website
	var/can_browse = 1

/datum/website
	var/name = "Blank Page"
	var/title = "Could not connect"
	var/url
	var/requires_password = FALSE 	//Set this to either true or false.
	var/password = null
	var/web_contents

/datum/website/New()
	..()
	website_list += src

/datum/website/error
	name = "404 Error"
	title = "404 Error - Page not found"

/datum/website/proc/get_web_header()
	web_contents += "<b>[url]</b><br>"

/datum/website/proc/get_web_content()
	web_contents += "<h1>[name]</h1><hr /><p>Unable to connect to server at <em>www.ntnet.com</em>. Please reload the page or try again later.</p><hr /><sub><em>error ref: 223</em></sub>"



/datum/website/ntoogle
	name = "NToogle"
	url = "ntgoogle.nt"

/datum/nano_module/nt_explorer/proc/set_to_url(datum/website/W)
	current_website = W


/datum/nano_module/nt_explorer/proc/browse_website()
	var/searched_url = sanitize(input(usr, "Input the web address.", "NT Explorer", null)  as text)
	if(!searched_url)
		return

	for(var/datum/website/W in website_list)
		if(searched_url == W.url)
			set_to_url(W)
		else
			set_to_url(/datum/website/error)



/datum/nano_module/nt_explorer/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = default_state)
	var/list/data = list()
	if(program)
		data = program.get_header_data()

	data["current_website"] = current_website

	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "arcade_classic.tmpl", "", 500, 350, state = state)
		if(program.update_layout())
			ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
