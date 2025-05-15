🖥️ ΟΔΗΓΙΕΣ ΧΡΗΣΗΣ: Linux System Monitor Script

🔗 GitHub Project:
https://github.com/ThanTol/linux_system_monitor

📌 Τι είναι αυτό:
Ένα Bash script που εμφανίζει πληροφορίες του συστήματος:
- Χρήση CPU, RAM και δίσκου
- Top 5 διεργασίες που καταναλώνουν CPU/RAM
- Επιλογές για καταγραφή σε αρχείο ή καθαρισμό logs

🎯 Τι χρειάζεται:
- Linux ή WSL (Windows Subsystem for Linux)
- Εγκατεστημένες εντολές: bash, ps, free, df, grep, awk, bc

📥 Πώς να το τρέξεις:

➡️ Αν έχεις εγκατεστημένο Git:

1. Άνοιξε terminal και γράψε:
   git clone https://github.com/ThanTol/linux_system_monitor.git

2. Μπες στον φάκελο:
   cd linux_system_monitor

3. Κάνε το script εκτελέσιμο:
   chmod +x monitor.sh

4. Τρέξε το:
   ./monitor.sh


➡️ Αν ΔΕΝ έχεις Git:

1. Μπες στο GitHub project:
   https://github.com/ThanTol/linux_system_monitor

2. Πάτα "Code > Download ZIP"

3. Αποσυμπίεσε το αρχείο (Extract)

4. Άνοιξε terminal στον φάκελο και τρέξε:
   chmod +x monitor.sh
   ./monitor.sh

🧪 Τι θα δεις:

Με την εκτέλεση του script, θα εμφανιστεί:

---- SYSTEM MONITOR ----
Ημερομηνία: 2025-05-14 13:00:00
CPU Usage: 3.7%
Memory Usage: 820Mi / 15Gi
Disk Usage: 4% used

Top 5 CPU-consuming processes:
...

Top 5 Memory-consuming processes:
...

[L]og  [C]lear  [Q]uit

👉 Πατάς:
- `L` για να αποθηκεύσει σε syslog.txt
- `C` για να καθαρίσει το αρχείο
- `Q` για έξοδο


