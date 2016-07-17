run_analysis<-function()
{
    ##PREPARING FILES##
    #Mounting necessary libraries
    library(plyr)   
    library(reshape2)
    
    #checking if dataset files exist. If not, downloading them to working directory
    if(file.exists("dataset.zip")==FALSE)
    {
        print("Loading data...")
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip")
    }
    
    #checking if unziped version of dataset files exist. If not unziping them
     if(file.exists("UCI HAR Dataset")==FALSE)
    {
        unzip("dataset.zip")
     }
    
    ##READING FILES##
    #reading activity lables and their numeric values (laying, sitting etc)
    activity_labels<-read.csv2("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="",col.names = c("label","activity"))
    
    #reading column names of dataset
    features<-read.csv("./UCI HAR Dataset/features.txt",header=FALSE,sep="",col.names=c("label","name"))

    #reading test dataset (subjects, actual data from sensors and activity labels)
    subject_test<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="",col.names=c("Subject"))
    X_test<-read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE,stringsAsFactors = FALSE,sep="",col.names=as.vector(features[,2]),check.names = FALSE)
    Y_test<-read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="",col.names="Activity")

    #merging all read tables into one test dataset 
    test_dataset<-cbind(subject_test,X_test)
    test_dataset<-cbind(test_dataset,Y_test)

    #reading train dataset (subjects, actual data from sensors and activity labels)
    subject_train<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="",col.names=c("Subject"))
    X_train<-read.csv("./UCI HAR Dataset/train/X_train.txt",header=FALSE,stringsAsFactors = FALSE,sep="",col.names=as.vector(features[,2]), check.names = FALSE)
    Y_train<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="",col.names="Activity")

    #merging all read tables into one train dataset 
    train_dataset<-cbind(subject_train,X_train)
    train_dataset<-cbind(train_dataset,Y_train)
    
    ##CLEANING DATA##
    
    ##1. Merging train and test datasets
    dataset<-rbind(test_dataset,train_dataset)
    
    ##2. Extracting only data on mean and standard deviation (and activity and subject as well)
    dataset<-dataset[grepl("(Subject|Activity|-[Mm]ean|[Ss]td)",names(dataset))]
    
    ##3. Making descriptive activity names to name activities in the data set (we already have read activity lables and coresponding codes, so we just rename levels in activity factor in dataset accordingly)
    dataset[,"Activity"]<-mapvalues(dataset[,"Activity"],from=c("1","2","3","4","5","6"),to=as.vector(activity_labels[,2]))
        
    ##4. Labeling data set with descriptive names (column names from features.txt were already assigned on "reading files" stage. We just make them more informative)
    for (index in 1:length(names(dataset))) 
    {
        names(dataset)[index]<-gsub("\\()","",names(dataset)[index])
        names(dataset)[index]<-gsub("^t","Time.",names(dataset)[index])
        names(dataset)[index]<-gsub("^f","Freq.",names(dataset)[index])
        names(dataset)[index]<-gsub("mean","Mean",names(dataset)[index])
        names(dataset)[index]<-gsub("Mag","Magnitude",names(dataset)[index])
        names(dataset)[index]<-gsub("std","StdDev",names(dataset)[index])
        names(dataset)[index]<-gsub("-",".",names(dataset)[index])
    }
    
    ##5.Creating second tidy data set, which contains average of each variable for each ativity and each subject
    melted_dataset <- melt(dataset,id.vars = c("Subject","Activity"))
    tidydata<-dcast(melted_dataset, Subject + Activity ~ variable,mean)
    #writing data to output file
    write.table(tidydata,"./tidydata.txt")
}