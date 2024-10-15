# VPN Setup Project

This project includes scripts to set up a VPN server and configure clients to connect to the server.

## Contents

- **[setup_tunnel_vpn.sh](setup_tunnel_vpn.sh)**: Script to install and configure the VPN server.
- **[setup_clients.sh](setup_clients.sh)**: Script to install and configure the VPN clients.

## Server VPN Installation and Configuration

To install and configure the VPN server, follow these steps:

1. Clone the repository on your server:
    ```sh
    git clone https://github.com/karlbrown87/TunnelVPN.git
    cd TunnelVPN*
    ```

2. Run the `setup_tunnel_vpn.sh` script:
    ```sh
    ./setup_tunnel_vpn.sh
    ```

3. Follow the on-screen instructions to complete the setup.

## Client VPN Installation and Configuration

To install and configure a VPN client, follow these steps:

2. Run the `setup_clients.sh` script:
    ```sh
    ./setup_clients.sh
    ```

3. Follow the on-screen instructions to complete the setup.

## Notes

- Ensure you have administrator (root) permissions to run the scripts.
- Verify that the necessary ports for the VPN are open in your firewall.

For more information, refer to the documentation of each script or contact the system administrator.

------#------

# Documentation for `setup_tunnel_vpn.sh` Script

This Bash script sets up a TunnelVPN server. Below are the steps and checks it performs:

1. **Define Escape Sequences for Colors**:
   - Defines variables for colors (red, green, yellow) and for clearing the line in the terminal.

2. **Install `figlet`**:
   - Checks if the `figlet` command is installed. If not, it installs it using `apt-get`.

3. **Initialization Messages**:
   - Prints an initialization message using colors and escape sequences.

4. **Functions to Print Messages**:
   - `print_error`: Prints error messages in red.
   - `print_success`: Prints success messages in green.

5. **Requirement Checks**:
   - **Check 1**: Verifies if the user running the script has ROOT access. If not, it prints an error message and exits.
   - **Check 2**: Verifies if there is internet access by pinging `8.8.8.8`. If not, it prints an error message and exits.

6. **Static IP Configuration**:
   - Creates the `ipp.txt` file in 

openvpn

 and adds an initial IP if it doesn't exist.
   - Prompts for the client's name and assigns a static IP on the internal network.

7. **Operating System Detection**:
   - Detects the Linux distribution and checks if it is supported (Ubuntu, Debian, CentOS, Fedora).

8. **TunnelVPN Server Configuration**:
   - Configures the OpenVPN server, including generating certificates and keys.
   - Configures the firewall and iptables rules.
   - Enables IP forwarding and configures the server to use specific DNS servers.

9. **Client Management**:
   - Allows adding new clients, revoking existing clients, and removing the TunnelVPN installation.

10. **Completion Messages**:
    - Prints success messages and provides additional instructions.

11. **Remove `redirect-gateway` Route**:
    - Comments out the `redirect-gateway def1 bypass-dhcp` line in `server.conf` to prevent traffic from connected networks from passing through the TunnelVPN server.

---

This script ensures that the necessary environment for installing and configuring the TunnelVPN server is properly set up before proceeding with the installation. It also modifies the configuration to avoid routing traffic from connected networks through the TunnelVPN server.



