This CodeBook is separated into two parts.  

The first part is the original data file that has to be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The first part is a direct copy/paste of the files README.txt and features_info.txt.  This will give an in depth look into the original messy data that this project starts with.  

The second part will be an explanation of the reduced tidy data and a description of the transformations and functions applied to the original datasets to have a final description of the combined and tidy datasets as the end resut. 

The two parts will be separated by the follwing so that it will be easy to scroll down and eyeball where the second data cleaning portion begins:
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################

Part 1 of the codebook
======================
This part of the codebook is the original data file information that has to be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Part 1 is a direct copy/paste of the files README.txt and features_info.txt, and will give an in depth look into the original messy data that this project starts with.

README.txt
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
======================================================================================
features.info.txt
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################

Part 2 of the codebook
======================
Part 2 is an explanation of the reduced tidy data and a description of the transformations and functions applied to the original datasets to have a final description of the combined and tidy datasets as the end resut.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The input dataset files include the following files
===========================================

- 'README.md'

- 'CodeBook.md'

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The output dataset files include the following files
===========================================

- 'one_data_set': tidy data aggregation of the input dataset files

- 'tidy_data.txt': means of features by subject and activity from one_data_set.txt


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time.Accelerometer_XYZ and Time.Gyroscope_XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time.Body.Accelerometer_XYZ and Time.Gravity.Accelerometer_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time.Body.Accelerometer.Jerk_XYZ and Time.Body.Gyroscope.Jerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.Body.Accelerometer.Magnitude, Time.Gravity.Accelerometer.Magnitude, Time.Body.Accelerometer.Jerk.Magnitude, Time.Body.Gyroscope.Magnitude, Time.Body.Gyroscope.Jerk.Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FastFourierTransform.Body.Accelerometer_XYZ, FastFourierTransform.Body.Accelerometer.Jerk_XYZ, FastFourierTransform.Body.Gyroscope_XYZ, FastFourierTransform.Body.Accelerometer.Jerk.Magnitude, FastFourierTransform.Body.Gyroscope.Magnitude, FastFourierTransform.Body.Gyroscope.Jerk.Magnitude. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Time.Body.Accelerometer_XYZ
Time.Gravity.Accelerometer_XYZ
Time.Body.Accelerometer.Jerk_XYZ
Time.Body.Gyroscope_XYZ
Time.Body.Gyroscope.Jerk_XYZ
Time.Body.Accelerometer.Magnitude
Time.Gravity.Accelerometer.Magnitude
Time.Body.Accelerometer.Jerk.Magnitude
Time.Body.Gyroscope.Magnitude
Time.Body.Gyroscope.Jerk.Magnitude
FastFourierTransform.Body.Accelerometer_XYZ
FastFourierTransform.Body.Accelerometer.Jerk_XYZ
FastFourierTransform.Body.Gyroscope_XYZ
FastFourierTransform.Body.Accelerometer.Magnitude
FastFourierTransform.Body.Accelerometer.Jerk.Magnitude
FastFourierTransform.Body.Gyroscope.Magnitude
FastFourierTransform.Body.Gyroscope.Jerk.Magnitude

The set of variables that were estimated from these signals are: 

_Mean: Mean value
_StandardDeviation: Standard deviation

Data Dictionary 
===============
Below are the classification variables and feature vector variables in the output datasets one_data_set.txt and tidy_data.  Note: tidy_data specifically are the means of each of the feature vector variables by subject and activity where one_data_set are the original tidied data without the application of the mean. 

subject
	Each row identifies the subject or volunteer within an age bracket of 19-48 years who performed
	the activity for each window sample. Its range is from 1 to 30.

activity
	Each row identifies the activity conducted.
		 WALKING
		 WALKING_UPSTAIRS
		 WALKING_DOWNSTAIRS
		 SITTING
		 STANDING
		 LAYING

Time.Body.Accelerometer_Mean_X
Time.Body.Accelerometer_Mean_Y
Time.Body.Accelerometer_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and 
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body linear acceleration signal from an accelerometer in the axial XYZ directions filtered with a
	low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Accelerometer_StandardDeviation_X
Time.Body.Accelerometer_StandardDeviation_Y
Time.Body.Accelerometer_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body linear acceleration signal from an accelerometer in the axial XYZ directions filtered with a 
	low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Gravity.Accelerometer_Mean_X
Time.Gravity.Accelerometer_Mean_Y
Time.Gravity.Accelerometer_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Gravity acceleration signal from an accelerometer in the axial XYZ directions filtered with a low 
	pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Gravity.Accelerometer_StandardDeviation_X
Time.Gravity.Accelerometer_StandardDeviation_Y
Time.Gravity.Accelerometer_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Gravity acceleration signal from an accelerometer in the axial XYZ directions filtered with a low 
	pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Accelerometer.Jerk_Mean_X
Time.Body.Accelerometer.Jerk_Mean_Y
Time.Body.Accelerometer.Jerk_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body linear acceleration Jerk signal from an accelerometer in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Accelerometer.Jerk_StandardDeviation_X
Time.Body.Accelerometer.Jerk_StandardDeviation_Y
Time.Body.Accelerometer.Jerk_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body linear acceleration Jerk signal from an accelerometer in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz.

Time.Body.Gyroscope_Mean_X
Time.Body.Gyroscope_Mean_Y
Time.Body.Gyroscope_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body angular velocity signal from a gyroscope in the axial XYZ directions filtered with a low pass 
	Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Gyroscope_StandardDeviation_X
Time.Body.Gyroscope_StandardDeviation_Y
Time.Body.Gyroscope_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body angular velocity signal from a gyroscope in the axial XYZ directions filtered with a low pass 
	Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Gyroscope.Jerk_Mean_X
Time.Body.Gyroscope.Jerk_Mean_Y
Time.Body.Gyroscope.Jerk_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body angular velocity Jerk signal from a gyroscope in the axial XYZ directions filtered with a low
	pass Butterworth filter with a corner frequency of 0.3 Hz. 

Time.Body.Gyroscope.Jerk_StandardDeviation_X
Time.Body.Gyroscope.Jerk_StandardDeviation_Y
Time.Body.Gyroscope.Jerk_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Body angular velocity Jerk signal from a gyroscope in the axial XYZ directions filtered with a low
	pass Butterworth filter with a corner frequency of 0.3 Hz. 



Time.Body.Accelerometer.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration signals from an accelerometer in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 

Time.Body.Accelerometer.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration signals from an accelerometer in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 



Time.Gravity.Accelerometer.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of gravity acceleration signals from an accelerometer in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the
	Euclidean norm. 

Time.Gravity.Accelerometer.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of gravity acceleration signals from an accelerometer in the axial XYZ directions
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using 
	the Euclidean norm. 



Time.Body.Accelerometer.Jerk.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration Jerk signals from an accelerometer in the axial XYZ 
	directions filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz 
	calculated using the Euclidean norm. 

Time.Body.Accelerometer.Jerk.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration Jerk signals from an accelerometer in the axial XYZ 
	directions filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz 
	calculated using the Euclidean norm.




Time.Body.Gyroscope.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity signals from a gyroscope in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 


Time.Body.Gyroscope.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity signals from a gyroscope in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 




Time.Body.Gyroscope.Jerk.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity Jerk signals from a gyroscope in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 

Time.Body.Gyroscope.Jerk.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	Time domain signal t captured at a constant rate of 50 Hz. then filtered using a median filter and
	a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity Jerk signals from a gyroscope in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 




FastFourierTransform.Body.Accelerometer_Mean_X
FastFourierTransform.Body.Accelerometer_Mean_Y
FastFourierTransform.Body.Accelerometer_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner
	frequency of 20 Hz to remove noise.
	Body linear acceleration signal from an accelerometer in the axial XYZ directions filtered with a
	low pass Butterworth filter with a corner frequency of 0.3 Hz. 


FastFourierTransform.Body.Accelerometer_StandardDeviation_X
FastFourierTransform.Body.Accelerometer_StandardDeviation_Y
FastFourierTransform.Body.Accelerometer_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Body linear acceleration signal from an accelerometer in the axial XYZ directions filtered with a
	low pass Butterworth filter with a corner frequency of 0.3 Hz. 


FastFourierTransform.Body.Accelerometer.Jerk_Mean_X
FastFourierTransform.Body.Accelerometer.Jerk_Mean_Y
FastFourierTransform.Body.Accelerometer.Jerk_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner
	frequency of 20 Hz to remove noise.
	Body linear acceleration Jerk signal from an accelerometer in the axial XYZ directions filtered
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz. 


FastFourierTransform.Body.Accelerometer.Jerk_StandardDeviation_X
FastFourierTransform.Body.Accelerometer.Jerk_StandardDeviation_Y
FastFourierTransform.Body.Accelerometer.Jerk_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Body linear acceleration Jerk signal from an accelerometer in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz. 


FastFourierTransform.Body.Gyroscope_Mean_X
FastFourierTransform.Body.Gyroscope_Mean_Y
FastFourierTransform.Body.Gyroscope_Mean_Z
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Body angular velocity signal from a gyroscope in the axial XYZ directions filtered with a low pass
	Butterworth filter with a corner frequency of 0.3 Hz. 



FastFourierTransform.Body.Gyroscope_StandardDeviation_X
FastFourierTransform.Body.Gyroscope_StandardDeviation_Y
FastFourierTransform.Body.Gyroscope_StandardDeviation_Z
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Body angular velocity signal from a gyroscope in the axial XYZ directions filtered with a low pass
	Butterworth filter with a corner frequency of 0.3 Hz. 

FastFourierTransform.Body.Accelerometer.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration signals from an accelerometer in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 



FastFourierTransform.Body.Accelerometer.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner
	frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration signals from an accelerometer in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 


FastFourierTransform.Body.Accelerometer.Jerk.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration Jerk signals from an accelerometer in the axial XYZ 
	directions filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz 
	calculated using the Euclidean norm. 


FastFourierTransform.Body.Accelerometer.Jerk.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body linear acceleration Jerk signals from an accelerometer in the axial XYZ 
	directions filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz 
	calculated using the Euclidean norm. 


FastFourierTransform.Body.Gyroscope.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity signals from a gyroscope in the axial XYZ directions filtered
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 



FastFourierTransform.Body.Gyroscope.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity signals from a gyroscope in the axial XYZ directions filtered 
	with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 



FastFourierTransform.Body.Gyroscope.Jerk.Magnitude_Mean
	The mean of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity Jerk signals from a gyroscope in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm. 



FastFourierTransform.Body.Gyroscope.Jerk.Magnitude_StandardDeviation
	The standard deviation of a 128 element vector normalized and bounded within [-1,1].
	A Fast Fourier Transform was applied to the time domain signal captured at a constant rate of 50
	Hz. then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise.
	Magnitude of body angular velocity Jerk signals from a gyroscope in the axial XYZ directions 
	filtered with a low pass Butterworth filter with a corner frequency of 0.3 Hz calculated using the 
	Euclidean norm.
