# Prints the header 
echo "===== SUMMARY OF DATA FILE ====="
# Prints the file name, which is the first argument.
echo "   File name: $1"

# Count the number of Pokemon while skipping the header row. Then it prints the total.
total_pokemon=$(awk 'NR>1 {count++} END {print count}' "$1")
echo "   Total Pokemon: $total_pokemon"

# Calculate average HP and print 
# Checks for numeric value. 
avg_hp=$(awk 'BEGIN {FS="\t"} NR>1 {if ($6 ~ /^[0-9]+$/) total += $6; count++} END {if (count > 0) print total/count; else print "N/A"}' "$1")
echo "   Avg. HP: $avg_hp"

# Calculate average attack. 
# Checks for numeric value. 
avg_attack=$(awk 'BEGIN {FS="\t"} NR>1 {if ($7 ~ /^[0-9]+$/) total += $7; count++} END {if (count > 0) print total/count; else print "N/A"}' "$1")
echo "   Avg. Attack: $avg_attack"

echo "===== END SUMMARY ====="
