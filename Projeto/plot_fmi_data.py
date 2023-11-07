import pandas as pd
import matplotlib.pyplot as plt

def plot_fmi_data(df, male_index, female_index):

    df['Valor'] = df['Valor'].astype(float)
    df['Período'] = df['Período'].astype(int)
    df['Valor'] = df['Valor'].round(2)

    fig, ax = plt.subplots(figsize=(5, 4))

    indicador1 = df[df['Código do indicador'] == male_index]
    indicador2 = df[df['Código do indicador'] == female_index]

    # Homens
    plt.plot(indicador1['Período'], indicador1['Valor'], color='#6D092D', label='Homens', marker='o')

    # Mulheres
    plt.plot(indicador2['Período'], indicador2['Valor'], color='#F1CD3C', label='Mulheres', marker='o')

    anos = indicador2['Período'].unique()
    
    plt.grid(True, alpha=0.3, color='gray')

    ax.tick_params(axis='both', which='both', bottom=False, top=False, left=False, right=False)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['bottom'].set_visible(False)
    ax.spines['left'].set_visible(False)

    plt.xlabel('Ano', fontsize=10)
    plt.ylabel('Valor', fontsize=10)
    plt.xticks(anos)
    plt.title('Nº de depositantes em bancos comerciais a cada mil')
    plt.legend()
    plt.show()