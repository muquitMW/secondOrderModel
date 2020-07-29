%% Data load
load ReadyVariables.mat

%% Data Explanation
% Table1 shows the distribution of normal and defected samples across
% training and test data.
%
    %% Table1: Disrtribution of samples
%                       training data   test data   
% normal samples:           57              23 
% defected samples:         43              12 
% total unique samples:     100             35 
% total images:             6000            2100
%
%
% File (ReadyVariables.mat) contains 4 variables, each corresponding
% to training data or test data 
    %% Table2: Variable Expalnation
%   Variable name       Size        Explanation
% TrainDataTable        100x61      Each line correspond to a sample (for 
%                                   100 training samples)
%                                   First 60 columns hold probability 
%                                   density (Model1's output) of each image
%                                   of the corresponding sample
%                                   Last column (61st) holds groundtruth
%                                   label (Normal/Defected) of the
%                                   corresponding sample
%
% TestDataTable         35x60       Each line correspond to a sample (for 
%                                   35 test samples)
%                                   Every column holds the probability 
%                                   density (Model1's output) for each of 
%                                   the 6o images of corresponding sample
%
% TestGtruthTable       35x60       Each line correspond to a sample (for 
%                                   35 test samples)
%                                   Every column holds the groundtruth
%                                   label (Normal/Defected) for each of the
%                                   60 images of the corresponding sample
%
% TestProdLabels        35x1        Each line correspond to a sample (for 
%                                   35 test samples), and the value is the
%                                   groundtruth label of the corresponding 
%                                   sample

