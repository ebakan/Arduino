#!/usr/bin/env python

import serial
import sys

if len(sys.argv) < 2:
    print "Please specify a port, e.g. %s /dev/ttyUSB0" % sys.argv[0]
    sys.exit(-1)

elif len(sys.argv) < 3:
    sys.argv.append("9600")

ser=serial.Serial(sys.argv[1],int(sys.argv[2]))

while True:
    try:
	sys.stdout.write(ser.read())
    except:
	break
ser.close()
