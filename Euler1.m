clear;
n = 6075143;
a = ceil(sqrt(n));
% b2 = a.^2 - n;
% while (mod(n,2) == 0); % eliminate all twos
%     n = n./2
% end
% j = zeros(4e6,1);
% for i = 3:2:sqrt(n); % each remaining prime factor must be odd; largest prime factor of n is less then sqrt(n)
%     while (mod(n,i) == 0);
%         n = n./i
%         j(i) = 1;
%     end
% end
% 
% largest = max(j);
% 
% while (sqrt(b2) ~= round(sqrt(b2)))
%     a = a + 1;
%     b2 = a.^2 - n;
%     fprintf('poop\n')
% end
% answer = a-sqrt(b2);



%% the sieve bitccheess
table = [0];
d = 2;
while (n>1)
    while mod(n,d) == 0;
        table(end+1) = d;
        %%
        % 
        n = n./d;
    end
    if d.^d > n
        if n>1
            table(end+1) = n;
        end
    end
end


    