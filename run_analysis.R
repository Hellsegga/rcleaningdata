getTidy <- function(){

#we assume that we are in the unzipped folder of the dataset

#dplyr will be used
library(dplyr)

# load test set
testsetx <- read.table("test/X_test.txt")
testsetsubj <- read.table("test/subject_test.txt")
testsety <- read.table("test/y_test.txt")
testset <- cbind(testsetx, testsetsubj, testsety)

#load training set
trainsetx <- read.table("train/X_train.txt")
trainsetsubj <- read.table("train/subject_train.txt")
trainsety <- read.table("train/y_train.txt")
trainset <- cbind(trainsetx, trainsetsubj, trainsety)

#merge datasets
all <- rbind(testset, trainset)

#put the names for the columns
fields <- as.character(read.table("features.txt")$V2)
fields <- c(fields, "subject", "label")
names(all) <- fields

#keep only columns containing mean or standard deviation and the label and subject
all <- all[grep("mean\\(|std|label|subject", names(all))]

#set descriptive label instead of integer
labels <- read.table("activity_labels.txt")
all <- mutate(all, labeldescription=labels$V2[label])

#changing to somewhat nicer names
names(all) <- gsub("-", " ", names(all))
names(all) <- gsub("()", "", names(all))
names(all) <- gsub("\\(\\)", "", names(all))
names(all) <- tolower(names(all))

#summarise by subject and activity
grouped <- group_by(all, subject, labeldescription)
grouped$label <- NULL
tidy <- summarise_each(grouped, funs(mean))
tidy

}