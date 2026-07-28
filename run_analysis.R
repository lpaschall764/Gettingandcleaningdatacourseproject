#Download and unzip data files 
if (!file.exists("UCI HAR Dataset")) {
  download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
    "dataset.zip"
  )
  unzip("dataset.zip")
}

# 1. Merge the training and test sets to create one data set

#Read in the files 

#Read the variable names 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              header = FALSE)

features <- read.table("UCI HAR Dataset/features.txt",
                       header = FALSE)

#Read training data 
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      header = FALSE)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      header = FALSE)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                      header = FALSE)

#Read test data 
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                     header = FALSE)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
                     header = FALSE)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",
                     header = FALSE)

#Merge training and test sets 
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#Add descriptive column names 
colnames(X) <- features[,2]

#Combine into one dataset 
data <- cbind(subject, y, X)
colnames(data)[1:2] <- c("subject", "activity")

# 2. Extract columns containing mean() or std()
mean_std <- grep(
  "mean\\(\\)|std\\(\\)",
  colnames(data)
)

data2 <- data[,c(1,2,mean_std)]

# 3. Use descriptive activity names to the activities 
data2$activity <- factor(
  data2$activity, 
  levels = activity_labels$V1,
  labels = activity_labels$V2
)

# 4. Appropriately label variables in column names

names(data2) <- gsub(
  "^t",
  "time",
  names(data2)
)

names(data2) <- gsub(
  "^f",
  "frequency",
  names(data2)
)

names(data2) <- gsub(
  "Acc",
  "Acceleration",
  names(data2)
)

names(data2) <- gsub(
  "Gyro",
  "Gyroscope",
  names(data2)
)

names(data2) <- gsub(
  "Mag",
  "Magnitude",
  names(data2)
)

names(data2) <- gsub(
  "BodyBody",
  "Body",
  names(data2)
)

# 5. Save a copy of the data as a new tidy dataset

#Load dplyr
library(dplyr)

#Create a tidy dataset with the average values of the different activities per sample
tidy_data <- data2 %>%
  group_by(subject, activity) %>%
  summarise(
    across(
      everything(),
      mean
    ),
    .groups = "drop"
  )

# Write to a text file
write.table(
  tidy_data,
  "tidy_data.txt",
  row.names = FALSE
)