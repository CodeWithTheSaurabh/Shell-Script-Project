#!/bin/bash

# Function to display menu
display_menu() {
    echo "Welcome to Mini Medical Store"
    echo "1. Display available medicines"
    echo "2. Add medicine"
    echo "3. Remove medicine"
    echo "4. Search for a medicine"
    echo "5. Exit"
}

# Function to display available medicines
display_medicines() {
    echo "Available medicines:"
    cat medicines.txt
}

# Function to add a medicine
add_medicine() {
    echo "Enter medicine name:"
    read name
    echo "Enter medicine price:"
    read price
    echo "$name - $price" >> medicines.txt
    echo "Medicine added successfully!"
}

# Function to remove a medicine
remove_medicine() {
    echo "Enter medicine name to remove:"
    read name
    sed -i "/$name/d" medicines.txt
    echo "Medicine removed successfully!"
}

# Function to search for a medicine
search_medicine() {
    echo "Enter medicine name to search:"
    read name
    grep -i "$name" medicines.txt
}

# Main program
while true; do
    display_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) display_medicines ;;
        2) add_medicine ;;
        3) remove_medicine ;;
        4) search_medicine ;;
        5) echo "Exiting program. Thank you!" && break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac

    echo ""
done
