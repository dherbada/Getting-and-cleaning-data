## README.md
The run_analysis.R script loads the raw data-set from the 'UCI HAR Dataset' directory and automatically produces a tidy data-set called "Tidy_average.txt" that contains exclusively the averages for every feature containing mean or standard deviation in their names arranged by subject and activity (with descriptive names) for a combination of the test and training data-sets.

The pre-requisites for the script to work are:
1) The UCI HAR Dataset is downloaded and unzipped into the working directory of R
2) The plyr library is installed in R
3) The dplyr library is installed in R

When sourced/run the run_analysis.R script automatically first loads the activity labels and the features labels from the text files activity_labels.txt and features.txt and then the test and train datasets comprising for each the x_... (values of the features), y_... (activities) and subject_... (subjects) files in each of the test and train directories.

These test and train data-sets are merged to create a single data set using calls to the rbind function:
```{r cars}
x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)
...
```
The descriptive names for the features are added to the x dataframe with conversion of feature names to lowercase, removal of extra symbols not synctatically acceptable in R via 'make.names' function, and then removal of the "." symbols created by 'make.names'. This is accomplished with a single line of code:
```{r cars}
names(x)<-gsub("\\.","",make.names(tolower(features[[2]])))
```
Conversely, a single line of code extracts the features/variables with descriptive names containing mean and standard deviation (std) for each measurement:
```{r cars}
xmean<-subset(x, select=grepl("*mean*|*std*",names(x)))
```
The script then assigns the name "activity" to the variable y containing the activities and the name "subject" to the variable s containing the subjects and creates an intermediate dataframe called 'dset' comprising subject, activity and features with mean and standard deviation in the name:
```{r cars}
dset<-cbind(s,y,xmean)
```

In the next step the script converts the activity labels dataframe into smallcaps and character formats in order for it to work properly with the plyr package function 'mapvalues'. Additionally and as a step to tidy-up the dataset it also converts the subject and activity columns into factors before calling mapvalues to "map" the acitvity numbers to activity labels across the data-set 'dset':
```{r cars}
dset$activity<-mapvalues(dset$activity, from=alabels$V1, to=alabels$V2)
```
The dataset 'dset' is arranged by subject and activity into a dataframe called dset2, and a final data frame dset3 that contains the average of the features with mean or standard deviation in the descriptive name is created and grouped by subject and activity. Once again this is accompished with a single line of code and a call to the ddply function:
```{r cars}
dset3<-ddply(dset2, c("subject", "activity"),x<-function(m){colMeans(m[,3:as.integer((dim(m)[2]))])})
```
The result is then written into the output file "Tidy_average.txt" contained in the working directory of R
###NOTE1:
The script deliberately skips the inertial data folders and the corresponding files because these are not used at all to create a tidy output dataset comprising only the averages of the means and standard deviations related features and variables.
###NOTE2: 
Rounding issues of the system may produce very small differences (<1e16?) in the values
of Features/variables exported by write.table using this script and imported back into the same system with read.table
