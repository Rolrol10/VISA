<<<<<<< HEAD
import pyvisa
import time

class PL303QMDP:
    """Class to control the Aim-TTi PL303QMD-P power supply via SCPI commands."""

    def __init__(self, address='USB0::0x0AAD::0x00E3::12345678::INSTR', timeout=10000):
        """Initialize connection to the power supply."""
        try:
            self.rm = pyvisa.ResourceManager()
            address = self.rm.list_resources()
            self.instr = self.rm.open_resource(address[0])

            # Set communication settings
            self.instr.timeout = timeout  # Timeout in milliseconds
            self.instr.read_termination = "\n"
            self.instr.write_termination = "\n"

            # Verify connection
            device_info = self.query("*IDN?")
            print(f"Connected to: {device_info}")

        except pyvisa.VisaIOError as e:
            print(f"Error: Unable to connect to the power supply. {e}")
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
        """Reset the power supply to default settings."""
        self.write("*RST")

    def set_voltage(self, channel, voltage):
        """Set output voltage for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"V{channel} {voltage}")
        else:
            print("Invalid channel. Use 1 or 2.")

    def get_voltage(self, channel):
        """Get the set voltage for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"V{channel}?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def set_current(self, channel, current):
        """Set output current limit for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"I{channel} {current}")
        else:
            print("Invalid channel. Use 1 or 2.")

    def get_current(self, channel):
        """Get the set current for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"I{channel}?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def output_on(self, channel):
        """Turn on the output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"OP{channel} 1")
        else:
            print("Invalid channel. Use 1 or 2.")

    def output_off(self, channel):
        """Turn off the output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"OP{channel} 0")
        else:
            print("Invalid channel. Use 1 or 2.")

    def measure_voltage(self, channel):
        """Measure the actual voltage output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"V{channel}O?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def measure_current(self, channel):
        """Measure the actual current output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"I{channel}O?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.output_off(1)
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()



# Example Usage
if __name__ == "__main__":
    # Initialize the power supply
    psu = PL303QMDP()

    # Reset the device
    psu.reset()

    # Sets parameters
    max_v = 4.2
    max_c = 3.0
    min_v = 3.0
    cutoff_c = 0.1
    voltage = True

    # Set initial voltage & current
    while voltage == True:
        try:
            voltage = float(input("Measure the battery and type in the voltage: "))
        except Exception:
            print("Error")

    # Venstre og Høyre Kanal på strømforsyning
    Venstre_kanal = 2
    Høyre_kanal = 1

    # Set voltage and current
    psu.set_voltage(Høyre_kanal, voltage+0.1)
    psu.set_current(Høyre_kanal, max_c)

    psu.set_voltage(Venstre_kanal, voltage+0.1)
    psu.set_current(Venstre_kanal, max_c)

    try:
        input("Check that the voltage is correct on the PSU display and then hit enter: ")
    except Exception:
        print("")

    print("\n Charging Started...\n")

    psu.output_on(Høyre_kanal)
    time.sleep(3)


    looptiloop = True
    while looptiloop:
        # Measure voltage & current
        voltage_raw = psu.measure_voltage(Høyre_kanal)
        time.sleep(1)
        current_raw = psu.measure_current(Høyre_kanal)
        time.sleep(1)
        print(voltage_raw)
        print(current_raw)
        # Extracting just the numeric value
        voltage = float(voltage_raw[:-1])
        current = float(current_raw[:-1])
    
        # print(f"Voltage: {voltage_value} V")
        # print(f"Current: {current_value} A")

        # Display status in a single line
        print(f"\r Voltage: {voltage}V | Current: {current}A")
    
        # Checks if current is too high and lowers voltage if it is
        if current > max_c and not voltage == max_v:
            new_volt = round((voltage - 0.02), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # Checks if voltage can be increased
        if (current < (max_c-0.5)) and (voltage < max_v) and not (voltage == max_v):
            new_volt = round((voltage + 0.01), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # If battery reaches max voltage, switch to constant voltage mode
        if voltage > max_v:
            psu.set_voltage(Høyre_kanal, max_v)
            # psu.set_current(Høyre_kanal, 3.0)  # Reduce current to prevent overcharging         Bør sees på

        # Stop charging if current falls below cutoff threshold (C/10 rule)
        if current < cutoff_c:
            print("\n Charging Complete! Battery is full.")
            psu.output_off(Høyre_kanal)
            break

        time.sleep(1)  # Update every 1 seconds











        # Measure voltage & current
        voltage_raw = psu.measure_voltage(Venstre_kanal)
        time.sleep(1)
        current_raw = psu.measure_current(Høyre_kanal)
        time.sleep(1)
        print(voltage_raw)
        print(current_raw)
        # Extracting just the numeric value
        voltage = float(voltage_raw[:-1])
        current = float(current_raw[:-1])
    
        # print(f"Voltage: {voltage_value} V")
        # print(f"Current: {current_value} A")

        # Display status in a single line
        print(f"\r Voltage: {voltage}V | Current: {current}A")
    
        # Checks if current is too high and lowers voltage if it is
        if current > max_c and not voltage == max_v:
            new_volt = round((voltage - 0.02), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # Checks if voltage can be increased
        if (current < (max_c-0.5)) and (voltage < max_v) and not (voltage == max_v):
            new_volt = round((voltage + 0.01), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # If battery reaches max voltage, switch to constant voltage mode
        if voltage > max_v:
            psu.set_voltage(Høyre_kanal, max_v)
            # psu.set_current(Høyre_kanal, 3.0)  # Reduce current to prevent overcharging         Bør sees på

        # Stop charging if current falls below cutoff threshold (C/10 rule)
        if current < cutoff_c:
            print("\n Charging Complete! Battery is full.")
            psu.output_off(Høyre_kanal)
            break

        time.sleep(1)  # Update every 1 seconds

=======
import pyvisa
import time

class PL303QMDP:
    """Class to control the Aim-TTi PL303QMD-P power supply via SCPI commands."""

    def __init__(self, address='USB0::0x0AAD::0x00E3::12345678::INSTR', timeout=10000):
        """Initialize connection to the power supply."""
        try:
            self.rm = pyvisa.ResourceManager()
            address = self.rm.list_resources()
            self.instr = self.rm.open_resource(address[0])

            # Set communication settings
            self.instr.timeout = timeout  # Timeout in milliseconds
            self.instr.read_termination = "\n"
            self.instr.write_termination = "\n"

            # Verify connection
            device_info = self.query("*IDN?")
            print(f"Connected to: {device_info}")

        except pyvisa.VisaIOError as e:
            print(f"Error: Unable to connect to the power supply. {e}")
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
        """Reset the power supply to default settings."""
        self.write("*RST")

    def set_voltage(self, channel, voltage):
        """Set output voltage for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"V{channel} {voltage}")
        else:
            print("Invalid channel. Use 1 or 2.")

    def get_voltage(self, channel):
        """Get the set voltage for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"V{channel}?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def set_current(self, channel, current):
        """Set output current limit for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"I{channel} {current}")
        else:
            print("Invalid channel. Use 1 or 2.")

    def get_current(self, channel):
        """Get the set current for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"I{channel}?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def output_on(self, channel):
        """Turn on the output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"OP{channel} 1")
        else:
            print("Invalid channel. Use 1 or 2.")

    def output_off(self, channel):
        """Turn off the output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            self.write(f"OP{channel} 0")
        else:
            print("Invalid channel. Use 1 or 2.")

    def measure_voltage(self, channel):
        """Measure the actual voltage output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"V{channel}O?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def measure_current(self, channel):
        """Measure the actual current output for a specific channel (1 or 2)."""
        if channel in [1, 2]:
            return self.query(f"I{channel}O?")
        print("Invalid channel. Use 1 or 2.")
        return None

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.output_off(1)
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()



# Example Usage
if __name__ == "__main__":
    # Initialize the power supply
    psu = PL303QMDP()

    # Reset the device
    psu.reset()

    # Venstre og Høyre Kanal på strømforsyning
    Venstre_kanal = 2
    Høyre_kanal = 1

    # Sets parameters
    max_v = 4.2
    max_c = 3.0
    min_v = 3.0
    cutoff_c = 0.1
    
    voltage_right = True
    voltage_left = True

    # Set initial voltage & current
    while voltage_right == True:
        try:
            voltage_right = float(input("Measure the battery on the Right channel and type in the voltage: "))
        except Exception:
            print("Error")

    while voltage_left == True:
        try:
            voltage_left = float(input("Measure the battery on the Left channel and type in the voltage: "))
        except Exception:
            print("Error")


    # Set voltage and current
    psu.set_voltage(Høyre_kanal, voltage_right+0.1)
    time.sleep(1)
    psu.set_current(Høyre_kanal, max_c)
    time.sleep(1)
    psu.set_voltage(Venstre_kanal, voltage_left+0.1)
    time.sleep(1)
    psu.set_current(Venstre_kanal, max_c)
    time.sleep(1)

    # Check if all ok before starting charging
    try:
        input("Check that the voltage is correct on the PSU display and then hit enter: ")
    except Exception:
        print("")

    print("\n Charging Started...\n")

    # Turns on outputs
    psu.output_on(Høyre_kanal)
    time.sleep(3)
    psu.output_on(Venstre_kanal)
    time.sleep(3)

    # Starts charging loop
    looptiloop = True
    while looptiloop:
        # Measure voltage & current
        voltage_raw_right = psu.measure_voltage(Høyre_kanal)
        time.sleep(1)
        current_raw_right = psu.measure_current(Høyre_kanal)
        time.sleep(1)
        # print(voltage_raw_right)
        # print(current_raw_right)
        # Extracting just the numeric value
        voltage_right = float(voltage_raw_right[:-1])
        current_right = float(current_raw_right[:-1])
    
        # print(f"Voltage: {voltage_value} V")
        # print(f"Current: {current_value} A")

        # Display status in a single line
        print(f"\r Right Voltage: {voltage_right}V | Current: {current_right}A")
    
        # Checks if current is too high and lowers voltage if it is
        if current_right > max_c and not voltage_right == max_v:
            new_volt = round((voltage_right - 0.02), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # Checks if voltage can be increased
        if (current_right < (max_c-0.5)) and (voltage_right < max_v) and not (voltage_right == max_v):
            new_volt = round((voltage_right + 0.01), 2)
            psu.set_voltage(Høyre_kanal, new_volt)

        # If battery reaches max voltage, switch to constant voltage mode
        if voltage_right > max_v:
            psu.set_voltage(Høyre_kanal, max_v)
            # psu.set_current(Høyre_kanal, 3.0)  # Reduce current to prevent overcharging         Bør sees på

        # Stop charging if current falls below cutoff threshold (C/10 rule)
        if current_right < cutoff_c:
            print("\n Charging Complete! Right Battery is full.")
            psu.output_off(Høyre_kanal)
            break

        time.sleep(1)  # Update every 1 seconds

        #                                                                               Skille mellom kanaler

        # Measure voltage & current
        voltage_raw_left = psu.measure_voltage(Venstre_kanal)
        time.sleep(1)
        current_raw_left = psu.measure_current(Venstre_kanal)
        time.sleep(1)
        # print(voltage_raw_left)
        # print(current_raw_left)
        # Extracting just the numeric value
        voltage_left = float(voltage_raw_left[:-1])
        current_left = float(current_raw_left[:-1])
    
        # print(f"Voltage: {voltage_value} V")
        # print(f"Current: {current_value} A")

        # Display status in a single line
        print(f"\r Left Voltage: {voltage_left}V | Current: {current_left}A")
    
        # Checks if current is too high and lowers voltage if it is
        if current_left > max_c and not voltage_left == max_v:
            new_volt = round((voltage_left - 0.02), 2)
            psu.set_voltage(Venstre_kanal, new_volt)

        # Checks if voltage can be increased
        if (current_left < (max_c-0.5)) and (voltage_left < max_v) and not (voltage_left == max_v):
            new_volt = round((voltage_left + 0.01), 2)
            psu.set_voltage(Venstre_kanal, new_volt)

        # If battery reaches max voltage, switch to constant voltage mode
        if voltage_left > max_v:
            psu.set_voltage(Venstre_kanal, max_v)
            # psu.set_current(Høyre_kanal, 3.0)  # Reduce current to prevent overcharging         Bør sees på

        # Stop charging if current falls below cutoff threshold (C/10 rule)
        if current_left < cutoff_c:
            print("\n Charging Complete! Left Battery is full.")
            psu.output_off(Venstre_kanal)
            break

        time.sleep(1)  # Update every 1 seconds

>>>>>>> 3d551faf15409e9d43a8ccfeb49b111309d4b419
    psu.close()