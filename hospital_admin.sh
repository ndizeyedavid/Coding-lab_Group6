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

if [-d "active_logs"]; then
	chmod 700 active_logs

	echo "permissions have been updated successfully"
	echo "Updated Permission: "
	is -ld active_logs
else
	echo "ERROR: active_logs directory is not found here"
fi
}

# Member 3's space to orchestrate Member 1 and 2 functions
