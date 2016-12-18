'''
Following through the MNIST tutorial from TensorFlow's website.
'''
#Import Libraries
import tensorflow as tf

#Import Training, Validation & Testing Data
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

#Create Model
x = tf.placeholder(tf.float32, [None, 784]) #Placeholder for input (784 is for 28*28 MNIST image data, reduced to 1D)
W = tf.Variable(tf.zeros([784, 10])) #Variable for Weights, (10 for 10 classes (the digits))
b = tf.Variable(tf.zeros([10]))#Variable for Biases

y = tf.nn.softmax(tf.matmul(x, W) + b) #Literally y=softmax(Wx+b), how elegant

#Define Cost and Optimizer
y_ = tf.placeholder(tf.float32, [None, 10]) #Placeholder for y' (the one-hot label vectors)

cross_entropy = tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(y), reduction_indices=[1])) #Cross Entropy Function
# cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_)) #This one is numerically stable
train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy) #Preform gradient descent on the cross_entropy

#Init Execution
init = tf.global_variables_initializer() #Init variables
sess = tf.Session() #Create new TF session
sess.run(init) #Run session with initialized variables

#Run Training
for i in range(1000):
    batch_xs, batch_ys = mnist.train.next_batch(100)
    sess.run(train_step, feed_dict={x: batch_xs, y_: batch_ys})

#Evaluation
correct_prediction = tf.equal(tf.argmax(y,1), tf.argmax(y_,1)) #Creates a list of booleans that represent which ones it got right.
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32)) #Averages correct predictions

print(sess.run(accuracy, feed_dict={x: mnist.test.images, y_: mnist.test.labels})) #Print Results