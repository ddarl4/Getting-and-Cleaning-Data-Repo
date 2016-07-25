# Getting-and-Cleaning-Data-Repo
Course Project

An overview of the course project can be found here: "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. One of the most exciting 
areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone." 


Process:

run_analysis.R performs the following process in order to clean and write a tidy set:
	1. Downloads data from source, unzips file, and reads data into R
	2. Binds together both pieces of subject data, both pieces of activity data and both pieces of features using rbind
	3. Renames similar variables into proper and distinct variables	
	4. extracts only the data where mean and standard deviation are contained
	5. Uses descriptive names to rename activities in dataset
	6. creates a second, independent dataset
		
		-See CodeBook.md for information on variable names in run_analysis.R


		


 