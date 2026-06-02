#!/bin/bash
# Member 3 - Orchestrator: Calls Member 1 and Member 2 functions in order

# Source Member 1 and Member 2 scripts
source ./initialize_system.sh
source ./secure_data.sh

initialize_system() {
    echo "Initializing system..."
}

secure_data() {
    echo "Securing data..."
}

<<<<<<< HEAD
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
            echo "System Environment Secured - $(date)"
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
=======
# Member 3's space to orchestrate Member 1 and 2 functions
>>>>>>> parent of 4d4db73... Created the loop that calls functions
