#!/usr/bin/env python3
import os

l_output = ""
l_output2 = ""
l_mname = "squashfs"

# Check how module will be loaded
l_loadable = os.popen(f"modprobe -n -v {l_mname}").read()
if "install /bin/(true|false)" in l_loadable:
    l_output += f"\n - module: \"{l_mname}\" is not loadable: \"{l_loadable}\""
else:
    l_output2 += f"\n - module: \"{l_mname}\" is loadable: \"{l_loadable}\""

# Check if the module is currently loaded
if f"{l_mname}" not in os.popen("lsmod").read():
    l_output += f"\n - module: \"{l_mname}\" is not loaded"
else:
    l_output2 += f"\n - module: \"{l_mname}\" is loaded"

# Check if the module is deny listed
if os.path.exists("/etc/modprobe.d"):
    for filename in os.listdir("/etc/modprobe.d"):
        with open(f"/etc/modprobe.d/{filename}") as f:
            if f"blacklist {l_mname}\n" in f.readlines():
                l_output += f"\n - module: \"{l_mname}\" is deny listed in: \"{filename}\""
                break
    else:
        l_output2 += f"\n - module: \"{l_mname}\" is not deny listed"
else:
    l_output += "\n - /etc/modprobe.d does not exist"

# Report results. If no failures output in l_output2, we pass
if not l_output2:
    print(f"\n- Audit Result:\n ** PASS **\n{l_output}\n")
else:
    print(f"\n- Audit Result:\n ** FAIL **\n - Reason(s) for audit failure:\n{l_output2}\n")
    if l_output:
        print(f"\n- Correctly set:\n{l_output}\n")
