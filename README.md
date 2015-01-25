README

Here’s the description for running analysis for course project
Step1: 	setup work directory
	Read data frams: Xtrain, Ytrain, Xtest, Ytest
	Add label of train vs test dataset
	combine those four data frame.

Step2:	Import feature.txt
	Apply variable names from feature.txt

Step3: 	Subset feature with name only contain mean() or std()
	Subset combined data 

Step4:	Import activity_labels.txt
	Rename y(originally has numbers 1-6) with activity labels
	
Step5: 	Calculate average for each variable, by each activity.