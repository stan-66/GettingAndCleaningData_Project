## =============================================================================================
##Getting and Cleaning Data Course Project: R script
##by stan-66, Feb 3, 2021
## =============================================================================================


## Prerequisites: install the packages for the aggregating functions
install.packages("dplyr")
library(dplyr)

## 1. load the files
## =============================================================================================
## Assumption: The source ZIP archive was unzipped in the work directory

## load measurements
xtest1 <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", dec = ".")
xtrain1 <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", dec = ".")

## load activities
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "", dec = ".")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "", dec = ".")

## load subjects
subtrain <-read.table("./UCI HAR Dataset/train/subject_train.txt")
subtest <-read.table("./UCI HAR Dataset/test/subject_test.txt")

## load labels
actlabels <-read.table("./UCI HAR Dataset/activity_labels.txt")
features <-read.table("./UCI HAR Dataset/features.txt")

## 2. select the mean and standard deviation on the measurements
## =============================================================================================

colnames(xtest1) <- c(as.character(features[ ,2])) #name the columns
colnames(xtrain1) <- c(as.character(features[ ,2])) #name the columns
cmean <- grep("mean()", colnames(xtest1), fixed = TRUE) #get the columns for mean
cstd <- grep("std()", colnames(xtest1), fixed = TRUE) #get the columns for std

xtest2 <- xtest1[, c(cmean, cstd)] #select the desired variables
xtrain2 <- xtrain1[, c(cmean, cstd)] #select the desired variables

## 3. bind the subject and the activity to the datasets, merge them and name the columns 
## =============================================================================================

xtest3 <- cbind(subtest, ytest, xtest2)
xtrain3 <- cbind(subtrain, ytrain, xtrain2)
xall <- rbind(xtest3, xtrain3)
colnames(xall)[1] <- "Subject"
colnames(xall)[2] <- "Activity"

## 4. Replace the activity code by its label
## =============================================================================================

for(i in 1:nrow(xall)){
	xall[i, 2] <- actlabels[xall[i, 2],2]
}

## 5. aggregate and compute the average on the variables
## =============================================================================================

xgrouped <- group_by( xall, Subject, Activity) #group
xsummary <- summarise_all(xgrouped, funs(mean)) #compute average

## 6. Set the column names and the activity labels in the summary data set
## =============================================================================================

colnames(xsummary) <- colnames(xall)  #variables get the same name as in the original dataset
xsummary[, 2] <- as.character(xsummary$Activity)
for(i in 1:nrow(xsummary)){
	xsummary[i, 2] <- actlabels[as.numeric(xsummary[i, 2]),2]
}

## 7. Generate file
## =============================================================================================

write.table(xsummary, file = "TidyData.txt", row.names = FALSE, col.names = TRUE)
