# executed in python environment on launch of linux_pyominas
import sys
import os
sys.path.insert(1, os.environ['PYOMINAS_DIR']) # receives environment variable from pyominas' configure.sh
from idlpy import *

#### could 'import idlpy as ominas' be an alternative to a metaclass inside idlpy.py???
