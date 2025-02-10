
%% 0: Clean up
clear all
clc
close all


%% 1: Set file path, importing data, and FFT


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify the location of the libsvm/matlab folder and import data %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Healthy data

healthydatafolder='H:\My Drive\Courses\Industry AI\Industry AI - Group Project\Homework 3\Data\Training\Healthy';
filepattern=fullfile(healthydatafolder, '*.txt');
textfiles=dir(filepattern);
healthydata=zeros(length(textfiles),2);

for i=1:length(textfiles)
    healthyfileName=textfiles(i).name;
    filename=fullfile(textfiles(i).folder,healthyfileName);
    NS1=readmatrix(filename);
    [healthydata(i,1),healthydata(i,2),f1,a1]=fFTonsignal(NS1,15,30);
end



%---------------------------------------------

%Faulty data - Unbalanced 1

faultydatafolder1='H:\My Drive\Courses\Industry AI\Industry AI - Group Project\Homework 3\Data\Training\Faulty\Unbalance 1';
filepattern=fullfile(faultydatafolder1, '*.txt');
textfiles=dir(filepattern);
faultydata1=zeros(length(textfiles),2);

for i=1:length(textfiles)
    faultyfileName1=textfiles(i).name;
    filename=fullfile(textfiles(i).folder,faultyfileName1);
    U1=readmatrix(filename);
    [faultydata1(i,1),faultydata1(i,2),f1,a1]=fFTonsignal(U1,15,30);
end

%---------------------------------------------

%Faulty data - Unbalanced 2

faultydatafolder2='H:\My Drive\Courses\Industry AI\Industry AI - Group Project\Homework 3\Data\Training\Faulty\Unbalance 2';
filepattern=fullfile(faultydatafolder2, '*.txt');
textfiles=dir(filepattern);
faultydata2=zeros(length(textfiles),2);

for i=1:length(textfiles)
    faultyfileName2=textfiles(i).name;
    filename=fullfile(textfiles(i).folder,faultyfileName2);
    U2=readmatrix(filename);
    [faultydata2(i,1),faultydata2(i,2),f1,a1]=fFTonsignal(U2,15,30);
end

%{
%-------------------------------------------------------------------
%plotting of individual FFTs

[healthydata(i,1),healthydata(i,2),fh,fftresultsh]=fFTonsignal(NS1,15,30);
[faultydata1(i,1),faultydata1(i,2),fu1,fftresultsu1]=fFTonsignal(U1,15,30);
[faultydata2(i,1),faultydata2(i,2),fu2,fftresultsu2]=fFTonsignal(U2,15,30);

figure(11)
hold on
plot(fh, fftresultsh);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
xlim([0 60]);
ylim([0 0.015]);
yticks([0 0.003 0.006 0.009 0.012 0.015])
xlabel('Frequency (Hz)','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Amp vs Feq - Healthy data', 'FontSize',25, 'FontName','Times New Roman');
hold off

figure(12)
hold on
plot(fu1, fftresultsu1);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
xlim([0 60]);
ylim([0 0.015]);
yticks([0 0.003 0.006 0.009 0.012 0.015])
xlabel('Frequency (Hz)','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Amp vs Feq - Unbalance1 data', 'FontSize',25, 'FontName','Times New Roman');
hold off

figure(13)
hold on
plot(fu2, fftresultsu2);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
xlim([0 60]);
ylim([0 0.015]);
yticks([0 0.003 0.006 0.009 0.012 0.015])
xlabel('Frequency (Hz)','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Amp vs Feq - Unbalance2 data', 'FontSize',25, 'FontName','Times New Roman');
hold off


%---------------------------------------------

%}

% dir_lib     = 'G:\My Drive\ELMS\HW3\For Students\libsvm\matlab';


%% 2: Plot signals, features


%% Plotting Healthy and Faulty Data

healthysamples=1:length(healthydata);
faultysamples1=1:length(faultydata1);
faultysamples2=1:length(faultydata2);

figure(1)
hold on
plot(healthysamples, healthydata(:,1),'-o');
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [0.4 0.4 0.4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
xlabel('Sample','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Feature View - Amplitude at 1X', 'FontSize',25, 'FontName','Times New Roman');
%plot(healthysamples, healthydata(:,1),'-o');
plot(faultysamples1, faultydata1(:,1),'-x');
plot(faultysamples2, faultydata2(:,1),'-+');

hold off
legend('healthy','imbalance1','imbalance2')


Feq=2560;
tstart=0;
t=1/Feq;
L=length(NS1);
time=(0:(L-1))*t;

figure(2)
hold on 
plot(time, NS1);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 0.5;
ylim([-0.6 0.6]);
xlabel('Time','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Healthy Data', 'FontSize',25, 'FontName','Times New Roman');
hold off

figure(3)
hold on 
plot(time, U1);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
ylim([-0.6 0.6]);
xlabel('Time','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Imbalance1 Data', 'FontSize',25, 'FontName','Times New Roman');
hold off

figure(4)
hold on 
plot(time, U2);
grid on
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'off';
ax.GridColor = [.4 .4 .4]
ax.GridLineStyle = ':';
ax.GridAlpha = 1;
ylim([-0.6 0.6]);
xlabel('Time','FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
ylabel('Amplitude', 'FontSize',18,'FontWeight', 'bold', 'FontName','Times New Roman');
set(gca,'FontSize',15, 'FontWeight', 'bold','FontName','Times New Roman');
title('Imbalance2 Data', 'FontSize',25, 'FontName','Times New Roman');
hold off


%% 5. SVM

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Before this section, you need prepare 
%  - FeatMat_train: Feature matrix for training data
%  - FeatMat_test : Feature matrix for testing data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{

dir_lib     = 'G:\My Drive\ELMS\HW3\For Students\libsvm\matlab';
cd(dir_lib)

% Training data
Train_X = FeatMat_train;
Train_Y = zeros(N_train,1);
Train_Y(1:Nh,1) = 1;
Train_Y(Nh+1:Nh+Nf1,1) = 2;
Train_Y(Nh+Nf1+1:N_train,1) = 3;

% Test Data
Test_X = FeatMat_test;
Test_Y = zeros(30,1);
Test_Y( 1:10,1) = 1;
Test_Y(11:20,1) = 2;
Test_Y(21:30,1) = 3;

% train SVM with different kernel

Mehtod_list = {'rbf','linear','polynomial','Sigmoid'}; % kernel function selection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here you can select kernel function 
% Try different kernel and check the results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Method = Mehtod_list{1}; % 1: rbf, 2: linear, 3: polynomial, 4: softmargin

switch Method
    case 'rbf'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 2 -g 0.333 -c 1');
            % refer to README file in libsvm for more infomation

    case 'linear'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 0 -g 0.333 ');
        
    case 'polynomial'
            svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 1 -g 0.333 ');
            
    case 'Sigmoid'
        svmStruct = libsvmtrain(Train_Y,Train_X,'-s 0 -t 3 -g 0.333 ');
        
end

% Test and predict label
% use trained SVM model for classification
[predicted_result, accuracy,~] = libsvmpredict(Test_Y,Test_X,svmStruct);


%}

%% 6. Confusion Matrix

%%%%%%%%%%%%%%%%%%%
% Write your code %
%%%%%%%%%%%%%%%%%%%