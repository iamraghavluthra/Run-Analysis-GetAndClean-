This project contains a single R script which gathers test data from my current working directory. The dataset was downloaded from [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) .
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities _**(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)**_ wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
So, what the code does :
1.	Reads all the relevant text files into data frames in R
2.	Changing the variable names i.e the column names into the features list for training as well as test data. Example, time dependant body acceleration along X axis signal subtracted by the mean value. A total of 561 features are available.
3.	Merging training set with its activity label and testing set with its activity label
4.	Changing the coded activity number into activity number (WALKING, STANDING etc.)
5.	Merging the two data frames of testing and training into one data frame.
6.	Extracting only a few features of the whole set which contain either mean function or standard deviation function.
7.	Finding average value of each variable for each activity and each subject 
