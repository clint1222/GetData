# Getting and Cleaning Data
Repository for code and programming assignment for the Johns Hopkins University Coursera Course "Getting and Cleaning Data".

The programming assignment consisted of manipulating and summarizing data collected from the accelerometers of Samsung Galaxy S smartphones.  A full description is available at the [site][uciwebsite] where the data was obtained.  The data for the project can be found [here][data].

Also in this repository, you'll find a run_analysis.R file that will summarize the data.  A requirement for the script to run correctly is that you have the dplyr package installed, the script will attempt to load it and call some functions contained within the dplyr package.  The script also has some hard-coded file paths, so it's assumed your working directory contains the following four files

* activity_labels.txt
* features.txt
* features_info.txt
* README.txt

and two directories

* test/
* train/

 containing the test and train data.  It's probably best if after you unzip the data, copy the run_analysis.R file into the the folder with the README.txt file and *"source"* it from there.  The CodeBook.md file explains the data objects created by the run_analysis.R file.



[uciwebsite]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[data]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
