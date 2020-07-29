%% Naive Approach
numImg  = width(TrainDataTable)-1;
dfctIndx= TestProdLabels=='Defected';%index of rows corresponding to Defected class
nrIndx  = ~dfctIndx;%index of rows corresponding to Normal class
Nnr     = sum(nrIndx);%Number of Nomral samples
Ndf     = sum(dfctIndx);%Number of Defected samples
SA      = sum(table2array(TestDataTable) <= 0.5,2);%Number of images labeled as Defected
nAcr    = zeros(numImg,1);
dAcr    = zeros(numImg,1);
% For each value of N_d, the accuracy at sample-to-class level is calculated  
for k = 1:numImg
    rslt = SA >= k;%k represents N_d
    dAcr(k) = sum(rslt == 1 & dfctIndx == 1)/Ndf;%Accuracy regarding Defected sample
    nAcr(k) = sum(rslt == 0 & nrIndx == 1)/Nnr;%Accuracy regarding Normal sample
end

% Visualization
figure
subplot(2,1,1)
xarr= (1:numImg)';% Values assigned to N_d 

% Left Y-axis corresponds to Normal samples
yyaxis left
plot(xarr, nAcr,'b-o')
xlim([0 60])
ylim([-0.2 1.2])

% Rights Y-axis corresponds to Normal samples
yyaxis right
plot(xarr,dAcr,'r-x')
xlim([0 60])
ylim([-0.2 1.2])

% Specs
title('Fig3. Minimum # of defected images and prediction accuracy')
xlabel('Minimum # of defected predictions required to call a sample defected')
ylabel('accuracy')
legend({'Normal','Defected'})
grid on


% Drawing ROC curve
subplot(2,1,2)
plot(nAcr,dAcr,'g-*')
grid on
title('Fig4. ROC Curve')
xlabel('Accuracy in predicting Normal')
ylabel('Accuracy in predicting Defected')