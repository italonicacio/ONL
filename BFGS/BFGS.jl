include("../busca_exata/busca_exata.jl")
using ForwardDiff, LinearAlgebra

function BFGS(f, x, H)
    epsilon = 1e-5
    kmax = 1000
    k = 0
    fx = f(x)
    gx = ForwardDiff.gradient(f, x)
    norm = LinearAlgebra.norm(gx)
    
    println("k = $k x = $x f(x) = $fx  norm(Grad) = $norm")
    print("H = ")
    println(H)

    
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
        q = gx - gy


        H = H + (1 + ((q'*H*q)/(p'*q))) * ( (p*p')/(p'*q) ) - (p*q'*H + H*q*p')/(p'*q)
        

        println()
        println("k = $k x = $x f(x) = $fx  norm(Grad) = $norm")
        println("Grad(f(x)) = ", gy)
        println("dk = ", d)
        println("tk = ", t)
        println("p = ", p)
        println("q = ", q)
        print("H = ")
        println(H)
        


        k += 1
    end

    if k == kmax
        println("Max Iteration")
    end
    

    println()
    println("f(x*) = ", fx)
    println("Grad(f(x*)) = ", gx)
    println("H = ", H)
    println("Hessiana = ", ForwardDiff.hessian(f,x))

    println()
    println("H = inv(Grad^2(f(x*))")
    println("H*Grad^2(f(x*)) = I")
    println("H*Grad^2(f(x*)) = ", H*ForwardDiff.hessian(f,x))
    
end