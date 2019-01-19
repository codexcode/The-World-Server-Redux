var/datum/antagonist/faction/factionists

/datum/antagonist/faction
	name = "Example Faction"
	desc = "What this faction is about."

	id = MODE_FACTIONS
	role_type = BE_FACTION
	role_text = "Factionist"
	role_text_plural = "Factionist"
	bantype = "renegade"

	welcome_text = "You are now a member of the <b>Radical Socialist Alliance</b>! \
	This is a faction created to collaborate against the bourgeoisie of the city \
	and make relations with the working class."
	antag_text = "Your goals are the goals of the RSA (Radical Socialist Alliance),\
	communicate with your other factions and decide together on how you'll achieve\
	your goals."

	id = "faction"                      // Unique datum identifier.
	role_type = BE_FACTION              // Preferences option for this role.
	role_text = "Faction"               // special_role text.
	role_text_plural = "Factionists"       // As above but plural.

	initial_spawn_req = 3
	hard_cap_round = 5

	flags = ANTAG_IMPLANT_IMMUNE | ANTAG_VOTABLE
	can_use_aooc = TRUE
	antaghud_indicator = "faction"
	antag_indicator = "faction"

	var/members
	var/disallowed_classes = list("")
	restricted_jobs = list("")
	var/datum/money_account/department_account/faction_acc
	var/starting_funds = 3000
	var/deepweb_website = list(/datum/deepweb)

/datum/antagonist/faction/union
	name = "Worker's Union"
	desc = "The suppressed working class - unions are already illegal. \
	This has already polarized and pushed the organization underground."
	disallowed_classes = list("Upper Class", "Middle Class")
	disallowed_jobs = list("Mayor", "Chief of Police", "Police Officer", "Prison Warden", "Detective")
	starting_funds = 1000

/datum/antagonist/faction/freeinfo
	name = "Free Information Society" // Name WIP
	desc = "A group of hackers who are into that 4chan shit when it comes to  \
	hacking and trying to get NT's secrets."
 	starting_funds = 4000

/datum/antagonist/faction/cartel
	name = "Blue Moon Cartel"
  desc = "'An underground organization built through deals with the police and double-agents within the government. Sells firearms, influences politicians, controls crime lords."
  starting_funds = 6000

/datum/antagonist/faction/coalation
	name = "Coalition against Detection"
	desc = "Basically flat earthers."
	starting_funds = 4000
