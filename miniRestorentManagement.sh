#!/bin/bash

# Function to display menu
display_menu() {
    echo "Welcome to Mini Restaurant Management System"
    echo "1. Display menu items"
    echo "2. Add a menu item"
    echo "3. Remove a menu item"
    echo "4. Search for a menu item"
    echo "5. Exit"
}

# Function to display menu items
display_menu_items() {
    echo "Menu items:"
    cat menu.txt
}

# Function to add a menu item
add_menu_item() {
    echo "Enter item name:"
    read name
    echo "Enter item price:"
    read price
    echo "$name - $price" >> menu.txt
    echo "Menu item added successfully!"
}

# Function to remove a menu item
remove_menu_item() {
    echo "Enter item name to remove:"
    read name
    sed -i "/$name/d" menu.txt
    echo "Menu item removed successfully!"
}

# Function to search for a menu item
search_menu_item() {
    echo "Enter item name to search:"
    read name
    grep -i "$name" menu.txt
}

# Main program
while true; do
    display_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) display_menu_items ;;
        2) add_menu_item ;;
        3) remove_menu_item ;;
        4) search_menu_item ;;
        5) echo "Exiting program. Thank you!" && break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac

    echo ""
done
