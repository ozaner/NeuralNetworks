'''
Created on Jun 6, 2017

@author: Weegee 64
'''
import os
import numpy as np
import tensorflow as tf
import random

#Get dataset file path
path = os.path.dirname(__file__)
file_name = os.path.join(path, 'wdbc.data')
file_object = open(file_name, 'r')

#Split dataset into separate points (as strings)
string_points = file_object.read().split('\n')
string_points.pop(-1)
random.shuffle(string_points) #Randomize (avoid bias)

#Initialize dataset class arrays
point_array = np.empty((0,10))
y_labels = np.empty((0,2))

#Trim data points, format as np.arrays, add to class arrays (Benign or Malignant)
for point in string_points:
    point = point.split(',')
    if 'M' in point: #if malignant
        y_labels = np.append(y_labels, [[0,1]], axis=0)
    else: #if benign (can only be labeled 'B' or 'M')
        y_labels = np.append(y_labels, [[1,0]], axis=0)
    point = point[2:12] #trim for only the 10 important features
    temp = np.array(point) #convert to numpy array
    temp = temp.astype(float) #cast as float array
    point_array = np.append(point_array, [temp], axis=0)

# End of data import. Start construction of neural network

#Split training and testing data
experience_matrix = point_array[0:400]
experience_matrix_y = y_labels[0:400]
test_matrix = point_array[400:]
test_matrix_y = y_labels[400:]

#Training variables
num_input_features = 10

with tf.name_scope('Hidden_Layer'):
    x = tf.placeholder(tf.float32, shape=[None, num_input_features]) #nx10 Matrix (Input)
    W = tf.Variable(tf.zeros([num_input_features,2])) #10x1 Matrix (Weights)
    b = tf.Variable(tf.zeros([2])) #2 long vector (Bias)

    y_noSoftmax = tf.matmul(x,W) + b
    
y_hat = tf.nn.softmax(y_noSoftmax, name='y_Hat')

#Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

#Training Model
with tf.name_scope('Training'):
    y = tf.placeholder(tf.float32, shape=[None, 2],name='y_Labeled') #nx2 Matrix (One-Hot Vector, Label Data)
    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits = y_noSoftmax, labels = y),name='Loss_Function') #Loss Function (cross_entropy(y_hat,y))
    train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy,name='Train_Step') #Performs Gradient Descent on loss function
 
for i in range(1000): #Run train step repeatedly
    train_step.run(feed_dict={x: experience_matrix, y: experience_matrix_y}) #Run training step on that batch
    
#Evaluation
with tf.name_scope('Validation'):
    correct_prediction = tf.equal(tf.argmax(y_hat,1), tf.argmax(y,1), name='isCorrect') #Returns whether model made correct prediction (List of booleans)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32),name='Accuracy') #Average of correct prediction (%Accuracy)

print("Accuracy:", '{0:.2%}'.format(accuracy.eval(feed_dict={x: test_matrix, y: test_matrix_y}))) #Print Accuracy
