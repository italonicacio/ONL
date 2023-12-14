using ForwardDiff, LinearAlgebra

function Armijo(f, x, d)
    gamma = 0.7
    eta = 0.45

    t = 1
    fx = f(x)
    gx = ForwardDiff.gradient(f, x)
    gd = gx'*d

    ft = f(x + t*d)

    while ft > fx + eta*t*gd
        t = gamma*t
        ft = f(x + t*d)
    end
    
    return t

end