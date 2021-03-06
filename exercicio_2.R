install.packages ("tidyverse")
library (tidyverse)


#
# Suponha que tenhamos o dataframe df abaixo
#
# x     y
# A     5
# A     3
# B     8
# B    12
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#        z
#        7
#

x <- c("A", "A", "B", "B")
y <- c(5, 3, 8, 12)
df <- data.frame(x, y)
df

df %>%
summarise (z = mean(y, na.rm = TRUE))


#######################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# y1    y2    y3    y4
# 8.04  9.14  7.46  6.58
# 6.95  8.14  6.77  5.76
# 7.58  8.74  12.74 7.71
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# y1    
# 8.04  
# 6.95  
# 7.58  

y1 <- c(8.04, 6.95, 7.58)
y2 <- c(9.14, 8.14, 8.74)
y3 <- c(7.46, 6.77, 12.74)
y4 <- c(6.58, 5.76, 7.71)
df <- data.frame (y1, y2, y3, y4)
df

df %>%
select(y1)
  
#######################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#    x  y
#   1  10
#   6  8
#   2  3
#   4  5
#
# Complete o c�digo que obt�m o seguinte resultado, fazendo uma opera��o
# entre x e y
#
#    x  y   z
#   1  10  -9
#   6  8   -2
#   2  3   -1
#   4  5   -1
#

x <- c(1, 6, 2, 4)
y <- c(10, 8, 3, 5)
df <- data.frame(x, y)
df

df %>% mutate( z = x - y )
  
########################################################################

#
# Suponha que tenhamos o dataframe df abaixo
#
#    city sales
# Boston   220
# Boston   125
#    NYC   150
#    NYC   250
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# city   avg_sales
# Boston      172
# NYC         200 

city <- c( "Boston", "Boston", "NYC", "NYC" )
sales <- c( 220, 125, 150, 250 )
df <- data.frame (city, sales)
df

df %>%
  group_by(city) %>%
  summarise(avg_sales = mean(sales))
  
########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#week   min   max
#  3    55    60
#  2    52    56
#  1    60    63
#  4    65    67
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#week   min   max
#  1    60    63
#  2    52    56
#  3    55    60
#  4    65    67

week <- c(3, 2, 1, 4)
min <- c(55, 52, 60, 65)
max <- c(60, 56, 63, 67)
df <- data.frame (week, min, max)
df

df %>%
count(week, min, max)  

########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# x_b_1  x_b_2  y_c_1  y_c_2
#  A      2      W1     25
#  A      4      W2     21
#  B      6      W1     26
#  B      8      W2     30
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# y_c_1  y_c_2
#  W1     25
#  W2     21
#  W1     26
#  W2     30

x_b_1 <- c("A", "A", "B", "B")
x_b_2 <- c(2, 4, 6, 8)
y_c_1 <- c("W1", "W2","W1", "W2")
y_c_2 <- c(25, 21, 26, 30)
df <- data.frame(x_b_1, x_b_2, y_c_1, y_c_2)

df %>%
select(y_c_1, y_c_2) 

#########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 78           6.7         3.0          5.0         1.7 versicolor
# 121          6.9         3.2          5.7         2.3  virginica
# 11           5.4         3.7          1.5         0.2     setosa
# 92           6.1         3.0          4.6         1.4 versicolor
# 146          6.7         3.0          5.2         2.3  virginica
# 62           5.9         3.0          4.2         1.5 versicolor
# 50           5.0         3.3          1.4         0.2     setosa
# 17           5.4         3.9          1.3         0.4     setosa
# 69           6.2         2.2          4.5         1.5 versicolor
# 143          5.8         2.7          5.1         1.9  virginica
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#Species      Sepal.Area
#versicolor      20.10
#virginica       22.08
#setosa          19.98
#versicolor      18.30
#virginica       20.10
#versicolor      17.70
#setosa          16.50
#setosa          21.06
#versicolor      13.64
#virginica      15.66

data(iris)
iris
df <- iris[c(78, 121, 11, 92, 146, 62, 50, 17, 69, 143) ,]
df


df %>%
transmute ( Species, Sepal.Area = Sepal.Length * Sepal.Width )



########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#name         start       end         party     
#Eisenhower   1953-01-20  1961-01-20  Republican
#Kennedy      1961-01-20  1963-11-22  Democratic
#Johnson      1963-11-22  1969-01-20  Democratic
#Nixon        1969-01-20  1974-08-09  Republican
#Ford         1974-08-09  1977-01-20  Republican
#Carter       1977-01-20  1981-01-20  Democratic
#Reagan       1981-01-20  1989-01-20  Republican
#Bush         1989-01-20  1993-01-20  Republican
#Clinton      1993-01-20  2001-01-20  Democratic
#Bush         2001-01-20  2009-01-20  Republican
#Obama        2009-01-20  2017-01-20  Democratic
#
#Crie um c�digo abaixo para que se altere a vari�vel party
#deixando apenas a primeira letra dos partidos


data(presidential)
presidential 
df <- data.frame(presidential)
df

df %>%
mutate(party = recode(party, Republican = "R", Democratic = "D" ))


###############################################################################

# No pacote poliscidata existe um banco de dados chamado nes, com informa��es 
# do American National Election Survey. Para os exer�cicios a seguir, instale 
# o pacote poliscidata e tidyverse, carregue-os e crie um objeto chamado
# df com os dados do nes. 

install.packages ("poliscidata")
library (poliscidata)
library (tidyverse)
data (nes)
df <- (nes)
df

# Fa�a uma primeira explora��o do banco de dados com todos os comandos
# passados at� aqui que possuem esse objetivo

glimpse(nes)
head(nes)
tail(nes)
str(nes)
summary(nes)

# Quantos respondentes possui na pesquisa?

5916

# Caso queiram ter mais informa��es sobre as vari�veis do nes, basta rodar
# o c�digo `?nes`, que no canto inferior direito aparecer� uma descri��o.
# Como temos muitas vari�veis, deixe apenas as colunas
# ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote
# income5, gender.

?nes
df2 <- df %>% 
  select(ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote, income5, gender)

df2

# Se quisermos ter informa��es apenas de pessoas que votaram na
# elei��o de 2012, podemos usar a vari�vel voted2012. Tire do banco
# os respondentes que n�o votaram


df3 <- df %>%
  select(voted2012) %>%
  filter (voted2012 == "Voted")

glimpse(df3)


# Quantos respondentes sobraram?

4.404

# Crie uma vari�vel chamada white que indica se o respondente � branco
# ou n�o a partir da vari�vel dem_raceeth, crie a vari�vel ideology a
# partir da vari�vel ftgr_cons (0-33 como liberal, 34 a 66 como centro,
# e 67 a 100 como conservador), ao mesmo tempo em que muda
# a vari�vel obama_vote para trocar o 1 por "Sim" e 0 por "n�o"

df2 %>%
mutate (white = dem_raceeth == "1. White non-Hispanic") %>%
mutate (ftgr_cons = case_when(ftgr_cons <= 33 ~ "Liberal",
                              ftgr_cons >= 34 & ftgr_cons < 66 ~ "centro",
                              ftgr_cons >= 67  ~ "conservador"))%>%
  mutate(obama_vote = case_when (obama_vote >= 1 ~ "Sim",
                                 obama_vote < 1 ~ "Nao"))



# Demonstre como observar a quantidade de pessoas em cada uma das
# categorias de science_use

df2 %>% 
  count(science_use, sort = T)

# Demonstre como observar a m�dia de conservadorismo (vari�vel 
# ftgr_cons) para cada categoria de science_use

df2 %>%
  group_by (science_use) %>%
  summarise (m�dia = mean(ftgr_cons, na.rm = TRUE))


###############################################################################

# Responder as quest�es te�ricas da aula abaixo

# Selecione o principal artigo do campo de estudos relacionado ao seu trabalho e responda as seguintes quest�es:
# 1) Qual � a quest�o da pesquisa?

A elabora��o de um �ndice composto por dez goals diversificados que avaliam a sa�de do oceano e calculou o �ndice para cada pa�s costeiro.

#2) Qual � a teoria?

Existem poucos frameworks de orienta��o para a medi��o de �ndices ambientais. De fato, mesmo embora a sa�de dos ecossistemas seja geralmente descrita
como o bem-estar de sistemas naturais e humanos associados, a maioria das avalia��es dos ecossistemas concentra-se exclusivamente nos impactos 
negativos dos seres humanos na natureza. Existem poucas medidas sint�ticas para avaliar clara e quantitativamente a sa�de dos oceanso. 
Sem um frameowrk para definir e orientar a medi��o da sa�de/pol�tica dos oceanos, sua gest�o recorrer� a avalia��es menos transparentes, mais subjetivas e que n�o
haver� uma padroniza��o entre locais e atrav�s do tempo. Construir e incorporar uma vasta gama de indicadores existentes para avaliar a qualidade do oceano � o objetivo desse trabalho.

#3) Qual � o desenho de pesquisa?

Mediram a sa�de dos oceanos em fun��o de dez objetivos p�blicos amplamente divulgados (as Informa��es suplementares est�o no Supplementary Information).
O �ndice reconhece, portanto, as liga��es entre as sociedades e ecossistemas oce�nicos. Os detalhes completos sobre como as pontua��es foram calculadas para o �ndice global e cada
objetivo, os dados utilizados em cada caso e a forma como cada camada de dados foi processada s�o fornecidas nas Informa��es Complementares do artigo. 
O objetivo (fun��o utilidade) do �ndice � maximizar o seu valor (I), onde I � determinado como uma soma linear ponderada das pontua��es para cada um dos objetivos (goals) p�blicos.

#4) Como o artigo se sai nos 4 quesitos de avalia��o de causalidade

1) Os autores n�o acreditam que apenas um X causa o Y (a sa�de dos oceanos). Para os autores, existem uma gama de fatores e sub-fatores que influenciam o resultado 
global das sa�des do oceanos. Entretanto, isso n�o � um problema do desenho de pesquisa, tendo em vista que a l�gica aplicada n�o se conforma em achar um X gerando um Y, 
mas um conjunto de condi��es que gerariam o resultado final de Y (aparenta ser uma condi��o INUS, onde um conjunto de condi��es seria necess�ria para causar o Y).

2) Sim. A sa�de dos oceanos n�o causaria as 10 goals e sub-goals aplicadas para o c�lculo do modelo. Fica claro que o conjunto de X que influencia o Y (sa�de dos oceanos) e n�o o cont�rio. 
Portanto, a sa�de dos oceanos n�o causaria a biodiversidade ou a prote��o costeira de cada caso estudado.

3) Para mim esse � o ponto mais fr�gil do artigo. Como o �ndice � composto por uma diversa gama de goals e sub-goals � poss�vel que haja uma covaria��o entre os inputs e os outputs.
Entretanto, entre os goals n�o fica t�o claro que h� uma covaria��o entre os goals e que eles interseccionam em sua natureza.

4) Sim. � levado em conta uma gama de vari�veis que podem ser associadas ao X e ao Y.

#5) O que ele conclui?

O �ndice proporciona uma ferramenta robusta e amplamente aplic�vel para uma avalia��o cont�nua
da sa�de dos oceanos em rela��o a objetivos socias bem e um par�metro-chave de refer�ncia. Tamb�m busca informar o n�vel atual da sa�de dos oceanos dos pa�ses.

#6) Como sua pesquisa d� um passo a mais?

O artigo afirma: "We hypothesized that sub-goal scores would be higher for more developed countries, 
typically at higher latitudes with stronger economic reliance on sustainable seafood."

Meu artigo busca avaliar essa hip�tese de que pa�ses desenvolvidos pontuam melhor no �ndice dos oceanos e quais seriam suas causas.


#7) Elabore qual sua pergunta de pesquisa?

Pa�ses desenvolvidos det�m de melhores oceanos? Quais s�o as causas? 
  
#8) Avalie o seu trabalho nas 4 avalia��es de rela��o causal
  
  1) Como o meu trabalho � um trabalho de avalia��ao de hip�tese do �ndice e como a vari�vel X (desenvolvimento dos pa�ses) 
est� contida nos goals do �ndice, haveria uma argumenta��o raz�avel de que pa�ses desenvolvidos tem melhores oceanos.

2) Sim. N�o seria os oceanos que causam o desenvolvimento dos pa�ses.

3) A an�lise emp�rica que mostra a associa��o das vari�veis seria o resultado do �ndice. Onde os pa�ses costeiros desenvolvidos teriam uma melhor pontua��o no �ndice.

4) Sim.

"An index to assess the health and benefits of the global ocean" - Benjamin S. Halpern1,2, Catherine Longo1, Darren Hardy1


 

