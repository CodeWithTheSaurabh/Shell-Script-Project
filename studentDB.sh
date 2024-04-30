#!/bin/bash

# File to store student records
database="student_db.txt"

# Function to create a database
create_database() {
    touch "$database"
    echo "Database created successfully."
}

# Function to view the database
view_database() {
    if [ -s "$database" ]; then
        cat "$database"
    else
        echo "Database is empty."
    fi
}

# Function to insert a student record
insert_record() {
    echo "Enter student ID:"
    read id
    echo "Enter student name:"
    read name
    echo "Enter student age:"
    read age
    echo "Enter student grade:"
    read grade

    echo "$id, $name, $age, $grade" >> "$database"
    echo "Record inserted successfully."
}

# Function to update a record
update_record() {
    echo "Enter student ID to update:"
    read id
    if grep -q "^$id," "$database"; then
        echo "Enter new student name:"
        read name
        echo "Enter new student age:"
        read age
        echo "Enter new student grade:"
        read grade

        sed -i "s/^$id,.*/$id, $name, $age, $grade/" "$database"
        echo "Record updated successfully."
    else
        echo "Record with ID $id not found."
    fi
}

# Function to delete a record
delete_record() {
    echo "Enter student ID to delete:"
    read id
    if grep -q "^$id," "$database"; then
        sed -i "/^$id,/d" "$database"
        echo "Record deleted successfully."
    else
        echo "Record with ID $id not found."
    fi
}

# Function to show record for a particular student
show_record() {
    echo "Enter student ID to show record:"
    read id
    if grep -q "^$id," "$database"; then
        grep "^$id," "$database"
    else
        echo "Record with ID $id not found."
    fi
}

# Main program
while true; do
    echo "Student Database Management System"
    echo "1. Create Database"
    echo "2. View Database"
    echo "3. Insert Record"
    echo "4. Update Record"
    echo "5. Delete Record"
    echo "6. Show Record for a Particular Student"
    echo "7. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) create_database ;;
        2) view_database ;;
        3) insert_record ;;
        4) update_record ;;
        5) delete_record ;;
        6) show_record ;;
        7) echo "Exiting program. Thank you!" && break ;;
        *) echo "Invalid choice. Please enter a number between 1 and 7." ;;
    esac

    echo ""
done
