import pyvisa
import time
import os
import csv
from pathlib import Path

class BatteryTester:
    """Class to control the Siglent SDL1030X-E DC Electronic Load in Battery Testing Mode."""

    def __init__(self, address='USB0::0xF4EC::0x1630::SDL13GCQ7R0669::INSTR', timeout=10000):
        """Initialize connection to the instrument."""
        try:
            self.rm = pyvisa.ResourceManager()
            self.instr = self.rm.open_resource(address)

            # Set communication settings
            self.instr.timeout = timeout  # Timeout in milliseconds
            self.instr.read_termination = "\n"
            self.instr.write_termination = "\n"

            # Verify connection
            device_info = self.query("*IDN?")
            print(f"Connected to: {device_info}")

        except pyvisa.VisaIOError as e:
            print(f"Error: Unable to connect to the device. {e}")
            self.instr = None

    def write(self, command):
        """Send a command to the instrument (without expecting a response)."""
        try:
            if self.instr:
                self.instr.write(command)
        except pyvisa.VisaIOError as e:
            print(f"Error sending command '{command}': {e}")

    def query(self, command):
        """Send a query command and return the response."""
        try:
            if self.instr:
                return self.instr.query(command).strip()
        except pyvisa.VisaIOError as e:
            print(f"Error querying '{command}': {e}")
        return None

    def reset(self):
        """Reset the instrument to default settings."""
        self.write("*RST")

    def enable_battery_mode(self):
        """Enable Battery Mode."""
        self.write(":SOUR:BATT:FUNC")
        print("Battery testing mode enabled.")

    def set_discharge_mode(self, mode):
        """Set battery discharge mode: 'CC' (Constant Current), 'CP' (Constant Power), 'CR' (Constant Resistance)."""
        valid_modes = ["CURRent", "POWer", "RESistance"]
        if mode in valid_modes:
            self.write(f":SOUR:BATT:MODE {mode}")
            print(f"Battery discharge mode set to {mode}.")
        else:
            print(f"Invalid mode: {mode}. Choose from {valid_modes}.")

    def set_discharge_current(self, current):
        """Set discharge current (only in Constant Current mode)."""
        self.write(f":SOUR:BATT:LEVel {current}")
        print(f"Discharge current set to {current} A.")

    def set_cutoff_voltage(self, voltage):
        """Set battery cutoff voltage (stops discharge when reached)."""
        self.write(f":SOUR:BATT:VOLT {voltage}")
        self.write(":SOUR:BATT:VOLT:STAT ON")  # Enable cutoff voltage
        print(f"Cutoff voltage set to {voltage} V.")

    def set_cutoff_capacity(self, capacity):
        """Set battery cutoff capacity (Ah)."""
        self.write(f":SOUR:BATT:CAP {capacity}")
        self.write(":SOUR:BATT:CAP:STAT ON")  # Enable cutoff capacity
        print(f"Cutoff capacity set to {capacity} Ah.")

    def set_cutoff_time(self, time_limit):
        """Set battery cutoff time (in seconds)."""
        self.write(f":SOUR:BATT:TIM {time_limit}")
        self.write(":SOUR:BATT:TIM:STAT ON")  # Enable cutoff time
        print(f"Cutoff time set to {time_limit} seconds.")

    def start_discharge(self):
        """Start battery discharge."""
        self.write("INP ON")
        print("Battery discharge started.")

    def stop_discharge(self):
        """Stop battery discharge."""
        self.write("INP OFF")
        print("Battery discharge stopped.")

    def get_voltage(self):
        """Get measured battery voltage."""
        return self.query("MEAS:VOLT?")

    def get_current(self):
        """Get measured discharge current."""
        return self.query("MEAS:CURR?")

    def get_power(self):
        """Get measured power in watts."""
        return self.query("MEAS:POW?")
    
    def get_resist(self):
        """Get measured resistor."""
        return self.query("MEAS:RES?")

    def get_capacity(self):
        """Get total discharged capacity (Ah)."""
        return self.query(":SOUR:BATT:DISCHA:CAP?")

    def get_discharge_time(self):
        """Get total discharge time (seconds)."""
        return self.query(":SOUR:BATT:DISCHA:TIM?")

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()

    def log_data_to_csv(self, filename="battery_test_data.csv", voltage=0, current=0, power=0, resistance=0, capacity=0, discharge_time=0):
        """Log battery test parameters to a CSV file every 5 seconds for MATLAB analysis."""
        # Check if file exists to determine whether to write headers
        file_exists = os.path.isfile(filename)
        try:
            with open(filename, mode="a", newline="", encoding="utf-8") as file:
                writer = csv.writer(file)

                # Write headers only if the file is new
                if not file_exists:
                    writer.writerow(["Timestamp", "Voltage (V)", "Current (A)", "Power (W)", 
                                       "Resistance (Ω)", "Capacity used (mAh)", "Discharge Time (s)"])

                # Fetch all parameters
                #data = battery_test.get_all()
                timestamp = time.strftime("%Y-%m-%d %H:%M:%S")

                row = [timestamp, 
                       voltage,
                       current,
                       power,
                       resistance,
                       capacity,
                       discharge_time]

                writer.writerow(row)
                file.flush()  # Ensure data is written immediately
                print(f"Data logged at {timestamp}")

                # time.sleep(5)  # Log every 5 seconds

        except KeyboardInterrupt:
            print("\nLogging stopped by user.")
        except Exception as e:
            print(f"Error logging data: {e}")



# Example Usage
if __name__ == "__main__":
    # Initialize the instrument
    battery_test = BatteryTester()

    # Reset device
    battery_test.reset()
    
    # Enable battery testing mode
    battery_test.enable_battery_mode()

    # Set discharge mode (Constant Current)
    battery_test.set_discharge_mode("CURRent")

    # Set test parameters
    discharge_current = 1  # Amps                                 Skriv her
    cutoff_time = 60*60*5  # Seconds                              Og her
    celle_nummer = 4 # Id på celle for å holde styr på data

    # Log filename
    filename_unfinished = f"Last_med_celle_{celle_nummer}_ved_{discharge_current}A_{time.strftime('%Y-%m-%d_%H-%M-%S')}.csv" 

    # Create full path
    # filename = os.path.join("Data", filename_unfinished)
    sub = Path("Data")
    sub.mkdir(parents=True, exist_ok=True)
    filename = sub / filename_unfinished

    # Safety parameters
    cutoff_voltage = 2.8  # Volts
    cutoff_capacity = 4800.0  # mAh

    battery_test.set_discharge_current(discharge_current)
    battery_test.set_cutoff_voltage(cutoff_voltage-0.05)
    battery_test.set_cutoff_capacity(cutoff_capacity)
    battery_test.set_cutoff_time(cutoff_time)

    # Monitor before discharge
    for i in range(5):
        voltage = battery_test.get_voltage()
        print(voltage)
        battery_test.log_data_to_csv(filename, voltage)
        time.sleep(1)

    # Start discharge
    battery_test.start_discharge()

    # Monitor battery parameters
    while True:
        voltage = battery_test.get_voltage()
        current = battery_test.get_current()
        power = battery_test.get_power()
        resistance = battery_test.get_resist()
        capacity = battery_test.get_capacity()
        discharge_time = battery_test.get_discharge_time()

        print(f"Voltage: {voltage} V, Current: {current} A, Power: {power} W, Resistance: {resistance}, Capacity: {capacity} mAh, Time: {discharge_time} s")

        if float(voltage) <= cutoff_voltage or float(capacity) >= cutoff_capacity or float(discharge_time) >= cutoff_time:
            print("Cutoff condition reached! Stopping discharge.")
            battery_test.stop_discharge()
            break
        
        battery_test.log_data_to_csv(filename, voltage, current, power, resistance, capacity, discharge_time)

        time.sleep(1)  # Check every 10 seconds

    # Close connection
    battery_test.close()
