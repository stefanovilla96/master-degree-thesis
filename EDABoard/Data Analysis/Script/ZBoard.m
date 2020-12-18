clc
clear
%% Resistenze S6-S7 OFF DI S2

%R teorico = 23.7 kΩ + 	42.2 kΩ =  65.9 kΩ

file_txt = 'R_S6-S7_OFF.txt';
t = readtable(file_txt,'ReadVariableNames',false);

figure
plot(t.Var2(2:end).*1e-3);
title('Noise with R S6&S7 OFF on S2');
ylabel('R(k\Omega)');
xlabel('Time');
mean_str = {'Mean', strcat(num2str(mean(t.Var2(2:end - 1)*1e-3)), ' k\Omega')};
std_str = {'Std: ', num2str(std(t.Var2(2:end - 1))*1e-3)};
text(200, 65.5, mean_str);
text(100, 65.5, std_str);
%% %% Resistenze S1-S2-S3-S10 OFF DI S2

%R teorico = 100Ω + 200Ω + 300Ω + 	200kΩ =  200.600kΩ
file_txt = 'R_S1-S2-S3-S10_OFF.txt';
t = readtable(file_txt,'ReadVariableNames',false);

figure
plot(t.Var2(2:end).*1e-3);
title('Noise with R S1&S2&S3&S10 OFF on S2');
ylabel('R(k\Omega)');
xlabel('Time');
mean_str = {'Mean', strcat(num2str(mean(t.Var2(2:end - 1)*1e-3)), ' k\Omega')};
std_str = {'Std: ', num2str(std(t.Var2(2:end - 1))*1e-3)};
ylim([204 206]);
text(200, 205, mean_str);
text(100, 205, std_str);
