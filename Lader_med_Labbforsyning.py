import pyvisa

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
            self.output_off()
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

    # Set voltage and current for channel 1
    psu.set_voltage(1, 12.0)
    psu.set_current(1, 2.0)

    # Turn on the output
    psu.output_on(1)

    # Read measured values
    voltage = psu.measure_voltage(1)
    current = psu.measure_current(1)

    print(f"Measured Voltage (CH1): {voltage} V")
    print(f"Measured Current (CH1): {current} A")


    running = True
    while running:
        verdi = float(input("Set voltage: "))
        if verdi == 69:
            running = False
        # Set voltage and current for channel 1
        psu.set_voltage(1, verdi)
        psu.set_current(1, 2.0)

        # Read measured values
        voltage = psu.measure_voltage(1)
        current = psu.measure_current(1)

        print(f"Measured Voltage (CH1): {voltage} V")
        print(f"Measured Current (CH1): {current} A")
        # Turn off the output
        psu.output_off(1)
