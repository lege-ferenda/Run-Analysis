Codebook Structure:
1. Intro
2. Process
3.





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








