libname class '/home/u51497487/PSTAT 130 W21/Class';

/* Question 1 */

data height;
	infile '/home/u51497487/PSTAT 130 W21/Class/height.txt';
	input ID $ height units $;
run;
proc contents data = height;
	title 'Question 1';
	footnote 'Descriptor Portion of Height Data';
run;
proc print data = height;
	footnote 'Data Portion of Height Data';
run;

data height_in(drop = units);
	set height;
	if UPCASE(units) = 'CM' then do;
		height = height/2.54;
	end;
run;
proc print data = height_in;
	footnote 'All heights in Inches and Units Column Dropped';
run;

/* Question 2 */

data group;
	infile '/home/u51497487/PSTAT 130 W21/Class/group.txt';
	input ID $ group $;
run;
proc print data = group;
	title 'Question 2';
	footnote 'Read the group data in';
run;
proc sort data = group out = sortedGroup;
by ID;
run;
proc sort data = height_in out = sortedHeights;
by ID;
run;
data group_heights;
	merge sortedGroup sortedHeights;
	by ID;
run;
proc print data = group_heights;
	footnote 'Merge the data from Group and Height';
run;
proc means data = group_heights n mean stddev;
	var height;
	class group;
	footnote 'Summary Statistics for Height and Group';
run;

/* Question 3 */

data height2;
	infile '/home/u51497487/PSTAT 130 W21/Class/height2.txt' missover;
	input ID $ height units $;
run;
proc contents data = height2;
	title 'Question 3';
	footnote 'Descriptor Portion of Height2 Data';
run;
proc print data = height2;
	footnote 'Data Portion of Height2 Data';
run;
data height2_in(drop = units);
	set height2;
	if UPCASE(units) = "CM" then
		height = height/2.54;
	else if UPCASE(units) = "IN" then
		height = height;
	else height = .;
run;
proc print data = height2_in;
	footnote 'All heights in Inches and Units Column Dropped';
run;

/* Question 4 */

data group2;
	infile '/home/u51497487/PSTAT 130 W21/Class/group2.txt';
	input ID $ group $;
run;
proc print data = group2;
	Title 'Question 4';
	footnote 'Read in the Group2 data';
run;
proc sort data = height2_in out = sortedHeight2;
	by ID;
run;
proc sort data = group2 out = sortedGroup2;
	by ID;
run;
data group2_height2;
	merge sortedGroup2 sortedHeight2;
	by ID;
run;
proc print data = group2_height2;
	footnote 'Merge the data from Group2 and Height2';
run;
data all_heights;
	set group_heights group2_height2;
run;
proc print data = all_heights;
	footnote 'Concatenate the Two Merged Datasets';
run;
proc means data = all_heights n mean stddev;
	var height;
	class group;
	footnote 'Calculating the Summary Statistics for the newly Concatenated Dataset';
run;

/* Question 5 */

data new_GroupXHeights1;
	merge sortedGroup sortedHeights;
	by ID;
	source = 1;
run;
proc print data = new_GroupXHeights1;
	title 'Question 5';
	footnote 'Merge Group and Height again with the source = 1';
run;
data sortedHeights2new;
	set sortedHeight2;
	if height = . then delete;
run;
data newGroupXHeights2;
	merge sortedGroup2 sortedHeights2new;
	by ID;
	if height = . then delete;
	source = 2;
run;
proc print data = newGroupXHeights2;
	footnote 'Merge Group2 and Height2 again with source = 2';
run;
data all_heights_source;
	set new_GroupXHeights1 newGroupXHeights2;
run;
proc print data = all_heights_source;
	footnote 'Append the two new Merged Data Sets again with the Source Column';
run;
proc freq data = all_heights_source;
	tables group*source;
	footnote 'Crosstabulation of Source and Group';
run;
		






