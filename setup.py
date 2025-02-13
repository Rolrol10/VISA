import webbrowser
import subprocess
import sys

def open_url(url):
    """Opens a URL in the default web browser."""
    print(f"Opening {url}...")
    webbrowser.open(url)

def install_pyvisa():
    """Installs PyVISA using pip."""
    print("Installing PyVISA...")
    subprocess.run([sys.executable, "-m", "pip", "install", "pyvisa"], check=True)

def main():
    url = "https://www.ni.com/en/support/downloads/drivers/download.ni-visa.html#558610"
    open_url(url)  # Open NI-VISA driver download page
    install_pyvisa()  # Install PyVISA via pip

if __name__ == "__main__":
    main()
