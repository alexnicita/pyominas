#!/bin/sh
# pyominas setup script for Linux VM. Currently set to work with my installed
# directories, but the script could be rewritten to search for the necessary
# locations prior to adjusting environment varibles and launching python

export LD_LIBRARY_PATH="/data/software/anaconda2/lib:/usr/local/exelis/idl85/bin/bin.linux.x86_64"

export PYTHONPATH="/usr/local/exelis/idl85/bin/bin.linux.x86_64:/usr/local/exelis/idl85/lib/bridges"

# issues with my Anaconda activate script so I'm just adjusting PATH
# ideally, find activate and source it in this script
export PATH="/data/software/anaconda2/bin:$PATH"
source ~/.ominas/ominas_setup.sh

# launch python
exec ~/python
