import csv
import sys
import time
import re
import os
from remediation import call_files

# variables
id_pattern = re.compile(r'^\d+\.\d+(\.\d+)?(\.\d+)?') # Description ID pattern
id_count = 0 #remove this after count id patterns
data_count = 0 #remove this after count data patterns

# Get the Nessus report file name from the command-line arguments
if len(sys.argv) < 2:
    print("Usage: python nessus_script.py <nessus_report_file>")
    sys.exit(1)

nessus_file = sys.argv[1]

# Open the CSV file and read it into a list of dictionaries
with open(nessus_file, 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    data = list(reader)

#Lenght of data
number_of_data = len(data)

# Introduction
print("\nImporting CSV file: %s" %nessus_file)
# time.sleep(1)
print("\nImported Successfully")
print("--------------------------------")

# Display the Host Details
    #Check if there are more than one hosts in the report
hosts = []

for row in data:
    if row['Host'] not in hosts:
        hosts.append(row['Host'])

if len(hosts) != 1:
    print("There are more than one hosts in the report")
    print("--------------------------------")
    print("Please select a single host CSV file\n--------------------------------")
    sys.exit(1)

print("\n==>Host: " + hosts[0])

print("\n--------------------------------")

for row in data[:3]:
    Plugin_ID = row['Plugin ID']
    Risk = row['Risk']
    Description = row['Description']

    for line in Description[1:10].split('\n'):
        match = id_pattern.match(line)
        if match:
            # print("ID found:", match.group())
            comp_id = match.group()

            first_line = Description.split('\n')[0] #To get the Comp ID and Breif Description
            if Risk == 'FAILED':
                # Uncomment the following below line
                # print(first_line)
                comp_id = 'test'
                remediation_filename = comp_id + '.sh'
                # print(remediation_filename)
                call_files(remediation_filename)
            elif Risk == 'PASSED':
                # Uncomment the following below line
                # print(first_line + "\n")
                pass
            else:
                print(first_line)
                print("Warning => Could not verified")



# print(data_count)
# print(id_count)
