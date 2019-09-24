def my_pow_1(x, n)
    return 1.0 if n == 0
    rv = my_pow(x * x, n.abs / 2)
    if n > 0
        n % 2 == 0 ? rv : x * rv
    else
        n % 2 == 0 ? 1 / rv : 1 / (x * rv)
    end
end

def my_pow(x, n)
    return 1.0 if n == 0
    rv = my_pow(x, (n.abs / 2) * (n < 0 ? -1 : 1 ))
    if n % 2 == 0
        rv * rv
    else
        if n > 0
            x * rv * rv
        else
            rv * rv / x
        end
    end
end

puts my_pow(2.00000, 10) # 1024.00000
puts my_pow(2.10000, 3) # 9.26100
puts my_pow(2.00000, -2) # 0.25
