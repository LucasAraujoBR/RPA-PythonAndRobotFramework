*** Settings ***
Documentation   teste de resultado APIs.
Library     RPA.Browser.Selenium
Library     RequestsLibrary
Library     Collections
Library    RPA.JSON

*** Variables ***
${HOST}         ********
${APP_KEY}      ********
${APP_SECRET}   ********


*** Keywords ***
testando
    Create Session      dadosImuneWEB     ${HOST}
    ${RESPOSTA}=        Get Request     dadosImuneWEB     usuario=${APP_KEY}&token=${APP_SECRET}            
    Log                 Resposta: ${RESPOSTA.json()}
    Set Global Variable    ${RESPOSTA}

*** Tasks ***
Minimal task
    testando
