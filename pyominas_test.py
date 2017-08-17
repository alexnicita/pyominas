import pyominas_setup

dd=OMINAS.dat_read(os.environ['OMINAS_DIR']+'/demo/data/N1350122987_2.IMG')

cd=OMINAS.pg_get_cameras(dd)
IDL.help(cd)

pg=OMINAS.pg_get_planets(dd)
IDL.help(pg)
