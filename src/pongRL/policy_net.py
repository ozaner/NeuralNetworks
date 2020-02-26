import os.path
import numpy as np
import tensorflow as tf

OBSERVATIONS_SIZE = 6400

class PolicyNet:
    episodes = 0;
    def __init__(self, hidden_layer_size, learning_rate, checkpoints_dir):
        self.checkpoints_dir = checkpoints_dir
        self.learning_rate = learning_rate
        self.observations = tf.placeholder(tf.float32, [None, OBSERVATIONS_SIZE])

        self.sampled_actions = tf.placeholder(tf.float32, [None, 1])
        self.advantage = tf.placeholder(tf.float32, [None, 1], name='advantage')

        hidden_layer = tf.layers.dense(
            self.observations,
            units=hidden_layer_size,
            activation=tf.nn.relu,
            kernel_initializer=tf.contrib.layers.xavier_initializer())

        self.up_probability = tf.layers.dense(
            hidden_layer,
            units=1,
            activation=tf.sigmoid,
            kernel_initializer=tf.contrib.layers.xavier_initializer())

        self.loss = tf.losses.log_loss(
            labels=self.sampled_actions,
            predictions=self.up_probability,
            weights=self.advantage)
        optimizer = tf.train.AdamOptimizer(self.learning_rate)
        self.train_op = optimizer.minimize(self.loss)

        self.sess = tf.InteractiveSession()

        tf.global_variables_initializer().run()

        self.saver = tf.train.Saver()
        self.checkpoint_file = os.path.join(checkpoints_dir, 'policy_network.ckpt')
        # self.checkpoint_file = checkpoints_dir+'/policy_network.ckpt'


    def forward_pass(self, observations):
        up_probability = self.sess.run(
            self.up_probability,
            feed_dict={self.observations: observations.reshape([1, -1])})
        return up_probability

    def train(self, feature_vector):
        print("Training with {} feature_vector".format(len(feature_vector)))

        # Unzip feature vector
        states, actions, rewards = zip(*feature_vector)

        # Turn array into column vector
        states = np.vstack(states)
        actions = np.vstack(actions)
        rewards = np.vstack(rewards)

        feed_dict = {
            self.observations: states,
            self.sampled_actions: actions,
            self.advantage: rewards
        }
        self.sess.run(self.train_op, feed_dict)
    import os
    def save_checkpoint(self):
        print("Saving checkpoint...")

        os.remove(self.checkpoint_file + ".data-00000-of-00001")
        self.saver.save(self.sess, self.checkpoint_file)
        file = open(self.checkpoints_dir+"/stats.txt","w+")
        file.write(str(self.episodes))
        file.close()

    def load_checkpoint(self):
        print("Loading checkpoint...")
        self.saver.restore(self.sess, self.checkpoint_file)
        file = open(self.checkpoints_dir+"/stats.txt","r")
        self.episodes = int(file.read())
        file.close()
        print(self.episodes)
