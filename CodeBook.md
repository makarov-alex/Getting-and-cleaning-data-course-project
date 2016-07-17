#Code book
***

## Introduction
Following data was collected by researchers from [Università degli Studi di Genova](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Experiment was carried out among group of 30 volunteers, who performed simple actions (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing Samsung Galaxy S II smartphone. Data from smartphone's accelerometer and gyroscope was recorded and processed by appling some filters and mathematical functions. Detailed raw data description is availible in _README.txt_ file inside dataset archive. 

## Raw dataset
[Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Key terms
**Feature** - column with data measured from sensors, processed by dataset authors. For example _tBodyAcc-XYZ_ - body acceleration signals, or _tGravityAcc-XYZ_ - gravity acceleration signals. <br/>
**Activity** - actions, performed by volunteers (walking, standing etc)<br/>
**Subject** - volunteer
## Data processing (Run_analysis.R script description)
**Step 0**: First of all, script mounts necessary libraries (plyr and reshape2). Then raw dataset is downloaded from the web and unziped. Data is read into dataframes using _read.csv()_  function (column names are loaded from _features.txt_ file) and then merged into two dataframes (test and train samples) using _cbind()_ function.<br/>
**Step 1**: Test and train datasets merged into one datased using _rbind()_ function. <br/>
**Step 2**: Using subsetting and _grepl()_ function only data on mean and standard deviation selected. I believe, that according to project assignment and data description in _features-info.txt_ file, every column, which contains "mean" and "std" should be considered (including _meanFreq_ columns, because it is weighted average of the frequency).<br/>
**Step 3**: Using _mapvalues()_ function levels of "Activity" factor vector were changed from numbers (1-6) to descriptive names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) <br/>
**Step 4**: Column names (which originally wer taken from _features.txt_ file) are fixed in order to look more readable <br/> 
**Step 5**: Tidy set were creating using dataframe melting and _dcast()_ function, which cosists of mean values for every feature and pair of activity (walking, standing etc) and subject (id of volunteer). <br/>

## Variables
_.Time_ - time<br/>
_.Freq_ - frequency domain signals<br/>
_.Mean_ - mean value<br/>
_.StdDev_ - standard deviation<br/>
_.X.Y.Z_ -directions<br/>
<br/>
**Body acceleration signals**<br/>
Time.BodyAcc.Mean.X <br/> 
Time.BodyAcc.Mean.Y <br/> 
Time.BodyAcc.Mean.Z <br/> 
Time.BodyAcc.StdDev.X <br/> 
Time.BodyAcc.StdDev.Y <br/> 
Time.BodyAcc.StdDev.Z <br/>
**Gravity acceleration signals**<br/> 
Time.GravityAcc.Mean.X <br/> 
Time.GravityAcc.Mean.Y <br/> 
Time.GravityAcc.Mean.Z <br/> 
Time.GravityAcc.StdDev.X <br/> 
Time.GravityAcc.StdDev.Y <br/> 
Time.GravityAcc.StdDev.Z <br/> 
**Jerk singals (body linear acceleration)**<br/> 
Time.BodyAccJerk.Mean.X <br/> 
Time.BodyAccJerk.Mean.Y <br/> 
Time.BodyAccJerk.Mean.Z <br/> 
Time.BodyAccJerk.StdDev.X <br/> 
Time.BodyAccJerk.StdDev.Y <br/> 
Time.BodyAccJerk.StdDev.Z <br/> 
**Jerk singals (angular velocity)**<br/> 
Time.BodyGyroJerk.Mean.X <br/>
Time.BodyGyroJerk.Mean.Y <br/> 
Time.BodyGyroJerk.Mean.Z <br/> 
Time.BodyGyroJerk.StdDev.X <br/> 
Time.BodyGyroJerk.StdDev.Y <br/> 
Time.BodyGyroJerk.StdDev.Z <br/> 
**Data from gyroscope**<br/> 
Time.BodyGyro.Mean.X <br/> 
Time.BodyGyro.Mean.Y <br/> 
Time.BodyGyro.Mean.Z <br/> 
Time.BodyGyro.StdDev.X <br/> 
Time.BodyGyro.StdDev.Y <br/> 
Time.BodyGyro.StdDev.Z <br/> 
**Magnitude calculated using the Euclidean norm**<br/> 
Time.BodyAccMagnitude.Mean <br/> 
Time.BodyAccMagnitude.StdDev <br/> 
Time.GravityAccMagnitude.Mean <br/> 
Time.GravityAccMagnitude.StdDev <br/> 
Time.BodyAccJerkMagnitude.Mean <br/> 
Time.BodyAccJerkMagnitude.StdDev <br/> 
Time.BodyGyroMagnitude.Mean <br/> 
Time.BodyGyroMagnitude.StdDev <br/> 
Time.BodyGyroJerkMagnitude.Mean <br/> 
Time.BodyGyroJerkMagnitude.StdDev <br/> 
**Data after application of Fast Fourier Transform (FFT) on signals**<br/>
Freq.BodyAcc.Mean.X <br/> 
Freq.BodyAcc.Mean.Y <br/> 
Freq.BodyAcc.Mean.Z <br/> 
Freq.BodyAcc.StdDev.X <br/> 
Freq.BodyAcc.StdDev.Y <br/> 
Freq.BodyAcc.StdDev.Z <br/> 
Freq.BodyAcc.MeanFreq.X <br/> 
Freq.BodyAcc.MeanFreq.Y <br/> 
Freq.BodyAcc.MeanFreq.Z <br/> 
Freq.BodyAccJerk.Mean.X <br/> 
Freq.BodyAccJerk.Mean.Y <br/> 
Freq.BodyAccJerk.Mean.Z <br/> 
Freq.BodyAccJerk.StdDev.X <br/> 
Freq.BodyAccJerk.StdDev.Y <br/> 
Freq.BodyAccJerk.StdDev.Z <br/> 
Freq.BodyAccJerk.MeanFreq.X <br/> 
Freq.BodyAccJerk.MeanFreq.Y <br/> 
Freq.BodyAccJerk.MeanFreq.Z <br/> 
Freq.BodyGyro.Mean.X <br/> 
Freq.BodyGyro.Mean.Y <br/> 
Freq.BodyGyro.Mean.Z <br/> 
Freq.BodyGyro.StdDev.X <br/> 
Freq.BodyGyro.StdDev.Y <br/> 
Freq.BodyGyro.StdDev.Z <br/> 
Freq.BodyGyro.MeanFreq.X <br/> 
Freq.BodyGyro.MeanFreq.Y <br/> 
Freq.BodyGyro.MeanFreq.Z <br/> 
Freq.BodyAccMagnitude.Mean <br/> 
Freq.BodyAccMagnitude.StdDev <br/> 
Freq.BodyAccMagnitude.MeanFreq <br/> 
Freq.BodyBodyAccJerkMagnitude.Mean <br/> 
Freq.BodyBodyAccJerkMagnitude.StdDev <br/> 
Freq.BodyBodyAccJerkMagnitude.MeanFreq <br/> 
Freq.BodyBodyGyroMagnitude.Mean <br/> 
Freq.BodyBodyGyroMagnitude.StdDev <br/> 
Freq.BodyBodyGyroMagnitude.MeanFreq <br/> 
Freq.BodyBodyGyroJerkMagnitude.Mean <br/> 
Freq.BodyBodyGyroJerkMagnitude.StdDev <br/> 
Freq.BodyBodyGyroJerkMagnitude.MeanFreq"<br/>
<br/>
Angle features were deleted from dataset, as they do not contain mean  or standard deviation data (it's just angle between vectors).
<br/>
17.07.2016
