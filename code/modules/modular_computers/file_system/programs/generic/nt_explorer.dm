// See websites.dm for websites list


/datum/computer_file/program/nt_explorer
	filename = "nt_explorer"					// File name, as shown in the file browser program.
	filedesc = "NT Explorer"				// User-Friendly name. In this case, we will generate a random name in constructor.
	extended_desc = "The go-to browser for your everyday NTnet browsing."		// A nice description.
	size = 5								// Size in GQ. Integers only. Smaller sizes should be used for utility/low use programs (like this one), while large sizes are for important programs.
	requires_ntnet = 1
	available_on_ntnet = 1					// ... but we want it to be available for download.
	nanomodule_path = /datum/nano_module/nt_explorer/	// Path of relevant nano module. The nano module is defined further in the file.
	usage_flags = PROGRAM_ALL

/datum/nano_module/nt_explorer
	var/datum/website/current_website
//	var/website_datum = WEBSITE_BLANK
	var/homepage = "ntgoogle.nt"
	var/website_url = "ntgoogle.nt"
	var/website_title = "NToogle!"
	var/website_content = "NanoTrasen Approved Search Engine"
	var/can_browse = 1

/*
/datum/nano_module/nt_explorer/New()
//	set_to_url(homepage)
	current_website = new /datum/website(src)
*/
/datum/nano_module/nt_explorer/proc/clear()
	current_website = null
	website_content = null

/datum/nano_module/nt_explorer/proc/update_content()
	clear() // Let's clear everything first.
	var/datum/website/W = current_website
	W.get_web_header()
	W.get_web_content()

	website_url = W.url
	website_title = W.title
	website_content = W.web_contents

/datum/nano_module/nt_explorer/proc/set_to_url(var/P)
	for(var/datum/website/W in website_list)
		if(!W.url == P)
			clear()
			current_website = error_website
		else
			current_website = W

	update_content()

/obj/item/website_viewer
	name = "website viewer"
	icon = 'icons/obj/fish_items.dmi'
	icon_state = "egg_scoop"
	var/list/websites_list

/obj/item/website_viewer/attack_self(mob/user as mob)
	for(var/datum/website/W in website_list)
		websites_list += W
		visible_message("<span class='warning'>[W.url]</span>")

/datum/nano_module/nt_explorer/proc/browse_website()
	var/searched_url = sanitize(input(usr, "Input the web address.", "NT Explorer", null)  as text)
	if(!searched_url)
		return

//	set_to_url(searched_url)
/datum/nano_module/nt_explorer/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["Browse"])
		. = 1
		browse_website()

	if(href_list["Refresh"])
		. = 1
		browse_website()


/datum/nano_module/nt_explorer/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = default_state)
	var/list/data = list()
	if(program)
		data = program.get_header_data()

	data["website_content"] = website_content
	data["website_title"] = website_title
	data["website_url"] = website_url
	data["url"] = website_url

	ui = nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "ntnet_explorer.tmpl", "NtNet Explorer", 600, 450, state = state)
		if(program.update_layout())
			ui.auto_update_layout = 1
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()