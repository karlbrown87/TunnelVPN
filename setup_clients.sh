#!/bin/bash

# Define escape sequences for colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'
CLEAR_LINE='\r\033[K'

# Install figlet
if ! command -v figlet &> /dev/null
then
    echo "figlet not found, installing..."
    sudo apt-get update
    sudo apt-get install -y figlet
fi

#Install TunnelVPN
if ! command -v openvpn &> /dev/null
then
    echo "openvpn not found, installing..."
    sudo apt-get update
    sudo apt-get install -y openvpn
fi

printf "${CLEAR_LINE}[Initializing]🎉${GREEN} TunnelVPN for Clients!${NO_COLOR}\n"

# Function to print error messages
print_error() {
    printf "${CLEAR_LINE}💀${RED}   $1${NO_COLOR}\n"
}

# Function to print success messages
print_success() {
    printf "${CLEAR_LINE}🎉${GREEN}   $1${NO_COLOR}\n"
}

# Check 1: Verify if user is root
printf "[1/2]🔎   Checking if user is root..."
if ! (( $(id -u) == 0 )); then
    print_error "You must have ROOT access to continue with installation"
    exit 1
fi

# Check 2: Verify if there is internet access
printf "[2/2]🔎   Checking for internet access..."
if ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    print_error "You must have INTERNET access to continue with installation"
    exit 1
fi

print_success "All checks passed successfully!"

echo

if command -v figlet &> /dev/null
    then
        figlet "TunnelVPN"
    else
        echo "..."
    fi

echo
echo -e "\n\033[1;32mPlease enter the configuration for client.conf (end with Ctrl + D):\033[0m "
echo

# Variables
CLIENT_NAME="client"
CONFIG_DIR="/etc/openvpn"
CLIENT_CONFIG="${CONFIG_DIR}/${CLIENT_NAME}.conf"

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
