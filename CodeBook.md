## CodeBook for the data-set Tidy_average.txt

The "Tidy_average.txt" data-set is a processed extract of the "Human Activity Recognition Using Smartphones Data Set" that can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and the data-set has been processed to obtain and export a single tidy data-set comprising the averages of those features in the original data-set that include 'mean' or 'standard deviation' ('std')  in the feature name arranged by subject and activity measured.

Full information on the project can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The resulting data-set "Tidy_average.txt" is considered tidy because:  
a) It contains a single variable per column  
b) The variables have descriptive names and these are in minor caps avoiding special characters  
c) Those variables that are factors (subject and activity) are included in the data-set as such with appropriate and descriptive names for the levels  
d) Each row of the data-set contains a single observation with the values of all the variables

####Subject
This variable has not been modified from the original data-set during processing.  

The variable contains the numeric identifier of each of the 30 people that participated in the test or train activities and can range:
1-30

####Activity
This variable has been created by mapping the activity numbers to the activity labels in the original data-set and then modifying the labels of the activities to be composed of lowercaps only.  

The variable contains the descriptive name of the activity that the subject participated in. It can adopt the following values:
walking
walking_upstairs
walking_downstairs
sitting
standing
laying



####Averages of features with descriptive names that include mean or standard deviation(std)

This set of 86 variables has been created by processing the original 561 feature-vector component variables (features) by:  
1 Subsetting those features that contain 'mean' or 'standard deviation' ('std') in their descriptive names  
2 The descriptive names of the features have been transformed to lowercaps and letters only  
3 The resulting features have been averaged and grouped by subject and activity

The resulting set of variables contains the averages of the 86 feature-vector components that include mean or standard deviation(std) in their descriptive name, out of the 561 feature-vector components contained in the original data-set. The variables values are numeric and the names of those variables are as follows:

 [1] "tbodyaccmeanx"                     "tbodyaccmeany"                    
 [3] "tbodyaccmeanz"                     "tbodyaccstdx"                     
 [5] "tbodyaccstdy"                      "tbodyaccstdz"                     
 [7] "tgravityaccmeanx"                  "tgravityaccmeany"                 
 [9] "tgravityaccmeanz"                  "tgravityaccstdx"                  
[11] "tgravityaccstdy"                   "tgravityaccstdz"                  
[13] "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
[15] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
[17] "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
[19] "tbodygyromeanx"                    "tbodygyromeany"                   
[21] "tbodygyromeanz"                    "tbodygyrostdx"                    
[23] "tbodygyrostdy"                     "tbodygyrostdz"                    
[25] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
[27] "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
[29] "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
[31] "tbodyaccmagmean"                   "tbodyaccmagstd"                   
[33] "tgravityaccmagmean"                "tgravityaccmagstd"                
[35] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
[37] "tbodygyromagmean"                  "tbodygyromagstd"                  
[39] "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
[41] "fbodyaccmeanx"                     "fbodyaccmeany"                    
[43] "fbodyaccmeanz"                     "fbodyaccstdx"                     
[45] "fbodyaccstdy"                      "fbodyaccstdz"                     
[47] "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
[49] "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
[51] "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
[53] "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
[55] "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
[57] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
[59] "fbodygyromeanx"                    "fbodygyromeany"                   
[61] "fbodygyromeanz"                    "fbodygyrostdx"                    
[63] "fbodygyrostdy"                     "fbodygyrostdz"                    
[65] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
[67] "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
[69] "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
[71] "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
[73] "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
[75] "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
[77] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
[79] "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
[81] "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
[83] "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
[85] "angleygravitymean"                 "anglezgravitymean"   
