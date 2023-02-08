## Análise estatística da qualidade da água das praias de SP

A atividade consiste em filtrar os dados sobre Enterococcus de cada praia, filtrando pela cidade, no caso 'ILHA COMPRIDA', e depois obter as estatísticas sobre os dados do arquivo CSV disponibilizado com uma planilha contendo as informações.
foram gerados também arquivos do tipo Rdata que serão carregados pelo R markdown para conseguir plotar os gráficos gerados pelo script 1va.R

* na primeira questão será retornado os valores em um dataframe que contém os valores para os enterococcus e sua média, mediana, desvio padrão, Q1 e Q3, valor máximo e mínimo.
* Na segunda questão a partir da variável Beach se monta um gráfico de barras para representar os valores percentuais de cada grupo e sua porcentagem em relação ao total de amostras, sendo cada praia representada por cores diferentes.
* Na questão 3, se tem os mesmo valores que são representados agora no formato de gráfico do tipo pizza para se ter uma noção mais clara da porcentagem de cada praia.
* Na questão 4, é gerado um histograma que mostra as frequência de cada faixa de valor para a variável enterococcus e mostrando em qual faixa se concentra a maior parte
da distribuição da amostra.
* Na questão 5, foi gerado um gráfico do tipo boxplot, que mostra dados sobre a variável enterococcus como valor mínimo, máximo, Q1(quartil) e Q3, mediana e consegue demonstrar graficamente a dispersão da amostra em relação À variével e agrupada por praia.

Por fim foi gerado um relatório no formato HTML, com as estatísticas pedidas para cada questão.
