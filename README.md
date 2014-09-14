datasciencetidydata
===================

You need "data.table" and "reshape2" libraries installed for the script to run
If they are not yet installed, use
install.packages('data.table')
install.packages('reshape2')
to install them in R

Download the zip file containing the data from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

(The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

unzip the zipfile into the directory where the R script is so that the R script directory contains the new directory 'UCI HAR Dataset'.

run run_analysis.R and it should produce tidydataset.txt

The run_analysis.R goes through these steps:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

