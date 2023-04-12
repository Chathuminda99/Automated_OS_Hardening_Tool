import subprocess

# Execute the 3 bash scripts and capture their output
result1 = subprocess.run(['bash', '1-1-1-1.sh'], capture_output=True, text=True)
result2 = subprocess.run(['bash', '1-1-1-2.sh'], capture_output=True, text=True)
result3 = subprocess.run(['bash', '1-1-1-3.sh'], capture_output=True, text=True)

# Initialize a list to store the results of each test
test_results = []

# Check the result of test 1
if "PASS" in result1.stdout:
    test_results.append("test 1 - PASS")
else:
    test_results.append("test 1 - fail")

# Check the result of test 2
if "PASS" in result2.stdout:
    test_results.append("test 2 - PASS")
else:
    test_results.append("test 2 - fail")

# Check the result of test 3
if "PASS" in result3.stdout:
    test_results.append("test 3 - PASS")
else:
    test_results.append("test 3 - fail")

# Print the results of all 3 tests
print(", ".join(test_results))
