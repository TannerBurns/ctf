#!/bin/bash

#Start stolen-pw server
#echo "Starting the server for Stolen Password"
/vagrant/servers/stolen-pw/server.py &

#Start hacker level server
#echo "Starting server for the Hacker Level"
/vagrant/servers/hackerlvl/server.py &

#Start The Race server
#echo "Starting server for The Race"
/vagrant/servers/race/server.py &

# Starting pyjail server
#echo "Starting server for Pyjail"
cd /vagrant/flags/pyjail; /vagrant/flags/run-pj &

# Starting clash of titans server
#echo "Starting server for Clash of Titans"
/vagrant/servers/clash-of-titans/server.py &

#echo "Starting server for HLE"
/vagrant/servers/hle/server.py &

#echo "Starting server for Poison IV"
/vagrant/servers/poison-iv/server.py &

# Starting formatstring server
#echo "Starting server for Formatstring"
cd /vagrant/flags/formatstring; /vagrant/flags/run-fs
