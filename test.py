import pyvisa

rm = pyvisa.ResourceManager()
addresses = rm.list_resources()  # Should show something like 'USB0::0x0AAD::0x00E3::12345678::INSTR'
print(addresses[0])