include("../busca_exata/busca_exata.jl")
using ForwardDiff, LinearAlgebra, Plots


function GradientAurea(f, x)
    epsilon = 1e-5
    kmax = 1000

    k = 0
    gx = ForwardDiff.gradient(f, x)
    norm = LinearAlgebra.norm(gx)
    
    fx = f(x)
    F = [fx]
    G = [norm]

    println("k = $k   f(x) = $fx  norm(Grad) = $norm")

    while (norm > epsilon) && (k < kmax)
        t = Aurea(f, x, -gx)
        x = x - t*gx
        gx = ForwardDiff.gradient(f, x)
        norm = LinearAlgebra.norm(gx)
        k += 1

        fx = f(x)
        F = [F; fx]
        G = [G; norm]

        println("k = $k   f(x) = $fx  norm(Grad) = $norm")

    end

    if k == kmax
        println("Max Iteration")
    end

    K = [i for i = 0:k]
    
    return K, F, G

end

function PlotGradientAurea(f,x)
    K, F, G = GradientAurea(f,x)
    gr()

    # scatter(K, LinearAlgebra.log.(F), label="Função")
    # plot!(K, LinearAlgebra.log.(F), label="")

    scatter(K, LinearAlgebra.log.(G), label="Gradient")
    plot!(K, LinearAlgebra.log.(G), label="") 
    

end