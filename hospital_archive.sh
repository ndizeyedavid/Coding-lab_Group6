#!/bin/bash


archive_logs() {
    echo "Beginning the Hospital log archiving"

    if [ ! -d "active_logs" ]; then
	echo "Error: active_logs directory is not found here."
	return 1
    fi

    timestamp=$(date +"%Y%m%d_%H%M")

    for file in active_logs/*.log; do
	if [ -f "$file" ]; then
	    newFileName=$(basename "$file")
	    newFileName="${newFileName%_log.log}"

	    mv "$file" "archived_logs/${newFileName}_${timestamp}.log"
	    echo "Archived: ${newFileName}_${timestamp}.log"

	    touch "active_logs/${newFileName}_log.log"
	    echo "Recreated active_logs/${newFileName}_log.log"
	fi
    done

    echo "Hospital log archiving completed successfully."
}

archive_logs

	    
