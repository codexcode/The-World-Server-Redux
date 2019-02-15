/datum/computer_file/program/nt_explorer
	filename = "nt_explorer"					// File name, as shown in the file browser program.
	filedesc = "NT Explorer"				// User-Friendly name. In this case, we will generate a random name in constructor.
	extended_desc = "The go-to browser for your everyday NTnet browsing."		// A nice description.
	size = 5								// Size in GQ. Integers only. Smaller sizes should be used for utility/low use programs (like this one), while large sizes are for important programs.
	requires_ntnet = 1	
	available_on_ntnet = 1					// ... but we want it to be available for download.
	nanomodule_path = /datum/nano_module/nt_explorer/	// Path of relevant nano module. The nano module is defined further in the file.
	usage_flags = PROGRAM_ALL
  
  var/current_website
  
 /datum/computer_file/program/nt_explorer/New()
	..()
	current_website = null
