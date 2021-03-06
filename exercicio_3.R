# Utilizando o banco world do pacote poliscidata, fa�a um  
# histograma que tamb�m indique a m�dia  e um boxplot 
# da vari�vel gini10
# Descreva o que voc� pode observar a partir deles.

library(tidyverse)
library(poliscidata)
banco <- world

ggplot(banco, aes(gini10)) + 
  geom_histogram(aes(y=..density..),
                 binwidth = 5) +
  geom_density() +
  geom_vline(aes(xintercept = mean(gini10, na.rm = T)))

ggplot (banco, aes(x = gini10)) +
  geom_boxplot()
  
ggplot (banco, aes(x= gini10, y = "")) + 
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))

A m�dia do histograma � 40 e a moda � entre 35 e 48, mais ou menos. Enquanto que a mediana no boxplot � um pouco 
menor do que 40. Separando em quintis, vemos que a curva de gini se concentra no segundo quintil (50%).
  
# Utilizando as fun��es de manipula��o de dados da aula passada,
# fa�a uma tabela que sumarize a media (fun��o mean), 
# mediana (funcao median) e o desvio padr�o (fundao sd) da 
# renda per capta (vari�vel gdppcap08), agrupada por tipo de regime 
# (vari�vel democ).
# Explique a diferen�a entre valores das m�dias e medianas.
# Ilustre com a explica��o com gr�fico de boxplot.
# Os dados corroboram a hip�tese da rela��o entre democracia
# e desempenho economico?

banco %>%
  group_by(democ) %>%
  summarise(mean(gdppcap08, na.rm = TRUE), + median(gdppcap08, na.rm = TRUE), + sd(gdppcap08, na.rm = TRUE))

ggplot(banco, aes(x = democ, y = gdppcap08)) +
  geom_boxplot() +


A M�dia � o valor m�dio de um determinado conjunto de casos, o formato aritm�tico �: o somat�rio de n / n, onde n � o n�mero de casos.
A Mediana � o valor do centro de um conjunto de dados (se esse conjunto for par). Caso seja �mpar: (a + b)/ 2, onde a e b sejam os casos centrais.

No nosso exemplo, percebemos que a renda per capta em pa�ses democr�ticos � maior do que em pa�ses n�o democr�ticos.
A m�dia de renda per capta dos pa�ses democr�ticos � bem maior do que a renda per capta de pa�ses n�o democr�ticos. Isso tamb�m serve para as medianas.
Tamb�m vemos alguns casos outliers. 

Por fim, os dados corroboram com a hip�tese de que em sistema democr�ticos h� um melhor desempenho econ�mico.


# Carregue o banco states que est� no pacote poliscidata 
# Mantenha apenas as vari�veis obama2012, conpct_m, hs_or_more,
# prcapinc, blkpct10, south, religiosity3, state

library(poliscidata)
banco <- states
banco_selecionado <- banco %>%
  select(obama2012, conpct_m, hs_or_more, prcapinc, blkpct10, south, religiosity3, state)


# Carregue o banco nes que est� no pacote poliscidata
# Mantenha apenas as vari�veis obama_vote, ftgr_cons, dem_educ3,
# income5, black, south, relig_imp, sample_state

library(poliscidata)
banco <- nes
banco_selecionado_2 <- banco %>%
  select(obama_vote, ftgr_cons, dem_educ3, income5, black, south, relig_imp, sample_state)

# As vari�veis medem os mesmos conceitos, voto no obama em 2012, 
# conservadorismo, educa��o, renda, cor, norte-sul, 
# religiosidade e estado. A diferen�a � que o nes � um banco de
# dados com surveys individuais e o states � um banco de dados
# com informa��es por estado
#
# Fa�a um gr�fico para cada banco representando o n�vel de
# conservadorismo. Comente as conclus�es que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.
# Para ajudar, voc�s podem ter mais informa��es sobre os bancos
# de dados digitando ?states e ?nes, para ter uma descri��o das
# vari�veis

?states

ggplot(banco_selecionado, aes(x = conpct_m)) +
  geom_histogram(aes(y =..density..),
                 binwidth = 2.5) +
  geom_vline(aes(xintercept = mean(conpct_m, na.rm = T)))


ggplot(banco_selecionado_2, aes(x = ftgr_cons)) +
  geom_histogram(aes(y =..density..),
                 binwidth = 10) +
  geom_density() +
  geom_vline(aes(xintercept = mean(ftgr_cons, na.rm = T)))

Percebemos no 1� gr�fico que os americanos se concentram majoritamente no n�vel 35 de conservadorismo. A m�dia fica muito pr�xima desse valor.
No 2� gr�fico percebemos que a moda de conservadorismo � o 50.

# Qual � o tipo de gr�fico apropriado para descrever a vari�vel
# de voto em obama nos dois bancos de dados?
# Justifique e elabore os gr�ficos

## Para o Banco States: ## 

head(banco_selecionado)
tail(banco_selecionado)
str(banco_selecionado)
install.packages("ggbeeswarm")
library(ggbeeswarm)

ggplot(banco_selecionado, aes(obama2012)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2.5) +
  geom_density() +
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T))) +
  labs(title = "Votos em Obama por Estado", x = "Votos em Obama", y = "Densidade")

ggplot(banco_selecionado, aes(obama2012, state)) +
  geom_point ()

## Achei interessante utilizar o histograma para o banco states, pois states � um banco de dados com informa��es por estado ##
## Cada caso no eixo y representaria a densidade dos estados que tiveram determinado valor x de votos em Obama ##
## j� no eixo x, seria a quantidade de votos para Obama ##
## Diminui o bins para que pudessemos ver a vota��o de mais estados separadamente. ##
## A m�dia dos votos para Obama por estado ficou um pouco abaixo dos 50 e a moda de votos foi mais ou menos 55% ##
## Conforme conversado, tentei relacionar a vari�vel obama2012 com os estados. Por isso tamb�m utilizei o comando geom_beeswarm.

## Para o Banco NES ## 

head(banco_selecionado_2)
tail(banco_selecionado_2)
str(banco_selecionado_2)

ggplot(banco_selecionado_2, aes(obama_vote)) +
  geom_bar()

## Achei interessante utilizar o gr�fico de barras, pois como a vari�vel obama_vote � uma vari�vel bin�ria, ##
## cada coluna mostra o caso 0 ou o caso 1 para o eleitorado americano. ##


# Crie dois bancos de dados a partir do banco nes, um apenas com
# respondentes negros e outro com n�o-negros. A partir disso, fa�a
# dois gr�ficos com a propor��o de votos no obama.
# O que voc� pode afirmar a partir dos gr�ficos?
# Voc� diria que existe uma rela��o entre voto em Obama e cor?

?nes

negros <- nes %>%
transmute(obama_vote, black) %>%
  filter(black == "YES") 

ggplot(negros, aes(obama_vote, ..count../sum(..count..))) +
geom_bar() + 
scale_y_continuous(labels = percent)

library(poliscidata)
brancos <- nes %>%
  transmute(obama_vote, black) %>%
  filter(black == "NO") 
  
ggplot(banco2, aes(obama_vote, ..count../sum(..count..))) +
  geom_bar(na.rm = T) +
  scale_y_continuous(labels = percent)

#Percebemos que h� diferen�a entre a cor da pele e os votos em Obama. No caso dos negros, h� um maior percentual de vontantes.


# A partir do banco de dados states, fa�a uma compara��o semelhante.
# Fa�a um gr�fico com as porcentagens de votos em Obama para estados
# que est�o acima da mediana da porcentagem de popula��o negra nos estados,
# e outro gr�fico com as porcentagens de votos em Obama para os estados
# que est�o abaixo da mediana de popula��o negra.
# O que voc� pode afirmar a partir dos gr�ficos?
# Podemos chegar a mesma conclus�o anterior?

?states
votos_negros <- states 

votos_negros %>%
transmute(obama2012, blkpct10, state) %>%
  filter(blkpct10 >= median(blkpct10))

ggplot(votos_negros, aes(blkpct10)) +
  geom_density()

ggplot(votos_negros, aes(y = blkpct10)) + 
  geom_boxplot()

votos_negros2 <- states

votos_negros2 %>%
  transmute(obama2012, blkpct10, state) %>%
  filter(blkpct10 < median(blkpct10))

ggplot(votos_negros2, aes(blkpct10)) +
  geom_density()

ggplot(votos_negros2, aes(y = blkpct10)) +
  geom_boxplot()


## N�o consegui perceber uma diferen�a significativa entre os dois gr�ficos. Ao meu ver, n�o podemos chegar na mesma conclus�o
## do exerc�cio anterior ##



# A partir da var�avel X do banco df abaixo
df <- data.frame(x = cos(seq(-50,50,0.5)))
# Fa�a os tipos de gr�ficos que representem esse tipo de vari�vel
# comentando as diferen�as entre elas e qual seria a mais adequada

df <- data.frame(x = cos(seq(-50,50,0.5)))

ggplot(df, aes(x)) +
  geom_bar()

Esse � o gr�fico de barras traidicional. Bota uma vari�vel no Eixo X e outra no eixo Y, como n�o especificamos, ser� definido como count

ggplot(df, aes(x, ..count../sum(..count..))) +
  geom_bar(na.rm = T) +
  scale_y_continuous(labels = percent)

ggplot(df, aes(x)) +
  geom_histogram()

ggplot(df, aes(x)) +
  geom_density()

Gr�fico de densidade. Quantos casos aparecem por caso de X

ggplot(df, aes(x)) +
  geom_histogram(aes(y =..density..),
                 binwidth = 5) +
  geom_density()

ggplot(df, aes(x)) +
  geom_boxplot()

Gr�fico de pontos. Determina o m�nimo, m�ximo e a m�dia dos casos para a vari�vel x.

ggplot(df, aes(x, y = "")) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))

Aqui separa por quintis de renda ou separa os casos em quintis.

ggplot(df, aes("", x)) +
  geom_beeswarm()

# responsa as quest�es te�ricas abaixo

1)

Vari�vel independente  ------------------------------------------------------------------------------------------------> Vari�vel dependente 
(Desempenho econ�mico)    pa�ses com melhor desempenho econ�mico tem melhor capacidade de monitoramento                 (Sa�de dos oceanos)





                                    pa�ses com melhor desempenho econ�mico tem melhores oceanos 
Vari�vel independente  ---------------------------------------------------------------------------------------> Vari�vel dependente
(IDH, pib per capita, �ndice de gini)                                                            (Ocean Health Index, seus goals e sub goals)

2)
Os dados est�o amplamente dispon�veis. Tanto os da vari�vel independete (IDH, pib per capita, gini), quanto o OHI (Ocean Health Index) 
ou alguma outra base de dados ambiental que possa surgir no decorrer do artigo.

3) O OHI fornecem um quadro robusto para avaliar a sa�de dos oceanos e motivar uma melhor recolha de dados
para refor�ar as futuras intera��es do �ndice.
Ao desenvolver o �ndice, os autores abordam seis grandes desafios: 
(1) identificar um modesto n�mero de objetivos amplamente aceites para avaliar a sa�de e os benef�cios dos oceanos em
qualquer escala; 
(2) desenvolver modelos que me�am, com razo�vel precis�o como cada objetivo � alcan�ado; 
(3) definir pontos de refer�ncia robustos para cada modelo; 
(4) incorporar a sustentabilidade no �ndice; 
(5) assegurar que o �ndice responde a diferen�as e mudan�as reais no oceano sa�de e benef�ciarios;
(6) permitir flexibilidade para se adaptar �s restri��es (ou melhorias futuras) da disponibilidade, qualidade e quantidade de dados.
Embora o �ndice possa ser implementado em qualquer escala, aqui concentramo-nos
em escalas de zona econ�mica global e exclusiva (ZEE).

Em rela��o as vari�veis independentes: O IDH, Gini e Pib per capita s�o amplamente usadas em trabalhos econ�micos.
Apesar do IDH ser um �ndice composto por uma m�dia entre vari�veis multisetoriais, ele det�m de amplo uso e capacidade de replica��o

4) Acredito que o m�todo atual seja um m�todo robusto pra operacionalizar as vari�veis. O OHI � um banco de dados colaborativo e global,
onde diversos pesquisadores o atualizam anualmente. Ele tamb�m � um �ndice robusto, composto por 10 goals e m�ltiplos sub-goals para chegar 
na conclus�o do valor da sa�de dos oceanos. Os goals s�o:
  
  -Food provision
  -Artisanal fishing opportunity 
  -Natural products
  -Carbon storage
  -Coastal protection
  -Tourism and recreation
  -Coastal livelihoods and economies
  -Sense of place
  -Clean waters
  -Biodiversity 

V�rios desses goals s�o compostos por sub-goals para calcular os seus valores. 

## Para entender melhor sobre o �ndice acessar: http://www.oceanhealthindex.org/methodology/goals ##

Como as v�riaveis econ�micas s�o amplamente difundidas, foquei mais no OHI.




