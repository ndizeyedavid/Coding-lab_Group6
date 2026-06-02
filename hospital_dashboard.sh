#!/bin/bash
# KNH Hospital Admin Dashboard

initialize_system() {
    echo "Initializing system..."
}

secure_data() {
    echo "Securing data..."
}

while true
do
    echo ""
    echo "==============================="
    echo "KNH Hospital Admin Dashboard"
    echo "==============================="
    echo "1. Initialize system"
    echo "2. Secure Data"
    echo "3. Run all"
    echo "4. Exit"

    read -p "choose an option: " choice
    case $choice in
        1)
            initialize_system
            echo "System initialization completed."
            ;;
        2)
            secure_data
            echo "Security update completed."
            ;;
        3)
            initialize_system
            secure_data
            echo "System Environment secured."
            ;;
        4)
            echo "Exiting dashboard..."
            break
            ;;
        *)
            echo "Invalid option. Please choose 1-4."
            ;;
    esac
done
