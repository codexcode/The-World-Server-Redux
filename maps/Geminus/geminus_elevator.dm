/obj/turbolift_map_holder/geminusspaceport
	name = "Abandoned Subway Elevator"
	depth = 2
	lift_size_x = 4
	lift_size_y = 4
	icon = 'icons/obj/turbolift_preview_5x5.dmi'

	areas_to_use = list(
		/area/turbolift/geminus_ground,
		/area/turbolift/geminus_top
		)

/obj/turbolift_map_holder/geminusmining
	name = "Mining Elevator"
	depth = 2
	lift_size_x = 4
	lift_size_y = 4
	icon = 'icons/obj/turbolift_preview_5x5.dmi'

	areas_to_use = list(
		/area/turbolift/geminus_ground_mining,
		/area/turbolift/geminus_top_mining
		)

/obj/turbolift_map_holder/geminushospital
	name = "City Hospital Elevator"
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	areas_to_use = list(
		/area/turbolift/geminus_ground_hospital,
		/area/turbolift/geminus_top_hospital
		)


/obj/turbolift_map_holder/geminuscourt
	name = "Courtroom Elevator"
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	wall_type =  /turf/simulated/wall/walnut
	floor_type = /turf/simulated/floor/wood

	areas_to_use = list(
		/area/turbolift/geminus_court_ground,
		/area/turbolift/geminus_court_top
		)


/obj/turbolift_map_holder/barcasino
	name = "Bar and Casino Elevator"
	depth = 2
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_3x3.dmi'

	wall_type =  /turf/simulated/wall/disco/blue
	floor_type = /turf/simulated/floor/tiled/dark

	areas_to_use = list(
		/area/turbolift/geminus_bar_ground,
		/area/turbolift/geminus_bar_top
		)