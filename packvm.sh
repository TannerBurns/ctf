#!/bin/bash

vagvm=txctf_default_1484242202833_27144
ctfvm=txctf.20170112

if [ ! -d "${HOME}/vmware/${vagvm}" ]; then
    echo "Set correct vagvm in packvm.sh"
    exit 1
fi

vboxmanage clonevm ${vagvm} --name ${ctfvm}
vboxmanage registervm ${HOME}/vmware/${ctfvm}/${ctfvm}.vbox
vboxmanage export ${ctfvm} -o ./${ctfvm}.ova
vboxmanage unregistervm ${ctfvm}
rm -rf ${HOME}/vmware/${ctfvm}
