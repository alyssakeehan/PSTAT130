libname class '/home/u51497487/PSTAT 130 W21/Class';

/* Exercise 1 */
data work.insure1(keep = Name Policy Company PctInsured BalanceDue);
	set class.insure;
run;
proc print data = insure1;
	title 'Exercise 1: Part 1';
run;
data work.insure2;
	set class.insure;
run;
proc print data =insure2;
	var ID Name Company PctInsured Total;
	title 'Exercise 1: Part 2';
run;
data work.insure3 (keep = Name Policy Company PctInsured BalanceDue);
	set class.insure;
run;
proc print data =insure2;
	var Name BalanceDue;
	title 'Exercise 1: Part 3';
run;

/* Exercise 2 */

data olympics;
	input hostcity $ year country $;
	cards;
	Rio 2016 Brazil
	London 2012 England
	Beijing 2008 China
	Athens 2004 Greece
	Sydney 2000 Australia
	;
run;
proc print label noobs;
	label hostcity = "Host City"
			year = "Year"
			country = "Country";
	title 'Exercise 2';
run;

/* Exercise 3 */

data world;
	set class.world;
run;
proc contents data = world;
	title 'Exercise 3: Part 1';
run;
proc print data = world;
	title 'Exercise 3: Part 2';
run;
proc print data = world;
	format UNdate mmddyy10. mil_spend comma14.0;
	title 'Exercise 3: Part 3';
run;
proc print data = world label;
	label country = 'Country Name'
			code = 'Continent Code'
			gdp = 'Gross Domestic Product'
			pci = 'Per Capita Income'
			lit_rate = 'Literacy Rate (%)'
			mil_spend = 'Amount of Military Spending'
			physicians = 'Number of Physicians per 100000 population'
			UNdate = 'Date the country joined the United Nations';
	title 'Exercise 3: Part 4';
run;
proc sort data = world out = work.world;
	by code physicians;
run;
proc print data = work.world;
	title 'Exercise 3: Part 5 and 6';
run;
data newWorld;
	set work.world; 
	label country = 'Country Name'
			code = 'Continent Code'
			gdp = 'Gross Domestic Product'
			pci = 'Per Capita Income'
			lit_rate = 'Literacy Rate (%)'
			mil_spend = 'Amount of Military Spending'
			physicians = 'Number of Physicians per 100000 population'
			UNdate = 'Date the country joined the United Nations';
run;
proc print data = newWorld label;
	format UNdate mmddyy10. mil_spend comma14.0;
	title 'Exercise 3: Part 7 and 8';
run;




