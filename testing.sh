#!/bin/sh

export PATH="/data/software/anaconda2/bin:$PATH"
export LD_LIBRARY_PATH="/data/software/anaconda2/lib/:/usr/local/exelis/idl85/bin/bin.linux.x86_64"
export PYTHONPATH="/usr/local/exelis/idl85/bin/bin.linux.x86_64:/usr/local/exelis/idl85/lib/bridges"
. ~/.ominas/ominas_setup.sh
exec python
