I = imread('Koala.jpg');
I = I([200:400],[100:300],[1 2 3]);
%% reducing the number of intensity level
numLevels = 10;
Ireduced = floor(I./(256./numLevels)).*(256./numLevels);
figure(1);clf;
  imshow(I)
title('Not Averaged')

%% performing averaging on image
rad = 2; % number of pixels in each direction to use in average, i.e., a rad of 1 gets all neighboring pixels
newI = zeros((size(I,1)-rad),((size(I,2)-rad)),size(I,3));
for i = rad:(size(I,1)-rad)
    for j = rad:(size(I,2)-rad)
        for k = 1:size(I,3)
            window = I([i-rad+1:i+rad],[j-rad+1:j+rad],k);
            newI(i,j,k) = mean(mean(window));
        end
    
    end
end
figure(2);clf;
imshow(newI);
title('Averaged')
