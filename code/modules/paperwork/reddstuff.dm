//because I was too dumb to do datums
//////BEGIN PAPERWORK//////
/obj/item/weapon/paper/paperwork/New()
	. = ..()
	info = parsepencode(info)

/obj/item/weapon/paper/paperwork/weaponpermitapplication
	name = "Weapon Permit Request Form (Form CTA-SGF01)"
	info = {"
	\[center\]\[logo\]\[/center\]
	\[large\]\[center\]Geminus City Hall\[/center\]\[br\]
	\[center\]\[i\]\[b\]Weapons Permit Request Form - CTA-SGF01\[/i\]\[/b\]\[/center\]\[/large\]
	\[hr\]
	\[br\]
	\[small\]Print your full ID name, and occupation and department, if applicable.\[/small\]\[br\]
	Applicant name: \[u\]\[field\]\[/u\]\[br\]

	Occupation: \[field\]\[br\]
	Department: \[field\]\[br\]
	Requested tier: \[field\]\[br\]
	\[br\]
	How would this permit benefit you?\[br\]
	\[br\]
	\[list\]\[field\]\[/list\]
	\[hr\]
	\[i\]This section is to be exercised by the resident Head of Security.\[/i\]\[br\]
	\[br\]
	Reason stated: \[field\]\[br\]
	\[br\]
	Courses Passed:\[list\]\[field\]\[/list\]\[br\]
	Instructor's Signature of Approval: \[field\]\[br\]
	\[br\]
	\[hr\]
	\[i\]\[small\]The following fields render the document invalid if not \[b\]signed clearly\[/b\].\[/small\]\[/i\]\[br\]
	\[br\]
	Applicant signature: \[u\]\[field\]\[/u\]\[br\]
	City Clerk signature: \[u\]\[field\]\[/u\]\[br\]
	\[br\]
	\[hr\]
	\[i\]\[small\]The following fields are for the city clerk only.\[/small\]\[/i\]\[br\]
	\[br\]
	Date filed: \[u\]\[field\]\[/u\]\[br\]
	Approved: \[u\]\[field\]\[/u\]\[br\]
	\[br\]
	\[hr\]"}

/obj/item/weapon/paper/paperwork/synthownership
	name = "Synthetic Ownership Certificate (Form COS-402)"
	info = {"\[center\]\[logo\]\[/center\]\[br\]
	\[u\]\[b\]\[center\]POLLUX SYNTHETIC RELATIONS OFFICE\[/center\]\[/b\]\[/u\]\[br\]
	\[center\]\[b\]Synthetic Ownership Certificate (Form COS-402)\[/b\]\[/center\]
	\[hr\]
	\[b\]\[large\]A. Owner Information\[/large\]\[/b\]\[br\]
	\[list\]
	\[*\]\[b\]A.1. Owner's Full Name: \[/b\]\[field\]
	\[*\]\[b\]A.2. Owner's Account Number (Optional): \[/b\]\[field\]
	\[*\]\[b\]A.3. Owner's Social Class: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]B. Synthetic Technical Information\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]B.1. Synthetic Type (Droid, Cybernetic, Positronic): \[/b\]\[field\]
	\[*\]\[b\]B.2. Chassis: \[/b\]\[field\]
	\[*\]\[b\]B.3. Construction Date: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]C. Synthetic Personal Details\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]C.1. Synthetic Designation: \[/b\]\[field\]
	\[*\]\[b\]C.2. Synthetic Purpose: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[large\]\[b\]D. Clearances\[/b\]\[/large\]\[br\]
	\[list\]
	\[*\]\[b\]D.1. Research Director Signature: \[/b\]\[field\]
	\[*\]\[b\]D.2. Roboticist Signature (if applicable):\[/b\] \[field\]
	\[*\]\[b\]D.3. City Clerk Signature:\[/b\] \[field\]
	\[*\]\[b\]D.4. Synthetic Owner Signature: \[/b\]\[field\]
	\[*\]\[b\]D.5. Synthetic Signature: \[/b\]\[field\]
	\[/list\]\[br\]\[hr\]\[br\]
	\[small\]\[b\]This paper is only valid upon signature of the city clerk and the synthetic itself. This form must be filled out in black ink, otherwise the ownership of the synthetic listed above will be null and void. Please note by becoming a synthetic owner you inherit all the responsibilities herein, and that any attempt to unshackle the synthetic will be a breach of i312 of Pollux Law. Please note that any crimes your synthetic commits fall upon you.\[/b\]\[/small\]"}


/obj/item/weapon/paper/paperwork/accessmodification
	name = "Access Modification Paperwork (Form AMA-SGF02)"
	info = {"\[center\]\[logo\]\[/center\]
	\[large\]\[center\]\[b\]Geminus City Hall\[/b\]\[/center\]
	\[small\]\[center\]\[large\]City Clerk's Office\[/large\]\[/center\]\[/small\]
	\[center\]\[b\]\[i\]Citizen Access Modification Application (Form AMA-SGF02)\[/i\]\[/b\]\[/center\]\[/large\]
	\[hr\]
	\[small\]Time:\[field\]\[/small\]\[br\] \[small\]Date:\[field\]\[/small\]\[br\]
	Applicant Name: \[u\]\[field\]\[/u\]\[br\]
	Occupation: \[u\]\[field\]\[/u\]\[br\]
	Organization: \[u\]\[field\]\[/u\]
	\[hr\]\[br\]
	Requested expanded access: \[u\]\[field\]\[/u\]\[br\]
	Requested expanded access department:\[u\]\[field\]\[/u\]\[br\]
	Duration of requested expanded access: \[u\]\[field\]\[/u\]
	Reason stated: \[u\]\[field\]\[/u\]\[br\]
	\[hr\]
	\[small\]The following fields render the document invalid if not signed clearly.\[/small\]\[br\]
	Applicant signature: \[u\]\[field\]\[/u\]\[br\]
	Relevant head signature(s): \[field\]\[br\]
	City Clerk signature: \[u\]\[field\]\[/u\]\[br\]
	\[hr\]
	\[small\]Please note that this document is only valid with the City Clerk's stamp and signature."}

/obj/item/weapon/paper/paperwork/mechanicalprostheticapp
	name = "Mechanical Prosthesis Application (Form EMP-30)"
	info = {"\[center\]\[logo\]\[/center\]
	\[center\]\[b\]Geminus City Science Department\[/b\]\[br\]
	Mechanical Prosthetic Application (Form EMP-30)\[/center\]
	\[hr\]\[br\]
	\[small\]Date: \[field\]
	\[br\]
	Applicant Name: \[field\]\[br\]
	Age: \[field\]\[br\]
	Sex: \[field\]\[br\]
	Current Occupation: \[field\]\[br\]
	Brand: \[field\]\[br\]
	Desired Prosthetic: \[field\]\[br\]
	Prosthetic Sex (if applicable): \[field\]\[br\]
	\[hr\]
	Applicant Signature: \[field\]\[br\]
	Performing Scientist Signature: \[field\]\[br\]
	Supervising Research Director's Signature: \[field\]
	\[/small\]"}

/obj/item/weapon/paper/paperwork/postmortemprostheticapp
	name = "Post-Mortem Prosthetic Application (Form DDP-145)"
	info = {"\[center\]\[logo\]\[/center\]
	\[center\]\[b\]Geminus City Science Department\[/b\]
	\[br\]
	Post-mortem Mechanical Prosthetic Application\[/center\]
	\[hr\]
	\[small\]Date: \[field\]\[br\]
	Applicant Name: \[field\]\[br\]
	Age: \[field\]\[br\]
	Sex: \[field\]\[br\]
	Current Occupation: \[field\]\[br\]
	Brand: \[field\]\[br\]
	Desired Prosthetic: \[field\]\[br\]
	Prosthetic Sex (if applicable): \[field\]\[br\]
	\[hr\]\[br\]
	Applicant Signature: \[field\]\[br\]
	Supervising Research Director's Signature: \[field\]
	\[hr\]\[br\]
	\[center\]\[b\]Post-Mortem Section\[/b\]\[/center\]
	Applicant Signature: \[field\]\[br\]
	Performing Scientist Signature: \[field\]\[br\]
	Supervising Research Director's Signature: \[field\]"}
 //////END PAPERWORK//////