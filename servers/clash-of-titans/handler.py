#!/usr/bin/python
# -*- coding: utf-8 -*-

import signal, subprocess, sys, os

#def signal_handler(signal, frame):
#   print "In handler"

#signal.signal(signal.SIGALRM,signal_handler)
    #signal.alarm(5)

#signal.alarm(2)
tmpc = os.path.dirname(__file__)
tmpc+='/test.js'
subprocess.Popen(['/usr/bin/node',tmpc]).communicate()