library(plyr)
library(dplyr)


if(!file.exists("./data")){dir.create("./data")}
setwd("./data/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "HumanActivityRecog.zip", method = "curl")
dateDownloaded <- date()
unzip("HumanActivityRecog.zip", exdir = "./")


setwd("./UCI HAR Dataset/train/")

xtrain <- read.table("X_train.txt", sep  ="")
ytrain <- read.table("Y_train.txt")
subjectTrain <- read.table("subject_train.txt")

setwd("../")
setwd("./UCI HAR Dataset/test/")
xtest <- read.table("X_test.txt", sep  ="")
ytest <- read.table("Y_test.txt")
subjectTest <- read.table("subject_test.txt")

setwd("../")

features1 <- read.table("features.txt", strip.white = TRUE)
features1 <- select(features1, V2)

mergedx <- rbind(xtrain, xtest)
names(mergedx) <- as.character(features1[1:561,])

mergedy <- rbind(ytrain, ytest)
subjects <- rbind(subjectTrain, subjectTest)
greatDf <- cbind(subjects, mergedy, mergedx)

meanStd <- grep("std | mean", colnames(greatDf))

smallerDf <- greatDf[,meanStd]

smallerDf <- cbind(mergedy, smallerDf)

as.factor(smallerDf[[1]])

activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

mapvalues(smallerDf[[1]], c("1","2","3","4","5","6"), activities)

newData <- copy(smallerDf)

lastData <- aggregate(.~ newData[[1]], data = newData, mean)

write.table(lastData, row.names = F, file = "dataProjectSolution.txt", sep = " ")
