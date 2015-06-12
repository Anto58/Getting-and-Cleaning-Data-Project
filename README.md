# Getting-and-Cleaning-Data-Project
Project for Coursera Assessment

This project involved a series of steps:

1.  Downloading a series of text files
* the x. files included the measurements recorded on a Samsung Galaxy phone;
* the y. files recorded the activity being undertaken;
* the subject. files recorded the subject;
For each of the above files there were a test and training file
* a file showing the mapping of the activity code to a description of the activity
* a file showing the variable names of the variables included in the x. files

2.  Combining the x. y. and subject. texts using cbind for each of the test and training files

*  I assigned the activity and subject column names at this point

3.  Combining the test and training datasets using the rbind command into a single dataset called all.data

4.  Locating the columns that recorded the mean or standard deviation of a measurement

*  Note that the round bracket is a special character and in order to extract only variables including mean(), special syntax needed to be used for the grep command, as follows:

  grep("mean\\(\\)", vars$V2)
  
This avoided picking up variables which included the text "meanfreq".  I did not consider it appropriate to include these variables as there was not a corresponding standard deviation variable.

5.  The relevant columns could then be selected from the all.data dataset

6.  At this point, I assigned the descriptive labels for the activity variable and assigned the variable names to selected variables.  

7.  I then applied the "group_by" function to the dataset using the subject and activity variables which allowed me to use the "summarise each" function to calculate the means for each subject/activity combination

8.  The resulting dataset had 68 variables and I used the melt function to reshape the data to a long form.  I also split out the original variable names into their three components:

*  the factor being measured;
*  the dimension over which it was measured; and
*  whether the measurement was the mean or standard deviation

This results in a dataset which has one numerical measure per observation and a series of descriptive characteristics, thus satisfying the requirements for tidy data.