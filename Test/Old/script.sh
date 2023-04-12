#!/usr/bin/env bash

# Checkings
cd scripts/checks/

chmod +x 1-1-1-1.sh && chmod +x 1-1-1-2.sh && chmod +x 1-1-1-3.sh

sudo ./1-1-1-1.sh && sudo ./1-1-1-2.sh && sudo ./1-1-1-3.sh


#Remediations
cd ../remediation

chmod +x 1-1-1-1.sh && chmod +x 1-1-1-2.sh && chmod +x 1-1-1-3.sh

sudo ./1-1-1-1.sh && sudo ./1-1-1-2.sh && sudo ./1-1-1-3.sh