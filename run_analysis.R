## Coursera Project for Getting and Cleaning Data
#########################################################
# Step 1 Preparation step (download,unzip,and import)
zipurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipurl,destfile="getdata_projectfiles_UCI HAR Dataset.zip")
unzip("getdata_projectfiles_UCI HAR Dataset.zip") # this will extract the entire folder
        
#       checking on unzip folder
#         list.files(".\\")
#         list.files(".\\UCI HAR Dataset")
#         list.files(".\\UCI HAR Dataset\\test")
#         list.files(".\\UCI HAR Dataset\\train")
        
# Import relevant files
# First set: ref files;

        activities<-read.table(".\\UCI HAR Dataset\\activity_labels.txt",
                             col.names=c("activity_id","activity"))
        features<-read.table(".\\UCI HAR Dataset\\features.txt",
                     col.names=c("feature_id","feature"))

# Second set: test

        subject_test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt",
                                 col.names="subject")
        x_test<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
        y_test<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt",
                           col.names="activity_id")

#       get a full dataset of test

        test_set<-cbind(subject_test,y_test,x_test)

# Third set: train

        subject_train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt",
                                 col.names="subject")
        x_train<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
        y_train<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt",
                           col.names="activity_id")

#       get a full dataset of train

        train_set<-cbind(subject_train,y_train,x_train)

# clean out working data
rm("x_test","y_test","subject_test","x_train","y_train","subject_train")
#########################################################
# Step 2: to answer question 1.
# Merges the training and the test sets to create one data set.

fulldata<-rbind(train_set,test_set)

# clean out working data
rm("test_set","train_set")
#########################################################
# Step 3: to answer question 2.
# Extracts only the measurements on the mean and standard deviation for each measurement.

# create a logic check vector from features
logic<-grepl("mean\\(\\)",features$feature)|grepl("std\\(\\)",features$feature)

# expand the logic to include columns other than features (i.e. subjects & activities)
logic<-c(as.logical("TRUE"),as.logical("TRUE"),logic)

        # QA on final logic vector
        # length(logic)
        # head(logic,n=10)

# check against logic vector,only export cols TRUE with either of logic below;
fulldata<-fulldata[,logic]

        # QA on final output
        # ncol(fulldata)
        # head(fulldata,n=1)
        # colnames(fulldata)

#########################################################
# Step 4: to answer question 3.
# Uses descriptive activity names to name the activities in the data set
# use plyr package.join function
require(plyr)
temp<-join(activities,fulldata,by="activity_id")

# output with the same coumn order but using descriptive activity
fulldata<-cbind(temp[,3:2],temp[,4:length(temp)])

#         QA for keeping consistent column order
#         check<-names(fulldata)
#         check[1:5]
#         ncol(fulldata)

# clean out once above step done
rm("temp")

#########################################################
# Step 5: to answer question 4.
# Appropriately labels the data set with descriptive variable names.

# use features.txt as reference for labelling variables

names(fulldata)[3:length(fulldata)] <- as.vector(features[logic[3:563],2])

# ouput final tidy dataset (only mean&std) with proper desc and labels
write.csv(fulldata,file="tidy_dataset.csv",row.names=FALSE)

#########################################################
# Step 6: to answer question 5.
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load library reshape2 to use melt function
require(reshape2)

melted<-melt(fulldata,
             id=c("subject","activity"),
             measure.vars=as.vector(names(fulldata)[3:length(fulldata)]))

#         QA on above result (this should be a liner but tall table with a record for each id combinition & variable cols)
#         unique(melted$variable)
#         head(melted,n=10)
#         tail(melted,n=10)

# apply mean by subject & activity on tidy dataset above
tidydata_2<-dcast(melted,subject+activity ~ variable,mean)
        
#         QA on above result 
#         check<-colnames(tidydata_2)
#         length(check)
#         check[1:10]
#         rm("check")
#         head(tidydata_2)
#         print(tidydata_2)

# output onto a .csv file
write.csv(tidydata_2,file="tidy_dataset_2.csv",row.names=FALSE)

## End of this project
#########################################################
