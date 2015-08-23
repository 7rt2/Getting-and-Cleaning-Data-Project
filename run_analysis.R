##load libraries
library(data.table)
library(dplyr)

##Read in all tables
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")

##combine test tables
test_data<-cbind(subject_test,y_test)
test_data<-cbind(test_data,x_test)
##combine train tables
train_data<-cbind(subject_train,y_train)
train_data<-cbind(train_data,x_train)
##combine test and train tables
all_data<-rbind(test_data,train_data)

##create vector of feature names
features<-read.table("features.txt")
features<-as.character(features$V2)
##names for ID and activity
IdActivity<-c("SubjectId","Activity")
##create vector of all column names
names<-c(IdActivity,features)

##retrieve col#s for variables with mean() and std()
meancols<-grep("mean()",names,fixed = TRUE)
stdcols<-grep("std()",names,fixed=TRUE)
columns<-c(1,2,meancols,stdcols)
columns<-sort(columns)

##use the column numbers to subset data,
##extracting measurements on the mean and standard deviation
data<-all_data[,columns]

##rename activities in data set using descriptive activity names
activity_lables<-read.table("activity_labels.txt")
activity_lables<-as.character(activity_lables$V2)
data$V1.1<-activity_lables[data$V1.1]

##extract names for the mean and std columns
names<-names[columns]

##label columns of the data set with descriptive variable names
setnames(data,names)

##create new tidy data set with the average of each variable for each activity and each subject
group_by(data,SubjectId,Activity) %>%
  summarise_each(funs(mean)) %>%
  write.table(file="tidydata.txt",row.names=FALSE)


