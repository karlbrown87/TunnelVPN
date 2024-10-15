# Documentation setup_clients.sh 

## Overview
This script automates the setup and configuration of a TunnelVPN client on a Linux system. It ensures the necessary software is installed, verifies system prerequisites, and configures the OpenVPN client.

## Script Breakdown

### Color Definitions
Defines escape sequences for colored output in the terminal:
- `RED`: Red color for error messages.
- `GREEN`: Green color for success messages.
- `YELLOW`: Yellow color (not used in the script).
- `NO_COLOR`: Resets color to default.
- `CLEAR_LINE`: Clears the current line in the terminal.

### Software Installation
Checks and installs required software:
- **Figlet**: If not found, installs using `apt-get`.
- **OpenVPN**: If not found, installs using `apt-get`.

### Initialization Message
Prints an initialization message indicating the start of TunnelVPN setup.

### Helper Functions
Defines functions for printing error and success messages:
- `print_error()`: Prints an error message in red.
- `print_success()`: Prints a success message in green.

### System Checks
Performs two critical checks:
1. **Root Access**: Verifies if the script is run with root privileges.
2. **Internet Access**: Checks for internet connectivity by pinging Google's DNS server.

### Figlet Display
If `figlet` is installed, displays "TunnelVPN" using figlet. Otherwise, prints ellipsis.

### Client Configuration Input
Prompts the user to enter the configuration for `client.conf` and reads the input until `Ctrl + D` is pressed.

### Countdown Timer
Displays a countdown timer with a progress bar for 10 seconds before proceeding.

### Client Configuration Creation
Creates the client configuration file:
- Creates the directory `/etc/openvpn` if it doesn't exist.
- Writes the user-provided configuration to `/etc/openvpn/client.conf`.

### OpenVPN Service Management
Enables and starts the OpenVPN client service:
- Enables the service `openvpn@client`.
- Starts the service `openvpn@client`.

### Completion Message
Prints a completion message indicating the location of the configuration file.

## Usage
Run the script with root privileges to ensure proper installation and configuration:
```bash
sudo [setup_clients.sh](http://_vscodecontentref_/#%7B%22uri%22%3A%7B%22%24mid%22%3A1%2C%22fsPath%22%3A%22%2FUsers%2Fcarlosg%2FLibrary%2FMobile%20Documents%2Fcom~apple~CloudDocs%2FDownload%2FmyPythonProjects%2FPROJECTS%2FTunnelVPN%2Fsetup_clients.sh%22%2C%22external%22%3A%22file%3A%2F%2F%2FUsers%2Fcarlosg%2FLibrary%2FMobile%2520Documents%2Fcom~apple~CloudDocs%2FDownload%2FmyPythonProjects%2FPROJECTS%2FTunnelVPN%2Fsetup_clients.sh%22%2C%22path%22%3A%22%2FUsers%2Fcarlosg%2FLibrary%2FMobile%20Documents%2Fcom~apple~CloudDocs%2FDownload%2FmyPythonProjects%2FPROJECTS%2FTunnelVPN%2Fsetup_clients.sh%22%2C%22scheme%22%3A%22file%22%7D%7D)
