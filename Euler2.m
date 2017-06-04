% make the Fibonacci sequence up to 4 million
clear;
Fib = zeros(100,1);
Fib(1) = 0; Fib (2) = 1;

n = 3;
while Fib(n-1) < 4e6;
    Fib(n) = Fib(n-1) + Fib(n-2);
    n = n+1;
end

% sum up all the even Fib numbers under 4 million
sum = 0;
for i = 1:34
    if mod(Fib(i),2) == 0;
        sum = sum + Fib(i);
    end
end

    
