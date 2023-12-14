# include("./busca_exata/busca_exata.jl")
# include("./busca_inexata/busca_inexata.jl")
# include("./gradiente_aurea/gradiente_aurea.jl")
# include("./Newton_Aurea/Newton_Aurea.jl")
# include("./Gradient_Conj_Aurea/Gradient_Conj_Aurea.jl")
include("./Gradient_Conjugado/gradient_conjugado.jl")
# include("./DFP/DFP.jl")
# include("./BFGS/BFGS.jl")
# include("./Regiao_Confianca/regiao_confianca.jl")


# function f(x)
#     r = (1/2)*x'*[2 1; 1 6]*x + [1 ; 1]'*x + 1 
#     return r[1]
# end

# f(x) = (x[1]^3 + x[2])^2 + 2*(x[2]-x[1]-4)^2 + 4

# Gradiente Conjugado
A = [1 0; 0 1]
b = [3 ; 2]
c = 2

f(x) = 0.5*x'*A*x + b'*x + c


# Quasi Newton DFP
# f(x) = x[1]^2 - x[1]*x[2] + (3/2)*x[2]^2 + 2

# Quasi Newton BFGS
# f(x) = x[1]^2 - x[1]*x[2] + (3/2)*x[2]^2 + 1


# Regiao Confianca
# f(x) = x[2]^4 + x[1]^2 + x[2]^2 + 2

# Inicial
x = [-3 ; 4]
# d = [-1; 0]
# delta = 1/4
# etha = 0

H = I(2)

# Aurea(f, x, d)

GradConj(f, x, A, b, c)

# DFP(f, x, H)

# BFGS(f, x, H)

# RegiaoConfianca(f, x, delta, etha)
