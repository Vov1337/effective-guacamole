n = 600851475143;

while (mod(n,2) == 0); % eliminate all twos
    n = n./2
end

for i = 3:2:sqrt(n); % each remaining prime factor must be odd; largest prime factor of n is less then sqrt(n)
    while (mod(n,i) == 0);
        n = n./i
    end
end


    