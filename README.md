xtrain                                 : training set in the train folder
ytrain                                 : activity set in the train folder
subjectTrain                         : the subjects who perform the activities in the train folder


xtest                                 : training set in the test folder
ytest                                 : activity set in the test folder
subjectTest                         :t he subjects who perform the activities in the train folder






features1                         : features collected from the phones


mergedx                        : xtrain + xtest combine via rbind()
mergedy                         :ytrain + ytest combine via rbind()
subjects                         :subjetTrain + subjectTest combined via rbind()
greatDf                         : mergedx + mergedy + subjects conbined via cbind()


meanStd                         : the indices of the mean ans standard deviation features


activities                         : vector of descriptive activities


smallerDf                        : data frame white just mean and std activities                


newData                         : copy of smallerDf to no corrupt smallerDf


lastData                        : data frame with the means of the columns by activities, this data frame is the one which will be written with write.table in point 5