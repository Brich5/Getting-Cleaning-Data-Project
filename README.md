# Getting-Cleaning-Data-Project

This is the course project for the Coursera class Getting and Cleaning Data.

Your first step would be to download the data at: 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The provided R script run_analysis.R will take the Samsung Data located in the local computer's working directory and transform it to a "tidy data frame".
 
The original data was split into two separate parts (train & test). 
The R script will merge these two parts. 
It will replace the generic column names (like V1) with the descriptive variable names (like tBodyAccMEANX). 
It will remove any columns that do not have mean or standard deviation data.
It will replace the numeric activity values (like 1) with the descriptive variable names (like walking).
It will label the subject and activity columns.
Finally, it will create a "tidy data set" which on includes the means of each column variable for each subject and each activity.
