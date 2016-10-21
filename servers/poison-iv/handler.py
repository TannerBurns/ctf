#!/usr/bin/python
# -*- coding: utf-8 -*-

import signal, subprocess, sys

#def signal_handler(signal, frame):
#   print "In handler"

#signal.signal(signal.SIGALRM,signal_handler)
    #signal.alarm(5)

#signal.alarm(2)
cmd = './questions.py'
subprocess.Popen(['/usr/bin/python','./secret.py']).communicate()