import pyvisa
import time

class PL303QMDP:
    """Class to control the Aim-TTi PL303QMD-P power supply via SCPI commands."""

    def __init__(self, address=None, timeout=10000):
        """Initialize connection to the power supply."""
        try:
            self.rm = pyvisa.ResourceManager()
            address = self.rm.list_resources()
            self.instr = self.rm.open_resource(address[0])

            # Set communication settings
            self.instr.timeout = timeout
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

    def set_voltage(self, voltage):
        """Set output voltage."""
        self.write(f"V1 {voltage}")

    def get_voltage(self):
        """Get the set voltage."""
        return float(self.query("V1?"))

    def set_current_limit(self, current):
        """Set output current limit."""
        self.write(f"I1 {current}")

    def get_current_limit(self):
        """Get the set current limit."""
        return float(self.query("I1?"))

    def measure_voltage(self):
        """Measure the actual output voltage."""
        return float(self.query("V1?"))

    def measure_current(self):
        """Measure the actual output current."""
        return float(self.query("I1O?"))

    def output_on(self):
        """Turn on the output."""
        self.write("OP1 1")

    def output_off(self):
        """Turn off the output."""
        self.write("OP1 0")

    def close(self):
        """Close the instrument connection."""
        if self.instr:
            self.output_off()
            self.instr.close()
            print("Connection closed.")

    def __del__(self):
        """Ensure connection is closed when the object is deleted."""
        self.close()


# --- HOVEDPROGRAM FOR BATTERILADING ---
if __name__ == "__main__":
    # Initialiser strømforsyningen
    psu = PL303QMDP()
    
    # Ladestrategi
    TARGET_CURRENT = 2  # Ønsket ladestrøm
    MAX_VOLTAGE = 4.2  # Sikkerhetsgrense for batterispenning
    ADJUST_STEP = 0.05  # Spenningsjustering pr. iterasjon
    SLEEP_TIME = 1  # Tid mellom målinger (sekunder)

    # Start lading
    psu.reset()
    psu.set_current_limit(TARGET_CURRENT)  # Sett strømbegrensning for sikkerhet
    psu.set_voltage(0.5)  # Start lavt og øk gradvis
    psu.output_on()
    print("Lading startet...")

    while True:
        # Mål spenning og strøm
        measured_voltage = psu.measure_voltage()
        measured_current = psu.measure_current()

        print(f"Målt spenning: {measured_voltage:.2f} V")
        print(f"Målt strøm: {measured_current:.2f} A")

        # Juster spenning for å prøve å holde målstrøm
        if measured_current < TARGET_CURRENT:  # Øk spenning hvis strømmen er for lav
            new_voltage = psu.get_voltage() + ADJUST_STEP
            if new_voltage > MAX_VOLTAGE:
                print("⚠️ Maks ladespenning nådd! Stopper lading.")
                break
            psu.set_voltage(new_voltage)
        elif measured_current > TARGET_CURRENT:  # Senk spenning hvis strømmen er for høy
            new_voltage = psu.get_voltage() - ADJUST_STEP
            if new_voltage < 0.1:
                print("⚠️ Spenning for lav, mulig batteri fulladet. Stopper lading.")
                break
            psu.set_voltage(new_voltage)

        # Sikkerhetsbetingelser for å stoppe lading
        if measured_voltage >= MAX_VOLTAGE:
            print("⚠️ Maks spenning nådd! Stopper lading for å beskytte batteriet.")
            break
        if measured_current < 0.05:  # Lading stopper automatisk hvis strømmen er veldig lav (batteri fulladet)
            print("✅ Batteriet er sannsynligvis fulladet. Stopper lading.")
            break

        time.sleep(SLEEP_TIME)

    # Slå av utgangen og avslutt
    psu.output_off()
    print("Lading avsluttet.")
    psu.close()
