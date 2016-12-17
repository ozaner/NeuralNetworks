'''
Following through the MNIST tutorial from TensorFlow's website.
'''
#Import Statements
import tensorflow as tf

#Import Training
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

x = tf.placeholder(tf.float32, [None, 784]) #Placeholder for input (784 is for 28*28 MNIST image data, reduced to 1D)
W = tf.Variable(tf.zeros([784, 10])) #Variable for Weights, (10 for 10 classes (the digits))
b = tf.Variable(tf.zeros([10]))#Variable for Biases

y = tf.nn.softmax(tf.matmul(x, W) + b) #Literally y=softmax(Wx+b), how elegant

