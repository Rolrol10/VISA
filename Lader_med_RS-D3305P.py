import pyvisa
import time
import sys


class RSD3305P:
    """Class to control the RS-D3305P power supply via SCPI commands."""

    def __init__(self, address=None, timeout=5000, debug=True):
        """Initialize connection to the power supply."""
        self.debug = debug
        try:
            self.rm = pyvisa.ResourceManager()

            # Auto-detect if no address is provided
            if address is None:
                resources = self.rm.list_resources()
                if resources:
                    address = resources[0]  # Select the first available instrument
                else:
                    raise ValueError("No instruments detected.")

            self.instr = self.rm.open_resource(address)

            # Set communication settings
            self.instr.timeout = timeout  # Timeout in milliseconds
            self.instr.read_termination = "\n"
            self.instr.write_termination = "\n"

            # Verify connection
            device_info = self.query("*IDN?")
            self.log(f"Connected to: {device_info}")

        except pyvisa.VisaIOError as e:
            print(f"Error: Unable to connect to the power supply. {e}")
            self.instr = None

    def log(self, message):
        """Print log messages if debug mode is enabled."""
        if self.debug:
            print(f"[DEBUG] {message}")

    def write(self, command):
        """Send a command to the instrument (without expecting a response)."""
        try:
            if self.instr:
                self.log(f"Sending command: {command}")
                self.instr.write(command)
        except pyvisa.VisaIOError as e:
            print(f"Error sending command '{command}': {e}")


    def query(self, command):
        """Send a query command and return the response."""
        try:
            if self.instr:
                self.log(f"Querying: {command}")
                return self.instr.query(command).strip()
        except pyvisa.VisaIOError as e:
            print(f"Error querying '{command}': {e}")
        return None

    def reset(self):
        """Reset the power supply to default settings."""
        self.write("*RST")

    def set_voltage(self, voltage):
        """Set output voltage."""
        self.write(f"VSET1:{voltage}")
        print(f"Set Voltage to {voltage} V")

    def get_voltage(self):
        """Get the actual output voltage."""
        voltage = float(self.query("VOUT1?"))
        return voltage

    def set_current(self, current):
        """Set output current limit."""
        self.write(f"ISET1:{current}")
        print(f"Set Current to {current} A")

    def get_current(self):
        """Get the actual output current."""
        current = float(self.query("IOUT1?"))
        return current

    def output_on(self):
        """Turn on the output."""
        self.write("OSET:1")
        print("Output ON")

    def output_off(self):
        """Turn off the output."""
        self.write("OUT0")
        print("Output OFF")

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.output_off()
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()


# Example Usage
if __name__ == "__main__":
    # Initialize the power supply
    psu = RSD3305P(debug=True)

    # Reset the device
    psu.reset()

    # Sets parameters
    max_v = 4.2
    max_c = 5.0
    min_v = 3.3
    cutoff_c = 1.0
    voltage = True

# Set initial voltage & current

    while voltage == True:
        try:
            voltage = float(input("Measure the battery and type in the voltage"))
        except Exception:
            print("Error")
    
    # Set voltage and current
    psu.set_voltage(voltage+0.1)
    psu.set_current(max_c)

    try:
        input("Check that the voltage is correct on the PSU display and turn on the output on the PSU")
    except Exception:
        print("")

    print("\n🔋 Charging Started...\n")

    while True:
        # Measure voltage & current
        voltage = psu.get_voltage()
        current = psu.get_current()

        # Display status in a single line
        print(f"\r🔋 Voltage: {voltage:.3f}V | ⚡ Current: {current:.3f}A", end="")

        # 
        if (current < 4.0) and (voltage < max_v) and not (voltage == max_v):
            new_volt = round((voltage + 0.01), 2)
            psu.set_voltage(new_volt)
        
        #
        if current > 5.0 and not voltage == max_v:
            new_volt = round((voltage - 0.01), 2)
            psu.set_voltage(new_volt)

        # If battery reaches max voltage, switch to constant voltage mode
        if voltage > max_v:
            psu.set_voltage(max_v)
            psu.set_current(1.0)  # Reduce current to prevent overcharging

        # Stop charging if current falls below cutoff threshold (C/10 rule)
        if current < cutoff_c:
            print("\n✅ Charging Complete! Battery is full.")
            psu.output_off()
            break

        time.sleep(2)  # Update every 2 seconds


    # Turn off the output
    #psu.output_off()

    # Close connection
    psu.close()
