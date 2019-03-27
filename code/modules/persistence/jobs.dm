// These are a list of persistence calls to load or save jobs, respectively.

proc/load_persistent_president_jobs(var/datum/job/J)
	for(J in job_master.occupations)
		var/file_embed = J.pres_jobs
		J.Read(file_embed)
//		log_admin("Persistent job ''[J.title]'' successfully loaded.")
//		message_admins("Persistent job ''[J.title]'' successfully loaded.", 1)

proc/save_persistent_president_jobs(var/datum/job/J)
	for(J in job_master.occupations)
		var/file_embed = J.pres_jobs
		J.Write(file_embed)
//		log_admin("Persistent job ''[J.title]''  successfully saved.")
//		message_admins("Persistent job ''[J.title]''  successfully saved.", 1)