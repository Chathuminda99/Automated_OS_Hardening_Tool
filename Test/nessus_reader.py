import nessus_file_reader as nfr

nessus_file = 'Ubuntu Comp 1_o2k0z5.nessus'

root = nfr.file.nessus_scan_file_root_element(nessus_file)
# print(root)
# file_name = nfr.file.nessus_scan_file_name_with_path(nessus_file)

# print(file_name)

report_name = nfr.scan.report_name(root)

# report_name = nfr.scan.report_name(root)
number_of_targets = nfr.scan.number_of_target_hosts(root)
number_of_scanned_hosts = nfr.scan.number_of_not_scanned_hosts(root)
number_of_scanned_hosts_with_credentials = nfr.scan.number_of_scanned_hosts_with_credentialed_checks_yes(root)
scan_time_start = nfr.scan.scan_time_start(root)

scan_time_end = nfr.scan.scan_time_end(root)

scan_time_elapsed = nfr.scan.scan_time_elapsed(root)

print(f' Report name: {report_name}')
print(f' Number of target/scanned/credentialed hosts: {number_of_targets}/{number_of_scanned_hosts}/{number_of_scanned_hosts_with_credentials}')
print(f' Scan time START - END (ELAPSED): {scan_time_start} - {scan_time_end} ({scan_time_elapsed})')

for report_host in nfr.scan.report_hosts(root):
   pido_10180 = nfr.plugin.plugin_output(root, report_host, '10180')
   print(f'Nessus Scan Information Plugin Output:\n{pido_10180}')

