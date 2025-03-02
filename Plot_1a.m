
data = readtable('Last_med_1a.csv'); % Opens file in read mode

Volt = table2array(data(:,2));
Current = table2array(data(:,3));
Power = table2array(data(:,4));
Resistance = table2array(data(:,5));
Capacity_used = table2array(data(:,6));
Discharge_Time = table2array(data(:,7));

x = Discharge_Time;
y = Volt;

x_new = linspace(min(x), max(x), length(x)); % Generate new evenly spaced x
y_new = interp1(x, y, x_new, 'linear'); % Linear interpolation

plot(x_new, y_new);


%plot(Discharge_Time, Volt)