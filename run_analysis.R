# This script takes as its input the unzipped directory UCI HAR Dataset which must be
# placed in the working directory of R. 
# This script also requires that plyr and dplyr are installed in R.

# Load Activity and Features labels, then test data set and train dataset:
# Labels:
alabels<-read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE)
# Test data set:
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
# Train data set:
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# NOTE: The scrip deliberately skips the inertial data folders as they will not be used to create a tidy
# output dataset (the requirements clearly specify that an extract with measurement means will be produced
# implying that, since the inertial datasets have no means labels they will not be part of the output)        

# Merges the test and training sets to create one data set
x<-rbind(x_test,x_train)

# Labels the data set with descriptive variable names taken from the Features file via
# conversion of Feature names to lowercase, removal of extra symbols not synctatically acceptable
# in R via make.names function, and then removal of the "." symbols created by make.names:
names(x)<-gsub("\\.","",make.names(tolower(features[[2]])))
# merges the activities in the test and train datasets and assigns the name "activity" to the variable
y<-rbind(y_test,y_train)
names(y)<-"activity"
# merges the subjects in the test and train datasets and assigns the name "subject" to the variable
s<-rbind(subject_test,subject_train)
names(s)<-"subject"
# Extracts the measurements on the mean and standard deviation for each measurement
xmean<-subset(x, select=grepl("*mean*|*std*",names(x)))

# NOTE: Since Feature names have been converted into small caps there is no need to check for large
# caps or mixed caps versions of the same names of the Features     
        
# dset is assigned the combined dataset with Subject and Activity data added as first 
# and second columns respectively
dset<-cbind(s,y,xmean)
# Converts activity labels to lowercase and the columns V1 and V2 into character objects
# to be passed to the mapvalues function 

# NOTE: for some reason mapvalues seems to work only with character arguments for "from" and "to"
# and not with factors (?)
alabels$V2<-as.character(tolower(alabels$V2))
alabels$V1<-as.character(alabels$V1)
# Converts subject abnd activity columns in the data set to factors
dset$subject<-as.factor(dset$subject)
dset$activity<-as.factor(dset$activity)
# Remapping of factors in activity using plyr function mapvalues
library(plyr)
dset$activity<-mapvalues(dset$activity, from=alabels$V1, to=alabels$V2)
# The script now uses dplyr library to create a second tidy data set containing the average
# of each Feature variable for each subject and activity
library(dplyr)
dset2<-arrange(dset, subject, activity)
#subsets the dset2 data frame by subject and activity, calculates the colMeans of all other columns
# and then creates a new data frame with the means of each variable grouped by subject and activity        
dset3<-ddply(dset2, c("subject", "activity"),x<-function(m){colMeans(m[,3:as.integer((dim(m)[2]))])})
#writes the new file with the tidy data set into the current working directory
write.table(dset3,"Tidy_average.txt", row.names=FALSE)
# NOTE: the call to read.table should include the option header=TRUE for it to work correctly
# NOTE2: rounding issues of the system may produce very small differences (<1e16?) in the values
# of Features/variables exported by write.table and imported with read.table