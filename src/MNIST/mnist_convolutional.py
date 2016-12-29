'''
A Deep Convolutional Neural Network that classifies handwritten Digits (0-9)
Trained & tested using the MNIST data set.
Made in TensorFlow

Layer order:
Input --> Convolution Layer 1 --> Convolution Layer 2 -->
Fully Connected Layer 1 --> Fully Connected Layer 2 --> Output

@author: Ozaner Hansha
'''
#Import Libraries
import tensorflow as tf

#Import Training, Validation & Testing Data
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

#Save path for network tensors.
save_path = 'C:\\Users\Weegee 64\Source Code\workspace\\NeuralNetworks\src\MNIST\mnist_convolutional_saved\conv_mnist.chk'

#Filter Constants
filter_size = 5 #5x5 filter
filter_stride_size = 1 #filter marches through 1 pixel at a time
pooling_size = 2 #2x2 --> halves resolution

#Layer Constants
img_size = 28; #input images are 28x28 pixels
img_size_flat = 784; #28x28 = 784

'''input layer is 1 channel (greyscale image);
   conv. layer 1 outputs 32 channels;
   conv. layer 2 outputs 64 channels;
   fully con. layer 1 input (channels[3]) explained below
   fully con. layer 1 outputs 1028 channels;
   fully con. layer 2 outputs 10 channels (one for each digit)'''
channels = [1,32,64,0,1028,10] #Channels in each layer

'''img_size is halved twice by the pooling_size so after the second convolutional layer the input is now a
tensor of 7x7 images in 64 channels. flattening this means 7*7*64 * 7*7*64 hence the statement below.'''
channels[3] = int((img_size/(pooling_size*2))**2) * channels[2] #number of channels from flattened layer 3 (7*7*64 squared)

#Initializes weights with random normal distribution with a sta.dev. of .1
def weight_variable(shape):
    initial = tf.truncated_normal(shape, stddev=0.1)
    weight_var = tf.Variable(initial, name="weight_var")
    return weight_var

#Initializes bias tensor with .1's and with given shape
def bias_variable(shape):
    initial = tf.constant(0.1, shape=shape)
    bias_var = tf.Variable(initial, name="bias_var")
    return bias_var

#Applies filters W to input x with given parameters, stride size 1, same size as input
def conv2d(x, W):
    return tf.nn.conv2d(x, W, strides=[1, filter_stride_size, filter_stride_size, 1], padding='SAME')

#2x2 Pooling function (Halves resolution of input)
def max_pool_2x2(x):
    return tf.nn.max_pool(x, ksize=[1, pooling_size, pooling_size, 1], strides=[1, pooling_size, pooling_size, 1], padding='SAME')

#General convolutional layer with pooling
def conv_layer(x,inputChannels,outputChannels,filterSize):
    W = weight_variable([filterSize, filterSize, inputChannels, outputChannels])
    b = bias_variable([outputChannels])
    y = tf.nn.relu(conv2d(x, W) + b) #Applies filters then adds bia
    y_pool = max_pool_2x2(y) #Halves resolution
    return y_pool

#General fully connected layer
def fullycon_layer(x,inputChannels,outputChannels):
    W = weight_variable([inputChannels, outputChannels])
    b = bias_variable([outputChannels])
    y = tf.matmul(x, W) + b
    return y

#Input Layer
x = tf.placeholder(tf.float32, shape=[None, img_size_flat]) #nx784 Matrix (Input)
x_image = tf.reshape(x, [-1,img_size,img_size,1]) #Reshape x to 28x28x1 Tensor (1 color channel)

#Convolutional Layer 1
conv1 = conv_layer(x_image, channels[0], channels[1], filter_size)

#Convolutional Layer 2
conv2 = conv_layer(conv1, channels[1], channels[2], filter_size)

#Conv. Layer 2 (Flattened for FC Layer 1)
'''Flattens the output of conv layer 2 to fit the linear fc layer 1'''
conv2_flat = tf.reshape(conv2, [-1, channels[3]])

#Fully Connected Layer 1
fc1 = fullycon_layer(conv2_flat, channels[3], channels[4])

#FC Layer 1 (ReLu)
'''This activation function is just max(fc1,0) (i.e all negative values become 0)
This means that (at this stage) negative evidence is thrown out.
This has the property of avoiding "vanishing gradients" which kill sections of NNs'''
fc1_relu = tf.nn.relu(fc1)

#FC Layer 1 (Dropout)
'''Dropout has a certain probability of drops a neural connection.
Is used while training to prevent over fitting'''
keep_prob = tf.placeholder(tf.float32) #Defined during training via feed_dict
fc1_drop = tf.nn.dropout(fc1_relu, keep_prob)

#Fully Connected Layer 2 (turns features into evidence for 10 classes)s
fc2 = fullycon_layer(fc1_drop, channels[4], channels[5])

#Output
'''Softmax activation function applied to get raw probabilities from log-probabilities
and to normalize probabilities so that results can be easily digested.
softmax(fc2) = norm(exp(fc2))'''
y_hat = tf.nn.softmax(fc2)

#Define Loss and train step
y = tf.placeholder(tf.float32, shape=[None, channels[5]]) #nx10 Matrix (One-Hot Vector, Label Data)
'''fc2 is used for cross_entropy instead of y_hat because the softmax_cross_entropy function does 
softmax internally to keep the function numerically stable'''
cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(fc2, y)) #Cost Function
train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy) #Training step (optimizer)

#Define Accuracy
correct_prediction = tf.equal(tf.argmax(fc2,1), tf.argmax(y,1)) #List of booleans (correct or not)
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32)) #Average of above list

#Create/Initialize Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

#Training (20,000 batches of 50)
for i in range(20001):
    batch = mnist.train.next_batch(50)
    if i%100 == 0:
        train_accuracy = accuracy.eval(feed_dict={x:batch[0], y: batch[1], keep_prob: 1.0})
        print("Train Accuracy @Step %d:"%(i), '{0:.1%}'.format(train_accuracy))
    train_step.run(feed_dict={x: batch[0], y: batch[1], keep_prob: 0.5})

#Save Model (the weights and biases
saver = tf.train.Saver()
saver.save(sess, save_path)

# #Load Model
# saver = tf.train.Saver()
# saver.restore(sess, save_path)

#Accuracy Check (10 batches of 50)
for i in range(10):
    testSet = mnist.test.next_batch(50)
    train_accuracy = accuracy.eval(feed_dict={ x: testSet[0], y: testSet[1], keep_prob: 1.0})
    print("Test Accuracy @Step %d:"%(i), '{0:.1%}'.format(train_accuracy))