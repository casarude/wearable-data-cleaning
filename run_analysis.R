setwd("C:/Users/SAMY/Documents/Coursera/Data Science Specialization/Getting and cleaning data/Project")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, destfile = "C:/Users/SAMY/Documents/Coursera/Data Science Specialization/Getting and cleaning data/Project/UCIHARDataset.zip", mode="wb")

#Accesing data into the extracted directory "UCI HAR Dataset" 

filepath = "UCI HAR Dataset\\train\\X_train.txt"
Xtrain <- read.table(filepath, header=FALSE)
filepath = "UCI HAR Dataset\\test\\X_test.txt"
Xtest <- read.table(filepath, header=FALSE)

#Q1: Merging the Xtrain and Ytest sets into one dataset

mergeDataSet <- rbind(Xtrain,Xtest)

#Q2: Extracts only the measurements on the mean and standard deviation for each measurement. 

filepath = "UCI HAR Dataset\\features.txt"
features <- read.table(filepath, header=FALSE, stringsAsFactors = FALSE)
meanStdFeatures <- features[grep("mean|std", features[,2]),]
meanStdDataSet <- mergeDataSet[,meanStdFeatures[,1]]

# Q3: Uses descriptive activity names to name the activities in the data set

filepath = "UCI HAR Dataset\\train\\Subject_train.txt"
subTrainSet <- read.table(filepath, header=FALSE)
filepath = "UCI HAR Dataset\\test\\Subject_test.txt"
subTestSet <- read.table(filepath, header=FALSE)
subDataSet <- rbind(subTrainSet,subTestSet)

filepath = "UCI HAR Dataset\\train\\y_train.txt"
activityTrainSet <- read.table(filepath, header=FALSE)
filepath = "UCI HAR Dataset\\test\\y_test.txt"
activityTestSet <- read.table(filepath, header=FALSE)
activityDataSet <- rbind(activityTrainSet,activityTestSet)

meanStdDataSet <- cbind(meanStdDataSet, activityDataSet)
meanStdDataSet <- cbind(meanStdDataSet, subDataSet)
names(meanStdDataSet) <- c(meanStdFeatures[,2], "Activity", "Subject")

library(plyr)

activityId <- meanStdDataSet[,"Activity"]
activityFactors <- as.factor(activityId)
activityFactors = revalue(activityFactors, c("1"="WALKING", "2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING"))
meanStdDataSet[,"Activity"] = activityFactors


# Q4: Appropriately labels the data set with descriptive activity names.

names(meanStdDataSet) <- c(meanStdFeatures[,2], "Activity", "Subject")

# Q5: Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 

library(data.table)
tidyDataSet <- data.table(meanStdDataSet)
avgTidyDataSet <- tidyDataSet[, lapply(.SD,mean), by=c("Activity","Subject")]
TidyColNames = sapply(names(avgTidyDataSet)[-(1:2)], function(name) paste("mean(", name, ")", sep=""))
setnames(avgTidyDataSet, names(avgTidyDataSet), c("Activity", "Subject", TidyColNames))
write.csv(avgTidyDataSet, file="finalTidyDataSet.txt", row.names = FALSE)
