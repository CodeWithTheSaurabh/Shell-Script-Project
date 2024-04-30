#!/bin/bash

# Function to generate random password
generate_password() {
    # Default password length
    length=12

    # Check if length argument is provided
    if [ $# -eq 1 ]; then
        length=$1
    fi

    # Generate random password
    password=$(openssl rand -base64 48 | cut -c1-$length)
    echo "Generated Password: $password"
}

# Main program
echo "Welcome to Password Generator"
echo "Enter password length (default is 12):"
read password_length

generate_password $password_length
