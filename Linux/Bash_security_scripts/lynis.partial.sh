!/bin/bash

sudo lynis audit --test-from-group malware,authentication,networking,storage,filesystem >> /tmp/lynis.partial_scan.log