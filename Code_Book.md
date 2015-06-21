##Code Book for each variable in the run_analysis R-script

* train is the X_train.txt data frame for the train data
* test is the X_test.txt data frame for the test data
* allFdata is the merge of the train and test data frames
* trainsub is the subject_train.txt data frame and contains the train subject data
* testsub is the subject_test.txt data frame and contains the test subject data
* allSubdata is the merge of the train and test subject data frames
* trainact is the y_train.txt data frame and contains the train activity data
* testact is the y_test.txt data frame and contains the test activity data
* allActdata is the merge of the train and test activity data frames
* features is the data from features.txt
* meanstdind are the columns that contain mean or std
* allwFeat is the allFData with only the columns that contain mean or std
* activity is the descriptive activity labels from activity_labels.txt
* actLabel contains the descriptive activity for each row of data
* finalData merges together the transformed allSubdata, allActdata, and allwFeat.
* finalDataMean provides the mean for each column category for each subject and each activity.