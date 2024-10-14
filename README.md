# VPN Setup Project

This project includes scripts to set up a VPN server and configure clients to connect to the server.

## Contents

- **[setup_tunnel_vpn.sh](path/to/setup_tunnel_vpn.sh)**: Script to install and configure the VPN server.
- **[setup_clients.sh](path/to/setup_clients.sh)**: Script to install and configure the VPN clients.

## Server VPN Installation and Configuration

To install and configure the VPN server, follow these steps:

1. Clone the repository on your server:
    ```sh
    git clone <REPOSITORY_URL>
    cd <REPOSITORY_NAME>
    ```

2. Run the `setup_tunnel_vpn.sh` script:
    ```sh
    ./setup_tunnel_vpn.sh
    ```

3. Follow the on-screen instructions to complete the setup.

## Client VPN Installation and Configuration

To install and configure a VPN client, follow these steps:

1. Clone the repository on your client:
    ```sh
    git clone <REPOSITORY_URL>
    cd <REPOSITORY_NAME>
    ```

2. Run the `setup_clients.sh` script:
    ```sh
    ./setup_clients.sh
    ```

3. Follow the on-screen instructions to complete the setup.

## Notes

- Ensure you have administrator (root) permissions to run the scripts.
- Verify that the necessary ports for the VPN are open in your firewall.

For more information, refer to the documentation of each script or contact the system administrator.
