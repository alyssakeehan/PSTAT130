data work.shoe;
	infile '/home/u51497487/PSTAT 130 W21/Class/Shoe.sas7bdat';
	INPUT Style $ 1-15 ExerciseType $ RegularPrice;
run;
proc sort data = work.shoe out = shoetypes;
	by exercisetype;
run;
proc print data = shoetypes;
	title 'Question 1: Part A';
	footnote 'Original Shoe Dataset';
run;
data work.disc;
	infile '/home/u51497487/PSTAT 130 W21/Class/Disc.sas7bdat';
	INPUT ExerciseType $ Adjustment;
run;
proc print;
	footnote 'Original Disc Dataset';
run;
data shoe_disc;
	/* 	Part B */
	merge shoetypes(in = inshoes) work.disc(in = indiscs);
	by ExerciseType;
	/* 	Part C */
	newPrice = Round(RegularPrice - (RegularPrice * Adjustment), .01);
run;
proc print data = shoe_disc;
	/* 	Part D */
	format newPrice dollar11.2;
	title 'Question 1: parts B C and D';
	footnote 'Merged Dataset and newPrice column With Correct Format';
run;
data up_shoe_disc;
	/* 	Same Code from the previous parts */
	merge shoetypes(in = inshoes) work.disc(in=inwork);
	by ExerciseType;
	newPrice = Round(RegularPrice - (RegularPrice * Adjustment), .01);
	/* 	Part E */
	if inshoes and inwork;
run;
proc print data = up_shoe_disc;
	format newPrice dollar11.2;
	title 'Question 1: part E';
	footnote 'All Combined Criteria';
run;

/* Question 2 */

data idcourse;
	/* 	Part A */
	infile '/home/u51497487/PSTAT 130 W21/Class/idcourse.txt';
	input ID $ Course $;
	/* 	Part B */
	if UPCASE(SUBSTR(Course,1,5)) = 'PSTAT' then PSTAT = 1;
	else PSTAT = 0;
run;
proc print;
	title ' Question 2: Parts A and B';
	footnote 'infile, PSTAT variable';
run;
data stats_students;
	set idcourse;
	/* 	Part C */
	where PSTAT = 1;	
proc print data = stats_students;
	title ' Question 2: Part C';
	footnote 'All Info about Students with PSTAT Courses';
run;
proc print data = stats_students(keep = id) noobs;
	footnote 'Only IDs of Students with PSTAT courses';
run;







