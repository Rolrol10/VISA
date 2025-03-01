import numpy as np
import pandas as pd
teller = 0
file_path = "Last_med_1a.csv"
df = pd.read_csv(file_path)

# Debugging: Print column names to verify
print("Columns in file:", df.columns)

# Use the correct column names from your CSV
df = df[['Discharge Time (s)', 'Voltage (V)']]  # Corrected names

# Convert to NumPy arrays for easier processing
discharge_time = df['Discharge Time (s)'].to_numpy()
volt = df['Voltage (V)'].to_numpy()

for i in range(len(discharge_time) - 1):
    if discharge_time[i+1] != discharge_time[i] + 1: # Manglende tall
        
        if discharge_time[i+1] == discharge_time[i] + 2: # Mangler 1
            print(f"1")
            teller += 1
        
        if discharge_time[i+1] == discharge_time[i] + 3: # Mangler 2
            print("fuck")
            teller += 2
            
        if discharge_time[i+1] == discharge_time[i] + 4: # Mangler 3
            print("fuckfuck")
            teller += 3
print(teller + len(discharge_time))