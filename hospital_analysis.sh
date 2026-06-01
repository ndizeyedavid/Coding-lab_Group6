#!/bin/bash

process_vitals() {
    # Member 5's function
    
    echo "Processing critical vital signs..."

    > reports/critical_alerts.txt

    grep "CRITICAL" active_logs/heart_rate.log \
    | awk -F',' '{print $1","$2","$3}' \
    >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature.log \
    | awk -F',' '{print $1","$2","$3}' \
    >> reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"

}


water_audit() {
	log_file="active_logs/water_usage_log.log"
	report_file="reports/water_audit_report.txt"

	if [ ! -f "$log_file" ]; then
		echo "No water usage log found."
		return
	fi

	total_usage=0
	entry_count=0

	while read line
	do
	usage=$(echo "$line" | awk '{print $NF}')

	if [[ "$usage" =~ ^[0-9]+$ ]]; then
		total_usage=$((total_usage + usage))
		entry_count=$((entry_count + 1))
	fi

	done < "$log_file"

	echo "=====================================" > "$report_file"
	echo " KNH WATER AUDIT REPORT" >> "$report_file"
	echo " Generated: $(date)" >> "$report_file"
	echo "=====================================" >> "$report_file"
	echo "Total Entries: $entry_count" >> "$report_file"
	echo "Total Water Usage: $total_usage Litres" >> "$report_file"

	if [ "$entry_count" -gt 0 ]; then
		average=$((total_usage / entry_count))
		echo "Average Usage: $average Litres" >> "$report_file"
	fi

	echo "Report saved to $report_file"
}
