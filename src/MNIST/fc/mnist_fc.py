'''
One Layer Neural Network Handwritten Digit Classifier (0-9)
Trained and tested using MNIST data set
Made using TensorFlow

Layer order:
Input --> Fully-Connected Layer --> Output

@author: Ozaner Hansha
'''
#Import Libraries
import tensorflow as tf
import os

#Import Training, Validation & Testing Data
from tensorflow.examples.tutorials.mnist import input_data
mnist = input_data.read_data_sets(os.pardir + "/MNIST_data/", one_hot=True)

#Create Model
img_dim = 28 #28x28 image
img_dim_flat = img_dim * img_dim #784 vector of pixel intensities
num_classes = 10 #10 digits

#The Neural Network: y_hat = softmax(Wx + b)
with tf.name_scope('Hidden_Layer'):
    x = tf.placeholder(tf.float32, shape=[None, img_dim_flat], name='x') #nx784 Matrix (Input)
    W = tf.Variable(tf.zeros([img_dim_flat,num_classes]),name='W') #784x10 Matrix (Weights)
    b = tf.Variable(tf.zeros([num_classes]),name='b') #10 long Vector (Biases)
    logits = tf.matmul(x,W) + b    
y_hat = tf.nn.softmax(logits, name='y_Hat')

#Hidden Layer Summary Data
tf.summary.histogram('Weights', W)
tf.summary.histogram('Biases', b)
tf.summary.histogram('y_Hat', y_hat)
x_2d = tf.reshape(x, [-1,28,28,1], 'x_2d')
tf.summary.image('input', x_2d, 3)

#Session
sess = tf.InteractiveSession() #Create Session
sess.run(tf.global_variables_initializer()) #Init Variables

#Training Model
with tf.name_scope('Training'):
    y = tf.placeholder(tf.float32, shape=[None, num_classes],name='y_Labeled') #nx10 Matrix (One-Hot Vector, Label Data)
    '''y_noSoftmax is used for cross_entropy instead of y_hat because the softmax_cross_entropy function does 
    softmax internally to keep the function numerically stable '''
    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits = logits, labels = y),name='Loss_Function') #Loss Function (cross_entropy(y_hat,y))
    tf.summary.scalar('cross_entropy', cross_entropy)
    train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy,name='Train_Step') #Performs Gradient Descent on loss function

#Evaluation
with tf.name_scope('Validation'):
    correct_prediction = tf.equal(tf.argmax(y_hat,1), tf.argmax(y,1), name='isCorrect') #Returns whether model made correct prediction (List of booleans)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32),name='Accuracy') #Average of correct prediction (%Accuracy)
    tf.summary.scalar('accuracy', accuracy)

#Summary (TensorBoard)
local_path = os.path.dirname(__file__)
save_dir = os.path.join(local_path, 'save/logs')
writer = tf.summary.FileWriter(save_dir)
writer.add_graph(sess.graph)
merged_summary = tf.summary.merge_all()

#Actual Training
for i in range(2001): #Run train step repeatedly
    batch = mnist.train.next_batch(100) #Get a batch of training data
    if i%5 == 0: #Every 5th batch sample and record the summary data
        s = sess.run(merged_summary, feed_dict={x: batch[0], y: batch[1]})
        writer.add_summary(s, i)
    sess.run(train_step, feed_dict={x: batch[0], y: batch[1]}) #Run training step on that batch

print("Accuracy:", '{0:.2%}'.format(accuracy.eval(feed_dict={x: mnist.test.images, y: mnist.test.labels}))) #Print Accuracy

