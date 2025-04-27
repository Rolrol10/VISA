%% Clear
clearvars;
clear;
close all;
%% Importer data fra celle 1
celle_1_ved_1a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_1.0A_2025-03-01_14-35-57.csv'); % Opens file in read mode
celle_1_ved_3a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_3A_2025-03-02_21-35-01.csv'); % Opens file in read mode
celle_1_ved_5a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_5.0A_2025-03-02_13-51-25.csv'); % Opens file in read mode
celle_1_ved_7_5a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_7.5A_2025-03-02_17-17-43.csv'); % Opens file in read mode

%% Importer data fra celle 2
celle_2_ved_1a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_1A_2025-03-03_06-55-19.csv'); % Opens file in read mode
celle_2_ved_3a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_3A_2025-03-03_13-04-16.csv'); % Opens file in read mode
celle_2_ved_5a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_5.0A_2025-03-02_14-48-31.csv'); % Opens file in read mode
celle_2_ved_7_5a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_7.5A_2025-03-02_19-14-37.csv'); % Opens file in read mode

%% Importer data fra celle 4
celle_4_ved_1a = readtable('Filtered\Filtrert_Last_med_celle_4_ved_1A_2025-03-03_14-50-45.csv'); % Opens file in read mode
celle_4_ved_3a = readtable('Filtered\Filtrert_Last_med_celle_4_ved_3A_2025-03-02_20-00-27.csv'); % Opens file in read mode
celle_4_ved_5a = readtable('Filtered\Filtrert_Last_med_celle_4_ved_5.0A_2025-03-02_11-50-30.csv'); % Opens file in read mode
celle_4_ved_7_5a = readtable('Filtered\Filtrert_Last_med_celle_4_ved_7.5A_2025-03-02_16-24-04.csv'); % Opens file in read mode

%% Spenninger for celle 1
celle_1_ved_1a_volt = table2array(celle_1_ved_1a(:,1));
celle_1_ved_3a_volt = table2array(celle_1_ved_3a(:,1));
celle_1_ved_5a_volt = table2array(celle_1_ved_5a(:,1));
celle_1_ved_7_5a_volt = table2array(celle_1_ved_7_5a(:,1));

%% Spenninger for celle 2
celle_2_ved_1a_volt = table2array(celle_2_ved_1a(:,1));
celle_2_ved_3a_volt = table2array(celle_2_ved_3a(:,1));
celle_2_ved_5a_volt = table2array(celle_2_ved_5a(:,1));
celle_2_ved_7_5a_volt = table2array(celle_2_ved_7_5a(:,1));

%% Spenninger for celle 4
celle_4_ved_1a_volt = table2array(celle_4_ved_1a(:,1));
celle_4_ved_3a_volt = table2array(celle_4_ved_3a(:,1));
celle_4_ved_5a_volt = table2array(celle_4_ved_5a(:,1));
celle_4_ved_7_5a_volt = table2array(celle_4_ved_7_5a(:,1));

%% Strøm for celle 1
celle_1_ved_1a_current = table2array(celle_1_ved_1a(:,2));
celle_1_ved_3a_current = table2array(celle_1_ved_3a(:,2));
celle_1_ved_5a_current = table2array(celle_1_ved_5a(:,2));
celle_1_ved_7_5a_current = table2array(celle_1_ved_7_5a(:,2));

%% Strøm for celle 2
celle_2_ved_1a_current = table2array(celle_2_ved_1a(:,2));
celle_2_ved_3a_current = table2array(celle_2_ved_3a(:,2));
celle_2_ved_5a_current = table2array(celle_2_ved_5a(:,2));
celle_2_ved_7_5a_current = table2array(celle_2_ved_7_5a(:,2));

%% Strøm for celle 4
celle_4_ved_1a_current = table2array(celle_4_ved_1a(:,2));
celle_4_ved_3a_current = table2array(celle_4_ved_3a(:,2));
celle_4_ved_5a_current = table2array(celle_4_ved_5a(:,2));
celle_4_ved_7_5a_current = table2array(celle_4_ved_7_5a(:,2));

%% Effekt (Power) for celle 1
celle_1_ved_1a_power = table2array(celle_1_ved_1a(:,3));
celle_1_ved_3a_power = table2array(celle_1_ved_3a(:,3));
celle_1_ved_5a_power = table2array(celle_1_ved_5a(:,3));
celle_1_ved_7_5a_power = table2array(celle_1_ved_7_5a(:,3));

%% Effekt (Power) for celle 2
celle_2_ved_1a_power = table2array(celle_2_ved_1a(:,3));
celle_2_ved_3a_power = table2array(celle_2_ved_3a(:,3));
celle_2_ved_5a_power = table2array(celle_2_ved_5a(:,3));
celle_2_ved_7_5a_power = table2array(celle_2_ved_7_5a(:,3));

%% Effekt (Power) for celle 4
celle_4_ved_1a_power = table2array(celle_4_ved_1a(:,3));
celle_4_ved_3a_power = table2array(celle_4_ved_3a(:,3));
celle_4_ved_5a_power = table2array(celle_4_ved_5a(:,3));
celle_4_ved_7_5a_power = table2array(celle_4_ved_7_5a(:,3));

%% Motstand (Resistance) for celle 1
celle_1_ved_1a_res = table2array(celle_1_ved_1a(:,4));
celle_1_ved_3a_res = table2array(celle_1_ved_3a(:,4));
celle_1_ved_5a_res = table2array(celle_1_ved_5a(:,4));
celle_1_ved_7_5a_res = table2array(celle_1_ved_7_5a(:,4));

%% Motstand (Resistance) for celle 2
celle_2_ved_1a_res = table2array(celle_2_ved_1a(:,4));
celle_2_ved_3a_res = table2array(celle_2_ved_3a(:,4));
celle_2_ved_5a_res = table2array(celle_2_ved_5a(:,4));
celle_2_ved_7_5a_res = table2array(celle_2_ved_7_5a(:,4));

%% Motstand (Resistance) for celle 4
celle_4_ved_1a_res = table2array(celle_4_ved_1a(:,4));
celle_4_ved_3a_res = table2array(celle_4_ved_3a(:,4));
celle_4_ved_5a_res = table2array(celle_4_ved_5a(:,4));
celle_4_ved_7_5a_res = table2array(celle_4_ved_7_5a(:,4));

%% Kapasitet brukt (Capacity Used) for celle 1
celle_1_ved_1a_capa = table2array(celle_1_ved_1a(:,5));
celle_1_ved_3a_capa = table2array(celle_1_ved_3a(:,5));
celle_1_ved_5a_capa = table2array(celle_1_ved_5a(:,5));
celle_1_ved_7_5a_capa = table2array(celle_1_ved_7_5a(:,5));

%% Kapasitet brukt (Capacity Used) for celle 2
celle_2_ved_1a_capa = table2array(celle_2_ved_1a(:,5));
celle_2_ved_3a_capa = table2array(celle_2_ved_3a(:,5));
celle_2_ved_5a_capa = table2array(celle_2_ved_5a(:,5));
celle_2_ved_7_5a_capa = table2array(celle_2_ved_7_5a(:,5));

%% Kapasitet brukt (Capacity Used) for celle 4
celle_4_ved_1a_capa = table2array(celle_4_ved_1a(:,5));
celle_4_ved_3a_capa = table2array(celle_4_ved_3a(:,5));
celle_4_ved_5a_capa = table2array(celle_4_ved_5a(:,5));
celle_4_ved_7_5a_capa = table2array(celle_4_ved_7_5a(:,5));


%% Tidsdata for celle 1
celle_1_ved_1a_time = table2array(celle_1_ved_1a(:,6));
celle_1_ved_3a_time = table2array(celle_1_ved_3a(:,6));
celle_1_ved_5a_time = table2array(celle_1_ved_5a(:,6));
celle_1_ved_7_5a_time = table2array(celle_1_ved_7_5a(:,6));

%% Tidsdata for celle 2
celle_2_ved_1a_time = table2array(celle_2_ved_1a(:,6));
celle_2_ved_3a_time = table2array(celle_2_ved_3a(:,6));
celle_2_ved_5a_time = table2array(celle_2_ved_5a(:,6));
celle_2_ved_7_5a_time = table2array(celle_2_ved_7_5a(:,6));

%% Tidsdata for celle 4
celle_4_ved_1a_time = table2array(celle_4_ved_1a(:,6));
celle_4_ved_3a_time = table2array(celle_4_ved_3a(:,6));
celle_4_ved_5a_time = table2array(celle_4_ved_5a(:,6));
celle_4_ved_7_5a_time = table2array(celle_4_ved_7_5a(:,6));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Find the maximum length (celle_2_ved_1a)
max_length = length(celle_2_ved_1a_time);

%% Function to pad shorter signals with NaN to make them fit in plot
pad_signal = @(y) [y(:); NaN(max_length - length(y), 1)];

%% Pad voltage to match the longest one
volt_1a_1 = pad_signal(celle_1_ved_1a_volt);
volt_1a_2 = pad_signal(celle_2_ved_1a_volt);
volt_1a_3 = pad_signal(celle_4_ved_1a_volt);
%
volt_3a_1 = pad_signal(celle_1_ved_3a_volt);
volt_3a_2 = pad_signal(celle_2_ved_3a_volt);
volt_3a_3 = pad_signal(celle_4_ved_3a_volt);
%
volt_5a_1 = pad_signal(celle_1_ved_5a_volt);
volt_5a_2 = pad_signal(celle_2_ved_5a_volt);
volt_5a_3 = pad_signal(celle_4_ved_5a_volt);
%
volt_7_5a_1 = pad_signal(celle_1_ved_7_5a_volt);
volt_7_5a_2 = pad_signal(celle_2_ved_7_5a_volt);
volt_7_5a_3 = pad_signal(celle_4_ved_7_5a_volt);

%% Samler spenningsvariabler (Voltage Variables)
volt_1a = [volt_1a_1, volt_1a_2, volt_1a_3];
volt_3a = [volt_3a_1, volt_3a_2, volt_3a_3];
volt_5a = [volt_5a_1, volt_5a_2, volt_5a_3];
volt_7_5a = [volt_7_5a_1, volt_7_5a_2, volt_7_5a_3];

%% Pad current to match the longest one
current_1a_1 = pad_signal(celle_1_ved_1a_current);
current_1a_2 = pad_signal(celle_2_ved_1a_current);
current_1a_3 = pad_signal(celle_4_ved_1a_current);

current_3a_1 = pad_signal(celle_1_ved_3a_current);
current_3a_2 = pad_signal(celle_2_ved_3a_current);
current_3a_3 = pad_signal(celle_4_ved_3a_current);

current_5a_1 = pad_signal(celle_1_ved_5a_current);
current_5a_2 = pad_signal(celle_2_ved_5a_current);
current_5a_3 = pad_signal(celle_4_ved_5a_current);

current_7_5a_1 = pad_signal(celle_1_ved_7_5a_current);
current_7_5a_2 = pad_signal(celle_2_ved_7_5a_current);
current_7_5a_3 = pad_signal(celle_4_ved_7_5a_current);

%% Samler strømvariabler (Current Variables)
current_1a = [current_1a_1, current_1a_2, current_1a_3];
current_3a = [current_3a_1, current_3a_2, current_3a_3];
current_5a = [current_5a_1, current_5a_2, current_5a_3];
current_7_5a = [current_7_5a_1, current_7_5a_2, current_7_5a_3];

%% Pad power to match the longest one
power_1a_1 = pad_signal(celle_1_ved_1a_power);
power_1a_2 = pad_signal(celle_2_ved_1a_power);
power_1a_3 = pad_signal(celle_4_ved_1a_power);

power_3a_1 = pad_signal(celle_1_ved_3a_power);
power_3a_2 = pad_signal(celle_2_ved_3a_power);
power_3a_3 = pad_signal(celle_4_ved_3a_power);

power_5a_1 = pad_signal(celle_1_ved_5a_power);
power_5a_2 = pad_signal(celle_2_ved_5a_power);
power_5a_3 = pad_signal(celle_4_ved_5a_power);

power_7_5a_1 = pad_signal(celle_1_ved_7_5a_power);
power_7_5a_2 = pad_signal(celle_2_ved_7_5a_power);
power_7_5a_3 = pad_signal(celle_4_ved_7_5a_power);

%% Samler effektvariabler (Power Variables)
power_1a = [power_1a_1, power_1a_2, power_1a_3];
power_3a = [power_3a_1, power_3a_2, power_3a_3];
power_5a = [power_5a_1, power_5a_2, power_5a_3];
power_7_5a = [power_7_5a_1, power_7_5a_2, power_7_5a_3];

%% Pad resistance to match the longest one
res_1a_1 = pad_signal(celle_1_ved_1a_res);
res_1a_2 = pad_signal(celle_2_ved_1a_res);
res_1a_3 = pad_signal(celle_4_ved_1a_res);

res_3a_1 = pad_signal(celle_1_ved_3a_res);
res_3a_2 = pad_signal(celle_2_ved_3a_res);
res_3a_3 = pad_signal(celle_4_ved_3a_res);

res_5a_1 = pad_signal(celle_1_ved_5a_res);
res_5a_2 = pad_signal(celle_2_ved_5a_res);
res_5a_3 = pad_signal(celle_4_ved_5a_res);

res_7_5a_1 = pad_signal(celle_1_ved_7_5a_res);
res_7_5a_2 = pad_signal(celle_2_ved_7_5a_res);
res_7_5a_3 = pad_signal(celle_4_ved_7_5a_res);

%% Samler motstandsvariabler (Resistance Variables)
res_1a = [res_1a_1, res_1a_2, res_1a_3];
res_3a = [res_3a_1, res_3a_2, res_3a_3];
res_5a = [res_5a_1, res_5a_2, res_5a_3];
res_7_5a = [res_7_5a_1, res_7_5a_2, res_7_5a_3];

%% Pad capacity to match the longest one
capa_1a_1 = pad_signal(celle_1_ved_1a_capa);
capa_1a_2 = pad_signal(celle_2_ved_1a_capa);
capa_1a_3 = pad_signal(celle_4_ved_1a_capa);

capa_3a_1 = pad_signal(celle_1_ved_3a_capa);
capa_3a_2 = pad_signal(celle_2_ved_3a_capa);
capa_3a_3 = pad_signal(celle_4_ved_3a_capa);

capa_5a_1 = pad_signal(celle_1_ved_5a_capa);
capa_5a_2 = pad_signal(celle_2_ved_5a_capa);
capa_5a_3 = pad_signal(celle_4_ved_5a_capa);

capa_7_5a_1 = pad_signal(celle_1_ved_7_5a_capa);
capa_7_5a_2 = pad_signal(celle_2_ved_7_5a_capa);
capa_7_5a_3 = pad_signal(celle_4_ved_7_5a_capa);

%% Samler kapasitetsvariabler (Capacity Used Variables)
capa_1a = [capa_1a_1, capa_1a_2, capa_1a_3];
capa_3a = [capa_3a_1, capa_3a_2, capa_3a_3];
capa_5a = [capa_5a_1, capa_5a_2, capa_5a_3];
capa_7_5a = [capa_7_5a_1, capa_7_5a_2, capa_7_5a_3];


%% Pad time to match the longest one
time_1a_1 = pad_signal(celle_1_ved_1a_time);
time_1a_2 = pad_signal(celle_2_ved_1a_time);
time_1a_3 = pad_signal(celle_4_ved_1a_time);

time_3a_1 = pad_signal(celle_1_ved_3a_time);
time_3a_2 = pad_signal(celle_2_ved_3a_time);
time_3a_3 = pad_signal(celle_4_ved_3a_time);

time_5a_1 = pad_signal(celle_1_ved_5a_time);
time_5a_2 = pad_signal(celle_2_ved_5a_time);
time_5a_3 = pad_signal(celle_4_ved_5a_time);

time_7_5a_1 = pad_signal(celle_1_ved_7_5a_time);
time_7_5a_2 = pad_signal(celle_2_ved_7_5a_time);
time_7_5a_3 = pad_signal(celle_4_ved_7_5a_time);

%% Samler tidsvariabler (Time Variables)
time_1a = [time_1a_1, time_1a_2, time_1a_3];
time_3a = [time_3a_1, time_3a_2, time_3a_3];
time_5a = [time_5a_1, time_5a_2, time_5a_3];
time_7_5a = [time_7_5a_1, time_7_5a_2, time_7_5a_3];

%% Plot
hold on;
plot(time_1a,volt_1a)
plot(time_3a, volt_3a)
plot(time_5a, volt_5a)
plot(time_7_5a, volt_7_5a)
hold off;

% Plot all signals on the same graph
%figure;
%hold on;
%plot(x, y1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Volt');
%plot(x, y2, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Volt_2');
%plot(time, y3, 'g-.', 'LineWidth', 1.5, 'DisplayName', 'Watt');
%plot(time, y4, 'm:', 'LineWidth', 1.5, 'DisplayName', 'Motstand');
%plot(time, y5, 'k-', 'LineWidth', 2, 'DisplayName', 'Capacity used');

% Formatting
%xlabel('Time (seconds)');
%ylabel('Signal Amplitude');
%title('Plot of Multiple Signals Over Time');
%legend show;
%grid on;
%hold off;

















