## You will be required to submit: 
## 1) a tidy data set as described below, 
## 2) a link to a Github repository with your script for performing the analysis, and 
## 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
## You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
## Here are the data for the project: 
##   
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 
## You should create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Set initial working directory
getwd()
setwd("./Get_n_Clean_Data/course_project")
getwd()

date()
## data was downloaded from website on [1] "Wed Aug 19 14:06:24 2015"

######################################################################################################
######################################################################################################
## BEGIN take a peek at the Working directory to ensure that files are present and unzipped. 
######################################################################################################
######################################################################################################
list.files()
list.files("./getdata_projectfiles_UCI HAR Dataset")
## [1] "UCI HAR Dataset"
list.files("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
## [1] "activity_labels.txt" "features.txt"        "features_info.txt"  
## [4] "README.txt"          "test"                "train"              

## alter working directory for ease of use. 
setwd("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
getwd()
list.files()

list.files("./test")
## [1] "Inertial Signals" "subject_test.txt" "X_test.txt"      
## [4] "y_test.txt"      
list.files("./train")
## [1] "Inertial Signals"  "subject_train.txt" "X_train.txt"      
## [4] "y_train.txt"      

## We know from the TA notes that Inertial Signals files are not necessary
# list.files("./test/Inertial Signals") 
# list.files("./train/Inertial Signals")
######################################################################################################
######################################################################################################
## END take a peek at the Working directory to ensure that files are present and unzipped. 
######################################################################################################
######################################################################################################

######################################################################################################
######################################################################################################
## BEGIN Identify what we will need to use without reading in unnecessary information
######################################################################################################
######################################################################################################

# - 'train/X_train.txt': Training set.
train.x<-read.table("./train/X_train.txt") 
dim(train.x)
head(train.x,1)

# - 'train/y_train.txt': Training labels.
train.y<-read.table("./train/y_train.txt") 
dim(train.y)
head(train.y)
table(train.y$V1)  ## So y is effectively the factors for the activities. 

# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
train.subject <- read.table("./train/subject_train.txt")
dim(train.subject)
head(train.subject)
table(train.subject$V1)        ## so we know that subject number is a subset of 1:30 in the train dataset.
dim(table(train.subject$V1))   ## there is [1]  21 subjects in the test dataset

# - 'test/X_test.txt': Test set.
test.x<-read.table("./test/X_test.txt") 
dim(test.x)
head(test.x,1)

# - 'test/y_test.txt': Test labels.
test.y<-read.table("./test/y_test.txt") 
dim(test.y)
head(test.y)
table(test.y$V1)  ## So y is effectively the factors for the activities. 

# - 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
test.subject <- read.table("./test/subject_test.txt")
dim(test.subject)
head(test.subject)
table(test.subject$V1)        ## so we know that subject number is a subset of 2:24 in the test dataset.
dim(table(test.subject$V1))   ## there is [1]  9 subjects in the test dataset

# - 'activity_labels.txt': Links the class labels with their activity name.
## we need strings as factors equal False here because in a merge it will try and merge based on the alphbetical factor number not the one we want. 
activity_labels <- read.table("./activity_labels.txt", stringsAsFactors=FALSE)
dim(activity_labels)
str(activity_labels)
activity_labels

# - 'features.txt': List of all features.
## we need strings as factors equal False here because in a merge it will try and merge based on the alphbetical factor number not the one we want. 
features <- read.table("./features.txt", stringsAsFactors=FALSE)
dim(features)
str(features)
head(features)

######################################################################################################
######################################################################################################
## END Identify what we will need to use without reading in unnecessary information
######################################################################################################
######################################################################################################

######################################################################################################
######################################################################################################
## BEGIN 1.Merges the training and the test sets to create one data set.
######################################################################################################
######################################################################################################
## check dimentions of train.x and test.x and ensure dimention of resulting rbind works properly.
dim(train.x)
dim(test.x)
dim(train.x)[1]+dim(test.x)[1]

## ready to merge train and test sets. 
comb.train.test <- rbind(train.x, test.x)
names(comb.train.test) ## names match what I expect
dim(comb.train.test)   ## number of rows and columns match what I expect

## Handle the test activity lables
dim(train.y)
dim(test.y)
dim(train.y)[1]+dim(test.y)[1]

## ready to merge train and test activity label sets. 
comb.train.test.y <- rbind(train.y, test.y)
names(comb.train.test.y) <- "activity" ## names match what I expect
dim(comb.train.test.y)   ## number of rows and columns match what I expect

## Handle the subject labels
dim(train.subject)
dim(test.subject)
dim(train.subject)[1]+dim(test.subject)[1]

## ready to merge train and test subject label sets. 
comb.train.test.subject <- rbind(train.subject, test.subject)
names(comb.train.test.subject) <- "subject" ## names match what I expect
dim(comb.train.test.subject)   ## number of rows and columns match what I expect

## combine subjects, activity levels and train/test sets
dim(comb.train.test)  ## expect final result to have 68 columns and 10299 rows
comb.train.test <- cbind(comb.train.test.subject, comb.train.test.y, comb.train.test)
names(comb.train.test) ## names match what I expect
dim(comb.train.test)   ## number of rows and columns match what I expect

## drop unnecessary information from memory
train.x <- NULL; rm(train.x)
test.x <- NULL; rm(test.x)
train.y <- NULL; rm(train.y)
test.y <- NULL; rm(test.y)
train.subject <- NULL; rm(train.subject)
test.subject <- NULL; rm(test.subject)
comb.train.test.subject <- NULL; rm(comb.train.test.subject)
comb.train.test.y <- NULL; rm(comb.train.test.y)
######################################################################################################
######################################################################################################
## END 1.Merges the training and the test sets to create one data set.
######################################################################################################
######################################################################################################

######################################################################################################
######################################################################################################
## BEGIN 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
######################################################################################################
######################################################################################################

## TRUE here tells us that the dimentions of our features variable can be used as the names for the comb.train.test dataset. 
## the minus 2 accounts for adding the columns of subject and activity
dim(features)[1]==(dim(comb.train.test)[2]-2)
length(features[,2])==length(names(comb.train.test))-2

## grep gives me a vector of the patterns with the word mean I'm skipping the capital version of Mean because it has no association with 
## the mean and std that we are interested in. The fixed=True option removes situations where I have meanFreq() in the features name.
                        # grep("mean()", features[,2], fixed=TRUE)
                        # grep("std()", features[,2], fixed=TRUE)

##varname.sub is the subset of row name values from features that we are interested in. 
## the sort function organizes them back to their origingal order clustering like features together
varname.sub <- sort(c(grep("mean()", features[,2], fixed=TRUE), grep("std()", features[,2], fixed=TRUE)))
length(varname.sub)


## We have now identified the rows of interest for the features dataset, now we are going to apply those rows to select the columns
## of comb.train.test and reduce the columns from 563 to 68. Likewise, we are going to apply those rows to select the rows of features
## and reduce the row count of features from 561 to 66. the difference between 563 and 561 is because we added columns for subject and
## activity.

dim(features)
features <- features[varname.sub,]
dim(features)

##Need to account for having added subject and activity
dim(comb.train.test)
comb.train.test <- comb.train.test[,c(1,2,(varname.sub+2))]
dim(comb.train.test)


## I ensure things line up by comparing the row names of features with the column names of comb.train.test
cbind(c(NA, NA, features[,1]),c(NA, NA, row.names(features)), names(comb.train.test), c(NA, NA, features[,2]))

## drop unnecessary information from memory
varname.sub <- NULL; rm(varname.sub)

######################################################################################################
######################################################################################################
## END 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
######################################################################################################
######################################################################################################

######################################################################################################
######################################################################################################
## BEGIN 3.Uses descriptive activity names to name the activities in the data set
######################################################################################################
######################################################################################################

str(comb.train.test[,2])
activity_labels
tail(head(comb.train.test[,2], 83),35) ## want to grab a small subset to see how this works. 
comb.train.test[,2] <- factor(comb.train.test[,2],
                                   levels = activity_labels[,1],
                                   labels = activity_labels[,2]) 
str(comb.train.test[,2])
tail(head(comb.train.test[,2], 83),35) ## everything worked appropriately

## drop unnecessary information from memory
activity_labels <- NULL; rm(activity_labels)

######################################################################################################
######################################################################################################
## END 3.Uses descriptive activity names to name the activities in the data set
######################################################################################################
######################################################################################################



######################################################################################################
######################################################################################################
## BEGIN 4.Appropriately labels the data set with descriptive variable names. 
######################################################################################################
######################################################################################################
## Using the guidance from the follwing thread
## https://class.coursera.org/getdata-031/forum/thread?thread_id=28
## I have opted not to parse out the t and f from the feature names.  Likewise I have opted not to parse
## out Body/Gravity as well.  But for future reference the Hadley Wickham video provides a good example
## of how to do this.  https://vimeo.com/33727555 

## This grabs the correct names (XXX-mean() and XXX-str()) from the dataset features.  
## We also want to perform some cleanup on the desired feature names. 
## by converting (XXX-mean()-XYZ and XXX-std()-XYZ) to (XXX_mean_XYZ and XXX_std_XYZ)
          # features[,2]
          # sub("()","",features[,2], fixed=TRUE)
features[,3] <- sub("BodyBody", "Body", gsub("-","_",sub("()","",features[,2], fixed=TRUE), fixed=TRUE), fixed=TRUE)
features[,4] <- sub("f","FastFourierTransform.", sub("t","Time.",features[,3], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("_sTime.d_","_std_", sub("_sTime.d","_std", features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("Gravity","Gravity.", sub("Body","Body.",features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("Acc","Accelerometer.", sub("Gyro","Gyroscope.",features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("Jerk","Jerk.", sub("Mag","Magnitude.",features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("_std_","_StandardDeviation_", sub("_mean_","_Mean_",features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("_std","_StandardDeviation", sub("_mean","_Mean",features[,4], fixed=TRUE), fixed=TRUE)
features[,4] <- sub("._","_",features[,4], fixed=TRUE)
names(comb.train.test)
names(comb.train.test) <- c("subject", "activity", features[,4])
names(comb.train.test)

head(comb.train.test, 1)

## back up to primary working directory
getwd()
setwd("../../")
getwd()

## output file to working directory
write.table(comb.train.test, file = "one_data_set.txt", row.name=FALSE) 

## read back in to check column names and structure
#check.file<-read.table("./one_data_set.txt", header=TRUE) 
#dim(check.file)
#str(check.file)
#head(check.file, 12)
#check.file$activity  ## it changes the order of the factors, but the factor names stay in the correct positions

## drop unnecessary information from memory
features <- NULL; rm(features)
######################################################################################################
######################################################################################################
## END 4.Appropriately labels the data set with descriptive variable names. 
######################################################################################################
######################################################################################################

######################################################################################################
######################################################################################################
## BEGIN 5.From the data set in step 4, creates a second, independent tidy data set 
##         with the average of each variable for each activity and each subject.
######################################################################################################
######################################################################################################

## resource for aggregate function
## R In Action Data analysis and graphics with R, Second Edition, by Robert I. Kabacoff 
## page 142 section 7.1.3
dim(table(comb.train.test[,1:2]))[1]*dim(table(comb.train.test[,1:2]))[2]
## [1] 180   ## we expect our tidy dataset to have 180 rows.

myvars <- names(comb.train.test)[-c(1,2)]
tidy<-aggregate(comb.train.test[myvars], by=list(activity=comb.train.test$activity, subject=comb.train.test$subject), mean)
dim(tidy)  ## it has 180 rows!!  [1] 180  68
head(tidy)
write.table(tidy, file = "tidy_data.txt", row.name=FALSE) 
#check.file<-read.table("./tidy_data.txt", header=TRUE) 
#dim(check.file)
#head(check.file, 12)
#cbind(tidy$activity,check.file$activity)  ## it changes the order of the factors, but the factor names stay in the correct positions
#head(tidy$activity,25)
#head(check.file$activity,25)
## drop unnecessary information from memory

myvars <- NULL; rm(myvars)

######################################################################################################
######################################################################################################
## END 5.From the data set in step 4, creates a second, independent tidy data set 
##       with the average of each variable for each activity and each subject.
######################################################################################################
######################################################################################################
