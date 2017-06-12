clear;clc
% basic = 0;
% %% basic implementation of JPEG - only doing first channel (R)
% if basic == 1
% I = imread('peppers.png');
% ca = mat2cell(I,8*ones(1,size(I,1)/8),8*ones(1,size(I,2)/8),3); % divide into blocks
% N = 10;
% mask = 1;
% for i = 1:size(ca,1)
%     for j = 1:size(ca,2)
%         block = ca{i,j};   % make each cell of ca into a matrix
%         dct = dct2(block(:,:,1)); % perform dct on only the first layer of the block matrix
%         if mask == 0
%                     dct = floor(dct./N).*N; % quantize by N
% 
%         [foo, idx] = sort(abs(dct(:)), 'descend'); % convert the matrix to a vector and sort it
%            dct(idx(8:end)) = 0;
%         end
%         
%          if mask == 1
%         mask = [1 0 0 0 0 0 0 0 
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0
%                 0 0 0 0 0 0 0 0];  % optional - mask only the low frequency components
%         dct = (dct.*mask);
%          end
%          
%         
%         
%         
%         da{i,j} = idct2(dct); % inverting the DCT
%     end
% end
% 
% compI = uint8(cell2mat(da));
% figure(1);clf;
% subplot(2,1,1)
% imshow(compI)
% subplot(2,1,2)
% imshow(floor(I(:,:,1)./N).*N)
% end
% 
% if basic == 0
% I = imread('peppers.png');
% I = rgb2ycbcr(I);
% ca = mat2cell(I,8*ones(1,size(I,1)/8),8*ones(1,size(I,2)/8),3); % divide into blocks
% N = 10; % how much to quantize each channel
% M = 1; % how much worse the chrominance channels should be compressed compared to the luminance channel
% for i = 1:size(ca,1)
%     for j = 1:size(ca,2)
%         for k = 1:3 
%             block = ca{i,j};   % make each cell of ca into a matrix  
%             dct = dct2(block(:,:,k)); % perform dct on only the first layer of the block matrix
%             if k == 1 
%        
%          dct = floor(dct./N).*N; % quantize by N
% 
%         [foo, idx] = sort(abs(dct(:)), 'descend'); % convert the matrix to a vector and sort it
%            dct(idx(8:end)) = 0;
%             end
%             if (k == 2) || (k == 3)
%                  dct = floor(dct./(M*N)).*(M*N); % quantize by N
% 
%         [foo, idx] = sort(abs(dct(:)), 'descend'); % convert the matrix to a vector and sort it
%            dct(idx(8:end)) = 0;
%         end
%         
%                 
% %         
% %          if mask == 1
% %         mask = [1 0 0 0 0 0 0 0 
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0
% %                 0 0 0 0 0 0 0 0];  % optional - mask only the low frequency components
% %         dct = (dct.*mask);
% %          end
%         
%         da{i,j,k} = idct2(dct); % inverting the DCT
%         end
%     end
% end
% 
% compI = uint8(cell2mat(da));
% compI = ycbcr2rgb(compI);
% figure(1);clf;
% subplot(2,1,1)
% imshow(compI)
% I = ycbcr2rgb(I);
% subplot(2,1,2)
% imshow(floor(I./N).*N)
% end


 %% prediction coding
 I = imread('circuit.tif');
 for i = 2:size(I,1);
     for j = 2:size(I,2);
         
            oops1(i,j) = I(i,j) - I(i-1,j);
         
         
             oops2(i,j) = I(i,j) - I(i,j-1);
         
        
             oops3(i,j) = I(i,j) - ((I(i,j-1)+I(i-1,j)+I(i-1,j-1))./3);
        
     end
 end
 
 figure(2);clf;
 subplot(2,2,1)
 histogram(I);
 title(sprintf('Original Image - Entropy: %d',entropy(I)))
 subplot(2,2,2)
 histogram(oops1)
 title(sprintf('Left Pixel - Entropy: %d',entropy(oops1)))
 subplot(2,2,3)
 histogram(oops2)
 title(sprintf('Upper Pixel - Entropy: %d',entropy(oops2)))
 subplot(2,2,4)
 histogram(oops3)
 title(sprintf('Nearest Three Pixels - Entropy: %d',entropy(oops3)))

 
             
         