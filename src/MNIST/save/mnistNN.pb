node {
  name: "input/x-input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "input/x-input-img/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\034\000\000\000\034\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "input/x-input-img"
  op: "Reshape"
  input: "input/x-input"
  input: "input/x-input-img/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "Conv._Layer_1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal/mul"
  op: "Mul"
  input: "Conv._Layer_1/truncated_normal/TruncatedNormal"
  input: "Conv._Layer_1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv._Layer_1/truncated_normal"
  op: "Add"
  input: "Conv._Layer_1/truncated_normal/mul"
  input: "Conv._Layer_1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Assign"
  op: "Assign"
  input: "Conv._Layer_1/weight_var"
  input: "Conv._Layer_1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/read"
  op: "Identity"
  input: "Conv._Layer_1/weight_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Conv._Layer_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Assign"
  op: "Assign"
  input: "Conv._Layer_1/bias_var"
  input: "Conv._Layer_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/read"
  op: "Identity"
  input: "Conv._Layer_1/bias_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "Conv._Layer_1/Conv2D"
  op: "Conv2D"
  input: "input/x-input-img"
  input: "Conv._Layer_1/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/add"
  op: "Add"
  input: "Conv._Layer_1/Conv2D"
  input: "Conv._Layer_1/bias_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv._Layer_1/Relu"
  op: "Relu"
  input: "Conv._Layer_1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv._Layer_1/MaxPool"
  op: "MaxPool"
  input: "Conv._Layer_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "Conv.Layer_2/Convolution/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal/mul"
  op: "Mul"
  input: "Conv.Layer_2/Convolution/truncated_normal/TruncatedNormal"
  input: "Conv.Layer_2/Convolution/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/truncated_normal"
  op: "Add"
  input: "Conv.Layer_2/Convolution/truncated_normal/mul"
  input: "Conv.Layer_2/Convolution/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var"
  input: "Conv.Layer_2/Convolution/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/weight_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var"
  input: "Conv.Layer_2/Convolution/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/bias_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/Conv2D"
  op: "Conv2D"
  input: "Conv._Layer_1/MaxPool"
  input: "Conv.Layer_2/Convolution/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/add"
  op: "Add"
  input: "Conv.Layer_2/Convolution/Conv2D"
  input: "Conv.Layer_2/Convolution/bias_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/Relu"
  op: "Relu"
  input: "Conv.Layer_2/Convolution/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/MaxPool"
  op: "MaxPool"
  input: "Conv.Layer_2/Convolution/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Flatten_Conv_2/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377@\014\000\000"
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Flatten_Conv_2"
  op: "Reshape"
  input: "Conv.Layer_2/Convolution/MaxPool"
  input: "Conv.Layer_2/Flatten_Conv_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "@\014\000\000\004\004\000\000"
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal/mul"
  op: "Mul"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal/TruncatedNormal"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/truncated_normal"
  op: "Add"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal/mul"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var"
  input: "FC_Layer_1/FC_Layer_1/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/weight_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1028
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var"
  input: "FC_Layer_1/FC_Layer_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/bias_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/MatMul"
  op: "MatMul"
  input: "Conv.Layer_2/Flatten_Conv_2"
  input: "FC_Layer_1/FC_Layer_1/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/add"
  op: "Add"
  input: "FC_Layer_1/FC_Layer_1/MatMul"
  input: "FC_Layer_1/FC_Layer_1/bias_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/ReLu"
  op: "Relu"
  input: "FC_Layer_1/FC_Layer_1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/Shape"
  op: "Shape"
  input: "FC_Layer_1/ReLu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "FC_Layer_1/Dropout/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform/sub"
  op: "Sub"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/max"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform/mul"
  op: "Mul"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/RandomUniform"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/random_uniform"
  op: "Add"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/mul"
  input: "FC_Layer_1/Dropout/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/add"
  op: "Add"
  input: "FC_Layer_1/Dropout/Placeholder"
  input: "FC_Layer_1/Dropout/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/Floor"
  op: "Floor"
  input: "FC_Layer_1/Dropout/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/div"
  op: "RealDiv"
  input: "FC_Layer_1/ReLu"
  input: "FC_Layer_1/Dropout/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_1/Dropout/dropout/mul"
  op: "Mul"
  input: "FC_Layer_1/Dropout/dropout/div"
  input: "FC_Layer_1/Dropout/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\004\004\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "FC_Layer_2/truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal/mul"
  op: "Mul"
  input: "FC_Layer_2/truncated_normal/TruncatedNormal"
  input: "FC_Layer_2/truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_2/truncated_normal"
  op: "Add"
  input: "FC_Layer_2/truncated_normal/mul"
  input: "FC_Layer_2/truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "FC_Layer_2/weight_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Assign"
  op: "Assign"
  input: "FC_Layer_2/weight_var"
  input: "FC_Layer_2/truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/read"
  op: "Identity"
  input: "FC_Layer_2/weight_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
}
node {
  name: "FC_Layer_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "FC_Layer_2/bias_var"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Assign"
  op: "Assign"
  input: "FC_Layer_2/bias_var"
  input: "FC_Layer_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/read"
  op: "Identity"
  input: "FC_Layer_2/bias_var"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
}
node {
  name: "FC_Layer_2/MatMul"
  op: "MatMul"
  input: "FC_Layer_1/Dropout/dropout/mul"
  input: "FC_Layer_2/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "FC_Layer_2/add"
  op: "Add"
  input: "FC_Layer_2/MatMul"
  input: "FC_Layer_2/bias_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Output"
  op: "Softmax"
  input: "FC_Layer_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Training_Input/y"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Shape"
  op: "Shape"
  input: "FC_Layer_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Shape_1"
  op: "Shape"
  input: "FC_Layer_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Sub"
  op: "Sub"
  input: "Training/Cost_Function/Rank_1"
  input: "Training/Cost_Function/Sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Slice/begin"
  op: "Pack"
  input: "Training/Cost_Function/Sub"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Training/Cost_Function/Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Slice"
  op: "Slice"
  input: "Training/Cost_Function/Shape_1"
  input: "Training/Cost_Function/Slice/begin"
  input: "Training/Cost_Function/Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/concat/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Cost_Function/concat"
  op: "ConcatV2"
  input: "Training/Cost_Function/concat/values_0"
  input: "Training/Cost_Function/Slice"
  input: "Training/Cost_Function/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Reshape"
  op: "Reshape"
  input: "FC_Layer_2/add"
  input: "Training/Cost_Function/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Rank_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Shape_2"
  op: "Shape"
  input: "Training/Training_Input/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Sub_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Sub_1"
  op: "Sub"
  input: "Training/Cost_Function/Rank_2"
  input: "Training/Cost_Function/Sub_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_1/begin"
  op: "Pack"
  input: "Training/Cost_Function/Sub_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_1/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_1"
  op: "Slice"
  input: "Training/Cost_Function/Shape_2"
  input: "Training/Cost_Function/Slice_1/begin"
  input: "Training/Cost_Function/Slice_1/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/concat_1/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Cost_Function/concat_1"
  op: "ConcatV2"
  input: "Training/Cost_Function/concat_1/values_0"
  input: "Training/Cost_Function/Slice_1"
  input: "Training/Cost_Function/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Reshape_1"
  op: "Reshape"
  input: "Training/Training_Input/y"
  input: "Training/Cost_Function/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Cost_Function"
  op: "SoftmaxCrossEntropyWithLogits"
  input: "Training/Cost_Function/Reshape"
  input: "Training/Cost_Function/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Cost_Function/Sub_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Sub_2"
  op: "Sub"
  input: "Training/Cost_Function/Rank"
  input: "Training/Cost_Function/Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_2/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_2/size"
  op: "Pack"
  input: "Training/Cost_Function/Sub_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Training/Cost_Function/Slice_2"
  op: "Slice"
  input: "Training/Cost_Function/Shape"
  input: "Training/Cost_Function/Slice_2/begin"
  input: "Training/Cost_Function/Slice_2/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Reshape_2"
  op: "Reshape"
  input: "Training/Cost_Function/Cost_Function"
  input: "Training/Cost_Function/Slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Cost_Function/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Cost_Function/Mean"
  op: "Mean"
  input: "Training/Cost_Function/Reshape_2"
  input: "Training/Cost_Function/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Fill"
  op: "Fill"
  input: "Training/Optimizer/gradients/Shape"
  input: "Training/Optimizer/gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Fill"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape"
  op: "Shape"
  input: "Training/Cost_Function/Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Tile"
  op: "Tile"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Reshape"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape_1"
  op: "Shape"
  input: "Training/Cost_Function/Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Prod"
  op: "Prod"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape_1"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Prod_1"
  op: "Prod"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Shape_2"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Maximum"
  op: "Maximum"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Prod_1"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Prod"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Cast"
  op: "Cast"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/truediv"
  op: "RealDiv"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Tile"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_2_grad/Shape"
  op: "Shape"
  input: "Training/Cost_Function/Cost_Function"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_2_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Mean_grad/truediv"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/zeros_like"
  op: "ZerosLike"
  input: "Training/Cost_Function/Cost_Function:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/PreventGradient"
  op: "PreventGradient"
  input: "Training/Cost_Function/Cost_Function:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/ExpandDims"
  op: "ExpandDims"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_2_grad/Reshape"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/mul"
  op: "Mul"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/ExpandDims"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/PreventGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_grad/Shape"
  op: "Shape"
  input: "FC_Layer_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Cost_Function_grad/mul"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape"
  op: "Shape"
  input: "FC_Layer_2/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 10
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_grad/Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Sum"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/Training/Cost_Function/Reshape_grad/Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Sum_1"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_2/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/control_dependency"
  input: "FC_Layer_2/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "FC_Layer_1/Dropout/dropout/mul"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul"
  input: "^Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul"
  input: "^Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul_1"
  input: "^Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape"
  op: "Shape"
  input: "FC_Layer_1/Dropout/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "FC_Layer_1/Dropout/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/mul"
  op: "Mul"
  input: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/control_dependency"
  input: "FC_Layer_1/Dropout/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/mul"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "FC_Layer_1/Dropout/dropout/div"
  input: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/mul_1"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Sum_1"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape"
  op: "Shape"
  input: "FC_Layer_1/ReLu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape_1"
  op: "Shape"
  input: "FC_Layer_1/Dropout/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/control_dependency"
  input: "FC_Layer_1/Dropout/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Neg"
  op: "Neg"
  input: "FC_Layer_1/ReLu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Neg"
  input: "FC_Layer_1/Dropout/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv_1"
  input: "FC_Layer_1/Dropout/Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/mul"
  op: "Mul"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/mul_grad/tuple/control_dependency"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/mul"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Sum_1"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/ReLu_grad/ReluGrad"
  op: "ReluGrad"
  input: "Training/Optimizer/gradients/FC_Layer_1/Dropout/dropout/div_grad/tuple/control_dependency"
  input: "FC_Layer_1/ReLu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape"
  op: "Shape"
  input: "FC_Layer_1/FC_Layer_1/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1028
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/ReLu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/FC_Layer_1/ReLu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Sum_1"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/control_dependency"
  input: "FC_Layer_1/FC_Layer_1/weight_var/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "Conv.Layer_2/Flatten_Conv_2"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul_1"
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul_1"
  input: "^Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Flatten_Conv_2_grad/Shape"
  op: "Shape"
  input: "Conv.Layer_2/Convolution/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Flatten_Conv_2_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/control_dependency"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Flatten_Conv_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "Conv.Layer_2/Convolution/Relu"
  input: "Conv.Layer_2/Convolution/MaxPool"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Flatten_Conv_2_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/MaxPool_grad/MaxPoolGrad"
  input: "Conv.Layer_2/Convolution/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape"
  op: "Shape"
  input: "Conv.Layer_2/Convolution/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Relu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Sum"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Relu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Sum_1"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Shape"
  op: "Shape"
  input: "Conv._Layer_1/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Shape"
  input: "Conv.Layer_2/Convolution/weight_var/read"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "Conv._Layer_1/MaxPool"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Shape_1"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropInput"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropInput"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropFilter"
  input: "^Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "Conv._Layer_1/Relu"
  input: "Conv._Layer_1/MaxPool"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "Training/Optimizer/gradients/Conv._Layer_1/MaxPool_grad/MaxPoolGrad"
  input: "Conv._Layer_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape"
  op: "Shape"
  input: "Conv._Layer_1/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Sum"
  op: "Sum"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Relu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Sum"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Sum_1"
  op: "Sum"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Relu_grad/ReluGrad"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape_1"
  op: "Reshape"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Sum_1"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape_1"
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape_1"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv._Layer_1/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Shape"
  op: "Shape"
  input: "input/x-input-img"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Shape"
  input: "Conv._Layer_1/weight_var/read"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\005\000\000\000\005\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "input/x-input-img"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Shape_1"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropInput"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropFilter"
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropInput"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropFilter"
  input: "^Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "Training/Optimizer/beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Training/Optimizer/beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Training/Optimizer/beta1_power/Assign"
  op: "Assign"
  input: "Training/Optimizer/beta1_power"
  input: "Training/Optimizer/beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/beta1_power/read"
  op: "Identity"
  input: "Training/Optimizer/beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Training/Optimizer/beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Training/Optimizer/beta2_power/Assign"
  op: "Assign"
  input: "Training/Optimizer/beta2_power"
  input: "Training/Optimizer/beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/beta2_power/read"
  op: "Identity"
  input: "Training/Optimizer/beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam/Assign"
  op: "Assign"
  input: "Conv._Layer_1/weight_var/Adam"
  input: "Training/Optimizer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam/read"
  op: "Identity"
  input: "Conv._Layer_1/weight_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam_1/Assign"
  op: "Assign"
  input: "Conv._Layer_1/weight_var/Adam_1"
  input: "Training/Optimizer/zeros_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/weight_var/Adam_1/read"
  op: "Identity"
  input: "Conv._Layer_1/weight_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam/Assign"
  op: "Assign"
  input: "Conv._Layer_1/bias_var/Adam"
  input: "Training/Optimizer/zeros_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam/read"
  op: "Identity"
  input: "Conv._Layer_1/bias_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam_1/Assign"
  op: "Assign"
  input: "Conv._Layer_1/bias_var/Adam_1"
  input: "Training/Optimizer/zeros_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv._Layer_1/bias_var/Adam_1/read"
  op: "Identity"
  input: "Conv._Layer_1/bias_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 32
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var/Adam"
  input: "Training/Optimizer/zeros_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/weight_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 5
          }
          dim {
            size: 5
          }
          dim {
            size: 32
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam_1/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  input: "Training/Optimizer/zeros_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/weight_var/Adam_1/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var/Adam"
  input: "Training/Optimizer/zeros_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/bias_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam_1/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  input: "Training/Optimizer/zeros_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Conv.Layer_2/Convolution/bias_var/Adam_1/read"
  op: "Identity"
  input: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3136
          }
          dim {
            size: 1028
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  input: "Training/Optimizer/zeros_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3136
          }
          dim {
            size: 1028
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3136
        }
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  input: "Training/Optimizer/zeros_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_10"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1028
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  input: "Training/Optimizer/zeros_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_11"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1028
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1/Assign"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  input: "Training/Optimizer/zeros_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1/read"
  op: "Identity"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_12"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1028
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam/Assign"
  op: "Assign"
  input: "FC_Layer_2/weight_var/Adam"
  input: "Training/Optimizer/zeros_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam/read"
  op: "Identity"
  input: "FC_Layer_2/weight_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_13"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1028
          }
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1028
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam_1/Assign"
  op: "Assign"
  input: "FC_Layer_2/weight_var/Adam_1"
  input: "Training/Optimizer/zeros_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/weight_var/Adam_1/read"
  op: "Identity"
  input: "FC_Layer_2/weight_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_14"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam/Assign"
  op: "Assign"
  input: "FC_Layer_2/bias_var/Adam"
  input: "Training/Optimizer/zeros_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam/read"
  op: "Identity"
  input: "FC_Layer_2/bias_var/Adam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/zeros_15"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam_1/Assign"
  op: "Assign"
  input: "FC_Layer_2/bias_var/Adam_1"
  input: "Training/Optimizer/zeros_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "FC_Layer_2/bias_var/Adam_1/read"
  op: "Identity"
  input: "FC_Layer_2/bias_var/Adam_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999747378752e-05
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_Conv._Layer_1/weight_var/ApplyAdam"
  op: "ApplyAdam"
  input: "Conv._Layer_1/weight_var"
  input: "Conv._Layer_1/weight_var/Adam"
  input: "Conv._Layer_1/weight_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/Conv._Layer_1/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_Conv._Layer_1/bias_var/ApplyAdam"
  op: "ApplyAdam"
  input: "Conv._Layer_1/bias_var"
  input: "Conv._Layer_1/bias_var/Adam"
  input: "Conv._Layer_1/bias_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/Conv._Layer_1/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/weight_var/ApplyAdam"
  op: "ApplyAdam"
  input: "Conv.Layer_2/Convolution/weight_var"
  input: "Conv.Layer_2/Convolution/weight_var/Adam"
  input: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/bias_var/ApplyAdam"
  op: "ApplyAdam"
  input: "Conv.Layer_2/Convolution/bias_var"
  input: "Conv.Layer_2/Convolution/bias_var/Adam"
  input: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/Conv.Layer_2/Convolution/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/weight_var/ApplyAdam"
  op: "ApplyAdam"
  input: "FC_Layer_1/FC_Layer_1/weight_var"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/bias_var/ApplyAdam"
  op: "ApplyAdam"
  input: "FC_Layer_1/FC_Layer_1/bias_var"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/FC_Layer_1/FC_Layer_1/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_FC_Layer_2/weight_var/ApplyAdam"
  op: "ApplyAdam"
  input: "FC_Layer_2/weight_var"
  input: "FC_Layer_2/weight_var/Adam"
  input: "FC_Layer_2/weight_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/FC_Layer_2/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/update_FC_Layer_2/bias_var/ApplyAdam"
  op: "ApplyAdam"
  input: "FC_Layer_2/bias_var"
  input: "FC_Layer_2/bias_var/Adam"
  input: "FC_Layer_2/bias_var/Adam_1"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/learning_rate"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "Training/Optimizer/Optimizer/epsilon"
  input: "Training/Optimizer/gradients/FC_Layer_2/add_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/mul"
  op: "Mul"
  input: "Training/Optimizer/beta1_power/read"
  input: "Training/Optimizer/Optimizer/beta1"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/bias_var/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/Assign"
  op: "Assign"
  input: "Training/Optimizer/beta1_power"
  input: "Training/Optimizer/Optimizer/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/mul_1"
  op: "Mul"
  input: "Training/Optimizer/beta2_power/read"
  input: "Training/Optimizer/Optimizer/beta2"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/bias_var/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer/Assign_1"
  op: "Assign"
  input: "Training/Optimizer/beta2_power"
  input: "Training/Optimizer/Optimizer/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Training/Optimizer/Optimizer"
  op: "NoOp"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv._Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_Conv.Layer_2/Convolution/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_1/FC_Layer_1/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/weight_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/update_FC_Layer_2/bias_var/ApplyAdam"
  input: "^Training/Optimizer/Optimizer/Assign"
  input: "^Training/Optimizer/Optimizer/Assign_1"
}
node {
  name: "Validation/Correct_Pred./ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Validation/Correct_Pred./ArgMax"
  op: "ArgMax"
  input: "FC_Layer_2/add"
  input: "Validation/Correct_Pred./ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Validation/Correct_Pred./ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Validation/Correct_Pred./ArgMax_1"
  op: "ArgMax"
  input: "Training/Training_Input/y"
  input: "Validation/Correct_Pred./ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Validation/Correct_Pred./Correct_Pred."
  op: "Equal"
  input: "Validation/Correct_Pred./ArgMax"
  input: "Validation/Correct_Pred./ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Validation/Mean_Accuracy/Cast"
  op: "Cast"
  input: "Validation/Correct_Pred./Correct_Pred."
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "Validation/Mean_Accuracy/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Validation/Mean_Accuracy/Mean_Accuracy"
  op: "Mean"
  input: "Validation/Mean_Accuracy/Cast"
  input: "Validation/Mean_Accuracy/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^Conv._Layer_1/weight_var/Assign"
  input: "^Conv._Layer_1/bias_var/Assign"
  input: "^Conv.Layer_2/Convolution/weight_var/Assign"
  input: "^Conv.Layer_2/Convolution/bias_var/Assign"
  input: "^FC_Layer_1/FC_Layer_1/weight_var/Assign"
  input: "^FC_Layer_1/FC_Layer_1/bias_var/Assign"
  input: "^FC_Layer_2/weight_var/Assign"
  input: "^FC_Layer_2/bias_var/Assign"
  input: "^Training/Optimizer/beta1_power/Assign"
  input: "^Training/Optimizer/beta2_power/Assign"
  input: "^Conv._Layer_1/weight_var/Adam/Assign"
  input: "^Conv._Layer_1/weight_var/Adam_1/Assign"
  input: "^Conv._Layer_1/bias_var/Adam/Assign"
  input: "^Conv._Layer_1/bias_var/Adam_1/Assign"
  input: "^Conv.Layer_2/Convolution/weight_var/Adam/Assign"
  input: "^Conv.Layer_2/Convolution/weight_var/Adam_1/Assign"
  input: "^Conv.Layer_2/Convolution/bias_var/Adam/Assign"
  input: "^Conv.Layer_2/Convolution/bias_var/Adam_1/Assign"
  input: "^FC_Layer_1/FC_Layer_1/weight_var/Adam/Assign"
  input: "^FC_Layer_1/FC_Layer_1/weight_var/Adam_1/Assign"
  input: "^FC_Layer_1/FC_Layer_1/bias_var/Adam/Assign"
  input: "^FC_Layer_1/FC_Layer_1/bias_var/Adam_1/Assign"
  input: "^FC_Layer_2/weight_var/Adam/Assign"
  input: "^FC_Layer_2/weight_var/Adam_1/Assign"
  input: "^FC_Layer_2/bias_var/Adam/Assign"
  input: "^FC_Layer_2/bias_var/Adam_1/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 26
          }
        }
        string_val: "Conv.Layer_2/Convolution/bias_var"
        string_val: "Conv.Layer_2/Convolution/bias_var/Adam"
        string_val: "Conv.Layer_2/Convolution/bias_var/Adam_1"
        string_val: "Conv.Layer_2/Convolution/weight_var"
        string_val: "Conv.Layer_2/Convolution/weight_var/Adam"
        string_val: "Conv.Layer_2/Convolution/weight_var/Adam_1"
        string_val: "Conv._Layer_1/bias_var"
        string_val: "Conv._Layer_1/bias_var/Adam"
        string_val: "Conv._Layer_1/bias_var/Adam_1"
        string_val: "Conv._Layer_1/weight_var"
        string_val: "Conv._Layer_1/weight_var/Adam"
        string_val: "Conv._Layer_1/weight_var/Adam_1"
        string_val: "FC_Layer_1/FC_Layer_1/bias_var"
        string_val: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
        string_val: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
        string_val: "FC_Layer_1/FC_Layer_1/weight_var"
        string_val: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
        string_val: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
        string_val: "FC_Layer_2/bias_var"
        string_val: "FC_Layer_2/bias_var/Adam"
        string_val: "FC_Layer_2/bias_var/Adam_1"
        string_val: "FC_Layer_2/weight_var"
        string_val: "FC_Layer_2/weight_var/Adam"
        string_val: "FC_Layer_2/weight_var/Adam_1"
        string_val: "Training/Optimizer/beta1_power"
        string_val: "Training/Optimizer/beta2_power"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 26
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Conv.Layer_2/Convolution/bias_var"
  input: "Conv.Layer_2/Convolution/bias_var/Adam"
  input: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  input: "Conv.Layer_2/Convolution/weight_var"
  input: "Conv.Layer_2/Convolution/weight_var/Adam"
  input: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  input: "Conv._Layer_1/bias_var"
  input: "Conv._Layer_1/bias_var/Adam"
  input: "Conv._Layer_1/bias_var/Adam_1"
  input: "Conv._Layer_1/weight_var"
  input: "Conv._Layer_1/weight_var/Adam"
  input: "Conv._Layer_1/weight_var/Adam_1"
  input: "FC_Layer_1/FC_Layer_1/bias_var"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  input: "FC_Layer_1/FC_Layer_1/weight_var"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  input: "FC_Layer_2/bias_var"
  input: "FC_Layer_2/bias_var/Adam"
  input: "FC_Layer_2/bias_var/Adam_1"
  input: "FC_Layer_2/weight_var"
  input: "FC_Layer_2/weight_var/Adam"
  input: "FC_Layer_2/weight_var/Adam_1"
  input: "Training/Optimizer/beta1_power"
  input: "Training/Optimizer/beta2_power"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/bias_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var/Adam"
  input: "save/RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/bias_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/bias_var/Adam_1"
  input: "save/RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var"
  input: "save/RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/weight_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var/Adam"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv.Layer_2/Convolution/weight_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "Conv.Layer_2/Convolution/weight_var/Adam_1"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv.Layer_2/Convolution/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "Conv._Layer_1/bias_var"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/bias_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "Conv._Layer_1/bias_var/Adam"
  input: "save/RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/bias_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "Conv._Layer_1/bias_var/Adam_1"
  input: "save/RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "Conv._Layer_1/weight_var"
  input: "save/RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/weight_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "Conv._Layer_1/weight_var/Adam"
  input: "save/RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Conv._Layer_1/weight_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "Conv._Layer_1/weight_var/Adam_1"
  input: "save/RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/bias_var/Adam_1"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var"
  input: "save/RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam"
  input: "save/RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "FC_Layer_1/FC_Layer_1/weight_var/Adam_1"
  input: "save/RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_1/FC_Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/bias_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "FC_Layer_2/bias_var"
  input: "save/RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_19/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/bias_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_19/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_19"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_19/tensor_names"
  input: "save/RestoreV2_19/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "FC_Layer_2/bias_var/Adam"
  input: "save/RestoreV2_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_20/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/bias_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_20/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_20"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_20/tensor_names"
  input: "save/RestoreV2_20/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "FC_Layer_2/bias_var/Adam_1"
  input: "save/RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/bias_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_21/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/weight_var"
      }
    }
  }
}
node {
  name: "save/RestoreV2_21/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_21"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_21/tensor_names"
  input: "save/RestoreV2_21/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "FC_Layer_2/weight_var"
  input: "save/RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_22/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/weight_var/Adam"
      }
    }
  }
}
node {
  name: "save/RestoreV2_22/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_22"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_22/tensor_names"
  input: "save/RestoreV2_22/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "FC_Layer_2/weight_var/Adam"
  input: "save/RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_23/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "FC_Layer_2/weight_var/Adam_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_23/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_23"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_23/tensor_names"
  input: "save/RestoreV2_23/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "FC_Layer_2/weight_var/Adam_1"
  input: "save/RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@FC_Layer_2/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_24/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Training/Optimizer/beta1_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_24/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_24"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_24/tensor_names"
  input: "save/RestoreV2_24/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "Training/Optimizer/beta1_power"
  input: "save/RestoreV2_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_25/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Training/Optimizer/beta2_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2_25/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_25"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_25/tensor_names"
  input: "save/RestoreV2_25/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "Training/Optimizer/beta2_power"
  input: "save/RestoreV2_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Conv._Layer_1/weight_var"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
}
versions {
  producer: 21
}
