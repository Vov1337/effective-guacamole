clear;clc

%% basic implementation of JPEG - only doing first channel (R)

I = imread('peppers.png');
ca = mat2cell(I,8*ones(1,size(I,1)/8),8*ones(1,size(I,2)/8),3); % divide into blocks
N = 10;
for i = 1:size(ca,1)
    for j = 1:size(ca,2)
        block = ca{i,j};   % make each cell of ca into a matrix
        dct = dct2(block(:,:,1)); % perform dct on only the first layer of the block matrix
        dct = floor(dct./N).*N; % quantize by N
        mask = [1 1 1 0 0 0 0 0 
                1 1 1 0 0 0 0 0
                1 1 0 0 0 0 0 0
                0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0];  % optional - mask only the low frequency components
        dct = dct.*mask;
        da{i,j} = idct2(dct);
    end
end

compI = uint8(cell2mat(da));
imshow(compI)