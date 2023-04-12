import csv
import sys

# Get the Nessus report file name from the command-line arguments
if len(sys.argv) < 2:
    print("Usage: python nessus_script.py <nessus_report_file>")
    sys.exit(1)

nessus_file = sys.argv[1]

# Open the CSV file and read it into a list of dictionaries
with open(nessus_file, 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    data = list(reader)

# Set the row number to retrieve
row_number = 3

# Get the Plugin ID and Risk fields for the specified row
plugin_id = data[row_number]['Plugin ID']
risk = data[row_number]['Risk']

# Print the Plugin ID and Risk fields
print("Plugin ID: ", plugin_id)
print("Risk: ", risk)
