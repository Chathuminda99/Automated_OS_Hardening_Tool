import os
import subprocess
def call_files(filename):
    file_dir = 'scripts/remediation'
    filename = os.path.join(file_dir, filename)
    os.system("chmod +x " + filename)
    # print("Call files function Called!")
    output =  os.system("bash " + filename)
    print("this is from remediation file: " + str(output))

