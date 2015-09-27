#### This script is for Course Project of "Getting and Cleaning Data" on Coursera 

## Download data file

if (!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method = "curl")
unzip("./data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", exdir = "./data")

## Read data

Vnames <- read.table("./data/UCI HAR Dataset/features.txt")
Alabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
training <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

## Merge data

TrainingTest <- rbind(training, test)
names(TrainingTest) <- Vnames[, 2]

VnamesMeanStd <- Vnames[grepl(nam[1], Vnames[, 2]) & !grepl(nam[3], Vnames[, 2]) | grepl(nam[2], Vnames[, 2]), 2]
VnamesMeanStd <- as.character(VnamesMeanStd)

TrainingTestMeanStd <- TrainingTest[, VnamesMeanStd]

## Add factors

subject <- rbind(subjecttrain, subjecttest)
labels <- rbind(ytrain, ytest)
labelnames <- as.factor(labels[,1])
levels(labelnames) <- Alabels[,2]
combinedfactors <- interaction(labelnames, subject[, 1])

MeanStdData <- cbind(TrainingTestMeanStd, combinedfactors)

## Calculate averages

AverageByFactors <- aggregate(MeanStdData[, 1:66], by = list(MeanStdData$combinedfactors), mean)

names(AverageByFactors)[1] <- "combinedfactor"

## Write data into data file

write.table(AverageByFactors, file = "./data/AverageByFactors.txt", row.names = FALSE)

