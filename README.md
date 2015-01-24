# 3project
This is for the course project for the coursera Getting and Cleaning Data course.
The R code is run_analysis.R
All of the input data files must be in the working directory for the code to run.
The code uses the packages dplyr and reshape2
It will insall the packages and load them
the output of the code is a file called "tidy.txt"
The file has only 4 variables 
subject-- the subject code
activity-- the description of the activity, for example LAYING 
variable which is the variable name from the xtest or xtrain data, for example tBodyAccmeanX
 ALL variables with "mean" or "std" in their name are included here. There were 79 such variables, 
The last variable in tidy.txt is the value -- this is the mean of the values for the activity, subject, and variable.

The file is very long since there are 30 subjects, 6 activities and 79 variables for 14220 rows.
