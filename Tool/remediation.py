import os
def call_files(filename):
    file_dir = 'scripts/remediation'
    filename = os.path.join(file_dir, filename)
    os.system("chmod +x " + filename)
    # print("Call files function Called!")
    return os.system("bash " + filename)

