#!/usr/bin/env python

import sys
import os
import tempfile
import re
from shutil import copyfile

INPUTFILENAME	= "file.json"
OUTPUTFILE	= "out.json"
NEW_VERSION	= ""

fout = open(OUTPUTFILE, 'w')
with open(INPUTFILENAME, 'r+') as f:
	for line in f:
		if line.find("version\":") == -1:
			fout.write(line)
			continue
		else:
			#print('Found')
			#print('\nPrevious Version\n %s\n'%line)
			ver = line.split("\"0.1.")
			ver[1] = ver[1].replace("\"", "")
			ver[1] = ver[1].replace(",", "")
			newVersion = int(ver[1].lstrip()) + 1
			NEW_VERSION = str(newVersion)
			#print "%s %s " % (ver[1], NEW_VERSION)
			print(line)
			newLine = '  \"version\":\"0.1.'+str(newVersion)+'\",\n'
			#print('\nNew Version \n %s\n'%newLine)
			fout.write(newLine);

f.close()
fout.close()
copyfile(OUTPUTFILE, INPUTFILENAME)
copyfile(OUTPUTFILE, './utils/package.json')
copyfile(OUTPUTFILE, 'package.json')

command = 'sh _upgrade.sh '+ '0.1.'+NEW_VERSION
os.system(command)



