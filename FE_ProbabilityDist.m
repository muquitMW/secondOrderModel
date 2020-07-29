%% Probability distribution value as Predictor

%% Machine Learning Model Creation
% Training
TM = trainClassifier(TrainDataTable,numImg);%Modeling using binary pattern as

%% Evaluation for Probability Density
P = TM.predictFcn(TestDataTable);% Prediction regarding the Test data (Sample-to-Class level prediction)
acc = 100*sum(P==TestProdLabels)/numel(P);
disp(['Normal Data Accuracy:',num2str(acc),'%'])