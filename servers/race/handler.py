#!/usr/bin/python
# -*- coding: utf-8 -*-

import signal, subprocess

signal.alarm(1)
subprocess.Popen(['/usr/bin/python','/vagrant/servers/race/questions.py']).communicate()