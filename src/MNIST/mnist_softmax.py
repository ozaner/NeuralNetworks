'''
Following through the MNIST beginner tutorial from TensorFlow's website.
'''
#Import Libraries
import tensorflow as tf

#Import Training, Validation & Testing Data
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

#Create Model
img_dim = 28 #28x28 image
img_dim_flat = img_dim * img_dim #784 vector of pixel intensities
num_classes = 10 #10 digits

x = tf.placeholder(tf.float32, shape=[None, img_dim_flat]) #nx784 Matrix (Input)
W = tf.Variable(tf.zeros([img_dim_flat,num_classes])) #784x10 Matrix (Weights)
b = tf.Variable(tf.zeros([num_classes])) #10 long Vector (Biases)

y_hat = tf.matmul(x,W) + b #This is the Neural Network: y_hat = Wx + b

#Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

#Training Model
y = tf.placeholder(tf.float32, shape=[None, num_classes]) #nx10 Matrix (One-Hot Vector, Label Data)
cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y_hat, y)) #Loss Function (cross_entropy(y_hat,y))
train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy) #Performs Gradient Descent on loss function

for i in range(1000): #Run train step repeatedly
    batch = mnist.train.next_batch(300) #Get a batch of training data
    train_step.run(feed_dict={x: batch[0], y: batch[1]}) #Run training step on that batch

#Evaluation
correct_prediction = tf.equal(tf.argmax(y_hat,1), tf.argmax(y,1)) #Returns whether model made correct prediction (List of booleans)
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32)) #Average of correct prediction (%Accuracy)

print("Accuracy:", '{0:.2%}'.format(accuracy.eval(feed_dict={x: mnist.test.images, y: mnist.test.labels}))) #Print Accuracy