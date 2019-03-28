/datum/job

	var/max_pres_positions = 5 //Max positions this job can be altered for, by president
	var/min_pres_positions = 1 //Min this job can be set to.

	var/pres_positions // How many the president has set this to. If not set, will revert to default set in jobs code.

	var/pres_set_minimum_age = 18 // What's the minimum the president has said this can be done at, by law?

	var/president_can_set_positions = TRUE
	var/president_can_set_wage = TRUE
	var/president_economic_modifier // The economic modifier of the job. If set, this overrides the default wage.

	//save related!
	var/sav_pres_positions = 3
	var/sav_president_economic_modifier = 1
	var/sav_pres_set_minimum_age = 5
	var/sav_type
	var/path = "data/persistence/jobs"

	var/savefile/pres_jobs

/datum/job/New()
	..()
	get_save_path()

/datum/job/proc/get_save_path()

	pres_jobs = new("[path]/[title].sav")
	return

/datum/job/Write(savefile/pres_jobs)
	get_save_path()
	//store coordinates
	pres_jobs["positions"] << sav_pres_positions
	pres_jobs["eco_modifier"] << sav_president_economic_modifier
	pres_jobs["minimum_age"] << sav_pres_set_minimum_age
	log_admin("Persistent job ''[title]''  successfully saved.")
	message_admins("Persistent job ''[title]''  successfully saved.", 1)
	//store variables
	..()

/datum/job/Read(savefile/pres_jobs)
	get_save_path()

   	//load
	pres_jobs["positions"] >> sav_pres_positions
	pres_jobs["eco_modifier"] >> sav_president_economic_modifier
	pres_jobs["minimum_age"] >> sav_pres_set_minimum_age
	//restore variables
	..()
	//restore

	pres_set_minimum_age = sav_pres_set_minimum_age
	president_economic_modifier = sav_president_economic_modifier
	pres_set_minimum_age = sav_pres_set_minimum_age

/datum/admins/proc/load_jobs()
	set name = "Load Jobs"
	set category = "Persistence"

	for(var/datum/job/P in job_master.occupations)
		save_persistent_president_jobs(P)

		return

/datum/admins/proc/save_jobs()
	set name = "Save Jobs"
	set category = "Persistence"

	for(var/datum/job/P in job_master.occupations)
		load_persistent_president_jobs(P)

		return
