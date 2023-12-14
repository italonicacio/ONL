

# Derivada de funcao de 1 variaveis

function df(f, x, h)
    df = (f(x + h) - f(x))/h;
    return df;
end

# Derivada de funcao de 2 variaveis

function dfx(f, x, y, h)
    return (f(x+h, y) - f(x,y))/h;
end

function dfy(f, x, y, h)
    return (f(x, y+h) - f(x, y))/h;
end

# Derivadas de funcao de 2 variaveis com uso de vetor

function v2dfx(f, px, h)
    h_ = [h ; 0];
    return (f(px + h_) - f(px))/h;
end

function v2dfy(f, px, h)
    h_ = [0; h];
    return (f(px + h_) - f(px))/h;
end


# Derivada de funcao de 3 variaveis

function dfx(f, x, y, z, h)
    return (f(x+h, y, z) - f(x, y, z))/h;
end

function dfy(f, x, y, z, h)
    return (f(x, y+h, z) - f(x, y, z))/h;
end

function dfz(f, x, y, z, h)
    return (f(x, y, z+h) - f(x, y, z))/h;
end

# Derivada de funcao de 3 variaveis com uso de vetor

function v3dfx(f, px, h)
    h_ = [h ; 0 ; 0];
    return (f(px + h_) - f(px))/h;
end

function v3dfy(f, px, h)
    h_ = [0 ; h ; 0];
    return (f(px + h_) - f(px))/h;
end

function v3dfz(f, px, h)
    h_ = [0 ; 0 ; h];
    return (f(px + h_) - f(px))/h;
end

# Gradiente de funcao de 2 variaveis

function Gradient(f, x, y, h)
    v_dfx = dfx(f, x, y, h);
    v_dfy = dfy(f, x, y, h);
    
    return [v_dfx, v_dfy];

end

# Gradiente de funcao de 2 variaveis com vetor
function Gradientv2(f, px, h)
    v_dfx = v2dfx(f, px, h);
    v_dfy = v2dfy(f, px, h);
    
    return [v_dfx, v_dfy];

end


# Gradiente de funcao de 3 variaveis

function Gradient(f, x, y, z, h)
    v_dfx = dfx(f, x, y, z, h);
    v_dfy = dfy(f, x, y, z, h);
    v_dfz = dfz(f, x, y, z, h);

    return [v_dfx; v_dfy; v_dfz];
end

# Gradiente de funcao de 3 variaveis com uso de vetor

function Gradientv3(f, px, h)
    v_dfx = v3dfx(f, px, h);
    v_dfy = v3dfy(f, px, h);
    v_dfz = v3dfz(f, px, h);

    return [v_dfx; v_dfy; v_dfz];
end

