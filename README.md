GettingandCleaningData
======================

==================================================================
Version 1.1
==================================================================

This project requirements can be found from Coursera assignment link as below:
https://class.coursera.org/getdata-005/human_grading/view/courses/972582/assessments/3/submissions

Acknowledging the original data source from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The input and output dataset are listed as below:
==================================================================

### Raw input files

- __"UCI HAR Dataset"__ folder
        
        1. activity_labels.txt ~ reference of all six activities within this work
        2. features.txt ~ reference of all 561 featured vaiables within this work

- __"test"__ folder

        1. subject_test.txt ~ data for all subjects in test group
        2. x_test.txt ~ data for all measurements on variables in test group
        3. y_test.txt ~ data for all activities in test group
        
- __"train"__ folder

        1. subject_train.txt ~ data for all subjects in train group
        2. x_train.txt ~ data for all measurements on variables in train group
        3. y_train.txt ~ data for all activities in train group
        
### Output files for this project

(1) __"tidy_dataset.csv"__ ~ a tidy dataset extracting only mean or sd variables on meansurements from both test and train group

(2) __"tidy_dataset_2.csv"__ ~ an aggregated dataset base on _"tidy_dataset.csv"_; this extracts the average of above columns by subject and activity type

Quick facts on data in this work:
==================================================================
### Subjects
- there are 30 unique subjects, considering each as an individual/natural person.
- each subject was fully observed with all activities.

### Activites
- there are 6 unique activities as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

### Variables
- there are 561 variables supplied with input data.
- output data only kept mean() or std() relevant variables from input.
- each subject and activity were measures with these variables.

Additional info:
==================================================================
- Codebook with details on workflow and coding is also available for this project
- R script for this project refers to "run_analysis.R"
- All documents relates to this project is online at: https://github.com/helenh2/GettingandCleaningData

