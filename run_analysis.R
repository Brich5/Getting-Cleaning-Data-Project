> # 
> # Step 1. Merges the training and the test sets to create one data set.
> # X_train & X_test need to be merged in order to apply "features"
> # subject_train & subject_test need to be merged
> # y_train and y_test need to be merged to apply activity_labels
> ## set working directory
> setwd("C:/Users/Bruce/Desktop/GetData1/UCI_HAR_Dataset")
> train <- read.table("./train/X_train.txt")
> test <- read.table("./test/X_test.txt")
> # 
> # Combine the data that the features will be applied to
> allFdata <- rbind(train,test)
> #    
> # Combine the subject data
> trainsub <- read.table("./train/subject_train.txt")
> testsub <- read.table("./test/subject_test.txt")
> allSubdata <- rbind(trainsub, testsub)   
> #
> # Combine all the activity data
> trainact <- read.table("./train/y_train.txt")
> testact <- read.table("./test/y_test.txt")
> allActdata <- rbind(trainact, testact)
> #
> # Step 2. Extracts only the measurements on the mean and 
> # standard deviation for each measurement.
> # In order to do this, need to use the features text file. 
> # We want to replace the column name V1 with the actual feature 
> # label tBodyAccMEANX.
> # Also want to remove all the features that don't involve
> # the mean or standard deviation.
> #
> features <- read.table("./features.txt")
> meanstdind <- grep("mean\\(\\)|std\\(\\)", features[, 2])
> allwFeat <- allFdata[, meanstdind]
> names(allwFeat) <- gsub("\\(\\)", "", features[meanstdind, 2])
> names(allwFeat) <- gsub("-", "", names(allwFeat))
> names(allwFeat) <- gsub("mean", "MEAN", names(allwFeat))
> names(allwFeat) <- gsub("std", "STD", names(allwFeat))
> #
> # Step 3. Uses descriptive activity names to name the activities in the data set.
> # In order to do this, need to use the activity_labels text file. 
> # Will replace numerical values in the data set allActdata with the activity label.
> # I.e. 1 will be replaced with walking, 2 will be replaced with walkingUpstairs.
> #
> activity <- read.table("./activity_labels.txt")
> activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
> substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
> substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
> actLabel <- activity[allActdata[,1], 2]
> allActdata[,1] <- actLabel
> #
> # Step 4. Appropriately labels the data set with descriptive variable names.
> # 
> names(allSubdata) <- "subject"
> names(allActdata) <- "activity"
> finalData <- cbind(allSubdata, allActdata, allwFeat)
> write.table(finalData, "Merged_data.txt", row.name = FALSE, quote = FALSE)
> #
> # Step 5. From the data set in step 4, creates a second, independent tidy
> # data set with the average of each variable for each activity and each subject.
> # This will be achieved reshaping, melting, and casting.
> #
> library(reshape2)
> fdatamelt <- melt(finalData, id = c("subject", "activity"))
> finalDataMean <- dcast(fdatamelt, subject + activity ~ variable, mean)
> write.table(finalDataMean, "tidy.txt", row.name = FALSE, quote = FALSE)
> 
