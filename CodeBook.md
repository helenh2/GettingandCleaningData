---
title: "CodeBook"
author: "Helen"
date: "Sunday, July 27, 2014"
output: html_document
---
##  Coursera Project Assignment - Index

This is a markdown documents aiming at describing relevant variables, the data, and any transformations or work towards producing the final set of tidy output.


### Coding for conducted in this project

1. Preparations

 This step downloaded, unZip and import relevant files as listed under __README.md__ _### Raw input files_ section. One final dataset for each group with the combination of subjects, activity and all variables were produced.

2. Merges the training and the test sets to create one data set
 
 This step merged two output from _step 1_ and output it as ```{r} fulldata ``` to feed into following steps.
 
 
3. Extracts only the measurements on the mean and standard deviation for each measurement

 This step created a logical vector based on if variables is a _"mean()"_ or _"std()"_ value according to names from _"features.txt"_.

        ```{r} grepl("mean\\(\\)",features$feature)|grepl("std\\(\\)",features$feature)```
 
 It then output ```{r} fulldata ``` with only columns (variables) that are TRUE when subsetted against the logical vector. 

4. Uses descriptive activity names to name the activities in the data set

 This step utilized _"activity_labels.txt"_ to substitude all activity numbers with descriptive wordings. To implement this, package ```{r} require(plyr)``` was loaded and function ```{r} join() ``` was used to bring across referencing.

5. Appropriately labels the data set with descriptive variable names

 This step brought across referencing of variable names to dataset colnames using the same logical vector from _step 3_, using ```{r} names()``` function in R. The first output _"tidy_dataset.csv"_ is now ready.
 
        ```{r} write.csv(fulldata,file="tidy_dataset.csv",row.names=FALSE)```

6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

 This step applied further aggregation to first output with package ```{r} require(reshape2)``` was loaded to call melt and dcast funcitons from. Mean was taken on each variables by all subject and activity combinitions.
 
 Again same as _step 5_ output the second tidy set to _"tidy_dataset_2.csv"_


### _End_
