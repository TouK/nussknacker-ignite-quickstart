#!/bin/sh

/opt/ignite/apache-ignite/bin/sqlline.sh -u 'jdbc:ignite:thin://ignite' -n ignite -p ignite -f $@
