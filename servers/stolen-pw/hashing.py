#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

xhash = "372b8bac8515639d85628f0305677467"
rhash = "strongpassword123"

print("\nI found this hashed password, can you give me the password?\n")
sys.stdout.flush()
print xhash + '\n'
sys.stdout.flush()
ans = raw_input()

if ans == rhash:
	print "\nChecking to see if I can log in..."
	sys.stdout.flush()
	print "Nice! That was the correct password, here is the flag: FLAG{md5_i5_w34k}\n"
	sys.stdout.flush()
else:
	print "I checked that password, and it was not the correct one."
	sys.stdout.flush()