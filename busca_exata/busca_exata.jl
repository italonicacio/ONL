using ForwardDiff

function Aurea(f, x, d)
    epsilon = 1e-5
    bmax = 100000000
    rho = 1

    theta1 = (3-sqrt(5))/2
    theta2 = (1 - theta1)
    


    a = 0
    s = rho
    b = 2rho

    phib = f(x + b*d)
    phis = f(x + s*d)

    while (phib < phis) && (2b < bmax) 
        a = s
        s = b
        b = 2b
        phis = phib
        phib = f(x + s*d)
    end

    u = a + theta1*(b - a)
    v = a + theta2*(b - a)

    phiu = f(x + u*d)
    phiv = f(x + v*d)

    while (b - a) > epsilon
        if phiu < phiv
            b = v
            v = u
            u = a + theta1*(b - a)
            phiv = phiu
            phiu = f(x + u*d)

        else 
            a = u
            u = v
            v = a + theta2*(b - a)
            phiu = phiv
            phiv = f(x + v*d)

        end
    end

    return t = (u + v)/2

end