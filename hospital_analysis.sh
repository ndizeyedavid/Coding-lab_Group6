#!/bin/bash

process_vitals() {
    # Member 5's function
    
    echo "Processing critical vital signs..."

    > reports/critical_alerts.txt

    grep "CRITICAL" active_logs/heart_rate_log.log \
    | awk -F',' '{print $1","$2","$3}' \
    >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature_log.log \
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

    average=$(awk -F' \\| ' '
        $2 == "ICU_WATER_RESERVE" {
            sum += $3
            count++
        }
        END {
            if (count > 0)
                print sum / count
            else
                print 0
        }
    ' "$log_file")

    total_records=$(awk -F' \\| ' '
        $2 == "ICU_WATER_RESERVE" {
            count++
        }
        END {
            print count
        }
    ' "$log_file")

    printf "\n"
    printf "===============================================\n"
    printf "           KNH FACILITY AUDIT REPORT\n"
    printf "===============================================\n"
    printf "%-20s : %s\n" "Resource" "ICU_WATER_RESERVE"
    printf "%-20s : %d\n" "Records Analysed" "$total_records"
    printf "%-20s : %.2f Litres\n" "Average Usage" "$average"
    printf "%-20s : %s\n" "Generated" "$(date)"
    printf "===============================================\n"
}

# =====================================
# Execution Logic
# =====================================

echo "====================================="
echo "KNH Hospital Analysis System"
echo "====================================="
echo "1. Process Critical Vitals"
echo "2. Water Audit"
echo "3. Run Both"
echo "4. Exit"
echo "====================================="

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        process_vitals
        ;;
    2)
        water_audit
        ;;
    3)
        process_vitals
        echo
        water_audit
        ;;
    4)
        echo "Exiting system..."
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 4."
        ;;
esac

