%% Training/evaluation with a simple LSTM Neural network

%% Parameter
trainLstm = true;
% IF YOU DO NOT HAVE AN ENVIRONMENT TO TRAIN NETWORKS< SET THIS AS FALSE

%% Training with an LSTM Neural Network
% Preparing cell data
trnLstm = cell(height(TrainDataTable),1);
tstLstm = cell(height(TestDataTable),1);
for k = 1 : numel(trnLstm)
    trnLstm{k} = table2array(TrainDataTable(k,1:end-1));
end
for k = 1 : numel(tstLstm)
    tstLstm{k} = table2array(TestDataTable(k,1:end));
end
trnLabel    = TrainDataTable.Labels;

% Training network
if ~trainLstm
    load pretrainedLstm.mat
    net = lstmnet;%Use a pre-saved LSTM Network (variable lstmnet)
else
    %% Defining layers of the Neural Network
    inputSize = 1;
    numHiddenUnits = 100;
    numClasses = 2;
    layers = [ ...
        sequenceInputLayer(inputSize)
        bilstmLayer(numHiddenUnits,'OutputMode','last')
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer];
    
    %% Training Options
    maxEpochs = 100;
    miniBatchSize = 10;
    
    options = trainingOptions('sgdm', ...
        'InitialLearnRate',0.1,...
        'ExecutionEnvironment','gpu', ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.2, ...
        'LearnRateDropPeriod',10, ...
        'GradientThreshold',1, ...
        'MaxEpochs',maxEpochs, ...
        'MiniBatchSize',miniBatchSize, ...
        'SequenceLength','longest', ...
        'Verbose',1, ...
        'Plots','training-progress',...
        'ExecutionEnvironment','cpu');
    
    %% Training
    net = trainNetwork(trnLstm,trnLabel,layers,options);
end