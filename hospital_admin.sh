#!/bin/bash

initialize_system() {
    if [ -d "active_logs" ]; then
        echo "active_logs directory already exists."
    else
        echo "Creating active_logs directory"
        mkdir active_logs

    fi

    if [ -d "archived_logs" ]; then
        echo "archived_logs directory already exists."
    else
        echo "Creating archived_logs directory"
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
# Member 2's function
}


# Member 3's space to orchestrate Member 1 and 2 functions
