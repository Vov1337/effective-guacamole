%% week 3 - Duke University Image Processing Coursera Class
% author: Joseph Kaiser except for the movie code, which was written by
% Guillermo Sapiro
% date: June 20th, 2017

clear all;clf;
%% histogram equalization
I = imread('cameraman.tif');
figure(1);
imshow(I)
title('Original Image')
hist = imhist(I);
% figure(2);
% plot(hist)
% Ieq = histeq(I);
% figure(3);
% imshow(Ieq);



% %% my own hist equalization
% tic
% y = 256 .* hist./(numel(I)); % a vector of proportion (out of 256) of number of pixels at each intensity
% y = cumsum(y); % compute cumulative sum of all elements up to the current index, e.g. y(end) = sum(y)
% y = round(y);
% out1 = y(I-1); % what
% out2 = histeq(I);
% figure;subplot(2,1,1);imshow(out2);
% title('histogram equalisation by matlab function');
% subplot(2,1,2);imshow(uint8(out1));
% title('histogram equalisation by implementation');
% toc



% %% median filter
% I = imread('cameraman.tif');
% noise = imnoise(I,'salt & pepper',0.25);
% rad = 2; % number of pixels in each direction to use in average, i.e., a rad of 1 gets all neighboring pixels
% newI = zeros((size(I,1)-rad),((size(I,2)-rad)),size(I,3));
% for i = rad+1:(size(I,1)-rad);
%     for j = rad+1:(size(I,2)-rad);
%         for k = 1:size(I,3) % for each color layer
%             window = noise([i-rad:i+rad],[j-rad:j+rad],k);
%             newI(i,j,k) = median(median((window)));
%         end
%     
%     end
% end
% out2 = medfilt2(noise);
% figure(1);subplot(3,1,1);imshow(out2);
% title('histogram equalisation by matlab function');
% subplot(3,1,2);imshow(uint8(newI));
% title('histogram equalisation by implementation');
% subplot(3,1,3);imshow(noise)
% title('original noisy image');




%% skipping non-local means bc I dont know how to do it, however i think I
% would make a function that scans all blocks of same size in the image and
% compare their pixel values with that of the original block, maybe even
% considering how much they overlap and take the
% first five or so of those blocks and  perform averaging on them????



% %% adding N random noise
% N = 1; % number of times to add noise
% for i = 1:N
%     I = imnoise(I,'salt & pepper',0.5);
% end
% figure(2);
% imshow(I)
% title(sprintf('Image with %d Layers of Noise Added',N));



%% edge detection using Laplacian
I = imread('peppers.png');
newI = zeros((size(I,1)-rad),((size(I,2)-rad)),size(I,3));
for i = rad+1:(size(I,1)-rad)
    for j = rad+1:(size(I,2)-rad)
        for k = 1:size(I,3) % for each color layer
            window = I([i-1:i+1],[j-1:j+1],k);
            
            newI(i,j,k) = median(median((window)));
        end
    
    end
end



%% movie
xyloObj = VideoReader('xylophone.mp4');
nFrames = xyloObj.NumberOfFrames;

vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width;

% Preallocate movie structure.
mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'), 'colormap', []);

% Read one frame at a time.
for k = 1 : nFrames
  im = read(xyloObj, k);

  % here we process the image im
  mov(k).cdata = im;
end

% Size a figure based on the video's width and height.
hf = figure;
set(hf, 'position', [150 150 vidWidth vidHeight])

% Play back the movie once at the video's frame rate.
movie(hf, mov, 1, xyloObj.FrameRate);





























