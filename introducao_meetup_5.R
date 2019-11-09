#operadores basicos R
#Limpar o console CTRL + l

#R é também uma calculadora
8+5
30-1
8*10-20
10/5
4^2

a <- 10
b <- 20
c <- a+b
c
d <- c-a
d
e <- a^2
f <- TRUE
g <- 1.2
h <- 1,2

#classe da variavel
class(f)
class(g)
class(a)
a


#criar vetores
#concatenar usar a função c()
vetor_c <- c(1,2,3,4,5,6,7,8,9,10) #concatenando valores de 1 a 10

#repetir usar a função rep()
vetor_rep_3 <- rep(3,10) #criando vetor que repete o valor 3 por 10 vezes
vetor_rep_Ladies <- rep('Ladies', 10) #vetor repete Ladies por 10 vezes

#sequencia usar a função seq
vetor_seq <- seq(1,10) #criando vetor que faz uma sequencia de 1 a 10
vetor_seq_1 <- seq(1,10,1) #criando vetor que faz uma sequencia de 1 a 10, de 1 em 1
vetor_seq_2 <- seq(2,22,2) #criando vetor que faz uma sequencia de 2 a 22, de 2 em 2

#sequencia só utilizar :
vetor <- 1:10 #criando vetor que faz uma sequencia de 1 a 10
vetor_seq_2[11] #localizando o valor em vetor_seq_tam_2 que está na posição 11
vetor_seq_2[-11] #imprimindo o vetor sem a posição 11
vetor_seq_2 <- vetor_seq_2[-11] #salvando o vetor sem a posição 11

class(vetor_rep_Ladies) #verificando a classe
class(vetor_c)
length(a)
length(vetor_rep_Ladies)

#procurando ajuda no R
help('is.character')
?is.character


#testando se os vetores criados são caracter
is.character(vetor_rep_Ladies)
is.character(vetor_c)
is.numeric(vetor_c)


#LIMPAR AS VARIAVEIS DE AMBIENTE

###################################################


#data frame
#vamos criar vetores
#cria vetor de data que inicia em 1/10/19 e segue por 31 dias
data <- seq( as.Date('2019-10-16'), by=1, len=14) 

#vetor que informa o dia do ciclo menstrual
dia_ciclo <- c(seq(26,27), seq(1,12))

#vetor que informa o periodo do ciclo
periodo <- c(rep('Pré Menstrual', 2), rep('Menstruando', 4), rep('Pré Ovulatória', 7),
             rep('Ovulatória', 1))

#vetor que informa qual qual o sentimento no dia do ciclo
sentimento <- c(rep('irritada', 2), 'reflexiva', 'feliz', 'radiante', 'feliz',
                rep('reflexiva', 2), rep('triste', 2), rep('feliz', 2), rep('radiante', 2))

#vetor que informa se teve colica ou não, caso teve colica é 1, se não teve colica é 0
colica <- c(0, rep(1, 5), rep(0, 8))

#vetor que informa a quantidade de absorventes descartaveis utiliados durante o ciclo
fluxo <- c(rep(0, 2), 2, 5, 3, 1, rep(0, 8))

#vetor que informa a quantidade em ML que o coletor menstrual coletou
fluxo_coletor <- c(rep(0,2), 10, 20, 16, 8, rep(0, 8))

#vetor que informa a temperatura do corpo
temperatura_basal <- c(36.3, 36.5, 37, 36.9, 36.9, 38.8,  rep(36.6,2), 
                       rep(36.4, 4), rep(36.3, 2))


#juntar todos os vetores criados em um data frame
df <- cbind.data.frame(data, dia_ciclo, periodo, sentimento, colica,
                       fluxo_coletor, fluxo, temperatura_basal)

#para olhar o data frame criado
View(df)

#para remover vetores, pois já estão todos no data frame
rm(colica, data, dia_ciclo, fluxo, fluxo_coletor, periodo, sentimento, temperatura_basal)

#para localizar e imprimir dados do dataframe
#base[linha, coluna]
df[10,4] #Imprime a linha 10 e na coluna 4 - sentimento
df[10,'sentimento'] #Imprime a linha 10 e na coluna 4 - sentimento

#soma os dias com colica no dataframe
sum(df[,'colica'])
#cria variavel com a soma os absorventes utilizados
abs <- sum(df[,'fluxo']) 

#instalar pacote
install.packages('stringr')
#chamar pacote instalado
library(stringr)
#Imprimi quantos absorventes foi utilizado no ciclo
str_c('Neste ciclo foram utilizados ', abs, ' absorventes descartáveis')

#resumo das variaveis do dataframe
summary(df)

#tabela de contingencia - relação de sentimento com o periodo no ciclo mestrual
table(df$periodo, df$sentimento)
#gráfico dos dias do ciclo e a temperatura corporal
plot(df$dia_ciclo, df$temperatura_basal)

#atalho para usar as variaveis do dataframe
#para não precisar toda fez que quiser utilizar uma variavel usar o $
attach(df)

#gráfico sem utilizar (nome do banco)$(nome da variavel)
#fica direto o nome da variavel
plot(dia_ciclo, temperatura_basal)

write.csv(df, 'Ciclo_Menstual.csv', row.names = FALSE)


