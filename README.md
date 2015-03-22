# CleaningAndGettingData_CourseProject
*Submission of course project of Cleaning and Getting Data*

## Files in the repository are:
1. **run_analysis.R**
2. **averages.txt**
3. **CodeBook.md**
4. **README.md** (*this file*)

### run_analysis.R
Purpose of this R script file is to create a tidy data set from the data collected from the from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data could be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This file is a part of the entire submission of course project of the coursera course **Getting and Cleaning Data**

### averages.txt
This the text file containing the tidy data set which is nothing but the output of the R script

### CodeBook.md
Describes the data set.


### **Summary**
The zip file containing the data is first downloaded and unzipped. Then as per the instructions given in the project requirement, a R script is written to do the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
