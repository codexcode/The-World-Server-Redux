/obj/item/weapon/lipstick
	gender = PLURAL
	name = "red lipstick"
	desc = "A generic brand of lipstick."
	icon = 'icons/obj/items.dmi'
	icon_state = "lipstick"
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	var/colour = "red"
	var/open = 0
	drop_sound = 'sound/items/drop/glass.ogg'

/obj/item/weapon/lipstick/purple
	name = "purple lipstick"
	colour = "purple"

/obj/item/weapon/lipstick/jade
	name = "jade lipstick"
	colour = "jade"

/obj/item/weapon/lipstick/black
	name = "black lipstick"
	colour = "black"

/obj/item/weapon/lipstick/random
	name = "lipstick"

/obj/item/weapon/lipstick/random/New()
	colour = pick("red","purple","jade","black")
	name = "[colour] lipstick"

/obj/item/weapon/lipstick/attack_self(mob/user as mob)
	user << "<span class='notice'>You twist \the [src] [open ? "closed" : "open"].</span>"
	open = !open
	if(open)
		icon_state = "[initial(icon_state)]_[colour]"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/lipstick/attack(mob/M as mob, mob/user as mob)
	if(!open)	return

	if(!istype(M, /mob))	return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.lip_style)	//if they already have lipstick on
			user << "<span class='notice'>You need to wipe off the old lipstick first!</span>"
			return
		if(H == user)
			user.visible_message("<span class='notice'>[user] does their lips with \the [src].</span>", \
								 "<span class='notice'>You take a moment to apply \the [src]. Perfect!</span>")
			H.lip_style = colour
			H.update_icons_body()
		else
			user.visible_message("<span class='warning'>[user] begins to do [H]'s lips with \the [src].</span>", \
								 "<span class='notice'>You begin to apply \the [src].</span>")
			if(do_after(user, 20) && do_after(H, 20, 5, 0))	//user needs to keep their active hand, H does not.
				user.visible_message("<span class='notice'>[user] does [H]'s lips with \the [src].</span>", \
									 "<span class='notice'>You apply \the [src].</span>")
				H.lip_style = colour
				H.update_icons_body()
	else
		user << "<span class='notice'>Where are the lips on that?</span>"

//you can wipe off lipstick with paper! see code/modules/paperwork/paper.dm, paper/attack()

/obj/item/weapon/haircomb //sparklysheep's comb
	name = "purple comb"
	desc = "A pristine purple comb made from flexible plastic."
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"



/obj/item/weapon/haircomb/attack_self(mob/living/user)
	var/text = "person"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.h_style == "Bald" || H.h_style == "Balding Hair" || H.h_style == "Skinhead")
			user.visible_message(text("<span class='notice'>[] lifts the [] and stares at it for a moment with longing, for they are bald. How pathetic. </span>", user, src))
			return
		var/mob/living/carbon/human/U = user
		switch(U.identifying_gender)
			if(MALE)
				text = "guy"
			if(FEMALE)
				text = "lady"
	else
		switch(user.gender)
			if(MALE)
				text = "guy"
			if(FEMALE)
				text = "lady"
	user.visible_message("<span class='notice'>[user] uses [src] to comb their hair with incredible style and sophistication. What a [text].</span>")

/obj/item/weapon/razor
	name = "electric razor"
	desc = "The latest and greatest power razor born from the science of shaving."
	icon = 'icons/obj/items.dmi'
	icon_state = "razor"
	flags = CONDUCT
	w_class = 1


/obj/item/weapon/razor/proc/shave(mob/living/carbon/human/H, location = "mouth")
	if(location == "mouth")
		H.f_style = "Shaved"
	else
		H.h_style = "Skinhead"

	H.update_hair()
	playsound(loc, 'sound/items/Welder2.ogg', 20, 1)


/obj/item/weapon/razor/attack(mob/M, mob/user)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		var/location = user.zone_sel.selecting
		if(location == "mouth")
/*			if(!get_location_accessible(H, location))
				user << "<span class='warning'>The mask is in the way!</span>"
				return */
			if(H.f_style == "Shaved")
				user << "<span class='warning'>Already clean-shaven!</span>"
				return

			if(H == user) //shaving yourself
				user.visible_message("[user] starts to shave their facial hair with [src].", \
									 "<span class='notice'>You take a moment to shave your facial hair with [src]...</span>")
				if(do_after(user, 50, target = H))
					user.visible_message("[user] shaves his facial hair clean with [src].", \
										 "<span class='notice'>You finish shaving with [src]. Fast and clean!</span>")
					shave(H, location)
			else
				var/turf/H_loc = H.loc
				user.visible_message("<span class='warning'>[user] tries to shave [H]'s facial hair with [src].</span>", \
									 "<span class='notice'>You start shaving [H]'s facial hair...</span>")
				if(do_after(user, 50, target = H))
					if(H_loc == H.loc)
						user.visible_message("<span class='warning'>[user] shaves off [H]'s facial hair with [src].</span>", \
											 "<span class='notice'>You shave [H]'s facial hair clean off.</span>")
						shave(H, location)

		else if(location == "head")
/*			if(!get_location_accessible(H, location))
				user << "<span class='warning'>The headgear is in the way!</span>"
				return */
			if(H.h_style == "Bald" || H.h_style == "Balding Hair" || H.h_style == "Skinhead")
				user << "<span class='warning'>There is not enough hair left to shave!</span>"
				return

			if(H == user) //shaving yourself
				user.visible_message("[user] starts to shave their head with [src].", \
									 "<span class='notice'>You start to shave your head with [src]...</span>")
				if(do_after(user, 5, target = H))
					user.visible_message("[user] shaves his head with [src].", \
										 "<span class='notice'>You finish shaving with [src].</span>")
					shave(H, location)
			else
				var/turf/H_loc = H.loc
				user.visible_message("<span class='warning'>[user] tries to shave [H]'s head with [src]!</span>", \
									 "<span class='notice'>You start shaving [H]'s head...</span>")
				if(do_after(user, 50, target = H))
					if(H_loc == H.loc)
						user.visible_message("<span class='warning'>[user] shaves [H]'s head bald with [src]!</span>", \
											 "<span class='notice'>You shave [H]'s head bald.</span>")
						shave(H, location)
		else
			..()
	else
		..()
