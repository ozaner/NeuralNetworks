'''
Created on Apr 14, 2017

@author: Weegee 64
'''

import tensorflow as tf
from tensorflow.python.tools import freeze_graph
from tensorflow.python.tools import optimize_for_inference_lib

save_path = 'C:\\Users\Weegee 64\Source Code\workspace\\NeuralNetworks\src\MNIST\save\\'

MODEL_NAME = 'mnistNN'

# Freeze the graph

input_graph_path = save_path + MODEL_NAME + '.pb'
checkpoint_path = save_path + MODEL_NAME + '.ckpt'
input_saver_def_path = ""
input_binary = False
output_node_names = "Output"
restore_op_name = "save/restore_all"
filename_tensor_name = "save/Const:0"
output_frozen_graph_name = 'frozen_' + MODEL_NAME + '.pb'
output_optimized_graph_name = 'optimized_' + MODEL_NAME + '.pb'
clear_devices = True


freeze_graph.freeze_graph(input_graph_path, input_saver_def_path,
                          input_binary, checkpoint_path, output_node_names,
                          restore_op_name, filename_tensor_name,
                          save_path + output_frozen_graph_name, clear_devices, "")



# Optimize for inference

input_graph_def = tf.GraphDef()
with tf.gfile.Open(save_path + output_frozen_graph_name, "r") as f:
    data = f.read()
    input_graph_def.ParseFromString(data)

output_graph_def = optimize_for_inference_lib.optimize_for_inference(
        input_graph_def,
        ["x-input"], # an array of the input node(s)
        ["Output"], # an array of output nodes
        tf.float32.as_datatype_enum)

# Save the optimized graph

f = tf.gfile.FastGFile(save_path + output_optimized_graph_name, "w")
f.write(output_graph_def.SerializeToString())

# tf.train.write_graph(output_graph_def, './', output_optimized_graph_name)