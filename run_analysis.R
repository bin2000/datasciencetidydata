# uncomment if these libraries are not installed already
# install.packages('data.table')
# install.packages('reshape2')
library(data.table)
library(reshape2)

# step 1 
# load data and label data

# load test and train data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# load feature names and activity names
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

feature_names <- features[,2]
activity_names <- activity_labels[,2]

# label the test and train data sets
names(X_test)<-feature_names
names(X_train)<-feature_names


# step 2
# Extracts only the measurements on the mean and standard deviation for 
# each measurement

# Extracts only the measurements on the mean and standard deviation
X_test<-X_test[,grepl("mean|std", feature_names)]
X_train<-X_train[,grepl("mean|std", feature_names)]

# step 3
# bind the test and train data sets
data<-rbind(X_test, X_train)

# add column with the activity description
Y_test[,2]<-activity_names[Y_test[,1]]
Y_train[,2]<-activity_names[Y_train[,1]]

# one set of activities
activities<-rbind(Y_test, Y_train)
# label the columns
names(activities)<-c("ActivityID", "ActivityLabel")

# one set of subjects
subjects<-rbind(subject_test, subject_train)
# label the subject names from the test and train files
colnames(subjects)<-"SubjectNumber"

# step 4 
# Combine all three tables
alldata<-cbind(as.data.table(subjects), activities, data)

# step 5 
# Creates a second, independent tidy data set with the average of each 
#        variable for each activity and each subject. (point 5)

# Calculate average of each variable for each activity and each subject
id_labels<-c("SubjectNumber", "ActivityID", "ActivityLabel")
data_labels<-setdiff(colnames(alldata), id_labels)
predata<-melt(alldata, id = id_labels, measure.vars = data_labels)

result<-dcast(predata, SubjectNumber + ActivityLabel ~ variable, mean)

# write the tidy dataset to a file
write.table(result, "tidydataset.txt", sep=",", row.name=FALSE)

