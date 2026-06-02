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
water_audit(){
 log_file="active_logs/water_usage_log.log"

    if [ ! -f "$log_file" ]; then
        echo "No water usage log found."
        return
    fi

    awk -F' \\| ' '
    $2 == "ICU_WATER_RESERVE" {
        sum += $3
        count++
    }
    END {
        if (count > 0) {
            avg = sum / count
            printf "\n===== ICU WATER AUDIT =====\n"
            printf "Total Records: %d\n", count
            printf "Total Usage : %.0f Litres\n", sum
            printf "Average Usage: %.2f Litres\n", avg
            printf "===========================\n"
        } else {
            print "No ICU_WATER_RESERVE records found."
        }
    }' "$log_file"
}

