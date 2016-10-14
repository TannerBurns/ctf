#!/usr/bin/python
import sys
while True:
	data=raw_input()
	try:
		print(eval(data))
		sys.stdout.flush()
	except:
		print(str(data))
		sys.stdout.flush()
