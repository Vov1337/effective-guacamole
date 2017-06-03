# -*- coding: utf-8 -*-
"""
Created on Fri Dec 30 18:31:00 2016

@author: joe
"""


x = 1005
thousands = 0
pythags = 0
for a in range (1,x):
    for b in range (a,x):
        for c in range(b,x):
            if (a*a + b*b) == c*c:
                pythags += 1
                if (a+b+c) == 1000:
                    product = a*b*c
                    nums = [a,b,c]
                    thousands += 1
                else:
                    pass
            else:
                pass
                
            
            
            
## another implementation
#y = 5
#for n in range(1,y):
#    for m in range(n,y):
#        a = m^2 - n^2
#        b = 2*m*n
#        c = m^2 + n^2
#        while (a+b+c) < 1002:
#            if (a+b+c) == 1000:
#                product = a*b*c
#                nums = [a,b,c]
#            else:
#                a = a + m^2 - n^2
#                b = b + 2*m*n
#                c = c + m^2 + n^2
