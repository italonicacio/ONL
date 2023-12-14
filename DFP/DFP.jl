include("../busca_exata/busca_exata.jl")
using ForwardDiff, LinearAlgebra

function DFP(f, x, H)
    epsilon = 1e-5
    kmax = 1000
    k = 0
    fx = f(x)
    gx = ForwardDiff.gradient(f, x)
    norm = LinearAlgebra.norm(gx)
    
    println("k = $k   f(x) = $fx  norm(Grad) = $norm")
    print("H = ")
    println(H)
    println()

    
    while (norm > epsilon) && (k < kmax)
        d = -H*gx
        t = Aurea(f, x, d)
        
        y = x
        gy = gx

        x = x + t*d
        fx = f(x)
        gx = ForwardDiff.gradient(f, x)
        norm =  LinearAlgebra.norm(gx)
        
        p = x - y
        # Perguntar o professor se vale mais a pena calular o gradiente ou fazer o calculo de Ap para encontrar q
        q = gx - gy

        H = H + (p*p')/(p'*q) - (H*q*q'*H)/(q'*H*q)
        

        
        k += 1
        println("k = $k   f(x) = $fx  norm(Grad) = $norm")    
        print("H = ")
        println(H)
        println()
        
        
    end

    if k == kmax
        println("Max Iteration")
    end

    println("x* = ", x)
    println("f(x*) = ", f(x))

    println("Grad(F,x*) = ", ForwardDiff.gradient(f,x))

    A = inv(H)
    println(H*A)
end