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
	
/datum/website
	var/name = "404 Error"
	var/title = "404 Error - Page not found"
	var/url
	var/requires_password = FALSE 	//Set this to either true or false.
	var/password = null
	var/web_contents
	
/datum/website/proc/get_web_header()
	web_contents += "<b>[url]</b><br>"
	
/datum/website/proc/get_web_content()
	web_contents += "<h1>[name]</h1>
<hr />
<p>Unable to connect to server at <em>www.ntnet.com</em>. Please reload the page or try again later.</p>
<hr />
<p style="text-align: right;"><sub><em>error ref: 223</em></sub></p>"
	
		
	
/datum/website/ntoogle
	name = "NToogle"
	url = "ntgoogle.nt"



