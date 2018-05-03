function net = cnn_init(varargin)
% Initialize a CNN network for MNIST classification
%
% Gregory D. Hunkins
%
% Test the effect of leaky ReLUs on the baseline architecture.
%
% Function to define and initialize a classification network  

rng('default'); 
rng(0) ;

%% Network Structure
net.layers = {} ;
%%%%% Define your network here

f = 1/100;

%(conv1): Conv2d(in channels=1, out channels=8, kernel size=(3, 3), stride=(1, 1), padding=(1, 1))
net.layers{end+1} = struct(...
    'name', 'conv1', ...
    'type', 'conv', ...
    'weights', {{f*randn(3,3,1,8,'single'), zeros(1,8, 'single')}}, ...
    'pad', 1, ...
    'stride', 1);
%(relu1): Relu
net.layers{end+1} = struct(...
    'name', 'relu1', ...
    'type', 'relu', ...
    'leak', 0.01);
%(pool1): Maxpool(kernel size=(2, 2), stride=(2, 2), padding=(0, 0))
net.layers{end+1} = struct(...
    'name', 'pool1', ...
    'type', 'pool', ...
    'method', 'max', ...
    'pool', [2 2], ...
    'stride', 2) ;
%(conv2): Conv2d(in channels=8, out channels=16, kernel size=(3, 3), stride=(1, 1), padding=(1, 1))
net.layers{end+1} = struct(...
    'name', 'conv2', ...
    'type', 'conv', ...
    'weights', {{f*randn(3,3,8,16,'single'), zeros(1,16, 'single')}}, ...
    'pad', 1, ...
    'stride', 1);
%(relu2): Relu
net.layers{end+1} = struct(...
    'name', 'relu2', ...
    'type', 'relu', ...
    'leak', 0.01);
%(pool2): Maxpool(kernel size=(2, 2), stride=(2, 2), padding=(0, 0))
net.layers{end+1} = struct(...
    'name', 'pool2', ...
    'type', 'pool', ...
    'method', 'max', ...
    'pool', [2 2], ...
    'stride', 2);
%(conv3): Conv2d(in channels=16, out channels=32, kernel size=(3, 3), stride=(1, 1), padding=(1, 1))
net.layers{end+1} = struct(...
    'name', 'conv3', ...
    'type', 'conv', ...
    'weights', {{f*randn(3,3,16,32,'single'), zeros(1,32, 'single')}}, ...
    'pad', 1, ...
    'stride', 1);
%(relu3): Relu
net.layers{end+1} = struct(...
    'name', 'relu3', ...
    'type', 'relu', ...
    'leak', 0.01);
%(pool3): Maxpool(kernel size=(7, 7), stride=(1, 1), padding=(0, 0))
net.layers{end+1} = struct(...
    'name', 'pool3', ...
    'type', 'pool', ...
    'method', 'max', ...
    'pool', [7 7], ...
    'stride', 1) ;
%(conv4): Conv2d(in channels=32, out channels=10, kernel size=(1, 1), stride=(1, 1), padding=(0, 0))
net.layers{end+1} = struct(...
    'name', 'conv1', ...
    'type', 'conv', ...
    'weights', {{f*randn(1,1,32,10,'single'), zeros(1,10, 'single')}}, ...
    'pad', 0, ...
    'stride', 1);

%%%%% End of code block
net.layers{end+1} = struct('type', 'softmaxloss');
%%

% Meta parameters 
net.meta.inputSize = [28 28 1];
net.meta.trainOpts.learningRate = 0.001;
net.meta.trainOpts.numEpochs = 20;
net.meta.trainOpts.batchSize = 100;

% Fill in default values
net = vl_simplenn_tidy(net);

