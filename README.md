Files available in github directory /Get_and_Clean_Data:
========================================================

- README.md - An overview of the task, inputs, outputs, and procedure
- CodeBook.md - A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
- run_analysis.R - R script that shows the step-by-step process from untidy/original to tidy/final data

The task was to create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Differing sections  as coded in R are clearly articulated in the comments with BEGIN and END where each of the above actions occurs. Anything in brackets"[]" for these processing steps indicates the line number where the task occurs inside the run_analysis.R program.

Inputs:
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt
./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt

Outputs:
./one_data_set.txt
./tidy_data.txt

Procedure:
1. manually download files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save to working directory.

2. unzip files into working directory

3. view files within subdirectories in R using list.files() [run_analysis.R lines 25-56]

4. read necessary files into R and analyze/explore structure [run_analysis.R lines 58-118]

5. merge the training and the test sets to create one data set [run_analysis.R lines 58-118]
	Identify dimentions and combine test and train data sets using rbind function
	Identify dimentions and add subject and activity columns

6. extract only the measurements on the mean and standard deviation for each measurement [run_analysis.R lines 176-223]
	Identify dimentional relationships between features.txt and combined data
	Use grep to extract features relating to the mean and standard deviation
	Take into account the additional two columns added in combined data
	Subset features data by identified mean and standard deviation rows
	Subset combined data by identified mean and standard deviation columns

7. use descriptive activity names to name the activities in the data set [run_analysis.R lines 225-247]
	Identify structural relationships between activity_labels and the activity key in the combined data
	Use the factor function to assign the activity labels to the activity levles

8. appropriately label the data set with descriptive variable names [run_analysis.R lines 251-303]
	Use sub and gsub functions to replace "()" and "-" with an underscore in the feature names
	In some of the feature names replace "BodyBody" with a single "Body"
	Rename abbreviated formats of old variable names to extended formats for new ones
	Transfer edited feature names as appropriate column names in the combined data
	Output combined data as one_data_set.txt to the working directory
	File may be read back in using check.file<-read.table("./one_data_set.txt", header=TRUE)
	Note1: when reading back in the factor key changes, but the factor names are in the correct positions
	Note2: converting XXX-mean()-XYZ and XXX-std()-XYZ to XXX_mean_XYZ and XXX_std_XYZ respectively.  This was done because the "-" and "()" failed to carry back into R as column names using read.table for the final tidy dataset

9 create a second, independent tidy data set with the average of each variable for each activity and each subject.[run_analysis.R lines 305-338]
	Use the aggregate function to average each feature for each activity and each subject
	Output tidy aggregated data as tidy_data.txt to the working directory
	tidy_data.txt is in a "wide" tidy data form
	File may be read back in using check.file<-read.table("./tidy_data.txt", header=TRUE) 
	Note: when reading back in, the factor key changes, but the factor names are in the correct positions.


