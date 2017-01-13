#!/bin/bash

vagvm=txctf_default_1484253727476_66769
ctfvm=txctf.20170112

if [ ! -d "${HOME}/vmware/${vagvm}" ]; then
    echo "Set correct vagvm in packvm.sh"
    exit 1
fi

if [ -f ./${ctfvm}.ova ]; then
    rm -f ./${ctfvm}.ova
fi

vboxmanage clonevm ${vagvm} --name ${ctfvm}
vboxmanage registervm ${HOME}/vmware/${ctfvm}/${ctfvm}.vbox
vboxmanage sharedfolder remove ${ctfvm} --name vagrant
vboxmanage export ${ctfvm} -o ./${ctfvm}.ova
vboxmanage unregistervm ${ctfvm}
rm -rf ${HOME}/vmware/${ctfvm}
