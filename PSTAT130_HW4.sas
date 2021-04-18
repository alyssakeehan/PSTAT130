/* Reading in all the data for this assignment */
data PSTAT130;
	infile '/home/u51497487/PSTAT 130 W21/Class/PSTAT130.txt';
	input StudentName $1-15;
	coursename = "PSTAT130";
run;

data PSYCH118;
	infile '/home/u51497487/PSTAT 130 W21/Class/PSYCH118.txt';
	input StudentName $1-15;
	coursename = "PSYCH118";
run;

data POLI125;
	infile '/home/u51497487/PSTAT 130 W21/Class/POLI125.txt';
	input StudentName $1-15;
	coursename = "POLI125";
run;

data instructors;
	infile '/home/u51497487/PSTAT 130 W21/Class/instructors.txt';
	input InstructorName $1-13 @16 AcademicRank $ @23 Salary comma9. @32 CourseName $ @42 FirstClassDate mmddyy8.;
	format Salary dollar10.;
	format FirstClassDate mmddyy8.;
run;
data classrooms;
	infile '/home/u51497487/PSTAT 130 W21/Class/classrooms.txt';
	input BldgName $1-13 @14 RoomNumber @19 CourseName $ @29 Days $ @36 Time $36-43;
run;

/* Question 1 */
data allStudents;
	set PSTAT130 PSYCH118 POLI125;
run;
proc sort data = allStudents;
	by courseName studentName;
run;
proc print data = allStudents;
	title 'Question 1';
	footnote 'create dataset called allstudents';
run;

/* Question 2 */
/* Must sort each dataset to use merge */
proc sort data = instructors out = sort_inst;
	by coursename;
run;
proc sort data = classrooms out = sort_class;
	by coursename;
run;
proc sort data = allStudents out = sort_students;
	by coursename;
run;
/* Merging the sorted instructor and classroom datasets by coursename */
data inst_room;
	merge sort_inst sort_class;
	by coursename;
run;
/* merging the newly sorted instructor/classroom dataset with sorted students */
data stud_inst_room;
	merge sort_students inst_room;
	by courseName;
run;
/* Only keep some variables */
proc print data = stud_inst_room;
	title 'Question 2';
	footnote 'All the combined variables';
proc print data = stud_inst_room(keep = StudentName CourseName InstructorName BldgName RoomNumber);
	footnote 'Pair each student with the Instructor and Room Information with each Class';
run;
	
/* Question 3 */
proc sort data = stud_inst_room out = sort_stud_inst_room;
	by courseName studentName;
run;
proc report data = sort_stud_inst_room;
	title 'Question 3';
	/* 	Part C: only the students column */
	column studentName;
	/* 	Step A : One page per class*/
	by courseName;
	/* 	step B : Correct labels */
	label courseName = "Course Name";
	define StudentName / width = 8 "Student Name";
	footnote 'Create a ‘Roster’ for each class showing the names of the students taking that
class.';
run;

/* Question 4 */
title ' ';
footnote ' ';
proc sort data = stud_inst_room out = sort_stud;
	by studentName CourseName;
run;
proc report data = sort_stud;
	/* 	Part A: Only Variables Below */
	column courseName FirstClassDate InstructorName BldgName RoomNumber Days Time;
	by StudentName;
	/* 	Part B: Assign the correct labels */
	label StudentName = "Student Name";
	define courseName / width = 4 'Course Name';
	/* 	Part C: Add the format for first class date */
	define FirstClassDate / order 'First Class Date' format = mmddyy8.;
	define InstructorName / 'Instructor Name';
	define BldgName / 'Building Name';
	define  RoomNumber / 'Room Number';
	define Days / 'Class Days';
	define Time / 'Class Time';
run;

/* Question 5 */
proc format;	
	/* 	Part C: Create a user-def format for the type of academic ranking */
	value $type_prof "Assoc" = "Associate Professor"
					"Asst" = "Assistant Professor";
run;
proc report data = sort_stud;
	title 'List of Students for Associate Professors';
	/* 	Part C also: only the observations where AcademicRank is Assoc */
	where AcademicRank = "Assoc"; 
	/* 	Part A: Only the variables below */
	column studentName coursename InstructorName AcademicRank Salary;
	/* 	Part B: Only the Correct Labels */
	define studentName / width = 4 'Student Name';
	define CourseName / 'Course Name';
	define InstructorName / 'Instructor Name';
	/* 	Part C: apply the format */
	define AcademicRank / 'Academic Rank' format = $type_prof.;
	/* 	part D: appropriate format for salary */
	define Salary / 'Salary' format = dollar10.;
	footnote 'Question 5';
run;








	
