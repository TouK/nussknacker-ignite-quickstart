#!/bin/sh -e

scripts_dir="/opt/nifi/scripts"
nifi_props_file=${NIFI_HOME}/conf/nifi.properties
nifi_bootstrap_file=${NIFI_HOME}/conf/bootstrap.conf

[ -f "${scripts_dir}/common.sh" ] && . "${scripts_dir}/common.sh"

prop_replace "nifi.flow.configuration.file" "${NIFI_HOME}/rafm_conf/flow.xml.gz"

echo "nifi.nar.library.directory.lib1=${NIFI_HOME}/extra-nars" >> "${nifi_props_file}"

"${scripts_dir}/start.sh"
