// These are a list of persistence calls to load or save jobs, respectively.

proc/load_persistent_president_jobs(var/datum/job/J)
	for(J in job_master.occupations)
		J.Read(J)
	log_admin("Persistent jobs successfully loaded.")
	message_admins("Persistent jobs successfully loaded.", 1)

proc/save_persistent_president_jobs(var/datum/job/J)
	for(J in job_master.occupations)
		J.Write(J)
	log_admin("Persistent jobs successfully saved.")
	message_admins("Persistent jobs successfully saved.", 1)