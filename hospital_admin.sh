#!/bin/bash

initialize_system() {
    if [ -d "active_logs" ]; then
        echo "active_logs directory already exists."
    else
        echo "Creating active_logs directory..."
        mkdir active_logs

    fi

    if [ -d "archived_logs" ]; then
        echo "archived_logs directory already exists."
    else
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    fi

    if [ -d "reports" ]; then
        echo "reports directory already exists."
    else
        echo "Creating reports directory..."
        mkdir reports
    fi

    echo "System directories initialized."
}

secure_data() {

echo "securing medical log data"

if [ -d "active_logs" ]; then
	chmod 700 active_logs

	echo "permissions have been updated successfully"
	echo "Updated Permission: "
	ls -ld active_logs
else
	echo "ERROR: active_logs directory is not found here"
fi
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
			echo ""
			;;
		2)
			secure_data
			echo ""
			;;
		3)
			initialize_system
			echo ""
			secure_data
			echo ""
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
