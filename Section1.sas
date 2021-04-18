/*Section 1*/

/*Exercise 1*/
data airport;
infile '/home/u51497487/PSTAT 130 W21/Class/airports.txt' dlm = "|";
/*proc contents data = class.airports;*//*file name mislabeled*/
input Airport:$36. Country:$15.;
run;
proc print data = airport;
run;

/*Exercise 2*/
data test;
input x y z;
cards;
18 2 46
37 46 72 
54 80 35
26 20 21
97 30 15
;
run;
proc print data = test;
run;
