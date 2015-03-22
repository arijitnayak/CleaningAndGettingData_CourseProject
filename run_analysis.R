################################################################################
# File name: run_analysis.R
#
# Purpose: To create a tidy data set from the data available in the link
#          https://github.com/arijitnayak/CleaningAndGettingData_CourseProject.
#          The R script does the following:
#           1. Merges the training and the test sets to create one data set.
#           2. Extracts only the measurements on the mean and standard deviation
#              for each measurement. 
#           3. Uses descriptive activity names to name the activities in the
#              data set
#           4. Appropriately labels the data set with descriptive variable names. 
#           5. From the data set in step 4, creates a second, independent tidy
#              data set with the average of each variable for each activity and
#              each subject.
################################################################################

# Clean the workspace
rm( list = ls() )

# Load required library
library( plyr )

# Set working directory
setwd( "D:\\DataScience\\GettingAndCleaningData\\ CourseProject\\data\\
       UCI HAR Dataset" )

########################################################################
########################################################################
### Now perform the steps mentioned in the course project one by one ###
########################################################################
########################################################################

#########################################################################
# Step 1 : Merges the training and the test sets to create one data set
#########################################################################

# Read data from the relevant files
xTrain   <- read.table( "./train/X_train.txt" )
yTrain   <- read.table( "./train/y_train.txt" )
xTest    <- read.table( "./test/X_test.txt" )
yTest    <- read.table( "./test/y_test.txt" )
trainSub <- read.table( "./train/subject_train.txt" )
testSub  <- read.table( "./test/subject_test.txt" )

# Do the merge stuffs

dataX   <- rbind( xTrain, xTest )            # Column merge to create data for x
dataY   <- rbind( yTrain, yTest )            # Column merge to create data for y
dataSub <- rbind( trainSub, testSub )        # Create data for subject

################################################################################
# Step 2: Extracts only the measurements on the mean and standard deviation for
#         each measurement.
################################################################################

features <- read.table( "./features.txt" )

# Find the columns which have mean and std in their name
meanStd <- grep( "-(mean|std)\\(\\)", features[, 2] )

# Extract the subset of dataX having the required columns
dataX <- dataX[, meanStd]
names(dataX) <- features[meanStd, 2]

################################################################################
# Step 3: Uses descriptive activity names to name the activities in the data set
################################################################################

# Read the activity levels
activities <- read.table( "./activity_labels.txt" )

# Update values with correct activity names
dataY[, 1] <- activities[dataY[, 1], 2]

# Modify the column name
names(dataY) <- "activity"

############################################################################
# Step 4: Appropriately labels the data set with descriptive variable names.
############################################################################

# correct column name
names(dataSub) <- "subject"

# bind all the data in a single data set
combined <- cbind( dataX, dataY, dataSub )

################################################################################
# Step 5: From the data set in step 4, creates a second, independent tidy data
#         set with the average of each variable for each activity and each
#         subject.
################################################################################

# Create the final data set
aveActSub <- ddply( combined, .( subject, activity ),
                    function(x) colMeans( x[, 1:66] ) )

# Finally write into the file
write.table( aveActSub, "./averages.txt", row.name=FALSE )