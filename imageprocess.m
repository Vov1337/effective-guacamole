I = imread('Koala.jpg');
%% reducing the number of intensity levels
numLevels = 10;
Ireduced = floor(I./(256./numLevels)).*(256./numLevels);
imshow(Ireduced)
