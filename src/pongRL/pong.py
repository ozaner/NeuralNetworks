"""
A Pong playing AI using Policy Gradient Reinforcement Learning.

@author: Ozaner Hansha
"""
import numpy as np
import gym

from policy_net import PolicyNet

# Runtime Parameters
render = True
load_checkpoint = True
checkpoint_every_n_episodes = 10

# Hyperparameters
hidden_layer_size = 200
learning_rate = 0.0005
batch_size_episodes = 1
discount_factor = 0.99
deterministic = False # always vs. tend to pick highest probability

# Map gym's values to policy network's values
MOVE_UP = 2 #Up action in pong gym
MOVE_DOWN = 3 #Down action in pong gym
action_dict = {MOVE_DOWN: 0, MOVE_UP: 1} #Up & Down in this network

# Preprocess frame to remove fluff
def preprocess(frame):
    #frame is now 210x160x3
    frame = frame[35:195] #crops unchanging parts of game
    frame = frame[::2, ::2, 0] #downsample x2, and remove color

    #frame is now 80x80
    frame[frame == 144] = 0 #erase first background
    frame[frame == 109] = 0 #erase second background
    frame[frame != 0] = 1 #everything else (paddles, ball) just set to 1

    #returns flattened 80x80 = 6400 dimension feature vector
    return frame.astype(np.float).ravel()

def discount_rewards(rewards, discount_factor):
    discounted_rewards = np.zeros_like(rewards)
    for t in range(len(rewards)):
        total_discounted_reward = 0
        discount = 1
        for k in range(t, len(rewards)):
            total_discounted_reward += rewards[k] * discount
            discount *= discount_factor
            # Don't count rewards from subsequent rounds
            if rewards[k] != 0:
                break
        discounted_rewards[t] = total_discounted_reward
    return discounted_rewards

env = gym.make('Pong-v0')

pongNet = PolicyNet(
    hidden_layer_size, learning_rate, checkpoints_dir='C:/Users/Weegee 64/Google Drive/Workspace/NeuralNetworks/src/pongRL/checkpoints')
if load_checkpoint:
    pongNet.load_checkpoint()

batch_feature_vector = [] #Vector of state, action, and reward
smoothed_reward = None
episode_count = 1

while True:
    print("Starting episode {}".format(episode_count))

    episode_done = False
    episode_reward_sum = 0

    round_num = 1

    last_observation = env.reset()
    last_observation = preprocess(last_observation)
    action = env.action_space.sample()
    observation = env.step(action)[0]
    observation = preprocess(observation)
    n_steps = 1

    # Episode Loop (Each point)
    while not episode_done:
        if render:
            env.render()

        observation_delta = observation - last_observation
        last_observation = observation
        up_probability = pongNet.forward_pass(observation_delta)[0]

        if deterministic:
            if up_probability > .5:
                action = MOVE_UP
            else:
                action = MOVE_DOWN
        else:
            if np.random.uniform() < up_probability:
                action = MOVE_UP
            else:
                action = MOVE_DOWN

        observation, reward, episode_done, info = env.step(action)
        observation = preprocess(observation)
        episode_reward_sum += reward
        n_steps += 1

        tup = (observation_delta, action_dict[action], reward)
        batch_feature_vector.append(tup)

        if reward == -1:
            print("Round {}: {} time steps; lost...".format(round_num, n_steps))
        elif reward == +1:
            print("Round {}: {} time steps; won!".format(round_num, n_steps))
        if reward != 0:
            round_num += 1
            n_steps = 0

    print("Episode {} finished after {} rounds".format(episode_count, round_num))

    # exponentially smoothed version of reward
    if smoothed_reward is None:
        smoothed_reward = episode_reward_sum
    else:
        smoothed_reward = smoothed_reward * 0.99 + episode_reward_sum * 0.01
    print("Reward total was {0:.3f}; discounted moving average of reward is {1:.3f}".format(episode_reward_sum, smoothed_reward))

    if episode_count % batch_size_episodes == 0:
        states, actions, rewards = zip(*batch_feature_vector)
        rewards = discount_rewards(rewards, discount_factor)
        rewards -= np.mean(rewards)
        rewards /= np.std(rewards)
        batch_feature_vector = list(zip(states, actions, rewards))
        pongNet.train(batch_feature_vector)
        batch_feature_vector = []

    if episode_count % checkpoint_every_n_episodes == 0:
        pongNet.save_checkpoint()

    episode_count += 1