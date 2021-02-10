%% Lu175
clc;  clear all;
close all;
format long;  format compact;

tic

%% Process
% Load data
load('test_raw_data.mat');

% Raw data plot
figure('name', '5 Transmitter');
mesh(FiveTransmitter);
figure('name', '3 Transmitter');
mesh(ThreeTransmitter);

% Delta plot
figure('name', '5 Transmitter - 3 Transmitter');
mesh(FiveTransmitter - ThreeTransmitter);
figure('name', '3 Transmitter - 5 Transmitter');
mesh(ThreeTransmitter - FiveTransmitter);

%%
% DEFINITION OF PLOTTING FUNCTION  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plotSectionDatas(rawData, selAxis, axisParamMatrix, shapeOfLine)
%     rawData             : Raw data from excel files.
%                               ex) FiveTransmitter
%     selAxis             : Select one axis. (x or y)
%                               ex) 'x' or 'X' / 'y' or 'Y'
%     axisParamMatrix     : You can use 'subplot'(ROWs) & 'hold on'(COLs) finctions.
%                               ex) See example under this help docs.
%     shapeOfLine         : line property (color, shape)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Select x values
plotSectionDatas(FiveTransmitter, 'x', [1, 101, 151, 201, 301], '-');

% Select y values
plotSectionDatas(FiveTransmitter, 'y', [1:40:301], '-');

% How to use axisParamMatrix parameter  (nan -> for blank)
params = [
     11,  16, nan, nan; ...     % Row NO.1 -> subplot NO.1
     31,  36,  41,  46; ...     % Row NO.2 -> subplot NO.2
     51,  56, nan, nan; ...     % Row NO.3 -> subplot NO.3
     71,  76,  81,  86; ...     % Row NO.4 -> subplot NO.4
     91,  96, nan, nan; ...     % Row NO.5 -> subplot NO.5
    111, 116, 121, nan; ...     % Row NO.6 -> subplot NO.6
    131, 136, 141, nan; ...     % Row NO.7 -> subplot NO.7
    151, 156, 161, nan; ...     % Row NO.8 -> subplot NO.8
];
plotSectionDatas(FiveTransmitter, 'x', params, '-');

% Also you can use ':' operator to choose slice parameter values
params = [
    71:10:101; ...  % Row NO.1 -> subplot NO.1
    111:10:141; ...  % Row NO.2 -> subplot NO.2
    151:10:181; ...  % Row NO.3 -> subplot NO.3
    191:10:221; ...  % Row NO.4 -> subplot NO.4
];
plotSectionDatas(FiveTransmitter, 'y', params, '-');


%%
toc
