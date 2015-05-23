#CodeBook.md

Sourcing the run_analysis.R file will create the following objects in R

* features : descriptive names for the measurements obtained
* subfeatures : a subset of the descriptive names that contain the text *mean()* or *std()*
* activityLabels : descriptive names of the activities recorded by the smartphones
* allData : all the subject, activity, and measurement data collected into one data.frame
* alldatasummary : an independent tidy data set with the average of each variable grouped by each subject and activity

###Data transformations

A quick overview of the data manipulation to obtain the summary data.  

* read in the features.txt and activity_labels.txt files into data tables
* grep the features for measurements containing "mean()" or "std()" storing results in subfeatures
* read in the test subject data and set the column name to "subject"
* read in the test activity data and set the column name to "activity"
* read in the test measurement data
* subset the measurement data based on the column numbers from subfeatures
* column bind the subject, activity, and measurement data into one data.frame
* repeat the 5 steps above for the train data
* row bind the test and train data
* summarize the data by grouping by the subject and activity and calculate the average storing in alldatasummary
* replace the activity codes in alldatasummary with descriptive names

#####Notes
A straight arithmetic mean was used to calculate the averages of the mean and standard deviation numbers.  A proper weighted average of the means would require digging into the raw data to calculate the number of measurements used to calculate the reported means, which is way to much work for this assignment.  Don't even get me started on what is involved to average the standard deviations.



