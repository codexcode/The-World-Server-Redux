// Contains:
// Gavel Hammer
// Gavel Block

/obj/item/weapon/gavelhammer
	name = "gavel hammer"
	desc = "Order, order! No bombs in my courthouse."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelhammer"
	force = 5
	throwforce = 6
	w_class = 2
	attack_verb = list("bashed", "battered", "judged", "whacked")
//	burn_state = 0 //Burnable



/obj/item/weapon/gavelblock
	name = "gavel block"
	desc = "Smack it with a gavel hammer when the civilians get rowdy."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelblock"
	force = 2
	throwforce = 2
	w_class = 1
//	burn_state = 0 //Burnable

/obj/item/weapon/gavelblock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/gavelhammer))
		playsound(loc, 'sound/effects/gavel.ogg', 100, 1)
		user.visible_message("<span class='warning'>[user] strikes \the [src] with \the [I].</span>")

	else
		return
