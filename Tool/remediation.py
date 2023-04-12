import os
def call_files(filename):
    file_dir = 'scripts/remediation'
    filename = os.path.join(file_dir, filename)
    print(filename)
    # os.chmod(filename, 0o755)
    os.system("chmod +x " + filename)
    os.system("bash " + filename)

filename = 'test.sh'
call_files(filename)

