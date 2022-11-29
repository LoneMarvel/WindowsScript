#!bash

source initpath  
getMachines 
for machine in $machines; do
for folder in db postgres; do
setacl -on \\\\$machine\\c\\$folder -ot file -actn ace \
-ace "m:set;n:$machine\None;p:full" \
-ace "m:set;n:$machine\Administrator;p:full" \
-ace "m:set;n:$machine\Appserver;p:full" \
-ace "m:set;n:$machine\Administrators;p:full" \
-ace "m:set;n:$machine\DBService;p:full" \
-ace "m:set;n:S-1-3-0;p:full" \
-ace "m:set;n:S-1-3-1;p:full"  -rec cont_obj \
-actn delorphanedsids -os dacl &
done
done
wait
