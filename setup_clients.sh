#!/bin/bash

# Variables
CLIENT_NAME="client"
CONFIG_DIR="/etc/openvpn"
CLIENT_CONFIG="${CONFIG_DIR}/${CLIENT_NAME}.conf"

# Update and install OpenVPN
sudo apt-get update
sudo apt-get install -y openvpn

# Prompt for client.ovpn configuration
echo "Please enter the configuration for client.conf (end with Ctrl + D):"
CLIENT_OVPN_CONFIG=""
while IFS= read -r line; do
    CLIENT_OVPN_CONFIG+="$line"$'\n'
done

# Create client configuration
sudo mkdir -p ${CONFIG_DIR}
echo "$CLIENT_OVPN_CONFIG" | sudo tee ${CLIENT_CONFIG} > /dev/null

# Enable and start OpenVPN client service
sudo systemctl enable openvpn@${CLIENT_NAME}
sudo systemctl start openvpn@${CLIENT_NAME}

echo "TunnelVPN client setup completed. Configuration file is located at ${CLIENT_CONFIG}"
