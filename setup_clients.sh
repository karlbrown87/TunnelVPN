#!/bin/bash

# Install figlet
if ! command -v figlet &> /dev/null
then
    echo "figlet not found, installing..."
    sudo apt-get update
    sudo apt-get install -y figlet
fi

# Variables
CLIENT_NAME="client"
CONFIG_DIR="/etc/openvpn"
CLIENT_CONFIG="${CONFIG_DIR}/${CLIENT_NAME}.conf"

# Update and install OpenVPN
sudo apt-get update
sudo apt-get install -y openvpn

clear

 if command -v figlet &> /dev/null
    then
        figlet "TunnelVPN"
    else
        echo "..."
    fi

# Prompt for client.ovpn configuration
echo
echo -e "\n\033[1;32mPlease enter the configuration for client.conf (end with Ctrl + D):\033[0m"
echo

CLIENT_OVPN_CONFIG=""
while IFS= read -r line; do
    CLIENT_OVPN_CONFIG+="$line"$'\n'
done

echo
echo -e "\n\033[1;32mExecuting configuration script, countdown 10 seconds...\033[0m"
echo

# Progress bar function
progress_bar() {
    local duration=$1
    local elapsed=$2
    local size=50
    local progress=$((elapsed*100/duration))
    local completed=$((size*elapsed/duration))
    local remaining=$((size-completed))
    printf "\r["
    printf "%0.s#" $(seq 1 $completed)
    printf "%0.s-" $(seq 1 $remaining)
    printf "] %s%%" $progress
}

# Countdown timer for 10 seconds
secs=10
while [ $secs -gt 0 ]; do
   progress_bar 10 $((10-secs))
   sleep 1
   : $((secs--))
done
wait
printf "\n"

# Create client configuration
sudo mkdir -p ${CONFIG_DIR}
echo "$CLIENT_OVPN_CONFIG" | sudo tee ${CLIENT_CONFIG} > /dev/null

# Enable and start OpenVPN client service
sudo systemctl enable openvpn@${CLIENT_NAME}
sudo systemctl start openvpn@${CLIENT_NAME}

echo
echo -e "\n\033[1;32mTunnelVPN client setup completed. Configuration file is located at ${CLIENT_CONFIG}\033[0m"
echo
