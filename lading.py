import pyvisa

# Initialize resource manager
rm = pyvisa.ResourceManager()

# Connect to the instrument (Modify as needed: USB, LAN, or RS232)
# List all VISA resources
print(rm.list_resources())

# Example connection via USB (Change address accordingly)
instr = rm.open_resource('USB0::0xF4EC::0xEE38::SDG12345678::INSTR')

# Example connection via LAN
# instr = rm.open_resource("TCPIP::192.168.1.100::INSTR")  # Change IP accordingly

# Set timeout and configure the instrument
instr.timeout = 5000  # Timeout in milliseconds
instr.write("*IDN?")  # Query device identity
response = instr.read()
print(f"Connected to: {response}")

# Example SCPI commands
instr.write("FUNC CC")  # Set to Constant Current mode
instr.write("CURR 1.5")  # Set current to 1.5A
instr.write("INP ON")  # Turn ON the load

# Read back the actual measured values
instr.write("MEAS:VOLT?")
voltage = instr.read()
print(f"Voltage: {voltage} V")

instr.write("MEAS:CURR?")
current = instr.read()
print(f"Current: {current} A")

# Turn off the load
instr.write("INP OFF")

# Close connection
instr.close()
