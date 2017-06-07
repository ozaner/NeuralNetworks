'''
Created on Jun 6, 2017

@author: Weegee 64
'''
import os
import numpy as np
#import tensorflow as tf

path = os.path.dirname(__file__)
filename = os.path.join(path, 'wdbc.data')
fileobject = open(filename, 'r')

stringPoints = fileobject.read().split('\n')
stringPoints.pop(-1)

benignPoints = np.array
malignantPoints = np.array

for point in stringPoints:
    point = point.split(',')
    if 'M' in point:
        point = point[2:12]
        temp = np.array(point)
        temp = temp.astype(float)
        malignantPoints.append(temp)
    else:
        point = point[2:12]
        temp = np.array(point)
        temp = temp.astype(float)
        benignPoints.append(temp)
print(benignPoints)