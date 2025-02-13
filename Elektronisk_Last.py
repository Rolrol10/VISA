import pyvisa
import time

class Elektronisk_Last:
    """Class to control the Siglent SDL1030X-E DC Electronic Load via SCPI commands."""

    def __init__(self, address='USB0::0xF4EC::0x1630::SDL13GCQ7R0669::INSTR',timeout=10000):
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

    def set_mode(self, mode):
        """Set the operating mode: CC (Constant Current), CV (Constant Voltage), CR (Constant Resistance), CP (Constant Power)."""
        valid_modes = ["CC", "CV", "CR", "CP"]
        if mode in valid_modes:
            self.write(f"FUNC {mode}")
        else:
            print(f"Invalid mode: {mode}. Choose from {valid_modes}.")

    def set_current(self, current):
        """Set current (only in Constant Current mode)."""
        self.write(f"CURR {current}")

    def set_voltage(self, voltage):
        """Set voltage (only in Constant Voltage mode)."""
        self.write(f"VOLT {voltage}")

    def set_resistance(self, resistance):
        """Set resistance (only in Constant Resistance mode)."""
        self.write(f"RES {resistance}")

    def set_power(self, power):
        """Set power (only in Constant Power mode)."""
        self.write(f"POW {power}")

    def turn_on(self):
        """Turn on the electronic load."""
        self.write("INP ON")

    def turn_off(self):
        """Turn off the electronic load."""
        self.write("INP OFF")

    def get_voltage(self):
        """Get the measured voltage."""
        return self.query("MEAS:VOLT?")

    def get_current(self):
        """Get the measured current."""
        return self.query("MEAS:CURR?")

    def get_resistance(self):
        """Get the measured resistance."""
        return self.query("MEAS:RES?")

    def get_power(self):
        """Get the measured power."""
        return self.query("MEAS:POW?")

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()

# Example Usage
if __name__ == "__main__":
    # Initialize the instrument
    sdl = Elektronisk_Last()

    # Reset the device
    sdl.reset()

    # Set mode to Constant Current and configure current
    sdl.set_mode("CC")
    sdl.set_current(2.0)

    # Turn on load
    sdl.turn_on()

    for i in range(60):
        # Read measured values
        voltage = sdl.get_voltage()
        current = sdl.get_current()
        print(f"Measured Voltage: {voltage} V")
        print(f"Measured Current: {current} A")
        time.sleep(1)

    # Turn off load
    sdl.turn_off()

    # Close connection
    sdl.close()