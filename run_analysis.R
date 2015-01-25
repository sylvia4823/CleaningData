setwd("/Users/QQL/Desktop/2T HardDrive Backup/Info3-Online_Test Learning/Coursera 3 Getting and Cleaning Data")

dataXtrain<-read.table("./Project_week 3 /UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
dim(dataXtrain) #7352x561
dataYtrain<-read.table("./Project_week 3 /UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
dim(dataYtrain) #7352x1

dataXtest<-read.table("./Project_week 3 /UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
dim(dataXtest) #2947x561
dataYtest<-read.table("./Project_week 3 /UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
dim(dataYtest) #2947x1

label<-rep("train", times=7352) #label is 1x7352
dataXtrain2<-cbind(dataXtrain, label) #dataXtrain2 is 7352x562
label<-rep("test", times=2947) #label is 1x2947
dataXtest2<-cbind(dataXtest, label) #dataXtrain2 is 7352x562
#combine data
dataCombine1<-cbind(dataXtrain2,dataYtrain)
dataCombine2<-cbind(dataXtest2,dataYtest)
dataCombine<-rbind(dataCombine1,dataCombine2)
#data in dataCombine is 10299 x 563

#rename data heading/variable name
datanames<-read.table("./Project_week 3 /UCI HAR Dataset/features.txt")
names(datanames)<-c("id", "feature")

datanames$feature<-as.character(datanames$feature)

names(dataCombine)<-c(datanames$feature, "label","y")
head(names(dataCombine))

#Subset data
v<-grep("mean()|std()",datanames$feature)
subdata<-dataCombine[, v]
v2<-dataCombine$y
subdata2<-cbind(subdata, v2)


#rename activity
activity<-read.table("./Project_week 3 /UCI HAR Dataset/activity_labels.txt")
names(activity)<-c("order", "activity")

subdata2$v2<-as.character(subdata2$v2)
subdata2$v2<-gsub("1", "WALKING", subdata2$v2)
subdata2$v2<-gsub("2", "WALKING_UPSTAIRS", subdata2$v2)
subdata2$v2<-gsub("3", "WALKING_DOWNSTAIRS", subdata2$v2)
subdata2$v2<-gsub("4", "SITTING", subdata2$v2)
subdata2$v2<-gsub("5", "STANDING", subdata2$v2)
subdata2$v2<-gsub("6", "LAYING", subdata2$v2)

#average
library(dplyr)
by_activity<-group_by(subdata2,v2)
summarize(by_activity, avg=mean)

#save data
write.table(subdata2, file="output.txt",row.name=FALSE, col.name=TRUE)