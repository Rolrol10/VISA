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
%% Clear Unnecessary vaiables
clear celle_1_ved_1a celle_1_ved_3a celle_1_ved_5a celle_1_ved_7_5a;
clear celle_2_ved_1a celle_2_ved_3a celle_2_ved_5a celle_2_ved_7_5a;
clear celle_4_ved_1a celle_4_ved_3a celle_4_ved_5a celle_4_ved_7_5a;

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

%% Clear Original Voltage Variables
clear celle_1_ved_1a_volt celle_2_ved_1a_volt celle_4_ved_1a_volt;
clear celle_1_ved_3a_volt celle_2_ved_3a_volt celle_4_ved_3a_volt;
clear celle_1_ved_5a_volt celle_2_ved_5a_volt celle_4_ved_5a_volt;
clear celle_1_ved_7_5a_volt celle_2_ved_7_5a_volt celle_4_ved_7_5a_volt;


%% Samler spenningsvariabler (Voltage Variables)
volt_1a = [volt_1a_1, volt_1a_2, volt_1a_3];
volt_3a = [volt_3a_1, volt_3a_2, volt_3a_3];
volt_5a = [volt_5a_1, volt_5a_2, volt_5a_3];
volt_7_5a = [volt_7_5a_1, volt_7_5a_2, volt_7_5a_3];

%% Clear Voltage vaiables
clear volt_1a_1 volt_1a_2 volt_1a_3;
clear volt_3a_1 volt_3a_2 volt_3a_3;
clear volt_5a_1 volt_5a_2 volt_5a_3;
clear volt_7_5a_1 volt_7_5a_2 volt_7_5a_3;

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

%% Clear Original Current Variables
clear celle_1_ved_1a_current celle_2_ved_1a_current celle_4_ved_1a_current;
clear celle_1_ved_3a_current celle_2_ved_3a_current celle_4_ved_3a_current;
clear celle_1_ved_5a_current celle_2_ved_5a_current celle_4_ved_5a_current;
clear celle_1_ved_7_5a_current celle_2_ved_7_5a_current celle_4_ved_7_5a_current;

%% Samler strømvariabler (Current Variables)
current_1a = [current_1a_1, current_1a_2, current_1a_3];
current_3a = [current_3a_1, current_3a_2, current_3a_3];
current_5a = [current_5a_1, current_5a_2, current_5a_3];
current_7_5a = [current_7_5a_1, current_7_5a_2, current_7_5a_3];

%% Clear Current Variables
clear current_1a_1 current_1a_2 current_1a_3;
clear current_3a_1 current_3a_2 current_3a_3;
clear current_5a_1 current_5a_2 current_5a_3;
clear current_7_5a_1 current_7_5a_2 current_7_5a_3;

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

%% Clear Original Power Variables
clear celle_1_ved_1a_power celle_2_ved_1a_power celle_4_ved_1a_power;
clear celle_1_ved_3a_power celle_2_ved_3a_power celle_4_ved_3a_power;
clear celle_1_ved_5a_power celle_2_ved_5a_power celle_4_ved_5a_power;
clear celle_1_ved_7_5a_power celle_2_ved_7_5a_power celle_4_ved_7_5a_power;

%% Samler effektvariabler (Power Variables)
power_1a = [power_1a_1, power_1a_2, power_1a_3];
power_3a = [power_3a_1, power_3a_2, power_3a_3];
power_5a = [power_5a_1, power_5a_2, power_5a_3];
power_7_5a = [power_7_5a_1, power_7_5a_2, power_7_5a_3];

%% Clear Power Variables
clear power_1a_1 power_1a_2 power_1a_3;
clear power_3a_1 power_3a_2 power_3a_3;
clear power_5a_1 power_5a_2 power_5a_3;
clear power_7_5a_1 power_7_5a_2 power_7_5a_3;

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

%% Clear Original Resistance Variables
clear celle_1_ved_1a_res celle_2_ved_1a_res celle_4_ved_1a_res;
clear celle_1_ved_3a_res celle_2_ved_3a_res celle_4_ved_3a_res;
clear celle_1_ved_5a_res celle_2_ved_5a_res celle_4_ved_5a_res;
clear celle_1_ved_7_5a_res celle_2_ved_7_5a_res celle_4_ved_7_5a_res;

%% Samler motstandsvariabler (Resistance Variables)
res_1a = [res_1a_1, res_1a_2, res_1a_3];
res_3a = [res_3a_1, res_3a_2, res_3a_3];
res_5a = [res_5a_1, res_5a_2, res_5a_3];
res_7_5a = [res_7_5a_1, res_7_5a_2, res_7_5a_3];

%% Clear Resistance Variables
clear res_1a_1 res_1a_2 res_1a_3;
clear res_3a_1 res_3a_2 res_3a_3;
clear res_5a_1 res_5a_2 res_5a_3;
clear res_7_5a_1 res_7_5a_2 res_7_5a_3;

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

%% Clear Original Capacity Variables
clear celle_1_ved_1a_capa celle_2_ved_1a_capa celle_4_ved_1a_capa;
clear celle_1_ved_3a_capa celle_2_ved_3a_capa celle_4_ved_3a_capa;
clear celle_1_ved_5a_capa celle_2_ved_5a_capa celle_4_ved_5a_capa;
clear celle_1_ved_7_5a_capa celle_2_ved_7_5a_capa celle_4_ved_7_5a_capa;

%% Samler kapasitetsvariabler (Capacity Used Variables)
capa_1a = [capa_1a_1, capa_1a_2, capa_1a_3];
capa_3a = [capa_3a_1, capa_3a_2, capa_3a_3];
capa_5a = [capa_5a_1, capa_5a_2, capa_5a_3];
capa_7_5a = [capa_7_5a_1, capa_7_5a_2, capa_7_5a_3];

%% Clear Capacity Variables
clear capa_1a_1 capa_1a_2 capa_1a_3;
clear capa_3a_1 capa_3a_2 capa_3a_3;
clear capa_5a_1 capa_5a_2 capa_5a_3;
clear capa_7_5a_1 capa_7_5a_2 capa_7_5a_3;

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

%% Clear Original Time Variables
clear celle_1_ved_1a_time celle_2_ved_1a_time celle_4_ved_1a_time;
clear celle_1_ved_3a_time celle_2_ved_3a_time celle_4_ved_3a_time;
clear celle_1_ved_5a_time celle_2_ved_5a_time celle_4_ved_5a_time;
clear celle_1_ved_7_5a_time celle_2_ved_7_5a_time celle_4_ved_7_5a_time;

%% Samler tidsvariabler (Time Variables)
time_1a = [time_1a_1, time_1a_2, time_1a_3];
time_3a = [time_3a_1, time_3a_2, time_3a_3];
time_5a = [time_5a_1, time_5a_2, time_5a_3];
time_7_5a = [time_7_5a_1, time_7_5a_2, time_7_5a_3];

%% Clear Time Variables
clear time_1a_1 time_1a_2 time_1a_3;
clear time_3a_1 time_3a_2 time_3a_3;
clear time_5a_1 time_5a_2 time_5a_3;
clear time_7_5a_1 time_7_5a_2 time_7_5a_3;

%% Compute average of voltage values
volt_1a_avg = mean(volt_1a, 2, 'omitnan');
volt_3a_avg = mean(volt_3a, 2, 'omitnan');
volt_5a_avg = mean(volt_5a, 2, 'omitnan');
volt_7_5a_avg = mean(volt_7_5a, 2, 'omitnan');

%% Clear Combined Voltage Variables
clear volt_1a volt_3a volt_5a volt_7_5a;

%% Compute average of current values
current_1a_avg = mean(current_1a, 2, 'omitnan');
current_3a_avg = mean(current_3a, 2, 'omitnan');
current_5a_avg = mean(current_5a, 2, 'omitnan');
current_7_5a_avg = mean(current_7_5a, 2, 'omitnan');

%% Clear Combined Current Variables
clear current_1a current_3a current_5a current_7_5a;

%% Compute average of power values
power_1a_avg = mean(power_1a, 2, 'omitnan');
power_3a_avg = mean(power_3a, 2, 'omitnan');
power_5a_avg = mean(power_5a, 2, 'omitnan');
power_7_5a_avg = mean(power_7_5a, 2, 'omitnan');

%% Clear Combined Power Variables
clear power_1a power_3a power_5a power_7_5a;

%% Compute average of resistance values
res_1a_avg = mean(res_1a, 2, 'omitnan');
res_3a_avg = mean(res_3a, 2, 'omitnan');
res_5a_avg = mean(res_5a, 2, 'omitnan');
res_7_5a_avg = mean(res_7_5a, 2, 'omitnan');

%% Clear Combined Resistance Variables
clear res_1a res_3a res_5a res_7_5a;

%% Compute average of capacity values
capa_1a_avg = mean(capa_1a, 2, 'omitnan');
capa_3a_avg = mean(capa_3a, 2, 'omitnan');
capa_5a_avg = mean(capa_5a, 2, 'omitnan');
capa_7_5a_avg = mean(capa_7_5a, 2, 'omitnan');

%% Clear Combined Capacity Variables
clear capa_1a capa_3a capa_5a capa_7_5a;

%% Compute average of time values
time_1a_avg = mean(time_1a, 2, 'omitnan');
time_3a_avg = mean(time_3a, 2, 'omitnan');
time_5a_avg = mean(time_5a, 2, 'omitnan');
time_7_5a_avg = mean(time_7_5a, 2, 'omitnan');

%% Clear Combined Time Variables
clear time_1a time_3a time_5a time_7_5a;
