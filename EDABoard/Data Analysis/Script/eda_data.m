clc
clear
%% ADC PARAMETERS
Vfs = 3;
nbit = 12;
samples = 2^nbit;
switch_en = 2;
Rf_switch = [470*10^3 820*10^3 2.7*10^5 4.7*10^5];
Rf = Rf_switch(switch_en);
Vin = 0.5;

%% FILE PARAMETERS

file_txt = 'eda_1593778610907.txt';
file_xls = 'eda_1593778610907.xls';
%% READ DATA FROM XLS AND TXT
EDA = readtable(file_xls);
EDA.Vout = (EDA.EDA * Vfs)/samples;
EDA.G = (EDA.Vout - Vin)/Rf;

fileID = fopen(file_txt,'r');
formatSpec = '%f';
E = fscanf(fileID,formatSpec);

time(1) = E(1);
for i = 2 : size(E)
    time(i) = time(i - 1) + 10;
end

for i = 4 : size(E)
    Vo = (E(i) * Vfs / samples);
    E(i) = (Vo - Vin) / Rf;
end

figure
plot(time(1:end - 4), (E(4:end - 1).*1e6), 'LineWidth', 0.5, 'Color', 'b');

xlabel('Timestamp(ms)');
ylabel('Skin Conductance(\muS)');
title('Electrodermal Activity during Stroop Test');
hold on
start_time = xline(EDA.QuestionTime(1), '--r', 'Start test');
start_time.LabelHorizontalAlignment = 'center';
start_time.LabelVerticalAlignment = 'bottom';
start_time.HandleVisibility = 'off';
hold on
end_time = xline(EDA.AnswerTime(end), '--r', 'End test');
end_time.LabelHorizontalAlignment = 'center';
end_time.LabelVerticalAlignment = 'bottom';
end_time.HandleVisibility = 'off';
hold on
% for i = 1 : height(EDA)
%     %plot(EDA.QuestionTime(i), (EDA.G(i)), 'Marker', '*', 'MarkerSize',
%     8, 'Color', '#A2142F'); plot([EDA.QuestionTime(i),
%     EDA.AnswerTime(i)], [EDA.G(i)*1e6, EDA.G(i)*1e6], 'Color', 'red',
%     'LineWidth', 3);
% end
% 
% legend('EDA', 'delta time Q&A');

