## Overview 

This code book describes the variables, data, and any transformations or work that was performed to clean up the data 

Source for data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script ('run_analysis.R') merges training and test datasets and combines them into one dataset where the final output is a tidy dataset. The script performs the following transformations:

1. Merges the training and test datasets
2. Extracts columns that correspond to mean and standard deviation
3. Replaces activity IDs with descriptive activity names
4. Appropriately labels column variables using descriptive names
5. Creates a tidy dataset containing the average of each measurement variable grouped by subject and activity

---

# Data Processing 

## Original Data Files
Training measurements (`train/X_train.txt`)
Test measurements (`test/X_test.txt`)
Training activity labels (`train/y_train.txt`)
Test activity labels (`test/y_test.txt`)
Training subject identifiers (`train/subject_train.txt`)
Test subject identifiers (`test/subject_test.txt`)
Activity labels (`activity_labels.txt`)
Feature names (`features.txt`)

---

# Transformations Performed 

## 1. Merging Training and Test Data 
The training and test datasets were combined using 'rbind()' into a dataset that contains observations from all 30 subjects 

---

## 2. Extracting mean and standard deviation measurements 
Only kept columns that contained 'mean()' or 'std()'

---

## 3. Activity naming 
Numeric activity labels were replaced with descriptive names from the activity labels file.

---

## 4. Variable naming 
Variable names were modified to be more descriptive 

---

## 5. Make the dataset Tidy
Final dataset is saved as 'tidy_data.txt'

Each row represents one subject and one activity 
Each column represents the average value of a measurement variable 

Final dataset contains the mean of every selected measurement grouped by subject and activity 

---

# Variables

## Subject
Identifier for the individual who performed the activity 
Values: 1-30

---

## Activity 
Activity performed by the subject
Values: found in 'activity_labels.txt'

---

## Measurement Variables 
The remaining variables represent averaged sensor measurements from the smartphone accelerometer and gyroscope

---

## Variable Naming 
The original variable names were modified:
t → time
f → frequency
Acc → Acceleration
Gyro → Gyroscope
Mag → Magnitude
