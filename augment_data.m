%
%
% Augment the dataset using translation and rotation.
%
%     Programmer: Gregory D. Hunkins
%
% ===================================================

imdb = load('imdb.mat');

X = imdb.imdb.images.data;
Y = imdb.imdb.images.labels;
X_mean = imdb.imdb.images.data_mean;

% Reference: https://www.mathworks.com/help/nnet/ref/augmentedimagedatastore.html
imageAugmenter = imageDataAugmenter( ...
    'RandRotation',[-20,20], ...
    'RandXTranslation',[-3 3], ...
    'RandYTranslation',[-3 3]);

imageSize = [28 28 1];
augimds = augmentedImageDatastore(imageSize, X, Y(:),'DataAugmentation', imageAugmenter);

for batch = 1:540
    mBatch = augimds.read();
    X = cat(4, X, mBatch.input{:});
    Y = [Y, mBatch.response{:}];
end

X_size = size(X);
labels = repelem([1 1 1 2 3], max(X_size) / 5);

images = struct(...
    'data', X, ...
    'data_mean', X_mean, ...
    'labels', Y, ...
    'set', labels);

imdb_augment = struct('meta', imdb.imdb.meta, 'images', images);
save('imdb_aug.mat', 'imdb_augment');
                     