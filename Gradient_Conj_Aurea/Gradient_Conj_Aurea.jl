include("../busca_exata/busca_exata.jl")
using ForwardDiff, LinearAlgebra, Plots


# gx = g(x), x passo k
# gy = g(y), y = x passo k+1
function BetaPolakRibiere(gx, gy)
    return (gy'*(gy - gx))/(gx'gx)
end


function BetaFletcherReever(gx, gy)
    return (gy'gy)/(gx'gx)
end

function GradConjAurea(f, x)
    epsilon = 1e-5
    kmax = 1000
    k = 0
    gx = ForwardDiff.gradient(f, x)
    d = -gx
    norm = LinearAlgebra.norm(gx)

    fx = f(x)
    F = [fx]
    G = [norm]

    println("k = $k   f(x) = $fx  norm(Grad) = $norm")

    while (norm > epsilon) && (k < kmax)
        t = Aurea(f, x, d)
        y = x
        gy = gx
        x = x + t*d
        gx = ForwardDiff.gradient(f, x)

        beta = BetaPolakRibiere(gy, gx)
        # beta = BetaFletcherReever(gy, gx)

        norm = LinearAlgebra.norm(gx)
        d = -gx+beta*gy
        k = k+1

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

function PlotGradConjAurea(f, x)
    K, F, G = GradConjAurea(f, x)
    gr()

    # scatter(K, LinearAlgebra.log.(F), label="Função")
    # plot!(K, LinearAlgebra.log.(F), label="")

    scatter(K, LinearAlgebra.log.(G), label="Gradient")
    plot!(K, LinearAlgebra.log.(G), label="")
end
