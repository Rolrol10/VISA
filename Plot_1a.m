
data = readtable('Last_med_1a.csv'); % Opens file in read mode
Volt = table2array(data(:,2));
Current = table2array(data(:,3));
Power = table2array(data(:,4));
Resistance = table2array(data(:,5));
Capacity_used = table2array(data(:,6));
Discharge_Time = table2array(data(:,7));


% Initialize new lists
filled_Discharge_Time = Discharge_Time(1);  
filled_Volt = Volt(1);

% Loop through original data
for i = 1:length(Discharge_Time) - 1
    % Add current value to the new list
    filled_Discharge_Time(end+1) = Discharge_Time(i+1);
    filled_Volt(end+1) = Volt(i+1);

    % Check if the next Discharge Time is 2 increments ahead
    if Discharge_Time(i+1) == Discharge_Time(i) + 2
        % Insert the missing value (average)
        mid_time = Discharge_Time(i) + 1;  % Insert missing time
        mid_volt = (Volt(i) + Volt(i+1)) / 2;  % Compute average Volt
        
        % Add to the list
        filled_Discharge_Time(end+1) = mid_time;
        filled_Volt(end+1) = mid_volt;
    end
end
