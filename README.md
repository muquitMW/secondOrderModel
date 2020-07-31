## Introduction
This is an example of multiple order modeling for accuracy improvement in deep neural networks.
Different approaches are shown on how to use the outputs of a category prediction model as predictors for a second model.
Time series instances of samples are used as multiple inputs (for example N frames of a video is used as N image inputs) for model, 
and those N number of predicted output (probability density) is used as predictors for the second model.

## Data
We attach a set of simulated data for testing this approach.
Details regarding the data is available in comment section of FE_DataLoad.m

## Supporting function
A function (trainClassifier.m) attached here for training data with SVM algorithm is called by the scripts. 
This function is generated using MATLAB's CalssifierLearner App's code generation functionality  
