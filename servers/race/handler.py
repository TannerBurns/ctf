#!/usr/bin/python
# -*- coding: utf-8 -*-

import signal, subprocess

#signal.alarm(2)
#cmd = '/vagrant/servers/race/questions.py -u'
subprocess.Popen(['/usr/bin/python','/vagrant/servers/race/questions.py']).communicate()