*** Settings ***
Documentation  Exemplos de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS

*** Variable ***
#SIMPLES
${GLOBAL_SIMPLES}    Vamos ver os tipos de variáveis no robot

#Tipo LISTAS
@{FRUTAS}          morango  banana  maça  uva  abacaxi

#tipo DICIONÁRIOS
&{PESSOA}         nome=Lucas Araújo     email=lucasaraujoti73@gmail.com     idade=22     sexo=masculino

*** Test Cases ***
Caso de Teste de exemplo 01
    Uma keyword qualquer 01

*** Keyword ***
Uma keyword qualquer 01
#SIMPLES
    log   ${GLOBAL_SIMPLES}
    #LISTAS
    Log    tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}
    #DICIONÁRIO
    log     nome: ${PESSOA.nome} e email: ${PESSOA.email}
