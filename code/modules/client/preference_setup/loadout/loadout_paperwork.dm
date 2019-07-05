/datum/gear/paperwork
	path =  /obj/item/weapon/paper/paperwork/synthownership
	display_name = "Synthetic Ownership Papers"
	description = "Ownership papers for a synthetic being."
	cost = 0
	sort_category = "paperwork"

/datum/gear/paperwork/weaponpermitapplication
	path = /obj/item/weapon/paper/paperwork/weaponpermitapplication
	display_name = "Weapon Permit Application Paperwork"
	description = "Weapon Permit Application, woo"

/datum/gear/paperwork/accessmod
	path = /obj/item/weapon/paper/paperwork/accessmodification
	display_name = "Access Modification Paperwork for clerks"
	description = "paperwork for clerks, yay. Only given to clerks."
	allowed_roles = list("City Clerk","Junior Clerk")

/datum/gear/paperwork/mechprosthesisapp
	path = /obj/item/weapon/paper/paperwork/mechanicalprostheticapp
	display_name = "Applications for mechanical prosthesis (for roboticist)"
	description = "clerical stuff for roboticists"
	allowed_roles = list("Scientist","Research Director","Roboticist")

/datum/gear/paperwork/postmortemprosthesisapp
	path = /obj/item/weapon/paper/paperwork/postmortemprostheticapp
	display_name = "Post Mortem Prosthetic Application (for the roboticist)"
	description = "clerical stuff for roboticists"
	allowed_roles = list("Scientist","Research Director","Roboticist")