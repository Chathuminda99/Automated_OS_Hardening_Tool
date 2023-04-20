import subprocess

#define the bash script command
permission_cmd = "chmod +x ./test.sh"
bash_script = "bash test.sh"

subprocess.run(permission_cmd, shell=True)
result = subprocess.run(bash_script, stdout=subprocess.PIPE, shell=True)

print("Output is: " + result.stdout.decode() + "This is the end of the script.")