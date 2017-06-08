'''
Created on Jun 6, 2017

@author: Weegee 64
'''
import os
import numpy as np
import tensorflow as tf

#Get dataset file path
path = os.path.dirname(__file__)
file_name = os.path.join(path, 'wdbc.data')
file_object = open(file_name, 'r')

#Split dataset into separate points (as strings)
string_points = file_object.read().split('\n')
string_points.pop(-1)

#Initialize dataset class arrays
benign_points = np.empty((0,10))
malignant_points = np.empty((0,10))

#Trim data points, format as np.arrays, add to class arrays (Benign or Malignant)
for point in string_points:
    point = point.split(',')
    if 'M' in point: #if malignant
        point = point[2:12] #trim for only the 10 important features
        temp = np.array(point)
        temp = temp.astype(float)
        malignant_points = np.append(malignant_points, [temp], axis=0)
    else: #if benign (can only be labeled 'B' or 'M')
        point = point[2:12] #trim for only the 10 important features
        temp = np.array(point)
        temp = temp.astype(float)
        benign_points = np.append(benign_points, [temp], axis=0)

# End of data import. Start construction of neural network

#Initialize different training sets for both classes.
experience_matrix_B = tf.constant(benign_points)
experience_matrix_M = tf.constant(malignant_points)

#Training variables
num_input_features = 10

with tf.name_scope('Hidden_Layer'):
    x = tf.placeholder(tf.float32, shape=[None, num_input_features]) #nx10 Matrix (Input)
    W = tf.transpose(tf.Variable(tf.zeros([num_input_features,1]))) #10x1 Matrix (Weights)
    b = tf.Variable(tf.zeros([1])) #10 long Vector (Biases)

    y_noSoftmax = tf.matmul(W,x) + b
    
y_hat = tf.nn.softmax(y_noSoftmax, name='y_Hat') #This is the Neural Network in one line: y_hat = softmax(Wx + b)

#Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

# #Training Model
# with tf.name_scope('Training'):
#     y = tf.placeholder(tf.float32, shape=[None, num_classes],name='y_Labeled') #nx10 Matrix (One-Hot Vector, Label Data)
#     '''y_noSoftmax is used for cross_entropy instead of y_hat because the softmax_cross_entropy function does 
#     softmax internally to keep the function numerically stable '''
#     cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits = y_noSoftmax, labels = y),name='Loss_Function') #Loss Function (cross_entropy(y_hat,y))
#     train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy,name='Train_Step') #Performs Gradient Descent on loss function
# 
# for i in range(1000): #Run train step repeatedly
#     batch = mnist.train.next_batch(300) #Get a batch of training data
#     train_step.run(feed_dict={x: batch[0], y: batch[1]}) #Run training step on that batch
