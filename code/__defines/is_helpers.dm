
#define isdatum(D)		istype(D, /datum)
#define isweakref(A)	istype(A, /weakref)

#define islist(D)		istype(D, /list)

//---------------
#define isatom(D)		istype(D, /atom)

//---------------
//#define isobj(D)		istype(D, /obj)		//Built in

#define isitem(D)		istype(D, /obj/item)

#define isairlock(A)	istype(A, /obj/machinery/door/airlock)

#define isorgan(A)		istype(A, /obj/item/organ/external)

//---------------
//#define isarea(D)		istype(D, /area)	//Built in

//---------------
//#define ismob(D)		istype(D, /mob)		//Built in
#define isliving(A)		istype(A, /mob/living)

#define isobserver(A)	istype(A, /mob/observer/dead)
#define isEye(A)		istype(A, /mob/observer/eye)

#define isnewplayer(A)	istype(A, /mob/new_player)