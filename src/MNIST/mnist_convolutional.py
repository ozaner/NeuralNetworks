'''
Following through the Deep Learning MNIST tutorial from TensorFlow's website.
'''
#Import Libraries
import tensorflow as tf

#Import Training, Validation & Testing Data
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

#Initializes
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
    return tf.nn.conv2d(x, W, strides=[1, 1, 1, 1], padding='SAME')

#2x2 Pooling function (Halves resolution of input)
def max_pool_2x2(x):
    return tf.nn.max_pool(x, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding='SAME')

#Placeholders (Input)
x = tf.placeholder(tf.float32, shape=[None, 784]) #nx784 Matrix (Input)
x_image = tf.reshape(x, [-1,28,28,1])

#Convolutional Layer 1
W_conv1 = weight_variable([5, 5, 1, 32])
b_conv1 = bias_variable([32])

h_conv1 = tf.nn.relu(conv2d(x_image, W_conv1) + b_conv1) #Applies filters then adds bias
h_pool1 = max_pool_2x2(h_conv1) #Halves resolution

#Convolutional Layer 2
W_conv2 = weight_variable([5, 5, 32, 64])
b_conv2 = bias_variable([64])

h_conv2 = tf.nn.relu(conv2d(h_pool1, W_conv2) + b_conv2)
h_pool2 = max_pool_2x2(h_conv2)

#Fully Connected Layer 1
W_fc1 = weight_variable([7 * 7 * 64, 1024])
b_fc1 = bias_variable([1024])

h_pool2_flat = tf.reshape(h_pool2, [-1, 7*7*64])
h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)

#Dropout (dropping connection during training to prevent overfitting)
keep_prob = tf.placeholder(tf.float32)
h_fc1_drop = tf.nn.dropout(h_fc1, keep_prob)

#Fully Connected Layer 2 (Readout Layer) (turns evidence into probability)
W_fc2 = weight_variable([1024, 10])
b_fc2 = bias_variable([10])

y_conv = tf.matmul(h_fc1_drop, W_fc2) + b_fc2

#Define Loss and train step
y = tf.placeholder(tf.float32, shape=[None, 10]) #nx10 Matrix (One-Hot Vector, Label Data)
cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y_conv, y))
train_step = tf.train.AdamOptimizer(1e-4).minimize(cross_entropy)
correct_prediction = tf.equal(tf.argmax(y_conv,1), tf.argmax(y,1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

#Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

for i in range(1000):
    batch = mnist.train.next_batch(50)
    if i%100 == 0:
        train_accuracy = accuracy.eval(feed_dict={
        x:batch[0], y: batch[1], keep_prob: 1.0})
        print("step %d, training accuracy %g"%(i, train_accuracy))
    train_step.run(feed_dict={x: batch[0], y: batch[1], keep_prob: 0.5})

#Save Model (the weights and biases
saver = tf.train.Saver()
saver.save(sess, 'C:\\Users\Weegee 64\Source Code\workspace\\NeuralNetworks\src\MNIST\mnist_convolutional_savedconv_mnist.chk')

# #Load Model
# saver = tf.train.Saver()
# saver.restore(sess, 'C:\\Users\Weegee 64\Source Code\workspace\\NeuralNetworks\src\MNIST\mnist_convolutional_savedconv_mnist.chk')

# #Accuracy Check
for i in range(10):
    testSet = mnist.test.next_batch(50)
    print("test accuracy %g"%accuracy.eval(feed_dict={ x: testSet[0], y: testSet[1], keep_prob: 1.0}))