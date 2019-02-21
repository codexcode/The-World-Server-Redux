//If you want to make some kind of junkie variant, just extend this quirk.
/datum/modifier/addiction
	name = "Addict"
	desc = "You can't get enough of hard drugs."

	on_created_text = "<span class='danger'>You suddenly feel the craving for drugs.</span>"
	on_expired_text = "<span class='notice'>You feel like you should kick your drug habit.</span>"

	var/medical_record_text = "Patient has a history of hard drugs."
	var/drug_list = list("cocaine", "ecstasy", "methamphetamine", "diamorphine") //List of possible IDs
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
	var/drug_amount = 3 //How much of the drug spawns.

/datum/modifier/addiction/on_applied()
	var/mob/living/carbon/human/H = holder
	reagent_id = pick(drug_list)
	if (!reagent_type)
		var/datum/reagent/prot_holder = chemical_reagents_list[reagent_id]
		reagent_type = prot_holder.type
	reagent_instance = new reagent_type()
	H.reagents.addiction_list.Add(reagent_instance)
	var/current_turf = get_turf(holder)
	if (!drug_container_type)
		drug_container_type = /obj/item/weapon/storage/pill_bottle
	drug_instance = new drug_container_type(current_turf)
	if (istype(drug_instance, /obj/item/weapon/storage/pill_bottle))
		var/pill_state = "pill[rand(1,20)]"
		for(var/i in 1 to 7)
			var/obj/item/weapon/reagent_containers/pill/P = new(drug_instance)
			P.icon_state = pill_state
			P.reagents.add_reagent(reagent_id, drug_amount)

	H.equip_to_appropriate_slot(drug_instance)
	announce_drugs()


/datum/modifier/addiction/proc/announce_drugs()
	to_chat(holder, "<span class='boldnotice'>From your leftovers there is a [drug_instance.name] of [reagent_instance.name] you've taken with you today. <b>Should you try to get better, or get some more?</b> That's up to you now...</span>")


/datum/modifier/addiction/tick()
	var/mob/living/carbon/human/H = holder
	if (tick_counter == 60) //Halfassed optimization, increase this if there's slowdown due to this quirk
		var/in_list = FALSE
		for (var/datum/reagent/entry in H.reagents.addiction_list)
			if(istype(entry, reagent_type))
				in_list = TRUE
				break
		if(!in_list)
			holder.reagents.addiction_list += reagent_instance
			reagent_instance.addiction_stage = 0
			to_chat(holder, "<span class='danger'>You thought you kicked it, but you suddenly feel like you need [reagent_instance.name] again...")
		tick_counter = 0
	else
		++tick_counter

/datum/modifier/addiction/smoker
	name = "Smoker"
	desc = "Sometimes you just really want a smoke. Probably not great for your lungs."
	on_created_text = "<span class='danger'>You could really go for a smoke right about now.</span>"
	on_expired_text = "<span class='notice'>You feel like you should quit smoking.</span>"
	medical_record_text = "Patient is a current smoker."
	reagent_type = /datum/reagent/drug/nicotine
	accessory_type = /obj/item/weapon/flame/lighter/zippo

/datum/modifier/addiction/smoker/on_applied()
	drug_container_type = pick(/obj/item/weapon/storage/fancy/cigarettes/carcinomas,
		/obj/item/weapon/storage/fancy/cigarettes/dromedaryco,
		/obj/item/weapon/storage/fancy/cigarettes/jerichos,
		/obj/item/weapon/storage/fancy/cigarettes/killthroat,
		/obj/item/weapon/storage/fancy/cigarettes/luckystars,
		/obj/item/weapon/storage/fancy/cigarettes/menthols,
		/obj/item/weapon/storage/fancy/cigarettes/professionals,
		/obj/item/clothing/mask/smokable/cigarette/cigar)
	. = ..()

/datum/modifier/addiction/smoker/announce_drugs()
	to_chat(holder, "<span class='boldnotice'>There is a [drug_instance.name] [where_drug], and a lighter [where_accessory]. Make sure you get your favorite brand when you run out.</span>")

/datum/modifier/addiction/stoner
	name = "Stoner"
	desc = "A lifetime of doing nothing and listening to reggae music has left you with the incapability to do anything but smoke weed everyday."
	on_created_text = "<span class='danger'>You could really go for a good spliff right about now.</span>"
	on_expired_text = "<span class='notice'>Somehow, weed doesn't seem as cool any more.</span>"
	medical_record_text = "Patient is a current smoker."
	reagent_type = /datum/reagent/drug/cannabis
	accessory_type = /obj/item/weapon/flame/lighter/zippo

/datum/modifier/addiction/stoner/on_applied()
	drug_instance = /obj/item/weapon/reagent_containers/drugs/baggie
	drug_container_type = /obj/item/clothing/accessory/storage/pouches/large
	. = ..()

/datum/modifier/addiction/stoner/announce_drugs()
	to_chat(holder, "<span class='boldnotice'>There is a [drug_instance.name] [where_drug], and a lighter [where_accessory].</span>")

