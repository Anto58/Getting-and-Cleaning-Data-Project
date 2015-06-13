---
title: "GACD Project Codebook"
author: "Susan"
date: "12 June 2015"

---

My output file includes six variables:

**subject**

This variable takes integer values between 1 and 30 corresponding to the 30 participants in the study

**activity**

This is a factor variable with six levels corresponding to the six tested activities:

* WALKING

* WALKING_UPSTAIRS

* WALKING_DOWNSTAIRS

* SITTING

* STANDING

* LAYING

**vartype**

This character variable either takes the value pf "mean" or "st_dev" depending upon whether the underlying variable was the mean or standard deviation of the measurement

**measure**

This character variable describes the feature being measured.  There are 17 possible measures as follows:

* fBodyAcc

* fBodyAccJerk

* fBodyAccMag

* fBodyBodyAccJerkMag

* fBodyBodyGyroJerkMag

* fBodyBodyGyroMag

* fBodyGyro

* tBodyAcc

* tBodyAccJerk

* tBodyAccJerkMag

* tBodyAccMag

* tBodyGyro 

* tBodyGyroJerk

* tBodyGyroJerkMag

* tBodyGyroMag

* tGravityAcc 

* tGravityAccMag 

See the description of the original datasets for more information on what these measures relate to at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**dimension**

This character variable takes one of four values.  Where the measure had a direction, this variable takes the value X, Y or Z indicating the direction in Euclidean space.  There are 9 features which measure a magnitude rather than having a dimension, indicated by the "mag" suffix for the measure variable.  For these features, the dimension variable is assigned the value "N"

**value**

This is numeric variable recording the average of the mean or standard deviation for the relevant measure


