# Interando listas
membros_lista = ["Alice", "Geovanna", "Emilly", "Ka", "Maria", "Adrielle", "Wallery", "Fernanda"]
for membro in membros_lista
    println(membro)
end

#println() vs print()
for membro in membros_lista
    print(membro, ", ")
end

# Iterando tuplas
membros_tupla = ("Alice", "Geovanna", "Emilly", "Ka", "Maria", "Adrielle", "Wallery", "Fernanda")
for membro in membros_tupla
    println(membro)
end

# Iterando strings
membro_string = "Adrielle"
for string in membro_string
    println(string)
end

# Iterando range de números
for i in 1:8
    println(i)
end

for i in 1:8

    for j in 1:i
        print(i, " ")
    end

    println()
end

membros_lista = ["Alice", "Geovanna", "Emilly", "Ka", "Maria", "Adrielle", "Wallery", "Fernanda"]

i = 1

while i <= length(membros_lista)
    membro = membros_lista[i]
    println(membro)
    global i += 1
end

function verificacao(x, y)
    if x < y
            println("x é menor que y")
    elseif x > y
            println("x é maior que y")
    else
            println("x é igual a y")
        end
    end

verificacao(1, 2)

function bhaskara(a, b, c)
    delta = b^2 - 4*a*c
    
    if delta > 0
        x1 = (-b + sqrt(delta)) / (2*a)
        x2 = (-b - sqrt(delta)) / (2*a)
        return (x1, x2)
    elseif delta == 0
        x = -b / (2*a)
        return (x,)
    else
        print("Não há nenhuma raiz real para essa equação")
        return ()
    end
end

bhaskara(3, -2, -8)
