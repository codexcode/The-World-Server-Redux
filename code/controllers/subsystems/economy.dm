SUBSYSTEM_DEF(economy)
	name = "Economy"
	init_order = INIT_ORDER_PAYROLL

	wait = 1200 //Ticks once per 2 minutes
	var/payday_interval = 1 HOUR
	var/next_payday = 1 HOUR

/datum/controller/subsystem/economy/Initialize()
	.=..()

/datum/controller/subsystem/economy/fire()
	if (world.time >= next_payday)
		next_payday = world.time + payday_interval

		//Search general records, and process payroll for all those that have bank numbers.
		for(var/datum/data/record/R in data_core.general)
			payroll(R)
			command_announcement.Announce("Hourly payroll has been processed. Please check your bank accounts for your latest payment.", "Payroll")


/proc/payroll(var/datum/data/record/G)
	var/bank_number = text2num(G.fields["bank_number"])
	var/datum/job/job = job_master.GetJob(G.fields["rank"])
	var/department
	var/class = G.fields["economic_status"]
	var/name = G.fields["name"]
	var/age = G.fields["age"]
	var/datum/money_account/bank_account
	var/wage
	var/calculated_tax
	var/tax


	if(!bank_number)
//		message_admins("ERROR: No bank number found for field.", 1)
		return


	bank_account = get_account(bank_number)

	if(!bank_account)
//		message_admins("ERROR: Could not find a bank account for [bank_number].", 1)
		return

	if(bank_account.suspended)
//		message_admins("ERROR: Bank account [bank_number] is suspended.", 1)
		return

	if((!class)  ||  (class == "Unknown"))
		class = CLASS_WORKING
//		message_admins("ERROR: Could not find class. Assigned working class.", 1)

	switch(class)
		if(CLASS_UPPER)
			tax = tax_rate_upper
		if(CLASS_MIDDLE)
			tax = tax_rate_middle
		if(CLASS_WORKING)
			tax = tax_rate_lower


	department = job.department

	if(!(department in station_departments))
//		message_admins("ERROR: Could not find [department] in station departments.", 1)
		return

	wage = job.wage
//	message_admins("Wage set to [job.wage].", 1)

	if(!wage)
//		message_admins("ERROR: Job does not have wage.", 1)
		return

	if(age > 17) // Do they pay tax?
		calculated_tax = round(tax * wage, 1)

	//Tax goes to the treasury. Mh-hm.
	department_accounts["[station_name()] Funds"].money += calculated_tax

	//Your wage comes from your department, yes.
	department_accounts[department].money -= wage

	wage -= calculated_tax

	//You get paid.
	bank_account.money += wage

	//create an entry for the payroll (for the payee).
	var/datum/transaction/T = new()
	T.target_name = bank_account.owner_name
	T.purpose = "[department] Payroll: [name] ([calculated_tax] credit tax)"
	T.amount = wage
	T.date = "[get_game_day()] [get_month_from_num(get_game_month())], [get_game_year()]"
	T.time = stationtime2text()
	T.source_terminal = "[department] Funding Account"

	//add the account
	bank_account.transaction_log.Add(T)

	//Complete
