
#data frame
#vamos criar vetores
#cria vetor de data que inicia em 1/10/19 e segue por 31 dias
data <- seq(as.Date('2019-09-29'), by=1, len=31)

#vetor que informa o dia do ciclo menstrual
dia_ciclo <- c(seq(26,29), seq(1,27))

#vetor que informa o periodo do ciclo
periodo <- c(rep('Pré Menstrual', 4), rep('Menstruando', 6), rep('Pré Ovulatória', 8),
             rep('Ovulatória', 8), rep('Pré Menstrual', 5))

#vetor que informa qual qual o sentimento no dia do ciclo
sentimento <- c(rep('triste', 2), 'sensivel', 'deprimida', 'triste', 'animada', 'triste',
                rep('animada', 2), rep('feliz', 4), 'triste', 'extrovertida', 'reflexiva',
                'feliz', 'animada', 'reflexiva', rep('radiante', 3),
                rep('animada', 2), 'feliz', 'triste', rep('irritada', 3), rep('triste',2))

#vetor que informa se teve colica ou não, caso teve colica é 1, se não teve colica é 0
colica <- c(0, rep(1, 6), rep(0, 22), rep(1, 2))

#vetor que informa a quantidade de absorventes descartaveis utiliados durante o ciclo
fluxo_absorvente <- c(rep(0, 4), 2, 5, 4, 3, 3, 1, rep(0, 21))

#vetor que informa a quantidade em ML que o coletor menstrual coletou
fluxo_coletor_ml <- c(rep(0,4), 8, 20, 18, 12, 12, 6, rep(0, 21))

#vetor que informa a temperatura do corpo
temperatura_basal <- c(rep(36.3,3), rep(36.2,3), rep(36.3, 3), rep(36.2, 4), rep(36.1, 3),
                       rep(36.3, 2), 36.5, 37, 36.9, 36.9, rep(36.8, 2), rep(36.6, 2), rep(36.4, 4), 36.3)


#juntar todos os vetores criados em um data frame
df <- cbind.data.frame(data, dia_ciclo, periodo, sentimento, colica,
                       fluxo_coletor_ml, fluxo_absorvente, temperatura_basal)

#para olhar o data frame criado
View(df)

#para remover vetores, pois já estão todos no data frame
rm(colica, data, dia_ciclo, fluxo_absorvente, fluxo_coletor_ml, periodo, sentimento, temperatura_basal)

#para localizar e imprimir dados do dataframe
#base[linha, coluna]
df[10,4] #Imprime a linha 10 e na coluna 4 - sentimento
df[10,'sentimento'] #Imprime a linha 10 e na coluna 4 - sentimento

#soma os dias com colica no dataframe
sum(df[,'colica'])
sum(df$colica)
#cria variavel com a soma os absorventes utilizados
abs <- sum(df$fluxo_absorvente) 

#instalar pacote
#install.packages('stringr')
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
