function euler_raw(n :: Int64)
    
    euler = 1
    term = (1 + 1/n)
    
    for i in 1:n
        euler*= term
    end
    
    return euler
end

num = 10^8
@time euler_raw(num)
