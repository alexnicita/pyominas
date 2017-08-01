function idlobjectsfrompython,pobj
compile_opt idl2,logical_predicate
help,pobj,output=ret,/object
cd=pg_get_cameras(pobj)
return,cd
end
