
 run_analysis <- function()
 {
   library("dplyr")
   
   ## Load all text files into respective data frames 
   
   Test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
   
   Test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
   
   Train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
   
   Train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
   
   activity <- read.table("UCI HAR Dataset/activity_labels.txt")
   
   features <- read.table("UCI HAR Dataset/features.txt")
   
   Sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
   
   Sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
   
   ## Renaming variable names
   
   Train_labels <- rename(Train_labels , Activity=V1)
   
   Test_labels <- rename(Test_labels , Activity=V1)
   
   Train_set <- setNames(Train_set,features$V2)
   
   Test_set <- setNames(Test_set,features$V2)
   
   Sub_test <- rename(Sub_test,Subject=V1)
   
   Sub_train <- rename(Sub_train,Subject=V1)
   
   ## Merging Set data with their respective Labels
   
   Train_data <- cbind(Train_labels,Train_set,Sub_train)
   
   Test_data <- cbind(Test_labels,Test_set,Sub_test)
   
   ## Merging Train and Test Data
   
   Whole_data <- rbind(Train_data,Test_data)
   
   ## Removing unique values if any
   
   Whole_data <- unique(Whole_data)
   
   ## Replacing Activity number with Activity labels of combined data
   
   no_activities <- nrow(activity)
   
   for (i in 1:no_activities)
   {
     Whole_data[,"Activity"] <- gsub(i,activity$V2[i],Whole_data$Activity)
   }
   
   ## Subsetting combined data into only mean and standard deviation variable for each measurement
     ## Also the task 2 of the assignment
   
   reg_expr <- "mean+[//(+//)]|std+[//(+//)]"
   
   col_names <- names(Whole_data)
   
   matched_col <- grep(reg_expr,col_names,value = TRUE)
   
   Matched_data <- Whole_data[,matched_col]
   
   ## Performing average of each Matched_data variable for each activity and subject
   
   no_variables <- ncol(Matched_data)
   
   subject_vector <- unique(Whole_data$Subject)
   
   sort_subjects <- sort(subject_vector)
   
   no_subjects <- length(subject_vector)
   
   Matched_data <- cbind(Matched_data,Whole_data$Activity,Whole_data$Subject) 
   
   split_activity <- split(Matched_data,Matched_data$`Whole_data$Activity`)
   
   split_subject <- split(Matched_data,Matched_data$`Whole_data$Subject`)
   
   Average_frame <- data.frame()
   
   n_row <- 1
   
   act_names <- as.character()
   
   for( i in 1:length(split_activity))
   {
     dummy_frame <- as.data.frame(split_activity[i])
     
     mean_values <- sapply(dummy_frame, mean)
     
     vars <- length(mean_values) - 2
     
     act_names[i] <- paste("Activity",i)
     
     Average_frame[i,1] <- act_names[i]
     
      for( j in 1:vars)
      {
        Average_frame[n_row,j+1] <- mean_values[[j]]
      }
     
     n_row <- n_row + 1
   }
   
   sub_names <- as.character()
   
   c <- 7
   
   for(i in 1: length(split_subject))
   {
     dummy_frame <- as.data.frame(split_subject[i])
     
     mean_values <- sapply(dummy_frame, mean)
     
     vars <- length(mean_values) - 2
     
     sub_names[i] <- paste("Subject",i)
       
     Average_frame[c,1] <- sub_names[i]
     
     for( j in 1:vars)
     {
       Average_frame[n_row,j+1] <- mean_values[[j]]
     }
     
     c <- c+1
     
     n_row <- n_row + 1
   }
   
   row_names <- union(act_names,sub_names)
   
   Average_frame <- `colnames<-`(Average_frame,c("Activity/Subject",matched_col))
   
   Average_frame <- `rownames<-`(Average_frame,row_names)
   
   ## Returning the tidy data set
   
   return(Average_frame)
   
 }
 
