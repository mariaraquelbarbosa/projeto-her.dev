using DataFrames
using Plots

function plot_fmi_data(df, male_index, female_index)
    
    # Converta a coluna 'Valor' para Float64
    df.Valor = parse.(Float64, df.Valor)
    
    # Filtrar os dados para o índice masculino
    male_data = filter(row -> row["Código do indicador"] == male_index, df)
    female_data = filter(row -> row["Código do indicador"] == female_index, df)
    
    # Inicialize o gráfico
    p = plot(grid=false)
    
    # Scatterplot e gráfico de linha para o índice masculino
    scatter!(male_data.Período, male_data.Valor, label = "Sexo Masculino", color = "purple")
    plot!(male_data.Período, male_data.Valor, label = nothing, color = "purple")
    
    # Scatterplot e gráfico de linha para o índice masculino
    scatter!(female_data.Período, female_data.Valor, label = "Sexo Feminino", color = "red")
    plot!(female_data.Período, female_data.Valor, label = nothing, color = "red")
   
    # Personalize o gráfico
    xlabel!("Ano")
    ylabel!("Valor")
    title!(female_index)
    
    display(p)
end