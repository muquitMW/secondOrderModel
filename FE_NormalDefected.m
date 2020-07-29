%% Normal-Defected Pattern as Predictor

%% Creating Binary Pattern
% Training data table -> Binary pattern Table for training
DiscTrainDataTable= double(table2array(TrainDataTable(:,1:end-1)) > 0.5);%Sets as 1 if predicted as Normal, otherwise 0
DiscTrainDataTable       = array2table(DiscTrainDataTable);%Array to table conversion
DiscTrainDataTable.Labels= TrainDataTable.Labels;%Appends Label column as ground truth response for training
DiscTrainDataTable.Properties.VariableNames = ... 
    TrainDataTable.Properties.VariableNames;%Adjust Binary Pattern Table's column names

% Test data table -> Binary pattern Table for test
DiscTestDataTable= double(table2array(TestDataTable(:,1:end)) > 0.5);%Sets as 1 if predicted as Normal, otherwise 0
DiscTestDataTable        = array2table(DiscTestDataTable);%Array to table conversion
DiscTestDataTable.Properties.VariableNames = ...
    TestDataTable.Properties.VariableNames;%Adjust Binary Pattern Table's column names

%% Machine Learning Model Creation and Evaluation for Binary Pattern
% Training
bTM = trainClassifier(DiscTrainDataTable,numImg);%Modeling using binary pattern as
% Evaluation
bP = bTM.predictFcn(DiscTestDataTable);% Prediction regarding the Test data (Sample-to-Class level prediction)
bAcc = 100*sum(bP==TestProdLabels)/numel(bP);
disp(['Thresholded Data Accuracy:', num2str(bAcc),'%'])