==================================================================
Getting and cleaning data course project
An analysis based on the Human Activity Recognition Using Smartphones Dataset Version 1.0 
Data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Downloaded on Jan. 30, 2021
Analysis by stan-66
==================================================================
Original study by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The present analysis takes the results of the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years.
In the original study, each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
In the orignial study, the sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The analysis merges the two data sets of the original study, and computes averages on a subset of measurements, for each subject and activity.

Each record provides:
. The identifier of the subject
. The activity label
. Averages on the mean values and standard deviation of the original measures, provided in the original dataset. For more info about the measures, please refer to CodeBook.md.
. The column names are provided  

The dataset includes the following files:
=========================================

- 'ReadMe.md': explains how the script works
- 'CodeBook.md': describes the variables, the data, and any transformations or work performed to clean up the data
- 'run_analysis.R': the R script performing the analysis
- 'TidyData.txt': the text file resulting of the analysis

Credits:
========
Original analysis:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

