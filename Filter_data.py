import numpy as np
import pandas as pd
from pathlib import Path
import csv
import os

teller = 0
teller_2 = 0
filename = str(input("Filnavn med filtype: "))
write_filename = f"Filtrert_{filename}"
folder = Path("Data")
write_folder = Path("Filtered")
write_folder.mkdir(parents=True, exist_ok=True)
file_path = folder / filename
write_path = write_folder / write_filename

df = pd.read_csv(file_path, encoding="utf-8")

def log_data_to_csv(behandled, filename="battery_test_data.csv"):
    """Log battery test parameters to a CSV file every 5 seconds for MATLAB analysis."""
    # Check if file exists to determine whether to write headers
    file_exists = os.path.isfile(filename)
    try:
        with open(filename, mode="a", newline="", encoding="utf-8") as file:
            writer = csv.writer(file)

            # Write headers only if the file is new
            if not file_exists:
                writer.writerow(["Voltage (V)", "Current (A)", "Power (W)", 
                                   "Resistance (Ω)", "Capacity used (mAh)", "Discharge Time (s)"])
                for i in range(5):
                    row = [volt[i],
                           straum[i],
                           effekt[i],
                           motstand[i],
                           kapasitet[i],
                           (-5+i)]
                    writer.writerow(row)
            # Fetch all parameters
            for i in range(len(behandled)):
                row = behandled[i]

                writer.writerow(row)
                file.flush()  # Ensure data is written immediately

    except KeyboardInterrupt:
        print("\nLogging stopped by user.")
    except Exception as e:
        print(f"Error logging data: {e}")


# Debugging: Print column names to verify
print("Columns in file:", df.columns)

# Use the correct column names from your CSV
df = df[['Voltage (V)', 'Current (A)', 'Power (W)', 'Resistance (Ω)', 'Capacity used (mAh)', 'Discharge Time (s)']]  # Corrected names

# Convert to NumPy arrays for easier processing
volt = df['Voltage (V)'].to_numpy()
straum = df['Current (A)'].to_numpy()
effekt = df['Power (W)'].to_numpy()
motstand = df['Resistance (Ω)'].to_numpy()
kapasitet = df['Capacity used (mAh)'].to_numpy()
discharge_time = df['Discharge Time (s)'].to_numpy()

behandlet = []
for i in range(5, len(discharge_time) - 1):

    if (discharge_time[i+1] != discharge_time[i] + 1): # Manglende tall    
        
        # Variables for volt
        current_v = volt[i]
        next_v = volt[i + 1]
        # Variables for straum
        current_a = straum[i]
        next_a = straum[i + 1]
        # Variables for effekt
        current_w = effekt[i]
        next_w = effekt[i + 1]
        # Variables for motstand
        current_r = motstand[i]
        next_r = motstand[i + 1]
        # Variables for kapasitet
        current_c = kapasitet[i]
        next_c = kapasitet[i + 1]
        # Variables for discharge time
        current = discharge_time[i]
        next = discharge_time[i + 1]
        diff = next - current

        # Step 1: Generate the sequence using linspace
        filled_values_v = np.linspace(current_v, next_v, diff + 1)  # +2 to include start & end
        filled_values_a = np.linspace(current_a, next_a, diff + 1)  # +2 to include start & end
        filled_values_w = np.linspace(current_w, next_w, diff + 1)  # +2 to include start & end
        filled_values_r = np.linspace(current_r, next_r, diff + 1)  # +2 to include start & end
        filled_values_c = np.linspace(current_c, next_c, diff + 1)  # +2 to include start & end
        filled_values = np.linspace(current, next, diff + 1)  # +2 to include start & end

        # Step 2: Convert to integers using rounding
        filled_list_v = np.round(filled_values_v, 6).tolist()  # Convert to list for easier use
        filled_list_a = np.round(filled_values_a, 6).tolist()  # Convert to list for easier use
        filled_list_w = np.round(filled_values_w, 6).tolist()  # Convert to list for easier use
        filled_list_r = np.round(filled_values_r, 6).tolist()  # Convert to list for easier use
        filled_list_c = np.round(filled_values_c).astype(int).tolist()  # Convert to list for easier use
        filled_list = np.round(filled_values).astype(int).tolist()  # Round to nearest integer
        # print(filled_list)



        for j in range(len(filled_list)-1):
            
            pakket = [filled_list_v[j], filled_list_a[j], filled_list_w[j], filled_list_r[j], filled_list_c[j], filled_list[j]]

            behandlet.append(pakket)
        teller += 1
        
        if discharge_time[i] == (discharge_time[len(discharge_time)-1]):
            break

    elif (discharge_time[i+1] == discharge_time[i] + 1) or (discharge_time[i] == (behandlet[len(behandlet)-1] + 1)):
        
        pakket = [volt[i], straum[i], effekt[i], motstand[i], kapasitet[i], discharge_time[i]]

        behandlet.append(pakket)
        teller_2 += 1
    elif (discharge_time[i] == discharge_time[len(discharge_time)-1]):
        break


teller = 0
teller_2 = 0
for i in range(len(behandlet)):
    bob = behandlet[i]
    bab = bob[5]
    if bab == teller:
        teller += 1
        # print(bab)
    else:
        teller_2 += 1
        print(bab)
        

print(f"Antall linjer: {teller}")
print(f"Antall feil: {teller_2}")

if teller_2 == 0:
    log_data_to_csv(behandlet,write_path)
