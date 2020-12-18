import struct
import matplotlib.pyplot as plt
import numpy as np
import math
mag = []
ph = []
list_hex = []

def readFile(filename):
    myfile = open(filename,'rb')
    myfile.seek(8)
    num = int.from_bytes(myfile.read(), 'big')
    myValues = format(num, 'x')
    n = 2
    myCode = [myValues[i:i+n] for i in range(0, len(myValues), n)]
   

    for i in range(0, len(myCode) - 4, 4):
        val = [''.join(myCode[i:(i+4)][::-1])][0]
        list_hex.append(val)

    list_hex.remove('21212121')

    for i in range (0, len(list_hex)):
        if i%2 == 0:
            mag.append(struct.unpack('!f', bytes.fromhex(list_hex[i]))[0])
        else:
            ph.append(struct.unpack('!f', bytes.fromhex(list_hex[i]))[0])

    
    R = mag[0] * math.cos(math.radians(ph[0]))
    Xc = mag[0] * math.sin(math.radians(ph[0]))

    

if __name__ == "__main__":
    readFile('ACQ_FILE.TXT')