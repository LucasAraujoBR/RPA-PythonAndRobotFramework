*** Settings ***
Documentation   RD Station Marketing robot.
Library    RPA.Browser.Selenium
Library    BuiltIn

*** variable ***
${URL}    https://accounts.rdstation.com.br/?locale=pt-BR
${Login}    ********
${Senha}    ********
${IDADE}     1
${Email}    TesteInicial@gmail.com
${Calendario1}     Lucas
*** Keywords ***
teste
    Open Chrome Browser     ${URL} 
    Sleep  5
    Close Browser
*** keyword ***
Logar
    Open Chrome Browser        ${URL}
    Maximize Browser Window
    Sleep  5
    Input Text    //*[@id="email"]    ${Login}
    Input Password    //*[@id="password"]    ${Senha}
    Sleep  4
    Press Keys        //*[@id="password"]        ENTER
    Sleep  10
    Capture Page Screenshot
    
*** Keywords ***
redirecionar para automacao
    Go To    https://app.rdstation.com.br/automacao-de-marketing-beta
    Sleep  5
    Capture Page Screenshot
*** Keywords ***
Fez vacina com 1 ano e 5 meses   
    Click Element    //*[@id="rdsm-basic-analytics"]/main/div[2]/div/table/tbody/tr[3]/td[8]/div/button
    Sleep  2
    Click Element    //*[@id="rdsm-basic-analytics"]/main/div[2]/div/table/tbody/tr[3]/td[8]/div/ul/li[2]/a
    Sleep  2
    Click Element    //*[@id="node-9257d03a-0a98-45fa-8a30-156cde9a888a"]
    Sleep  2
    Click Element    //*[@id="content"]/div[1]/div/div/div[1]/span[2]/button
    Sleep  2
    Click Element    //*[@id="dialogExit"]/div/div/form/div[3]/a[2]
    Sleep  2
    Click Element    //*[@id="rdsm-basic-analytics"]/main/div[2]/div/table/tbody/tr[3]/td[8]/div/button
    Sleep  2
    Click Element    //*[@id="rdsm-basic-analytics"]/main/div[2]/div/table/tbody/tr[3]/td[8]/div/ul/li[4]/a
    Sleep  2
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Validar
    Run Keyword If    ${IDADE} <= 525     Fez vacina com 1 ano e 5 meses  
    
*** Tasks ***
RD Station Marketing RPA IMUNEKIDS
    Logar
    redirecionar para automacao
    Validar