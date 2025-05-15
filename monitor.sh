#!/bin/bash

LOG_FILE="syslog.txt"

# Υπολογισμός πραγματικού CPU usage (σε όλα τα Linux/WSL)
get_cpu_usage() {
    CPU1=$(grep '^cpu ' /proc/stat | awk '{u=$2+$4; t=$2+$4+$5+$6+$7+$8+$9+$10; print u, t}')
    sleep 1
    CPU2=$(grep '^cpu ' /proc/stat | awk '{u=$2+$4; t=$2+$4+$5+$6+$7+$8+$9+$10; print u, t}')

    U1=$(echo $CPU1 | awk '{print $1}')
    T1=$(echo $CPU1 | awk '{print $2}')
    U2=$(echo $CPU2 | awk '{print $1}')
    T2=$(echo $CPU2 | awk '{print $2}')

    USAGE=$(echo "scale=1; 100*($U2-$U1)/($T2-$T1)" | bc)
    echo "$USAGE%"
}

print_header() {
    echo "---- SYSTEM MONITOR ----"
    echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
}

show_system_info() {
    echo "CPU Usage: $(get_cpu_usage)"
    echo "Memory Usage: $(free -h | awk '/^Mem/ {print $3 " / " $2}')"
    echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5 " used"}')"
    echo ""
    echo "Top 5 CPU-consuming processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
    echo "Top 5 Memory-consuming processes:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo ""
}

log_to_file() {
    {
        print_header
        show_system_info
        echo "------------------------"
    } >> "$LOG_FILE"
    echo "✅ Log saved to $LOG_FILE"
}

clear_logs() {
    > "$LOG_FILE"
    echo "🧹 Logs cleared."
}

# Κύρια εκτέλεση: εμφάνιση συστήματος + μενού επιλογών
print_header
show_system_info

echo "[L]og  [C]lear  [Q]uit"
read -n1 -p "Επιλογή: " choice
echo ""

case "$choice" in
    [Ll])
        log_to_file
        ;;
    [Cc])
        clear_logs
        ;;
    [Qq])
        echo "👋 Έξοδος."
        ;;
    *)
        echo "❌ Μη έγκυρη επιλογή."
        ;;
esac



