clear; clc; close all
I = imread('Koala.jpg');
I = I([200:400],[100:300],[1 2 3]);

%% reducing the number of intensity level
numLevels = 10;
Ireduced = floor(I./(256./numLevels)).*(256./numLevels);
figure(1);clf;

%% performing averaging on image
rad = 10; % number of pixels in each direction to use in average, i.e., a rad of 1 gets all neighboring pixels
newI = zeros((size(I,1)-rad-1),((size(I,2)-rad-1)),size(I,3));
for i = rad+1:(size(I,1)-rad)
    for j = rad+1:(size(I,2)-rad)
        for k = 1:size(I,3) % for each color layer
            window = I([i-rad:i+rad],[j-rad:j+rad],k);
            newI(i,j,k) = mean(mean(window));
        end
    
    end
end
newI = uint8(newI);
figure(2);clf;
subplot(2,2,1)
imshow(newI(:,:,1));
title('First layer')
hold on
subplot(2,2,2)
imshow(newI(:,:,2))
title('Second Layer')
subplot(2,2,3)
imshow(newI(:,:,3))
title('Third Layer')
subplot(2,2,4)
imshow(newI)
title('All Layers')

figure(3);clf;
subplot(2,2,1)
imshow(I(:,:,1));
title('First layer')
hold on
subplot(2,2,2)
imshow(I(:,:,2))
title('Second Layer')
subplot(2,2,3)
imshow(I(:,:,3))
title('Third Layer')
subplot(2,2,4)
imshow(I)
title('All Layers')

%% rotation

I = imrotate(I,90);
imshow(I);

%% shrinkage

J = imresize(I,0.5);
imshow(J)

imshow(imread('cameraman.tif'))
