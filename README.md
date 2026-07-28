# Getting and Cleaning Data Course Project
This repository contains the R script and documentation for the Getting and Cleaning Data course project 
The purpose of this project is to collect, work with, clean, and prepare a dataset for later analysis. 
This project utilizes the Human Activity Recognition Using Smartphones Dataset with the original dataset source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


---

# Repository Contents 

## R Script 
Filename: 'run_analysis.R'
This script performs all required data cleaning and analysis steps: 
1. Downloads and loads the dataset
2. Reads training and test datasets
3. Merges training and test datasets
4. Extracts measurements containing mean and standard deviation values
5. Applies descriptive activity names
6. Updates variable names to make them more descriptive
7. Creates a second tidy dataset containing averages of each variable grouped by subject and activity
8. Writes the final dataset to: 'tidy_data.txt'

---

## Codebook.md 
This file describes:
- The dataset
- Data transformations
- Cleaning procedures
- Final tidy dataset structure
- Variables

  ---

  # Running the Analysis

  ## Requirements
  The following packages are required:
  ```r install.packages("dplyr")
