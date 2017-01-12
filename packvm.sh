#!/bin/bash

vagvm=txctf_default_1484248959964_61735
ctfvm=txctf.20170112

if [ ! -d "${HOME}/vmware/${vagvm}" ]; then
    echo "Set correct vagvm in packvm.sh"
    exit 1
fi

vboxmanage clonevm ${vagvm} --name ${ctfvm}
vboxmanage registervm ${HOME}/vmware/${ctfvm}/${ctfvm}.vbox
vboxmanage sharedfolder remove ${ctfvm} --name vagrant
vboxmanage export ${ctfvm} -o ./${ctfvm}.ova
vboxmanage unregistervm ${ctfvm}
rm -rf ${HOME}/vmware/${ctfvm}
