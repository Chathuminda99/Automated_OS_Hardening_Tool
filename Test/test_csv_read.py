import csv

# Open the CSV file and read it into a list of dictionaries
with open('nessus_report.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    data = list(reader)

# print('number of rows: {}'.format(len(data)))

# Print the Name, Plugin ID, and Host fields for the first 5 rows
for row in data:
    print("Name: ", row['Name'])
    print("Plugin ID: ", row['Plugin ID'])
    print("Host: ", row['Host'])
    print("Risk: ", row['Risk'])
    print("----------------------")

row_number = 1

# Get the Plugin ID and Risk fields for the specified row
plugin_id = data[row_number]['Plugin ID']
risk = data[row_number]['Risk']

# Print the Plugin ID and Risk fields
print("Plugin ID: ", plugin_id)
print("Risk: ", risk)
