/datum/reagents/metabolism
	var/metabolism_class //CHEM_TOUCH, CHEM_INGEST, or CHEM_BLOOD
	var/metabolism_speed = 1	// Multiplicative, 1 is full speed, 0.5 is half, etc.
	var/mob/living/carbon/parent

/datum/reagents/metabolism/New(var/max = 100, mob/living/carbon/parent_mob, var/met_class = null)
	..(max, parent_mob)

	if(met_class)
		metabolism_class = met_class
	if(istype(parent_mob))
		parent = parent_mob

/datum/reagents/metabolism/proc/metabolize(var/mob/M)

	var/metabolism_type = 0 //non-human mobs
	if(ishuman(parent))
		var/mob/living/carbon/human/H = parent
		metabolism_type = H.species.reagent_tag

	for(var/datum/reagent/current in reagent_list)
		current.on_mob_life(parent, metabolism_type, src)

	if(addiction_tick == 6)
		addiction_tick = 1
		for(var/A in addiction_list)
			var/datum/reagent/R = A
			if(M && R)
				if(R.addiction_stage < 0)
					R.addiction_stage++
				if(R.addiction_stage >= 0 && R.addiction_stage <= 10)
					R.addiction_act_stage1(M)
					R.addiction_stage++
				if(R.addiction_stage >= 10 && R.addiction_stage <= 20)
					R.addiction_act_stage2(M)
					R.addiction_stage++
				if(R.addiction_stage >= 20 && R.addiction_stage <= 30)
					R.addiction_act_stage3(M)
					R.addiction_stage++
				if(R.addiction_stage > 30 && R.addiction_stage <= 40)
					R.addiction_act_stage4(M)
				if(R.addiction_stage > 40)
					M << "<span class = 'notice'>You feel like you've gotten over your need for [R.name].</span>"
					addiction_list.Remove(R)
	addiction_tick++
	last_tick++
	update_total()

// "Specialized" metabolism datums
/datum/reagents/metabolism/bloodstream
	metabolism_class = CHEM_BLOOD

/datum/reagents/metabolism/ingested
	metabolism_class = CHEM_INGEST
	metabolism_speed = 0.5

/datum/reagents/metabolism/touch
	metabolism_class = CHEM_TOUCH