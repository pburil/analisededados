
## Fa�a todos os gr�ficos utilizando um tema que voc� ache mais adequado
## e nomeie os eixos x e y da maneira adequada

ggplot(banco, aes(fct_infreq(democ_regime08))) +
geom_bar() +
  theme_classic() +
  labs(title = "Frequ�ncia por tipo de regime", subtitle = "Regimes Democr�ticos e n�o democr�ticos", x = "Tipos de Regime", y = "Quantidade")

ggplot(banco, aes(democ_regime08)) +
  geom_density(alpha = 0.8) +
  theme_classic() +
labs(title = "Frequ�ncia por tipo de regime", subtitle = "Regimes Democr�ticos e n�o democr�ticos", x = "Tipos de Regime", y = "Densidade")

ggplot(banco, aes(y = democ_regime08)) +
  theme_minimal() +
  labs(title = "Frequ�ncia por tipo de regime", subtitle = "Regimes Democr�ticos e n�o democr�ticos", x = "Tipos de Regime", y = "Densidade") +
  geom_boxplot()

install.packages("ggbeeswarm")
library(ggbeeswarm)

ggplot(banco, aes("", democ_regime08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  theme_minimal() +
  geom_beeswarm() +
  labs(title = "Frequ�ncia por tipo de regime", subtitle = "Regimes Democr�ticos e n�o democr�ticos", x = "Tipos de Regime", y = "Densidade")


## Carregue o banco world do pacote poliscidata

library(tidyverse)
library(poliscidata)

banco <- world

## Observe o banco de dados com as fun��es adequadas

head(banco)
tail(banco)
str(banco)
summary(banco)
glimpse(banco)

## A vari�vel democ_regime08 indica se um pa�s � democr�tico.
## Usando as ferramentas de manipulacao de bancos de dados, verifique
## quantos paises sao democraticos ou nao, e apresente esta vari�vel 
## graficamente

banco %>%
  count(democ_regime08)

ggplot(banco, aes(x = democ_regime08)) +
  geom_bar() +
  theme_tufte() +
  labs(title = "Sistema Pol�tico dos Pa�ses", x = "Tipos de Regime", y = "Quantidade")


## Teste a rela��o entre a vari�vel democ_regime08 e a vari�vel
## muslim (que indica se um pa�s � mu�ulmano ou n�o). E represente
## visualmente as vari�veis para visualizar se esta religi�o
## aumenta ou diminui a chance de um pa�s ser democr�tico
## Qual seria sua conclus�o com rela��o a associa��o destas duas
## vari�veis?

banco2 <- world %>%
  filter(!is.na(democ_regime08),
         !is.na(muslim))


tabela <- table(banco2$muslim, banco2$democ_regime08)
prop.table(tabela)
chisq.test(tabela)

library(graphics)
mosaicplot(tabela, shade = TRUE)

library(vcd)
assoc(tabela, shade = TRUE)
  
Podemos perceber que quando os pa�ses n�o s�o mul�umanos h� mais pa�ses democr�ticos, enquanto que 
quando os pa�ses s�o mul�umanos, eles s�o menos democr�ticos 
Quando o pa�s � mul�umano, tem menos chance dele ser democr�tico.
O resultado do p-valor corrobora com essa hip�tese


## A vari�vel gdppcap08 possui informa��o sobre o PIB per capta
## dos pa�ses. Fa�a uma representa��o gr�fica desta vari�vel

banco3 <- world %>%
  filter(!is.na(gdppcap08)) 


ggplot(banco3, aes(gdppcap08)) +
  geom_density(adjust = 0.5)  

ggplot(banco3, aes(x = "", y = gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))


Nesses 2 gr�ficos vemos que a concentra��o de pa�ses com um PIB per capita elevado tende a diminuir. � mais comum
encontrar pa�ses na faixa do segundo e terceiro quartis.

  
## Fa�a um sumario com a m�dia, mediana e desvio padr�o do pib per capta
## para cada tipo de regime politico, represente a associa��o destas
## vari�veis graficamente, e fa�a o teste estat�stico adequado para
## chegar a uma conclus�o. Existe associa��o entre as vari�veis?

banco %>%
group_by(democ_regime08) %>%
  summarise(mean(gdppcap08, na.rm = TRUE),
            median(gdppcap08, na.rm = TRUE),
             sd(gdppcap08, na.rm = TRUE),
            n = n())

t.test(gdppcap08 ~ democ_regime08, data = banco)

ggplot(banco, aes(democ_regime08, gdppcap08)) +
  theme_minimal() +
  geom_boxplot()


O intervalo de confian�a n�o inclui o 0, isso seria um sinal de que h� signific�ncia estatistica no modelo.
Tamb�m temos um p-valor baixo. Isso seria um sinal de que h� signific�ncia estatistica. 
A diferen�a entre as m�dias tamb�m � uma informa��o importante para afirmar de que h� rela��o entre o tipo do regime
 e o desempenho econ�mico

## Por fim, ao inv�s de utilizar uma vari�vel bin�ria de democracia,
## utilize a vari�vel dem_score14 para avaliar se existe uma associa��o
## entre regime pol�tico e desenvolvimento econ�mico. Represente
## a associa��o graficamente, fa�a o teste estat�stico e explica sua
## conclus�o

cor.test(banco$dem_score14, banco$gdppcap08)

ggplot(banco, aes(dem_score14, gdppcap08)) +
  theme_minimal() +
  geom_point(alpha = 0.8)



O valor 0 n�o est� presente no intervalo de confian�a da correla��o, isso significaria que h� signific�ncia estat�stica 
O valor da correla��o entre as vari�veis � de 0.505, isso seria um valor razo�vel para a correla��o entre as vari�veis
O valor do p-valor � bastante baixo, refor�ando a ideia de correla��o entre as vari�veis

## Teste a associa��o entre renda perca capta e religiao (com a vari�vel
## muslim) e represente graficamente. Qual � sua conclus�o? 

banco %>%
  group_by(muslim) %>%
  summarise(mean(gdppcap08, na.rm = TRUE),
            median(gdppcap08, na.rm = TRUE),
            sd(gdppcap08, na.rm = TRUE),
            n = n())

t.test(gdppcap08 ~ muslim, data = banco)

ggplot(banco, aes(muslim, gdppcap08)) +
  theme_classic() +
  geom_boxplot()

ggplot(banco, aes(muslim, gdppcap08)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) +
  theme_classic()


O valor do p-valor foi bem baixo, refor�ando a ideia de que h� signific�ncia est�tistica
O intervalo de confian�a n�o t�m o valor 0, refor�ando a ideia de que h� signific�ncia est�tistica
A m�dia dos grupos mostra que a densidade dos pa�ses mul�umanos se concentra mais no quintis de baixo pib per capita,
Enquanto que os pa�ses n�o-mul�umanos est�o em outros quintis de renda

## Comparando suas conclus�es anteriores, � poss�vel afirmar qual
## das duas vari�veis possui maior impacto no desenvolvimento economico?
## Por que? 

De acordo com os valores do p-valor e do intervalo de confian�a, ao meu ver, aparenta que um sistema pol�tico influ�ncia
mais no desempenho econ�mico do que a religi�o. Os valores do sistema pol�tico foram mais relevantes estatisticamente do que
os valores da religi�o. Tamb�m temos que destacar que alguns pa�ses mul�umanos n�o s�o democr�ticos e que alguns pa�ses 
democr�ticos s�o majoritariamente crist�os. Isso poderia ser um grau a ser melhor analisado.


##########################################################################

## Exerc�cio te�rico
## Levando em considera��o as vari�veis de seu trabalho final,
## qual dos 3 testes estat�sticos utilizados seria adequado utilizar?

Como irei utilizar vari�veis continuas que medem desenvolvimento (PIB per capita e IDH) e utilizarei o Ocean Health Index, 
que utiliza uma variedade de goals e subgoals de natureza distintas, mas sua pontua��o global vai de 0 a 100, acredito que utilizar
teste de duas vari�veis cont�nuas (teste de correla��o) seria o mais adequado de utilizar
