/* Question 1 */
data _null_;
	/* 	get today's date */
	totay = today();
	/* 	how to create a date */
	ex1 = mdy(5,26,2020);
	/* 	date function: YEAR(),MONTH(),WEEKDAY() */
	dt1 = '26May20'd;
	year = year(dt1);
	month = month(dt1);
	weekday = weekday(dt1);
	put today date9. ;
	put ex1 date9.;
	put dt1 year month weekday;
	year1 = year(ex1);
	month1 = month(ex1);
	put year1= ' ' month1= ;
run;

/* Question 2 */
data one;
	input x y;
	datalines;
	5 11.1
	6 12.2
	7 13.3
	8 14.4
	;
run;
data two;
	input x w $;
	datalines;
	5 a
	6 b
	9 z
	;
run;
data three;
	input z;
	datalines;
	100
	200
	;
run;
/* part A */
data one_two;
	set one two;
run;
proc print data = one_two;
	title 'Question 2: part A';
	footnote '7 Rows 3 Columns';
run;
/* part B */
data one_two_three;
	set one two three;
run;
proc print data = one_two_three;
	title 'Question 2: part B';
	footnote '9 Rows 4 Columns';
run;
/* part C */
data onetwo;
	merge one two;
	by x;
run;
proc print data = onetwo;
	title 'Question 2: part C';
	footnote '5 Rows 3 Columns';
run;
/* part D */
data onetwo_comp;
	merge one(in=inone) two(in=intwo);
	by x;
	if inone and intwo;
run;
proc print data = onetwo_comp;
	title 'Question 2: part D';
	footnote '2 Rows 3 Columns';
run;

/* Question 3 */
libname class '/home/u51497487/PSTAT 130 W21/Class';
data insure10(keep = Name Company PctInsured);
	set class.insure;
	where PctInsured >= 100;
run;
proc print;
	title1 'Question 3: part A';
	title2 'i. insure10';
	footnote '';
run;
data insure20;
	set class.insure;
	keep Name Company PctInsured BalanceDue;
run;
proc print;
	title2 'ii. insure20';
run;
proc sort data = insure20 out = sortedInsure;
	by Descending BalanceDue;
proc print data = sortedInsure;
	var Name Company BalanceDue;
	format BalanceDue dollar11.2;
	title1 'Question 3: Part B';
run;








	