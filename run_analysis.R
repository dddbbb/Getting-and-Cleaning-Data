library(data.table)

# 1. Merge test and train sets
xTrain <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", header = FALSE)
xTest <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", header = FALSE)

yTrain <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", header = FALSE)
yTest <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", header = FALSE)

subTrain <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subTest <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

xMerged <- rbind(xTrain, xTest)
yMerged <- rbind(yTrain, yTest)
subMerged <- rbind(subTrain, subTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table('./UCI HAR Dataset/features.txt')
meanSD <- features[grep("mean|std", features[,2]),]
xMeanSD <- xMerged[,meanSD[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
names(xMeanSD) <- features[meanSD[,1],2]
names(yMerged) <- 'Activity'
names(subMerged) <- 'Subject'

DataSet <- cbind(yMerged, subMerged, xMeanSD)

# 4. Appropriately labels the data set with descriptive variable names. 

actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(actLabels) <- c("Activity", "Activity.Name")
DataSet<-merge(actLabels, DataSet)
DataSet[,1]<-NULL #drop column with activity id
names(DataSet)[names(DataSet)=="Activity.Name"] <- "Activity"

#5. From the data set in step 4, creates a second, independent tidy data set with the 
#   average of each variable for each activity and each subject

tidy <- data.table(DataSet)
tidy <- tidy[, lapply(.SD, mean), by = c('Activity', 'Subject')]
write.table(tidy, file = 'tidy.txt', row.name=FALSE)