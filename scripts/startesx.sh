#!/bin/bash
# temporary script to run vmci_srv.py detached.
# The real log is in "/var/log/vmware/docker-vmdk-plugin.log" (see vmci_srv.py )
# redirtecting stdio/err to /tmp/plugin.log in case we missed something in logs
# this will be gone when VIB work is complete
# Note that we are resetting actual log here - it is useful in Drone runs. 
log=/tmp/plugin.log
pylog=/var/log/vmware/docker-vmdk-plugin.log 
echo === `date` Actual logs are in $pylog  === > $log
cat /dev/null > $pylog
nohup python -B /usr/lib/vmware/vmdkops/bin/vmci_srv.py >> $log 2>&1 &
