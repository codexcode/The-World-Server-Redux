// Laws can be set by the president, here.

var/list/presidential_laws = list()

/datum/president/laws/law
	no = "i100"
	name = "Sample Law"
	desc = "Sample law text."
  
/datum/president/laws/law/New()
	..()
	src += presidential_laws	
