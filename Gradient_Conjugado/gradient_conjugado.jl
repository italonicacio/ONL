using ForwardDiff, LinearAlgebra


# gx = g(x), x passo k
# gy = g(y), y = x passo k+1
function BetaPolakRibiere(gx, gy)
    return (gy'*(gy - gx))/(gx'gx)
end


function BetaFletcherReever(gx, gy)
    return (gy'gy)/(gx'gx)
end

function GradConj(f, x, A, b, c)
    epsilon = 1e-5
    kmax = 1000
    k = 0
    gx = ForwardDiff.gradient(f, x)
    d = -gx
    norm = LinearAlgebra.norm(gx)

    fx = f(x)


    println("k = $k dk = $d x = $x")
    # println("k = $k   f(x) = $fx  norm(Grad) = $norm")

    while (norm > epsilon) && (k < kmax)
        t = - (gx'*d)/(d'*A*d)
        y = x
        gy = gx
        x = x + t*d
        println("xk + tk*dk = $x")
        gx = ForwardDiff.gradient(f, x)

        beta = (d'*A*gx)/(d'*A*d)
        

        norm = LinearAlgebra.norm(gx)
        d = -gx+beta*d

        fx = f(x)
       

        println("k = $k   tk = $t Beta = $beta dk = $d x = $x")
        println("gx = $gx norm(gx) = $norm")


        k = k+1
        println()



    end

    if k == kmax
        println("Max Iteration")
    end

    println("x* = $x")
    println("Grad(f, x) = ", ForwardDiff.gradient(f, x))
    

end

