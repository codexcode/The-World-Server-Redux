//If you want to make some kind of junkie variant, just extend this quirk.
/datum/trait/modifier/mental/addiction
	name = "Addict"
	desc = "You can't get enough of hard drugs."

	on_created_text = "<span class='danger'>You suddenly feel the craving for drugs.</span>"
	on_expired_text = "<span class='notice'>You feel like you should kick your drug habit.</span>"
  
	var/medical_record_text = "Patient has a history of hard drugs."
	var/drug_list = list("crank", "krokodil", "morphine", "happiness", "methamphetamine") //List of possible IDs
	var/reagent_id //ID picked from list
	var/datum/reagent/reagent_type //If this is defined, reagent_id will be unused and the defined reagent type will be instead.
	var/datum/reagent/reagent_instance
	var/where_drug
	var/obj/item/drug_container_type //If this is defined before pill generation, pill generation will be skipped. This is the type of the pill bottle.
	var/obj/item/drug_instance
	var/where_accessory
	var/obj/item/accessory_type //If this is null, it won't be spawned.
	var/obj/item/accessory_instance
	var/tick_counter = 0
 
 
/datum/trait/modifier/mental/addiction/expire()
  "[on_expired_text]"

/datum/trait/modifier/mental/addiction/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	reagent_id = pick(drug_list)
	if (!reagent_type)
		var/datum/reagent/prot_holder = chemical_reagents_list[reagent_id]
		reagent_type = prot_holder.type
	reagent_instance = new reagent_type()
	H.reagents.addiction_list.Add(reagent_instance)
	var/current_turf = get_turf(quirk_holder)
	if (!drug_container_type)
		drug_container_type = /obj/item/storage/pill_bottle
	drug_instance = new drug_container_type(current_turf)
	if (istype(drug_instance, /obj/item/storage/pill_bottle))
		var/pill_state = "pill[rand(1,20)]"
		for(var/i in 1 to 7)
			var/obj/item/reagent_containers/pill/P = new(drug_instance)
			P.icon_state = pill_state
			P.reagents.add_reagent(reagent_id, 1)

	if (accessory_type)
		accessory_instance = new accessory_type(current_turf)
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK
	)
	where_drug = H.equip_in_one_of_slots(drug_instance, slots, FALSE) || "at your feet"
	if (accessory_instance)
		where_accessory = H.equip_in_one_of_slots(accessory_instance, slots, FALSE) || "at your feet"
	announce_drugs()
