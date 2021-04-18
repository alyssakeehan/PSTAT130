libname class '/home/u51497487/PSTAT 130 W21/Class';

/* Question 1 */
data invest;
	balance = 1000;
	do year = 1 to 5;
		balance = balance * 1.0425;
		output;
	end;
proc print data = invest;
	format balance dollar11.2;
	title 'Question 1';
	footnote 'Balance after 5 years with 4.25% Interest';
run;
/* Question 2 */
/* Part A */
data sfosch_A(keep = date totalPass);
	set class.sfosch;
	by date;
	if first.date then totalPass = 0 ;
	totalPass + sum(FClassPass, BClassPass, EClassPass);
	if last.date;
run;
proc print data = sfosch_A;
	title 'Question 2: Part A';
	footnote 'Used the Sum Statement to Calculate Total Passengers for Each Date';
run;
/* Part B */
data sfosch_B;
	set class.sfosch;
	by date;
	if first.date then Do;
	totalPass = 0;
	sumCap = 0;
	End;
	totalPass + sum(FClassPass, BClassPass, EClassPass);
	sumCap + TotPassCap;
	if last.date;
	percCap = totalPass / sumCap;
	keep date totalPass sumCap percCap;
run;

proc print data = sfosch_B;
	var date percCap; 
	title 'Question 2: Part B';
	footnote 'Add the Percentage of Total Passengers / Sum Capactiy';
run;
/* Part C */
proc print data = sfosch_B;
	format percCap percent10.2;
	title 'Question 2: Part C';
	footnote 'Date, Total Passengers, Total Capacity and Percent Capacity using the Percent Format';
run;
/* Part D */
data overCap;
	set sfosch_B;
	if percCap > 1 then OverCapacity = "YES";
	else OverCapacity = "NO";
run;
proc print data = overCap;
	var date percCap OverCapacity;
	format percCap percent10.2;
	title 'Question 2: Part D';
	footnote 'The flights that departed on December 28, 2000 had a total number of passengers greater than the total capacity for that day.';
run;
	

