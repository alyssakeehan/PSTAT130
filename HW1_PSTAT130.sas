libname class '/home/u51497487/PSTAT 130 W21/Class'; 

/* Question 1 */
data empdata;
	set class.empdata;
	if salary > 50000 then NewSalary = salary + salary*0.03;
run;
/* part a */
proc print data = empdata;
	var LastName FirstName NewSalary;
	title 'Question 1: Part A';
run;
/* part b */
proc print data = empdata noobs;
	title 'Question 1: Part B';
run;
/* part c */
proc print data = empdata label;
	label LastName = "Last Name"
			FirstName = "First Name"
			newSalary = "New Salary";
	title 'Question 1: Part C';
run;
/* part d */
proc print data = empdata;
	where jobcode = 'PILOT';
	title 'Question 1: Part D';
run;
/* combined criteria */
proc print data = empdata label noobs;
	where jobcode = 'PILOT';
	var LastName FirstName NewSalary;
	label LastName = "Last Name"
			FirstName = "First Name"
			NewSalary = "New Salary";
	title 'Question 1: All Criteria';
run;

/* Question 2 */
data insure10 (keep = Name Company PctInsured BalanceDue);
	set class.insure;
run;
/* part i */
proc print data = insure10;
	title 'Question 2: Part i';
run;
/* part ii */
proc print data = insure10;
	where PctInsured < 100;
	title 'Question 2: Part ii';
run;
/* part iii */
proc print data = insure10;
	var Name Company BalanceDue; 
	title 'Question 2: Part iii';
run;
/* all combine criteria */
proc print data = insure10;
	where PctInsured < 100;
	var Name Company BalanceDue;
	title 'Question 2: All Criteria';
run;

/* Question 3 */
data experiment;
input ID trt $ response;
cards;
001 D1 10
002 D1 14
003 D1 09
004 D2 00
005 D2 05
006 P 20
007 P 22
009 P 11
011 D1 08
013 D2 03
014 D1 02
010 P 00
;
run;
/* part a */
proc print data = experiment;
	title 'Question 3: Part A';
run;
/* part b */
proc means data = experiment mean std; 
	var response;
	class trt;
	title 'Question 3: Part B';
run;
/* part c */
proc format;
	value range low-<10 = "Less than 10"
				10-20 = "10 to 20"
				20-high = "Greater than 20";
run;
proc print data = experiment;
	format response range.;
	title 'Question 3: Part C';
run;
/* part d */
proc print data = experiment label;
	label trt = "Treatment"
		response = "Response (time in Months)";
	title 'Question 3: Part D';
run;
/* part c and d together */
proc print data = experiment label;
	format response range.;
	label trt = "Treatment"
		response = "Response (time in Months)";
	title 'Question 3: Part C and D Together';
run;
/* part e */
proc means data = experiment sum; 
	var response;
	class trt;
	title 'Question 3: Part E';
run;


