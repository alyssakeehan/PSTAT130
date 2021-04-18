/* Goal:  */
/* Understand the Do-End (Do-While) loop  */
/* Special Missing Values, sum statement and sum function  */
/* Review for Quiz */

/* Question 1 */
data d000;
N = 20;
do i = 1 to N;
x + 1;
if i > 17 then output;
end;
run;
proc print;
	title 'Question 1';
	footnote1 'There are three variables and observations in the resulting dataset.
	The first row in the dataset is 18 since it only outputs when the value of i is greater than 17';
run;

/* Question 2 */
data test;
	x=.;
	y=5;
	a=x+y;
	b=sum(x,y);
	c=5;
	c+x;
	d=5;
	z = d+x+y;
	put a= b= c= d = z =;
run;
proc print;
	title 'Question 2';
	footnote 'x, a, and z all end up being empty since x is 
	set to missing, a is the sum of empty and y and z is set 
	to the sum of empty plus 10. y, b, c, d all have the value 
	of 5 since y, c, and d are set to be 5, and b is set as the 
	sum function of x and y which is just 5. I guess the sum 
	function takes a missing value as 0 while just adding a 
	missing value makes the sum a missing value. With c in line 
	27, it is not setting the sum of c+x to c, otherwise, it 
	would end up being missing.';
run;
