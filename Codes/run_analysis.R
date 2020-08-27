'
Script to create a tidy set. 
'
### 1.) Merges the training and the test sets to create one data set.

    ## Setting up the directory paths
    Data_Directory <- "./UCI HAR Dataset/" 
        # Copy the path of your downloaded data here

    TestData_Dir <- paste(Data_Directory, "test/", sep = "")
    TrainData_Dir <- paste(Data_Directory, "train/", sep = "")
    
    ## Reading the common input files between test and training data

        ActivityLabels <- read.table(paste(Data_Directory,"activity_labels.txt", sep= ""))
        # Dim 6*2 # Assigns a number to each of the 6 activities
        
        FeatureLabels <- read.table(paste(Data_Directory, "features.txt", sep = ""))
        # Dim 561*2

'---------------------------------------TEST DATASET-------------------------------------------'
    ## Reading the TEST input files

        X_Test <- read.table(paste(TestData_Dir, "X_test.txt", sep = ""))
        # Dim 2947*561
        
        Y_Test <- read.table(paste(TestData_Dir, "y_test.txt", sep=""))
        # Dim 2947*1 # Min = 1; Max = 6

        Subject_Test <- read.table( paste(TestData_Dir, "subject_test.txt", sep=""))
        # Dim 2947*1 # Min = 2; Max = 24

    ## Merging the appropriate dataframes
        
        #Merging Activity labels with Y_Test to create a vector
        Activity_Col <- merge(Y_Test, ActivityLabels, by.x = "V1", by.y = "V1", all = TRUE )
        
    ## Adding feature labels to X_Test from FeatureLabels dataframe
        colnames(X_Test) <- FeatureLabels$V2

    ## Making the final output df for TEST data
        Final_Test_Df <- data.frame(X_Test, "Activity" = Activity_Col$V2, "Subject_ID" = Subject_Test$V1, "Data_Origin" = rep("TEST", 2947))
        

'---------------------------------------TRAINING DATASET-------------------------------------------'
    ## Reading the Training input files

        X_Train <- read.table(paste(TrainData_Dir, "X_train.txt", sep = ""))
        # Dim 7352*561
        
        Y_Train <- read.table(paste(TrainData_Dir, "y_train.txt", sep=""))
        # Dim 7352*1 # Min = 1; Max = 6

        Subject_Train <- read.table( paste(TrainData_Dir, "subject_train.txt", sep=""))
        # Dim 7352*1 # Min = 2; Max = 24

    ## Merging the appropriate dataframes
        
        #Merging Activity labels with Y_Train to create a Activity vector
        Activity_Col <- merge(Y_Train, ActivityLabels, by.x = "V1", by.y = "V1", all = TRUE )
        
    ## Adding feature labels to X_Train from FeatureLabels dataframe
        colnames(X_Train) <- FeatureLabels$V2

    ## Making the final output df for Train data
        Final_Train_Df <- data.frame(X_Train, "Activity" = Activity_Col$V2, "Subject_ID" = Subject_Train$V1, "Data_Origin" = rep("TRAIN", 7352))
        
'---------------------------------------Merging the 2 DATASETS-------------------------------------------'
        
        MergedDf = rbind(Final_Train_Df, Final_Test_Df)
        # Dim 10299*564 (Original 561 cols + 3 addons)
        

### 2.) Extracts only the measurements on the mean and standard deviation for each measurement.
        
        Mean_Cols <- grep("mean",FeatureLabels$V2)
        Std_Cols <- grep("std", FeatureLabels$V2)
        Valid_Col_Indices <- sort(c(Mean_Cols, Std_Cols, c(562,563,564)))
        
        First_Tidy_Data <- MergedDf[,Valid_Col_Indices]
        # Dim 10299*82 (79 +  3 addon cols)
        
        
### 3.) Uses descriptive activity names to name the activities in the data set

        # Done directly after reading the files above in the section named as below 
            # Merging Activity labels with Y_Train to create a Activity vector

### 4.) Appropriately labels the data set with descriptive variable names.

        # Also done while creating the respective dataframes.
            # Making the final output df

'---------------------------------------Merging the 2 DATASETS-------------------------------------------'

### 5.) From the data set in step 4, creates a second, independent tidy data set with 
#       the average of each variable for each activity and each subject.
        
        library(dplyr)

        # Converting into a tibble data frame for convenience
        Tbl_First_Tidy_Data <- tbl_df(First_Tidy_Data)
        Tbl_First_Tidy_Data <- group_by(Tbl_First_Tidy_Data,Subject_ID)
        
        Mean_Subject_ID <-aggregate(Tbl_First_Tidy_Data[,1:79], list(Tbl_First_Tidy_Data$Subject_ID), mean)
        # Dim 30*80
        Mean_Activity <- aggregate(Tbl_First_Tidy_Data[,1:79], list(Tbl_First_Tidy_Data$Activity), mean)
        # Dim 6*80
        
        colnames(Mean_Activity)[1] <- "Group"
        colnames(Mean_Subject_ID)[1] <- "Group"
        
        Sec_Tidy_Dataset <- rbind(Mean_Subject_ID, Mean_Activity)
        # Dim 36*80
        
        # Writing the final tidy dataset
        write.table(Sec_Tidy_Dataset, "./Results/final_Tidy_Data.txt", sep = "\t", row.names = F)
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        