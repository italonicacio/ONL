include("../busca_exata/busca_exata.jl")
using ForwardDiff, LinearAlgebra


function DogLeg(gk, B, delta)
    println("")
    println("DogLeg:")
    d = -((gk'*gk)/(gk'*B*gk))*gk
    println("d_antes = ", d)
    normd = norm(d)
    println("norm(d_antes) = ", normd)
    if normd > delta
        d = -(delta/norm(gk))*gk
        println("d_if = ", d)

    end

    println("d_resultado = ", d)
    return d
    
end

# function RegiaoConfianca(f, x, delta, etha)
#     epsilon = 1e-5
#     kmax = 1
#     k = 0
#     fx = f(x)
#     gx = ForwardDiff.gradient(f, x)
#     norm = LinearAlgebra.norm(gx)
    
#     println("k = $k   f(x) = $fx  norm(Grad) = $norm")
    
    
    
#     # while (norm > epsilon) && (k < kmax)

#         B = ForwardDiff.hessian(f, x)
#         # d = - ((gx'*gx)/(gx'*Hessian*gx)) .* gx
#         d = DogLeg(gx, B, delta)
#         m0 = f(x)
#         m(d) = f(x) + gx'*d + (1/2)*d'*B*d 


#         println("m(d) = ", m(d))
#         println(Hessian)
#         println("m(0) = ", m0)




#         ared = f(x) - f(x + d)
#         pred = m0 - m(d) 
        
#         p = (ared/pred)
#         normd = LinearAlgebra.norm(d)
#         theta1 = 1/4
#         theta2 = 3/4

#         if p > etha
#             x = x + d
#         end

#         if p < theta1
#             delta = delta/2
#         else
#             if (p > theta2) && (normd == delta)
#                 delta = 2*delta 
#             end
#         end

#         k += 1
        

#         fx = f(x)
#         gx = ForwardDiff.gradient(f, x)
#         norm =  LinearAlgebra.norm(gx)
    
#         println("k = $k   f(x) = $fx  norm(Grad) = $norm")    
#         println()


#         k += 1
#     # end

#     # if k == kmax
#     #     println("Max Iteration")
#     # end

#     println(ForwardDiff.gradient(f,x))

# end

function RegiaoConfianca(f, x, delta, etha)

    fx = f(x)
    gx = ForwardDiff.gradient(f, x)
    norm = LinearAlgebra.norm(gx)
    
    println("f(x) = $fx  norm(Grad) = $norm")
    println("Grad(f, x) = $gx")

    B = ForwardDiff.hessian(f, x)
    println("B = $B")

    d = DogLeg(gx, B, delta)
    println("")
    normd = LinearAlgebra.norm(d)
    println("norm(d_resultado) = ", normd)


    println("x + d = ", x + d)
    println("f(x) = ", f(x))
    println("f(x + d) = ", f(x + d))

    m0 = f(x)
    m(d) = f(x) + gx'*d + (1/2)*d'*B*d 

    
    println("m(0) = ", m0)
    println("m(d) = ", m(d))

    println()

    ared = f(x) - f(x + d)
    pred = m0 - m(d) 
        
    p = (ared/pred)
    println("p = ", p)
    normd = LinearAlgebra.norm(d)
    theta1 = 1/4
    theta2 = 3/4

    if p > etha
        x = x + d
    end

    if p < theta1
        delta = delta/2
    else
        if (p > theta2) && (normd == delta)
            delta = 2*delta 
        end
    end
        

    fx = f(x)
    gx = ForwardDiff.gradient(f, x)
    norm =  LinearAlgebra.norm(gx)
    
    println("x* = ", x)
    println("f(x) = $fx  norm(Grad) = $norm")
    println("Grad(f, x) = $gx")

    println(ForwardDiff.gradient(f,x))

end