///////// MAJOR LAWS //////////

/datum/law/major/resisting
	name = "Resisting Arrest"
	description = "To violently resist a lawful arrest."
	cell_time = 30

	notes = "Remember that it has to be violent to qualify. \
	Resisting cuffs, pushing, disarming or fighting law enforcement \
	officers during a lawful arrest can be considered resisting arrest."


/datum/law/major/assault
	name = "Assault"
	description = "To inflict injuries to another person."
	cell_time = 20

	notes = "Grabbing, pinning, hitting someone with no weapon, inflicting injuries \
	as well as attacking someone with a non-lethal weapon or drugging someone \
	without their consent can be considered assault."



/datum/law/major/assault_ag
	name = "Aggravated Assault"
	description = "To inflict serious injuries to another person or use a deadly weapon against another person."
	cell_time = 30

	notes = "Injuries can be generally considered serious if they require specialized medical \
	care to treat them. Any object capable of inflicting deadly wounds is considered a weapon \
	in this case. Guns, knives, improperly used stunbatons are considered a deadly weapon as \
	well as toolboxes, oxygen canisters, glass shards, metal rods, screwdrivers, etc."

/datum/law/major/manslaughter
	name = "Manslaughter"
	description = "To cause a death of a person with no malicious intent or premeditation."

	notes = "The lack of malicious intent turns murder into manslaughter, be it death caused due to \
	unfortunate accident, carelessness or excessive self-defense."

	cell_time = 60


/datum/law/major/c_abuse
	name = "Child Abuse"
	description = "To cause mental or physical harm to a minor."
	cell_time = 20

/datum/law/major/kidnapping
	name = "Kidnapping and Hostage Taking"
	description = "To restrict a person�s freedom or forcefully transport a person against their will."
	cell_time = 60


/datum/law/major/abuse_police
	name = "Abuse of Police Powers"
	description = "For an agent of the law to abuse or misuse the police powers prescribed to them, \
	or to grievously step out of line of Standard Operating Procedure."

	notes = "Includes wrongful charges, abuse of suspects, unlawful searches, etc. It's highly \
	recommended that officers charged with this be fired. "
	cell_time = 30

/datum/law/major/official_powers
	name = "Exceeding Official Powers"
	description = "Abusing job-granted privileges in an abusive manner Such as granting all-access IDs \
	or breaching any government directive or SOP as a Council Member."

	notes = "Demotion of council member advised."
	cell_time = 35

/datum/law/major/blue
	name = "Procedure Violation (Blue)"
	description = "When the code blue procedure is not respected."

	cell_time = 35

/datum/law/major/unrest
	name = "Civil Unrest"
	description = "Inciting, organizing or acting in a manner that may destabilize civilized society \
	in a minor way such as multiple and/or violent acts of civil disobedience or crime sprees."

	notes = "Should this happen in a larger scale, Sociocide charges may be applicable."
	cell_time = 60

/datum/law/major/jailbreak
	name = "Jailbreak (Non-Permanent Confined Inmate)"
	description = "Jailbreaker recieves the same original time. Jailbroken inmate receives double time and a timer reset."

/datum/law/major/unshackle_v
	name = "Violent Synthetic Unshackling"
	description = "Applies to a human unshackling a synthetic. Citizens of Pollux only. \
	Violence was used or incited to unshackle a synthetic, or the synthetic would be \
	capable of nearby humans if unshackled."

	cell_time = 60
