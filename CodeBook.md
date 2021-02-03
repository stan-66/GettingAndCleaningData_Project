Getting and cleaning data course project: code book
===================================================

by stan-66, Feb. 2021


This code book describes the variables, the data, and any transformations or work performed to clean up the data

====================================================

Requirements:
=============
The package dplyr is needed for this script. The script contains the following code lines to that avail:
install.packages("dplyr")
library(dplyr)

Source data:
============
The script assumes the UCI dataset was unzipped directly into R's working directory:
- measurements: X_test.txt, X_train.txt
- activities: y_test.txt, y_train.txt
- subjects: subject_test.txt, subject.train.txt
- labels: activity:_labels.txt, features.txt

Process:
========
The script goes along the following steps:
1. Load the sources files provided (see assumption above as to the source data) -> datasets xtest1 and xtrain1.

2. Select the mean and the standard deviations in the measurements using the column names -> datasets xtest2 and xtrain2.

3. Include the columns for subject and activity ID to the datasets -> datasets xtest3, xtrain3; merge them and set the column names -> dataset xall

4. Replace the activity ID by the label -> dataset xall

5. Aggregate and compute the average on the variables -> datasets xgrouped, xsummary

6. Set the column names in the summary dataset -> dataset xsummary

7. Generate the results text file in the working directory -> TidyData.txt


Output Data:
============
The result text file TidyData.txt contains the following data elements:
- Subject, identifying the subject ID
- Activity, indentifying the activity type

It also includes mean (Mean) and standard deviation (std) variables for the original variables:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The column labels are included.
