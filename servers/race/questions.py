#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys

answer=""
print("If you can answer all my questions in 1 second, I'll give you the flag.\nWhat letter is '01010011'")
sys.stdout.flush()
#print("What letter is '01010011'")
#sys.stdout.flush()
data = raw_input()
if "S" == data[0]:
        answer+=data[0]
        print("What letter is '01100101'")
        sys.stdout.flush()
        data = raw_input()
        if "e" == data[0]:
                answer+=data[0]
                print("What letter is '01100011'")
                sys.stdout.flush()
                data = raw_input()
                if "c" == data[0]:
                        answer+=data[0]
                        print("What letter is '01110010'")
                        sys.stdout.flush()
                        data = raw_input()
                        if "r" == data[0]:
                                answer+=data[0]
                                print("What letter is '01100101'")
                                sys.stdout.flush()
                                data = raw_input()
                                if "e" == data[0]:
                                        answer+=data[0]
                                        print("What letter is '01110100'")
                                        sys.stdout.flush()
                                        data = raw_input()
                                        if "t" == data[0]:
                                                answer+=data[0]
                                                if "Secret" in answer:
                                                        print("FLAG{Ch3ck3r3d_Fl4g5}")
                                                        sys.stdout.flush()
                                        else:
                                                print("Nope it's not " + data + "\n")
                                else:
                                        print("Nope it's not " + data + "\n")
                        else:
                                print("Nope it's not " + data + "\n")
                else:
                        print("Nope it's not " + data + "\n")
        else:
                print("Nope it's not " + data + "\n")
else:
        print("Nope it's not " + data + "\n")