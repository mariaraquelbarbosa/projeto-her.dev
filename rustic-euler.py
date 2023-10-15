def euler(n=10**8):
    euler = 1
    term = (1 + 1/n)
    
    for i in range(n):
        euler*= term
    return euler
  
%timeit -n 1 euler() 
