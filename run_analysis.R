library(dplyr)

# Read training data set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read test data set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the data's features
features <- read.table("./UCI HAR Dataset/features.txt")

# Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Step 1: Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
subject_total <- rbind(subject_train, subject_test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
selected_var <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_total <- X_total[,selected_var[,1]]

# Step 3: Uses descriptive activity names to name the activities in the data set.
colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

# Step 4: Appropriately labels the data set with descriptive variable names.
colnames(X_total) <- features[selected_var[,1],2]

# Step 5: From the data set in Step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
colnames(subject_total) <- "subject"
total <- cbind(X_total, activitylabel, subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)