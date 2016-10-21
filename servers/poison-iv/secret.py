#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

answer="19a9d10c3b15464f9c585543cef10bce"
response=""

print("\nHey, did you figure out the aes without the key?\n")
sys.stdout.flush()
response = raw_input()

if response == answer:
	print "\nVery good! Sending you the flag.."
	sys.stdout.flush()
	print "Here is the flag: FLAG{AeS_1V_Be4ts_k3y}\n"
	sys.stdout.flush()
else:
	print "How did you come up with that one??"
	sys.stdout.flush()