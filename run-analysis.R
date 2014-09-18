
#Run Analysis
==============

## data input

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
varFeatures <-  read.table("UCI HAR Dataset/features.txt")
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

## merging data (sets) in a single data frames

#step 1 - combine xTest with xTrain

merge_X <- rbind(xTest,xTrain)

#step 2 -combine yTest with yTrain

y_all <- rbind(yTest, yTrain)

# turning the variable into a factor to assign the activity labels
factor_y_all <- as.factor(y_all[[1]])
levels(factor_y_all) <-  c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
y_all2 <- as.data.frame(factor_y_all)

#step 3 - combine subjects
subject_all <- rbind(testSubject, trainSubject)

## taking the variable names 

ColumnNames <- varFeatures[,2]

## assign the variable names

colnames(merge_X) <- ColumnNames

##adding new data as columns to the dataframe

final_df <- cbind(merge_X, y_all2,subject_all)

#naming the two new columns
names(final_df)[563] <- "subject"
names(final_df)[562] <- "activity"

# transform the data frame in data table for easier manipulation 

library(plyr) ;library(data.table) ; library(dplyr)

DF <- data.table(final_df)

## selecting only the columns with mean and standar deviation (plus activity label and subject id columns)

cleanDF1 <- select(DF,contains("mean()"))
cleanDF2 <- select(DF, contains("std()"))

DFa <- cbind(cleanDF1, cleanDF2)
DF2 <- cbind(final_df[563], final_df[562], DFa)


## making column names typing friendly (lowercase) and more human readable
names(DF2) <- tolower(names(DF2))
names(DF2) <- gsub("\\()", "", names(DF2))


##Create a second, independent tidy data set with the average of each variable for each activity and each subject.


DF2 <- arrange(DF2, `subject`,`activity`)  
DF3 <- group_by(DF2,subject, activity)    
DF4 <- summarise_each(DF3, funs(mean))
colnames(DF4) <- paste0("avg-",colnames(DF4))


#exporting a .txt using the write.table function

write.table(DF4,file =  "run_analysis.txt", row.names = FALSE)


