#!/bin/bash

# Run weekly full system lynis audit\
sudo lynis audit system >> /tmp/lynis.system_scan.log