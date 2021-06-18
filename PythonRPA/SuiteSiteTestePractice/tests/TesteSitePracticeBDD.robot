*** Settings ***
Resource              ../resource/Resource.robot


### SETUP ele roda keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda keyword depois de uma suite ou um Teste

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Test Case ***
Cenário 01: Pesquisar produto existente
    dado que eu estou na página home do site
    quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca


Cenário 02: Pesquisar produto não existente
    dado que eu estou na página home do site
    quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

*** Keywords ***
