Run-Analysis
============

The purpose of the code located in run-analysis.R is to "clean" the data coming from "Human Activity Recognition Using Smartphones Dataset", and produce a single data frame only with the measurements concerning mean values as well as standard deviation. 
In the end it calculates and prints the mean for each combination of subject and activity for those variables.

The process in general terms is following the above steps: 

1.load the data into R
2.merge them in a single data frame
3.Keeping only the variables about mean and std
3.Renaming the variables names to a more typing friendly and human readable format
4.Creates a second data set, grouped by Subject and Activity
5.Calculates for every variable the mean for each combination of subject and activity.
6.Exports the result in a .txt format file

For more details about the variables and the process of clening the original data, please see the Codebook, located in the Run Analysis repo.
