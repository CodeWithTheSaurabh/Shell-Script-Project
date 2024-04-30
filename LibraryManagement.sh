#!/bin/bash

# Function to display menu
display_menu() {
    echo "Welcome to Mini Library Management System"
    echo "1. Display available books"
    echo "2. Add a book"
    echo "3. Remove a book"
    echo "4. Search for a book"
    echo "5. Exit"
}

# Function to display available books
display_books() {
    echo "Available books:"
    cat books.txt
}

# Function to add a book
add_book() {
    echo "Enter book title:"
    read title
    echo "Enter author name:"
    read author
    echo "$title by $author" >> books.txt
    echo "Book added successfully!"
}

# Function to remove a book
remove_book() {
    echo "Enter book title to remove:"
    read title
    sed -i "/$title/d" books.txt
    echo "Book removed successfully!"
}

# Function to search for a book
search_book() {
    echo "Enter book title or author to search:"
    read query
    grep -i "$query" books.txt
}

# Main program
while true; do
    display_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) display_books ;;
        2) add_book ;;
        3) remove_book ;;
        4) search_book ;;
        5) echo "Exiting program. Thank you!" && break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac

    echo ""
done
