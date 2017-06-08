#Variables

* subject: subject id (from 1 to 30)
* labeldescription: the label of the activity (see activity_labels.txt in the original dataset)

For the following variables the average ("mean") and standard deviation ("std") is provided. Those metrics are the average of the original metrics per subject and activity.

* tbodyccc xyz
* tgravityacc xyz
* tbodyaccjerk xyz
* tbodygyro xyz
* tbodygyrojerk xyz
* tbodyaccmag
* tgravityaccmag
* tbodyaccjerkmag
* tbodygyromag
* tbodygyrojerkmag
* fbodyacc xyz
* fbodyaccjerk xyz
* fbodygyro xyz
* fbodyaccmag
* fbodyAccjerkmag
* fbodygyromag
* fbodygyrojerkmag

For definition of the variables, see the original dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Based on the original dataset the following processing has been done:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.