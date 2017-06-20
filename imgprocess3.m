%% week 3
clear all;clf;
%% histogram equalization
I = imread('cameraman.tif');
figure(1);
imshow(I)
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
