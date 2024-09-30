is_number() {
    [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
}

# Function to perform addition
add() {
    echo "Result: $(echo "$1 + $2" | bc)"
}

# Function to perform subtraction
subtract() {
    echo "Result: $(echo "$1 - $2" | bc)"
}

# Function to perform multiplication
multiply() {
    echo "Result: $(echo "$1 * $2" | bc)"
}

# Function to perform division
divide() {
    if [ "$2" == "0" ]; then
        echo "Error! Division by zero."
    else
        echo "Result: $(echo "scale=2; $1 / $2" | bc)"
    fi
}

echo "Select operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

read -p "Enter choice (1/2/3/4): " choice
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Validate inputs
if ! is_number "$num1" || ! is_number "$num2"; then
    echo "Error! Please enter valid numbers."
    exit 1
fi

case $choice in
    1) add $num1 $num2 ;;
    2) subtract $num1 $num2 ;;
    3) multiply $num1 $num2 ;;
    4) divide $num1 $num2 ;;
    *) echo "Invalid choice" ;;
esac
