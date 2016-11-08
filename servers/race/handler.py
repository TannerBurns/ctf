#!/usr/bin/python
# -*- coding: utf-8 -*-

import signal, subprocess, os

signal.alarm(1)
tmpc = os.path.dirname(__file__)
tmpc+='/questions.py'
subprocess.Popen(['/usr/bin/python',tmpc]).communicate()