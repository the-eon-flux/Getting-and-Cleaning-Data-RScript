## Codebook for run_analysis.R

### Variables 
    1. 'X_Test, Y_Test, X_Train, Y_Train, FeatureLables, Subject_Test, Subject_Train & ActivityLabels' are all variables into which the input files are read into. With '_Test' indicating Test data files & so on.
    2. 'ActivityCol, Final_Test_df, Final_Train_df & MergedDf' are variables with above merged data variables.
    3. 'First_Tidy_Data & Sec_Tidy_Dataset' are major outputs of this code
    

### Key Data Tranformation Steps

1. Merges the training and the test datasets to create one data set.
    * In this section of the code the variable name assigned is according to the
        file it was read from. Since we're new to the data I figured. 
    * Variable names with _'_Test'_ as suffix are for the __Test Data__ and similarly
        variables with suffix _'_Train'_ are for the __Training Data__
    * Looking at the dimensions & reading the READ.txt in the data folder, the 
        files which need to be merged was deduced.
    * Hence, 2 main merges happened :
        + Merging the Y_test.txt with activity_labels.txt files.
             __[Variable Y_test merged with ActivityLabels dataframe]__
        
        + Merging the features.txt as colnames to X_test/train.txt
            __[ Variable featureLabels used as column names for X_test ]__
    * Finally a dataframe was created with all the test files. __'Final_Test_Df'__. This df has __'Activity names, Subject_IDs & Proper Column Names added to the data'__.

    * Similarly __'Final_Train_Df'__ was created. 
    * Both of these were merged to get out first tidy data __'MergedDf'__

2. Extracting only the measurements on the mean and standard deviation for each measurement.
    * Input was __'First_Tidy_Data'__ variable, from which columns with mean & 
        standard dev variables were subsetted.

    * The new variable was called __'First_Tidy_Data'__.

3. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
    * The final dataset __'Sec_Tidy_Dataset'__ was created by row binding
        2 data frames. ( Dataframes of mean against Subject_IDs & mean against Activity)
    * The final variable was written into a file __'final_Tidy_Data.txt'__ in results folder.    

            
            
            