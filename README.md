### The run_analysis.R file is for the course project of “Getting and Cleaning Data”. 

The script processes data (download, read, merge, add factors, calculate averages and write into file).

### Code Book

TrainingTest: combined raw training and test data

VnamesMeanStd: value names contains “mean()” or “std()”

TrainingTestMeanStd: combined training and test data with “mean()” or “std()” variables only

subject: subject (person) in training and test data (1 to 30)

labels: numeric labels for activities (1 to 6)

labelnames: factors (character names) of labels

combinedfactor: combined factors (subject and labelnames)

MeanStdData: mean and standard deviation data (TrainingTestMeanStd) combined with combined factor

AverageByFactors: the average of each variable for each activity and each subject (final data set)


