# program to take raw data and create a tidy data set
# import needed packages in case they are not in
  install.packages("dplyr")
  install.packages("reshape2")
  library(dplyr)
  library(reshape2)# assume all of the files are in the same directory-- no subdirectories
# program to take raw data and create a tidy data set
  lb <- read.table("features.txt")
  testxdata <- read.table("X_test.txt")
#    ## remove troublesome characters from names of variables
#    ## use gsub to remove ( ) _ and ,
  nam <- gsub("\\(","", lb[,2])
  nam <- gsub("\\)","", nam)
  nam <- gsub("\\-","", nam)
  nam <- gsub(",","", nam)
  names(testxdata) <- nam
# read in rest of data
  trainxdata <- read.table("X_train.txt")
  names(trainxdata) <- nam
  subjecttrain <- read.table("subject_train.txt")
  subjecttest <- read.table("subject_test.txt")
  testydata <- read.table("Y_test.txt")
  trainydata <- read.table("Y_train.txt")
  activityL <- read.table("activity_labels.txt")
# keep position information on the y and merge activity labels with activity codes
#  in y lista is just the original position
  lista <- 1:length(testydata$V1)
  testydata2 <- cbind(lista, testydata)
  testy <- arrange(merge(testydata2, activityL, by.x = "V1", by.y ="V1"), lista)
  lista <- 1:length(trainydata$V1)
  trainydata2 <- cbind(lista, trainydata)
  trainy <- arrange(merge(trainydata2, activityL, by.x="V1", by.y = "V1"), lista)
# change names of subject variable to subject
  subjecttest <- rename(subjecttest, subject = V1)
  subjecttrain <- rename(subjecttrain, subject = V1)
# test is all test data, train is all training data
  test <- cbind(testxdata, subjecttest, testy)
  train <- cbind(trainxdata, subjecttrain, trainy)
## create one big file merge test and train
  all <- rbind(test, train)
# find all names with mean or std
  nam2 <- grep("mean", nam)
  nam3 <- grep("std", nam)
  nam4 <- union(nam2, nam3)
# select just variables with mean of std
  all2 <- all[, nam4]
# get other variables we need
  all4 <- all[, 562:565]
# remerge numeric and category variables
  allf <- cbind(all2, all4)
# rename activity variable to activity
  allf <- rename(allf, activity = V2)
# meltdata  and then use dcast to find means by activity and subject
  meltdata <- melt(allf, id = c("subject", "activity"), measure.vars = 1:79)
  d <- dcast(meltdata, subject + activity ~ variable, mean)
# tidy up the data create a long narrow data set with melt
# then write the data to tidy.txt
  d2 <- melt(d, id=c("subject", "activity"), measure.vars = 3:81)
  d2 <- rename(d2, measurement_type= variable, mean= value)
  write.table(d2, "tidy.txt", row.name = FALSE)
