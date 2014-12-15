getdata-016
===========

Getting and Cleaning Data Course Project

The code assumes that the following files are present in the working directory:
  1. activity_labels.txt
  2. features.txt
  3. X_train.txt
  4. X_test.txt
  5. Y_test.txt
  6. Y_train.txt
  7. subject_train.txt
  8. subject_test.tx

The first part of the code extracts the activity labels as well as the features labels and storing the data for the test and training sets.

The labels which are numeric are then convereted into the appropriate activity labels.

Once that is complete the subject files for the test and the training sets are extracted and binded to the appropraite data sets. Once that is complete all of the data is binded together. The appropriate column names are applied.

The next step is to determine all of the columns that contain the word mean() or std(). This is accomplished with the function grepl. Once the columns are determined the data set is subsetted to the appropriate columns and stored into a new data set called clean.

Finally the data is summarized by using the function aggregate with all columns from 3 to 68 categorized by the first two columns which are the activity and subject columns. 

Once this is all complete a write.table function is called for the output text file.
