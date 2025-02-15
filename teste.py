import pyvisa
import time

class Lader:
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

    def query(self, command, retries=2):
        """Send a query command and return the response."""
        for _ in range(retries):
            try:
                if self.instr:
                    self.log(f"Querying: {command}")
                    response = self.instr.query(command).strip()
                    if response:
                        self.log(f"Response: {response}")
                        return response
            except pyvisa.VisaIOError as e:
                print(f"Error querying '{command}': {e}")
            time.sleep(0.2)  # Small delay before retry
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
        return self.query("VOUT1?")

    def set_current(self, current):
        """Set output current limit."""
        self.write(f"ISET1:{current}")
        print(f"Set Current to {current} A")

    def get_current(self):
        """Get the actual output current."""
        return self.query("IOUT1?")

    def output_on(self):
        """Turn on the output."""
        self.write("OUT1")
        print("Output ON")

    def output_off(self):
        """Turn off the output."""
        self.write("OUT0")
        print("Output OFF")

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
    psu = Lader(debug=True)

    psu.reset()
    psu.set_voltage(4.2)
    psu.set_current(5.0)
    psu.output_on()

    voltage = psu.get_voltage()
    current = psu.get_current()

    print(f"Measured Voltage: {voltage} V")
    print(f"Measured Current: {current} A")

    psu.output_off()
    psu.close()
