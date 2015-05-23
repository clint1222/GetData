library(dplyr)

## Read in the features and label data
features <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")

## The features data frame contains the feature name and column number.  We're
## only interested in the measurements of the mean and standard deviation for each 
## measurement.  grep for features containing "mean()" and "std()"
subfeatures <- subset(features, grepl("mean()", V2, fixed=TRUE)==TRUE | grepl("std()", V2, fixed=TRUE)==TRUE)

## Read in the subject and activity test data
subjectsTest <- as.data.frame(scan("./test/subject_test.txt", what=integer()), row.names=NULL)
activitiesTest <- as.data.frame(scan("./test/y_test.txt", what=integer()), row.names=NULL)

colnames(subjectsTest) <- "subject"
colnames(activitiesTest) <- "activity"

## Read in the subject and activity train data
subjectsTrain <- as.data.frame(scan("./train/subject_train.txt", what=integer()), row.names=NULL)
activitiesTrain <- as.data.frame(scan("./train/y_train.txt", what=integer()), row.names=NULL)

colnames(subjectsTrain) <- "subject"
colnames(activitiesTrain) <- "activity"

## The number of rows in features data.frame will be the number of columns in
## the measurement dataset, while the number of rows in the test and train 
## subject data.frames will be the number of rows in the measurement dataset.
numFeatures <- nrow(features)
numSubjectsTest <- nrow(subjectsTest)
numSubjectsTrain <- nrow(subjectsTrain)
xTest <- as.data.frame(matrix(scan("./test/X_test.txt", n = numSubjectsTest*numFeatures), numSubjectsTest, numFeatures, byrow=TRUE))
xTrain <- as.data.frame(matrix(scan("./train/X_train.txt", n = numSubjectsTrain*numFeatures), numSubjectsTrain, numFeatures, byrow=TRUE))

colnums <- as.vector(subfeatures$V1)

xTestsub <- subset(xTest, select=colnums)
xTrainsub <- subset(xTrain, select=colnums)
colnames(xTestsub) <- as.vector(subfeatures$V2)
colnames(xTrainsub) <- as.vector(subfeatures$V2)

allTestdata <- cbind(subjectsTest, activitiesTest, xTestsub)
allTraindata <- cbind(subjectsTrain, activitiesTrain, xTrainsub)

allData <- rbind(allTestdata, allTraindata)

alldatasummary <- group_by(allData, subject, activity) %>% summarise_each(funs(mean))

for (i in 1:nrow(activityLabels)){
  activityId <- activityLabels[i,1]
  activityName <- activityLabels[i,2]
  alldatasummary[,2] <- as.data.frame(lapply(alldatasummary[,2], function(x) gsub(activityId, activityName, x)))
}

print("Summary data is stored in alldatasummary")

## Clean up unneeded objects
rm(activitiesTest)
rm(activitiesTrain)
rm(allTestdata)
rm(allTraindata)
rm(subjectsTest)
rm(subjectsTrain)
rm(xTest)
rm(xTestsub)
rm(xTrain)
rm(xTrainsub)
rm(i)
rm(numFeatures)
rm(numSubjectsTest)
rm(numSubjectsTrain)
rm(colnums)
rm(activityId)
rm(activityName)
