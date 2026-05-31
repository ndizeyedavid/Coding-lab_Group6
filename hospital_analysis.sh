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
    # Member 6's function
}

