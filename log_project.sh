#!/bin/bash

LOG_FILE="/var/log/syslog"
OUTPUT_FILE="$HOME/log_output.txt"

echo "----- LOG ANALYSIS START -----" > $OUTPUT_FILE
date >> $OUTPUT_FILE

echo "Checking for errors..." >> $OUTPUT_FILE

# Find errors
ERRORS=$(grep -i "error" $LOG_FILE)

if [ -z "$ERRORS" ]; then
    echo "No errors found " >> $OUTPUT_FILE
else
    echo "Errors found ⚠️" >> $OUTPUT_FILE
    echo "$ERRORS" >> $OUTPUT_FILE
fi

# Count errors
COUNT=$(grep -c -i "error" $LOG_FILE)
echo "Total error count: $COUNT" >> $OUTPUT_FILE

echo "----- END -----" >> $OUTPUT_FILE

echo "Analysis complete. Check log_output.txt"
