# Neural Networks
### A Testspace for Neural Networks and Machine Learning Projects in Python

## Projects:
- Can model basic monotonic functions [(Src)](src/test/firstNeuralNetwork.py)
  - Single-Layer Perceptron Network
  - Implemented from scratch as a proof of concept of neural networks.
- Classifies handwriten digits (0-9) [(Src)](src/MNIST/fc/mnist_fc.py)
  - Single-Layer Perceptron Network
  - Trained on the [MNIST dataset](http://yann.lecun.com/exdb/mnist/)
- Classifies handwriten digits (0-9) [(Src)](src/MNIST/conv/mnist_convolutional.py)
  - Deep Convolutional Network
  - Trained on the [MNIST dataset](http://yann.lecun.com/exdb/mnist/)
  - [Simplified Graph of the Network](https://raw.githubusercontent.com/ozanerhansha/NeuralNetworks/master/convNet.PNG)
  - I implemented this network into [an android app](https://github.com/ozanerhansha/DigitClassifier)
- Classifies Breast Cancer tumors as malignant or benign [(Src)](src/test/bcDiagnosis.py)
  - Single-Layer Perceptron Network
  - Trained on the [Breast Cancer Wisconsin Data Set](https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(original)) 
  - Full writeup can be found [here](https://ozanerhansha.github.io/breast-cancer-classification/)

Coded in **Python 3.5** with:
- Google's [*TensorFlow*](https://www.tensorflow.org/)
- [*NumPy*](http://www.numpy.org/)

## Useful References:
- [Deep Learning](http://www.deeplearningbook.org) by Ian Goodfellow, et al.
  - Comprehensive description of deep learning.
  - Also includes a review of prerequisite mathematics (Linear Algebra, Information Theory, etc).
- [Neural Networks and Deep Learning](http://neuralnetworksanddeeplearning.com) by Michael Nielson
  - Introduces and constructs neural networks from first principles.
- [Essence of Linear Algebra](https://www.youtube.com/watch?v=kjBOesZCoqc&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab) by Grant Sanderson
  - Video series visually explaining Linear Algebra.
- [Gradient Descent Derivation](http://mccormickml.com/2014/03/04/gradient-descent-derivation/) by Chris McCormick
  - Explains and derives graident descent using calculus.
- [Discrete Mathematics and its Applications](https://isbnsearch.org/isbn/9780073383095) by Kenneth H. Rosen
