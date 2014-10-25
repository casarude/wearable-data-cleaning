wearable-data-cleaning
======================

The goal of this scrip is to extract, clean and finally provide a tidy dataset that can be easily analyzed.

The raw data provided from the source is messy: measurement data, categories and variable names are in diferent files. The idea is to combine all these datasets into one(s) that can make sense of this data.

The following steps explain how my scrip works:

1. Download the zip file from the source to my working directory

2. Access the Xtrain and Xtest files from the extracted directory "UCI HAR Dataset"

3. Merge these two files into one dataset using the cbind command. The result is one dataset containing all the observations (rows) from both files but the same number of columns

4. Read the file "features" that contain "mean" and "standart deviation" and use it to extract all the mean and std values from the merged dataset obtained in the previous step.

5. Include the activity names from the "activity-train" dataset and "activity-test" dataset into the merged dataset so that each column can be easily identifiable. Here, each activity column is converted into a factor; then each activity factor is renamed with its descriptive activity names.

6. Link the class labels with their activity names and the subject who performed the activity for each window sample.

7. In the last part of the script, I created a new dataset called "finalTidyDataSet.txt", which contains the average of each variable for each activity and each subject. 


 





