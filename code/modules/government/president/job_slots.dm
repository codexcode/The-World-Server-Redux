/datum/job

	var/max_pres_positions = 5 //Max positions this job can be altered for, by president
	var/min_pres_positions = 1 //Min this job can be set to.

	var/pres_positions // How many the president has set this to. If not set, will revert to default set in jobs code.

	var/pres_set_minimum_age = 18 // What's the minimum the president has said this can be done at, by law?

	var/president_can_set_positions = TRUE
	var/president_can_set_wage = TRUE
	var/president_economic_modifier // The economic modifier of the job. If set, this overrides the default wage.


var/savefile/pres_jobs = new("data/persistence/jobs.sav")



/datum/job/Write(savefile/pres_jobs)
   //store coordinates
   pres_jobs << pres_positions
   pres_jobs << president_economic_modifier
   pres_jobs << pres_set_minimum_age
   //store variables
   ..()
/datum/job/Read(savefile/pres_jobs)
   var {sav_pres_positions; sav_president_economic_modifier; sav_pres_set_minimum_age}
   //load coordinates
   pres_jobs >> sav_pres_positions
   pres_jobs >> sav_president_economic_modifier
   pres_jobs >> sav_pres_set_minimum_age
   //restore variables
   ..()
   //restore coordinates
   pres_set_minimum_age = sav_pres_set_minimum_age
   president_economic_modifier = sav_president_economic_modifier
   pres_set_minimum_age = sav_pres_set_minimum_age

/datum/admins/proc/save_jobs()
	set name = "Save Jobs"
	set category = "Persistence"

	for(var/datum/job/P in job_master.occupations)
		save_persistent_president_jobs(P)

	return

/datum/admins/proc/load_jobs()
	set name = "Load Jobs"
	set category = "Persistence"

	for(var/datum/job/P in job_master.occupations)
		load_persistent_president_jobs(P)

	return
