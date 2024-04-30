#!/bin/bash

# Function to perform addition
add() {
    result=$(echo "$1 + $2" | bc)
    echo "Result: $result"
}

# Function to perform subtraction
subtract() {
    result=$(echo "$1 - $2" | bc)
    echo "Result: $result"
}

# Function to perform multiplication
multiply() {
    result=$(echo "$1 * $2" | bc)
    echo "Result: $result"
}

# Function to perform division
divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: Division by zero!"
    else
        result=$(echo "scale=2; $1 / $2" | bc)
        echo "Result: $result"
    fi
}

# Main program
echo "Welcome to Calculator"
echo "Enter operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read operation

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

case $operation in
    1) add $num1 $num2 ;;
    2) subtract $num1 $num2 ;;
    3) multiply $num1 $num2 ;;
    4) divide $num1 $num2 ;;
    *) echo "Invalid operation" ;;
esac
