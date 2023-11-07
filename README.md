![Her dev](https://github.com/mariaraquelbarbosa/Projeto-Her.dev-Julia-Python/assets/122839919/e55d28b8-5445-4f14-9359-73ff105ca412)

<div align="center">
  
  <img src="https://img.shields.io/badge/-Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white"/> <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue"/>

</div>

<div align="center">

  **Participantes:** <a href="https://github.com/mariaraquelbarbosa">[![GitHub Badge](https://img.shields.io/badge/Maria_Raquel-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/mariaraquelbarbosa)</a>
  <a href="https://github.com/Alice-ts">[![GitHub Badge](https://img.shields.io/badge/Alice_Saraiva-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/Alice-ts)
  <a href="https://github.com/emillymeneses">[![GitHub Badge](https://img.shields.io/badge/Emilly_Meneses-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/emillymeneses)
  <a href="https://github.com/geovannangf">[![GitHub Badge](https://img.shields.io/badge/Geovanna_Ferreira-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/geovannangf)
  <a href="https://github.com/WalleryO">[![GitHub Badge](https://img.shields.io/badge/Wallery_Gomes-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/WalleryO)
  <a href="https://github.com/Adrielle123abreu">[![GitHub Badge](https://img.shields.io/badge/Adrielle_Abreu-100000?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/Adrielle123abreu)


</div>

<p></p>

# O FEA.dev e o Her.dev 🌹
O FEA.dev é uma entidade estudantil da FEA-USP que tem como objetivo conectar os estudantes à intersecção entre o mundo dos negócios e o universo da programação. Um dos grandes obstáculos que enfrentamos aos valores promovidos pela entidade é o gap de gênero nesse contexto. Desse modo, a fim de discutir o problema e colocar as mulheres no centro do debate, o FEA.dev criou a campanha Her.dev, a qual ocorre anualmente no mês de outubro.

# O Projeto

Esse projeto consiste na ***Extração e Análise de Dados do Fundo Monetário Internacional (FMI) sobre o Acesso Feminino a Serviços Financeiros*** na Argentina, nos Emirados Árabes, na Índia, no Brasil, na Angola e no Cabo Verde utilizando Python e Julia, com o objetivo de comparar esse dado em países com contextos históricos e culturais diferentes, como também comparar as duas linguagens de programação.

# Overview

O `FMIDataset` é uma classe que permite acessar facilmente os dados das bases do FMI selecionando diferentes parâmetros, como frequências regiões e indicadores desejados.

## Instalação

Para utilizar a classe `FMIDataset`, siga estas etapas:

1. Clone ou baixe este repositório para o seu sistema.

![Python Badge](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue) ```git clone https://github.com/mariaraquelbarbosa/projeto-her.dev.git```

![Python Badge](https://img.shields.io/badge/-Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white) ```run(`git clone https://github.com/mariaraquelbarbosa/projeto-her.dev.git`)```

2. Navegue até o diretório onde você clonou ou baixou o repositório.
3. Importe a classe FMIDataset no seu projeto como um módulo local.

![Python Badge](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue) ```from fmi_extractor import FMIDataset```

![Python Badge](https://img.shields.io/badge/-Julia-9558B2?style=for-the-badge&logo=julia&logoColor=white) ```include("fmi_extractor.jl")```

## Exemplo de uso

A seguir, um exemplo de como usar a classe `FMIDataset` na linguagem Python:

```python

base = FMIDataset("FAS")                                 # Código da base de dados
frequency_list = ["A"]                                   # Frequência dos dados
region_list = ["AE"]                                     # Sigla do país
indicator_list = ["FCROFNMFHF_NUM", "FCDODCHF_PE_NUM"]   # Código dos indicadores

# Gerando o DataFrame
df = base.get_indicator(frequency_list, region_list, indicator_list)
print(df)
```

E um exemplo de uso da mesma classe na linguagem Julia:
```julia
base = FMIDataset("FAS")                                 # Código da base de dados
frequency_list = ["A"]                                   # Frequência dos dados
region_list = ["AE"]                                     # Sigla do país
indicator_list = ["FCROFNMFHF_NUM", "FCDODCHF_PE_NUM"]   # Código dos indicadores

# Gerando o DataFrame
df = get_indicator(base, frequency_list, region_list, indicator_list)
println(df)
```

## Exemplo de output

| Código do indicador | Localização | Período |   Valor |
|---------------------|------------|--------|---------|
| FCDODCHF_PE_NUM     | AE         |   2014 | 1,429,296|
| FCDODCHF_PE_NUM     | AE         |   2015 | 1,066,752|
| FCDODCHF_PE_NUM     | AE         |   2016 | 1,263,867|
| FCDODCHF_PE_NUM     | AE         |   2017 | 1,381,932|
| FCDODCHF_PE_NUM     | AE         |   2018 | 1,522,333|
| FCDODCHF_PE_NUM     | AE         |   2019 | 1,467,851|
| FCDODCHF_PE_NUM     | AE         |   2020 | 1,531,593|
| FCDODCHF_PE_NUM     | AE         |   2021 | 1,640,526|
| FCDODCHF_PE_NUM     | AE         |   2022 | 1,860,573|

## Análises

Confira um resumo das nossas análises no [Post do Instagram do FEA.dev](https://www.instagram.com/p/CzFN9LmoKqs)!
