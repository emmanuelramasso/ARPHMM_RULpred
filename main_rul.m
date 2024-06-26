% Download CHMM_with_partial_labels on github
% Add folders and subs to path
% Add external and subfolders therein to path

% load data
% built from regenere_data_turbofan.m that load features and estimate the
% heath index
load('data_train_filtered2.mat')

% load the pl prior
% depends on the number of states you specify, here for example 6
load dataset1_etats_pl.mat
for i=1:length(pl), pl{i} = pl{i}'; end % format pb

% Run ARPHMM
predc = 7;
[gamma2, NDEIf, msemf, signalt, signalcomb, B, sigma, ...
A, Pi, alpha2, gammaHMM, alphaHMM, NDEI, msem, LL, dataRUL]= ...
AUTOREGRESSIVE_pourRUL(data_train_filtered, pl, size(pl{1},2), predc);

% Prediction
figure,plot(signalcomb)
hold on, plot(dataRUL,'r')

