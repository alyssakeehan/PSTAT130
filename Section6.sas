libname class '/home/u51497487/PSTAT 130 W21/Class';

data temp;
	set class.GradeGS;
	keep Q1-Q8;
run;
proc print;
	title 'Question 1';
	footnote 'GradeGS only columsn Q1-Q8';
run;
/* Using the Means procedure */
proc means data = temp mean;
	var Q1-Q8;
	output out = AvQuiz (drop = _type_ _freq_) mean = Q1-Q8;
	footnote 'Just the means from each of the Quizzes';
run;
proc print data = AvQuiz;
	footnote 'One row for for all the means of each quiz';
run;

/* Question 2*/
proc transpose data = AvQuiz out = AvQuiz_Transpose;
run;
proc print data = AvQuiz_Transpose label;
	label _Name_ = "Quiz"
			Col1 = "Av_score_quiz";
	title 'Question 2';
	footnote 'Swap Rows and Columns. 8 rows and 2 columns';
run;

/* Question 3 */
proc sgplot data = AvQuiz_Transpose;
	series x = _NAME_ y = Col1 / markers smoothconnect markerattrs=(symbol = diamond);
	refline 4.4 /label = "Global Average" lineattrs=(Color = red);
	xaxis label = 'Quiz Number';
	yaxis label = 'Average';
	title 'Question 3';
	footnote 'Plot of the Average Score on Each Quiz using SGPLOT';
run;


