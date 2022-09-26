
## ReadMe : Code for getting and cleaning data


### Background & contents

The goal is to prepare tidy data that can be used for later analysis. 

Contents of this repository are as follows :

1. A tidy data set as described below ( Output of following script )
2. Script for performing the analysis : _run_analysis.R_
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.


#### R Script (run_analysis.R) does the following things

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

***

#### Dataset to be transformed 

**Human Activity Recognition Using Smartphones Dataset _Version 1.0_**

***

-  The experiments have been carried out with a group of __30 volunteers__ within an age bracket of 19-48 years. 
-  Each person performed __six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)__ wearing a smartphone (Samsung Galaxy S II) on the waist. 

- Using its embedded accelerometer and gyroscope, they have captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

- The obtained dataset has been __randomly partitioned into two sets__, where __70% of the volunteers__ was selected for generating the __training data__ and __30% the test data__.

***
#### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

_The following files are available for the train and test data. Their descriptions are equivalent. _

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

***

**Notes:**

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

**License:**

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

***
