Codebook Structure:
1. Intro
2. Process
3. Cration of the new "tidy" dataset.





1. INTRO

The codebook describes the transformation on "Human Activity Recognition Using Smartphones Dataset" (Version 1.0), a dataset which has been produced by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

The data has been collected through experiments and according to the scientific team that published them: " The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The original form of the dataset can be found here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

2. PROCESS

A. Data Input

From the original dataset, the above files have been loaded into R using the read.table() function

-- X_test.txt 
-- y_test.txt
-- X_train.txt
-- y_train.txt
-- subject_test.txt
-- subject_train.txt
-- features.txt
-- activity_labels.txt

B. Data Merge

After the data input, the separate data frames are combined in order to produse a single data frame

The combination follows the above pattern:

-- X_test and X_train rbinded together
-- y-test and y_train rbinded together
-- subject_test and subject_train rbinded together

Then the output of them was cbinded, producing a data frame with 10.299 observations (rows) and 563 variables (columns).

C.Naming the variables -- Choosing only the variables with "mean" and "std" in their names

After the data input and merge, the variables appear with names  like "V1", "V2", which are not human readable. So the variables names have been replaced with the original variable names contained in the "features.txt". In total there are 561 variable names. 

 -- A list of the original variable names: 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

After assigning the names to the 561 variables, the two remaining variables (from y_test and y_train rbind as well as the subject_test and subject_train rbind) took respectively the name of "activity" and "subject".

From the 563 variables, we are only concerned for those with "mean" and "std" measurements. So, we keep only them and drop the rest of the variables except variables "subject" and "activity".

Variable "subject" stands for the Subject Id of the experiment, and variable "activity" takes only values from 1 to 6 indicating the nature of the activity the subject of the experiment performed. 

Specifically, for the variable "activity" there are six activity labels:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The variable transformed to a factor (and then back to data.frame) so its values are no more 1-6, but WALKING, SITTING etc..

After dropping the  needless variables, we come up with a new data frame with 10.299 observtions and 88 variables.

The original names have been transformed so they can be more typing friendly and human readable. The new names have only lower case characters and also the "()" have been removed.

 [1] "subject"                              "activity"                             "tbodyacc-mean-x"                     
 [4] "tbodyacc-mean-y"                      "tbodyacc-mean-z"                      "tgravityacc-mean-x"                  
 [7] "tgravityacc-mean-y"                   "tgravityacc-mean-z"                   "tbodyaccjerk-mean-x"                 
[10] "tbodyaccjerk-mean-y"                  "tbodyaccjerk-mean-z"                  "tbodygyro-mean-x"                    
[13] "tbodygyro-mean-y"                     "tbodygyro-mean-z"                     "tbodygyrojerk-mean-x"                
[16] "tbodygyrojerk-mean-y"                 "tbodygyrojerk-mean-z"                 "tbodyaccmag-mean"                    
[19] "tgravityaccmag-mean"                  "tbodyaccjerkmag-mean"                 "tbodygyromag-mean"                   
[22] "tbodygyrojerkmag-mean"                "fbodyacc-mean-x"                      "fbodyacc-mean-y"                     
[25] "fbodyacc-mean-z"                      "fbodyacc-meanfreq-x"                  "fbodyacc-meanfreq-y"                 
[28] "fbodyacc-meanfreq-z"                  "fbodyaccjerk-mean-x"                  "fbodyaccjerk-mean-y"                 
[31] "fbodyaccjerk-mean-z"                  "fbodyaccjerk-meanfreq-x"              "fbodyaccjerk-meanfreq-y"             
[34] "fbodyaccjerk-meanfreq-z"              "fbodygyro-mean-x"                     "fbodygyro-mean-y"                    
[37] "fbodygyro-mean-z"                     "fbodygyro-meanfreq-x"                 "fbodygyro-meanfreq-y"                
[40] "fbodygyro-meanfreq-z"                 "fbodyaccmag-mean"                     "fbodyaccmag-meanfreq"                
[43] "fbodybodyaccjerkmag-mean"             "fbodybodyaccjerkmag-meanfreq"         "fbodybodygyromag-mean"               
[46] "fbodybodygyromag-meanfreq"            "fbodybodygyrojerkmag-mean"            "fbodybodygyrojerkmag-meanfreq"       
[49] "angle(tbodyaccmean,gravity)"          "angle(tbodyaccjerkmean),gravitymean)" "angle(tbodygyromean,gravitymean)"    
[52] "angle(tbodygyrojerkmean,gravitymean)" "angle(x,gravitymean)"                 "angle(y,gravitymean)"                
[55] "angle(z,gravitymean)"                 "tbodyacc-std-x"                       "tbodyacc-std-y"                      
[58] "tbodyacc-std-z"                       "tgravityacc-std-x"                    "tgravityacc-std-y"                   
[61] "tgravityacc-std-z"                    "tbodyaccjerk-std-x"                   "tbodyaccjerk-std-y"                  
[64] "tbodyaccjerk-std-z"                   "tbodygyro-std-x"                      "tbodygyro-std-y"                     
[67] "tbodygyro-std-z"                      "tbodygyrojerk-std-x"                  "tbodygyrojerk-std-y"                 
[70] "tbodygyrojerk-std-z"                  "tbodyaccmag-std"                      "tgravityaccmag-std"                  
[73] "tbodyaccjerkmag-std"                  "tbodygyromag-std"                     "tbodygyrojerkmag-std"                
[76] "fbodyacc-std-x"                       "fbodyacc-std-y"                       "fbodyacc-std-z"                      
[79] "fbodyaccjerk-std-x"                   "fbodyaccjerk-std-y"                   "fbodyaccjerk-std-z"                  
[82] "fbodygyro-std-x"                      "fbodygyro-std-y"                      "fbodygyro-std-z"                     
[85] "fbodyaccmag-std"                      "fbodybodyaccjerkmag-std"              "fbodybodygyromag-std"                
[88] "fbodybodygyrojerkmag-std"  


3. Creating a new "tidy" data set with the average of each variable for each activity and each subject.

In this step, a second (and independent) dataset is created with only the observations of about "mean", "std", as well as "subject" and "activity". Overall, 88 variables and 180 observations. It is named as "DF4"

The new data frame is grouped by (and arranged) "subject" and "activity" to make it possible to calculate the mean value of every variable for every group (combination of subject and activity.)

The name of the variables have benn changed for the previous dataset, and all have now the prefix "avg-" to signify that now they are not the same as before. 

Abreviations: avg = average
              acc = acceleration
              gyro = gyroscope
              t    = time domain signals  ( "t" in the beginning of the name, e.g "tbodyacc")
              f    = frequency domain signals ("f" in the beginning of the name, e.g "fbodygyro")
              mean = mean value
              std  = standard deviation
              

This is the list with new variables:
 [1] "subject"                                   "activity"                            
 [3] "avg-tbodyacc-mean-x"                      "avg-tbodyacc-mean-y"                     
 [5] "avg-tbodyacc-mean-z"                      "avg-tgravityacc-mean-x"                  
 [7] "avg-tgravityacc-mean-y"                   "avg-tgravityacc-mean-z"                  
 [9] "avg-tbodyaccjerk-mean-x"                  "avg-tbodyaccjerk-mean-y"                 
[11] "avg-tbodyaccjerk-mean-z"                  "avg-tbodygyro-mean-x"                    
[13] "avg-tbodygyro-mean-y"                     "avg-tbodygyro-mean-z"                    
[15] "avg-tbodygyrojerk-mean-x"                 "avg-tbodygyrojerk-mean-y"                
[17] "avg-tbodygyrojerk-mean-z"                 "avg-tbodyaccmag-mean"                    
[19] "avg-tgravityaccmag-mean"                  "avg-tbodyaccjerkmag-mean"                
[21] "avg-tbodygyromag-mean"                    "avg-tbodygyrojerkmag-mean"               
[23] "avg-fbodyacc-mean-x"                      "avg-fbodyacc-mean-y"                     
[25] "avg-fbodyacc-mean-z"                      "avg-fbodyacc-meanfreq-x"                 
[27] "avg-fbodyacc-meanfreq-y"                  "avg-fbodyacc-meanfreq-z"                 
[29] "avg-fbodyaccjerk-mean-x"                  "avg-fbodyaccjerk-mean-y"                 
[31] "avg-fbodyaccjerk-mean-z"                  "avg-fbodyaccjerk-meanfreq-x"             
[33] "avg-fbodyaccjerk-meanfreq-y"              "avg-fbodyaccjerk-meanfreq-z"             
[35] "avg-fbodygyro-mean-x"                     "avg-fbodygyro-mean-y"                    
[37] "avg-fbodygyro-mean-z"                     "avg-fbodygyro-meanfreq-x"                
[39] "avg-fbodygyro-meanfreq-y"                 "avg-fbodygyro-meanfreq-z"                
[41] "avg-fbodyaccmag-mean"                     "avg-fbodyaccmag-meanfreq"                
[43] "avg-fbodybodyaccjerkmag-mean"             "avg-fbodybodyaccjerkmag-meanfreq"        
[45] "avg-fbodybodygyromag-mean"                "avg-fbodybodygyromag-meanfreq"           
[47] "avg-fbodybodygyrojerkmag-mean"            "avg-fbodybodygyrojerkmag-meanfreq"       
[49] "avg-angle(tbodyaccmean,gravity)"          "avg-angle(tbodyaccjerkmean),gravitymean)"
[51] "avg-angle(tbodygyromean,gravitymean)"     "avg-angle(tbodygyrojerkmean,gravitymean)"
[53] "avg-angle(x,gravitymean)"                 "avg-angle(y,gravitymean)"                
[55] "avg-angle(z,gravitymean)"                 "avg-tbodyacc-std-x"                      
[57] "avg-tbodyacc-std-y"                       "avg-tbodyacc-std-z"                      
[59] "avg-tgravityacc-std-x"                    "avg-tgravityacc-std-y"                   
[61] "avg-tgravityacc-std-z"                    "avg-tbodyaccjerk-std-x"                  
[63] "avg-tbodyaccjerk-std-y"                   "avg-tbodyaccjerk-std-z"                  
[65] "avg-tbodygyro-std-x"                      "avg-tbodygyro-std-y"                     
[67] "avg-tbodygyro-std-z"                      "avg-tbodygyrojerk-std-x"                 
[69] "avg-tbodygyrojerk-std-y"                  "avg-tbodygyrojerk-std-z"                 
[71] "avg-tbodyaccmag-std"                      "avg-tgravityaccmag-std"                  
[73] "avg-tbodyaccjerkmag-std"                  "avg-tbodygyromag-std"                    
[75] "avg-tbodygyrojerkmag-std"                 "avg-fbodyacc-std-x"                      
[77] "avg-fbodyacc-std-y"                       "avg-fbodyacc-std-z"                      
[79] "avg-fbodyaccjerk-std-x"                   "avg-fbodyaccjerk-std-y"                  
[81] "avg-fbodyaccjerk-std-z"                   "avg-fbodygyro-std-x"                     
[83] "avg-fbodygyro-std-y"                      "avg-fbodygyro-std-z"                     
[85] "avg-fbodyaccmag-std"                      "avg-fbodybodyaccjerkmag-std"             
[87] "avg-fbodybodygyromag-std"                 "avg-fbodybodygyrojerkmag-std" 

In the new "tidy" dataset the values of the variables are the mean value for  each combination of subject and activity.

That means that in the previous dataset, for example the variable "tbodyacc-mean-x" for subject 1 and activity WALKING, had 95 observations. 

In the new dataset, the variable "avg-tbodyacc-mean-x"  calculates the average value (mean) of those 95 observations. The same logic applies for every variable in the "DF4' dataset.

Finally, running the script run-analysis.R will produce a .txt ("run_analysis.txt") that will be located in your R's working directory.

Plese keep in mind that for running the script you have to unzip the original dataset in your working directory.











