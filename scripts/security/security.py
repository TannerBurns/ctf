#!/usr/bin/python

#groupname=$1
#gnumber=$2
#dname=$3
#$uname=$4
#pathtoserver=$5
#pathtoflagfile=$6
#pathofstartfile=$7

import subprocess
from random_words import RandomWords
import random

list1=[]
list2=[]
list3=[]
list4=[]
groupnumber=[]
rw = RandomWords()


with open ("/vagrant/scripts/security/paths.txt", "r") as file1:
	for line in file1:
		list1=line.strip('\n').split(',')
		list2.append(list1)
		groupname = rw.random_word()
		dname = rw.random_word()
		uname = rw.random_word()
		tmp=str(groupname)+","+str(dname)+","+str(uname)
		list3=tmp.split(',')
		list4.append(list3)

groupnumber=random.sample(range(1010,1099),len(list2))

x=0
while x < len(list2):
	cmd = ['/vagrant/scripts/security/security.sh']+ list4[x] + list2[x] + [str(groupnumber[x])]
	subprocess.call(cmd)
	x+=1
