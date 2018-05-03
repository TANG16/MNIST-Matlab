# MNIST-Matlab
Using data augmentation and MatConvNet, create a robust CNN that achieves **99.21% accuracy on noisy, rotated validation data.**



**Quick Note:** _This is not meant to be a forkable, out-of-the-box implementation._ The designed architectures are uploaded for reference; however, the framework for testing the architectures is not included in this repository (data loading, architecture compilation, etc.). Please visit [MatConvNet](http://www.vlfeat.org/matconvnet/) for further help with the details.

## Requirements
* [**MATLAB_R2018A**](https://www.mathworks.com/downloads/web_downloads/select_release?mode=gwylf)
	* Recommended packages installed.
* [**MatConvNet**](http://www.vlfeat.org/matconvnet/)


## Results

Below is a table summary of the results for the provided architectures.

<img src="https://raw.githubusercontent.com/ghunkins/MNIST-Matlab/master/Results/Summary.png" alt="alt text" width="200" height="200">

### Baseline

The baseline architecture achieved a **98.47%** classification accuracy on the clean validation data. Below is a visualization of the training cycle of 20 epochs.

<img src="https://raw.githubusercontent.com/ghunkins/MNIST-Matlab/master/Results/Baseline.png" alt="alt text" width="300" height="300">

This architecture is contained in `cnn_init_baseline.m`.

### Filters-Dropout

The baseline architecture achieved a **98.54%** classification accuracy on the clean validation data. When trained with augmented (X-Y shifting, rotation) data, this increased to **99.21%** accuracy on the _dirty_ validation set. Below is a visualization of the latter training cycle of 16 epochs.

<img src="https://raw.githubusercontent.com/ghunkins/MNIST-Matlab/master/Results/Robust-Filters-Dropout.png" alt="alt text" width="300" height="300">

This architecture is contained in `cnn_init_filters_dropout.m`.

### Data Augmentation

The script `augment_data.m` uses the `imageDataAugmenter` method from the `Deep Learning Image Classification` section of the `Neural Network Toolbox`. The data is doubled with augmented (X-Y shifting, rotation) images.

