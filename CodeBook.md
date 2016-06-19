**Experimintal Design** 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

**Coding variables**

Some of the variables in my code are as follows :
* __Test_set__ : Data Frame consisting of the testing data _(Range: [-1,1])_
*  __Test_labels__ : Data Frame consisting of activity labels of testing data _(Range: 1 to 6)_
*  __Train_set__ : Data Frame consisting of the training data _(Range: [-1,1])_
*  __Train_labels__ : Data Frame consisting of activity labels of training data _(Range: 1 to 6)_
*  __activity__ : Data Frame consisting of activity number along with its activity label as follows:
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING
* __Features__ : Data Frame consisting of column number of training or testing data along with its feature value.
*   __Sub_test__ : Data Frame with values of subject number of that testing data _(Range: 1 to 30)_
*  __Sub_train__ :  Data Frame with values of subject number of that testing data _(Range: 1 to 30)_
* __Train_data__ : Merged training data of training set and training label
* __Test_data__ : Merged testing data of testing set and testing label
* __Whole_data__ : Merged Train_data and Test_data
* __Matched_data__ : Merged data with specific variables of mean or standard deviation
* __split_activity__ : List of data set split on the basis of activity
* __split_subject__ : List of data set split on the basis of subject
* __Average_frame__ : Data Frame consisting the mean of variables for each activity and each subject

