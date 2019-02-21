//If you want to make some kind of junkie variant, just extend this quirk.
/datum/modifier/addiction
	name = "Addict"
	desc = "You can't get enough of hard drugs."

	on_created_text = "<span class='danger'>You suddenly feel the craving for drugs.</span>"
	on_expired_text = "<span class='notice'>You feel like you should kick your drug habit.</span>"

	var/medical_record_text = "Patient has a history of hard drugs."
	var/drug_list = list("cocaine", "ecstasy") //List of possible IDs
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

/datum/modifier/addiction/on_applied(var/mob/living/carbon/human/H)
	var/mob/living/carbon/human/quirk_holder = H
	reagent_id = pick(drug_list)
	if (!reagent_type)
		var/datum/reagent/prot_holder = chemical_reagents_list[reagent_id]
		reagent_type = prot_holder.type
	reagent_instance = new reagent_type()
	H.reagents.addiction_list.Add(reagent_instance)
	var/current_turf = get_turf(quirk_holder)
	if (!drug_container_type)
		drug_container_type = /obj/item/weapon/storage/pill_bottle
	drug_instance = new drug_container_type(current_turf)
	if (istype(drug_instance, /obj/item/weapon/storage/pill_bottle))
		var/pill_state = "pill[rand(1,20)]"
		for(var/i in 1 to 7)
			var/obj/item/weapon/reagent_containers/pill/P = new(drug_instance)
			P.icon_state = pill_state
			P.reagents.add_reagent(reagent_id, 10)

	if(H.equip_to_appropriate_slot(drug_instance))
		announce_drugs()


/datum/modifier/addiction/proc/announce_drugs(var/mob/living/carbon/human/H)
	to_chat(H, "<span class='boldnotice'>There is a [drug_instance.name] of [reagent_instance.name] you've taken with you today. <b>Should you try to get better, or get some more?</b> That's up to you now...</span>")


