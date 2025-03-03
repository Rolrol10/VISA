%% Importer data fra celle 1
celle_1_ved_1a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_1.0A_2025-03-01_14-35-57.csv'); % Opens file in read mode
celle_1_ved_3a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_3A_2025-03-02_21-35-01.csv'); % Opens file in read mode
celle_1_ved_5a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_5.0A_2025-03-02_13-51-25.csv'); % Opens file in read mode
celle_1_ved_7_5a = readtable('Filtered\Filtrert_Last_med_celle_1_ved_7.5A_2025-03-02_17-17-43.csv'); % Opens file in read mode

%% Importer data fra celle 2
celle_2_ved_1a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_1A_2025-03-03_06-55-19.csv'); % Opens file in read mode
%celle_2_ved_3a = readtable('Filtered\'); % Opens file in read mode
celle_2_ved_5a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_5.0A_2025-03-02_14-48-31.csv'); % Opens file in read mode
celle_2_ved_7_5a = readtable('Filtered\Filtrert_Last_med_celle_2_ved_7.5A_2025-03-02_19-14-37.csv'); % Opens file in read mode

%% Importer data fra celle 4
% celle_4_ved_1a = readtable('Filtered\'); % Opens file in read mode
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

%% Samler spenningsvariabler (Voltage Variables)
volt_1a = [celle_1_ved_1a_volt, celle_2_ved_1a_volt, celle_4_ved_1a_volt];
volt_3a = [celle_1_ved_3a_volt, celle_2_ved_3a_volt, celle_4_ved_3a_volt];
volt_5a = [celle_1_ved_5a_volt, celle_2_ved_5a_volt, celle_4_ved_5a_volt];
volt_7_5a = [celle_1_ved_7_5a_volt, celle_2_ved_7_5a_volt, celle_4_ved_7_5a_volt];

%% Samler strømvariabler (Current Variables)
current_1a = [celle_1_ved_1a_current, celle_2_ved_1a_current, celle_4_ved_1a_current];
current_3a = [celle_1_ved_3a_current, celle_2_ved_3a_current, celle_4_ved_3a_current];
current_5a = [celle_1_ved_5a_current, celle_2_ved_5a_current, celle_4_ved_5a_current];
current_7_5a = [celle_1_ved_7_5a_current, celle_2_ved_7_5a_current, celle_4_ved_7_5a_current];

%% Samler effektvariabler (Power Variables)
power_1a = [celle_1_ved_1a_power, celle_2_ved_1a_power, celle_4_ved_1a_power];
power_3a = [celle_1_ved_3a_power, celle_2_ved_3a_power, celle_4_ved_3a_power];
power_5a = [celle_1_ved_5a_power, celle_2_ved_5a_power, celle_4_ved_5a_power];
power_7_5a = [celle_1_ved_7_5a_power, celle_2_ved_7_5a_power, celle_4_ved_7_5a_power];

%% Samler motstandsvariabler (Resistance Variables)
res_1a = [celle_1_ved_1a_res, celle_2_ved_1a_res, celle_4_ved_1a_res];
res_3a = [celle_1_ved_3a_res, celle_2_ved_3a_res, celle_4_ved_3a_res];
res_5a = [celle_1_ved_5a_res, celle_2_ved_5a_res, celle_4_ved_5a_res];
res_7_5a = [celle_1_ved_7_5a_res, celle_2_ved_7_5a_res, celle_4_ved_7_5a_res];

%% Samler kapasitetsvariabler (Capacity Used Variables)
capa_1a = [celle_1_ved_1a_capa, celle_2_ved_1a_capa, celle_4_ved_1a_capa];
capa_3a = [celle_1_ved_3a_capa, celle_2_ved_3a_capa, celle_4_ved_3a_capa];
capa_5a = [celle_1_ved_5a_capa, celle_2_ved_5a_capa, celle_4_ved_5a_capa];
capa_7_5a = [celle_1_ved_7_5a_capa, celle_2_ved_7_5a_capa, celle_4_ved_7_5a_capa];

%% Samler tidsvariabler (Time Variables)
time_1a = [celle_1_ved_1a_time, celle_2_ved_1a_time, celle_4_ved_1a_time];
time_3a = [celle_1_ved_3a_time, celle_2_ved_3a_time, celle_4_ved_3a_time];
time_5a = [celle_1_ved_5a_time, celle_2_ved_5a_time, celle_4_ved_5a_time];
time_7_5a = [celle_1_ved_7_5a_time, celle_2_ved_7_5a_time, celle_4_ved_7_5a_time];

%% Find the maximum length
max_length = length(time_1a);

%% Function to pad shorter signals with NaN
pad_signal = @(y) [y(:); NaN(max_length - length(y), 1)];

% Pad signals to match the longest one
if exist('y1', 'var') && ~isempty(y1), y1 = pad_signal(y1); end
if exist('y2', 'var') && ~isempty(y2), y2 = pad_signal(y2); end

% Plot all signals on the same graph
figure;
hold on;
plot(x, y1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Volt');
plot(x, y2, 'b--', 'LineWidth', 1.5, 'DisplayName', 'Volt_2');
%plot(time, y3, 'g-.', 'LineWidth', 1.5, 'DisplayName', 'Watt');
%plot(time, y4, 'm:', 'LineWidth', 1.5, 'DisplayName', 'Motstand');
%plot(time, y5, 'k-', 'LineWidth', 2, 'DisplayName', 'Capacity used');

% Formatting
xlabel('Time (seconds)');
ylabel('Signal Amplitude');
title('Plot of Multiple Signals Over Time');
legend show;
grid on;
hold off;

















