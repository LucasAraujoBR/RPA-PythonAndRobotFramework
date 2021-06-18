*** Settings ***
Documentation   Omie cadastramento.
Library        RPA.Browser.Selenium
*** Variables ***
${URL}    https://app.omie.com.br/login/
${Login}    ******
${Senha}    ******
${nomeDoCliente}    ALINE DE ANDRADE HOLANDA
${NOME}    FULANO
${CPF/CNPJ}    845.845.845-98
${nomeAbreviado}   FU
${DDD}    81    
${TELEFONE}    1234-1234
${nomeDoContato}    CICRANO
${endereçoNumero}    159
${endereçoComplemento}    A
${CEP}     50030903 
${nomeASerPesquisado}   ALINE DE ANDRADE HOLANDA 
${TributaçãoDosServiços}    Exigível
${CodDeServiço}        1111111111111111
*** Keywords ***
Logar 
    Open Chrome Browser    ${URL}    
    Sleep   5
    Input Text    //*[@id="user_login"]    ${Login}
    Capture Page Screenshot
    Sleep  2
    Click Element    //*[@id="btn-continue"]
    Sleep  5
    Input Password    //*[@id="user_pass"]    ${Senha}
    Capture Page Screenshot
    Click Element    //*[@id="btn-login"]
    Sleep  20
    Go To    https://app.omie.com.br/gestao/imune-9wptr45/
    Sleep  10
    Click Element    //*[@id="tiles"]/li[3]
    Sleep  10

*** Keywords ***
Cadastrar Clientes
    Sleep  10
    Click Element    //*[@id="dialogContent-50534"]/div/a[2]
    Sleep  10
    Click Element    //div[1]/ul/a[2]    
    Sleep  5
    Click Element    //*[@id="dialogContent-50341"]/div/div[5]
    Sleep  5
    Input Text    //*[@id="d50515c4"]    ${CEP}
    Sleep  2
    Click Element    //*[@id="dialogContent-50515"]/div/button
    Sleep  5
    Input Text    //*[@id="d50113c9"]    ${NOME}
    Sleep  1
    Input Text    //*[@id="d50113c10"]    ${CPF/CNPJ}
    Sleep  1
    Input Text    //*[@id="d50113c19"]    ${nomeAbreviado}
    Sleep  1
    Input Text    //*[@id="d50113c20"]   ${DDD}    
    Sleep  1    
    Input Text    //*[@id="d50113c21"]    ${TELEFONE}
    Sleep  1
    Input Text    //*[@id="d50113c22"]    ${nomeDoContato}
    Sleep  1    
    Input Text    //*[@id="d50113c32"]    ${endereçoNumero}
    Sleep  1
    Input Text    //*[@id="d50113c38"]    ${endereçoComplemento}
    Sleep  5
    Capture Page Screenshot
    Click Element    //*[@id="dialog-50113"]/div[1]/button
    Sleep  5
    Click Element    //li/div/div[2]/button[1]
    Capture Page Screenshot
    Sleep  5
    Click Element    //*[@id="dialog-50113"]/div[1]/button

*** Keywords ***
Cadastrar ordens de serviço e faturas
    Sleep  20
    Click Element    //*[@id="dialogContent-50534"]/div/a[5]/span[2]/div
    Sleep  5
    Input Text    //*[@id="dialog-30002"]/div[2]/div[1]/input    ${nomeASerPesquisado} 
    Sleep  2
    Click Element    //*[@id="dialog-51613"]/div[1]/span
    Sleep  5
    Click Element    //*[@id="dialogContent-30002"]/div/div[1]/div[2]
    Sleep  5
    Input Text    //*[@id="d51613c11"]    ${nomeDoCliente}
    Sleep  5
    Input Text    //*[@id="d51613c75"]    ${TributaçãoDosServiços}
    Sleep  1
    Input Text    //*[@id="d51613c79"]    ${CodDeServiço}
    Sleep  2
    Click Element    //*[@id="navbar-collapse-51613"]/ul/li[4]/a
    Sleep  2
    Capture Page Screenshot
    Sleep    2
    Click Element    //*[@id="dialogToolbar-51613"]/a[11]/div[3]
    Sleep  2
    Click Element    //*[@id="noty_1116902119219140600"]/div[2]/button[1]
    Sleep  5
    Capture Page Screenshot
    Click Element    //*[@id="dialogToolbar-51613"]/a[10]/div[3]
    Sleep  2
    Click Element    //*[@id="noty_392086839153017800"]/div[2]/button[1]
    Sleep  4
    Close Browser
*** Tasks ***
Logar no OMIE
    Logar
Efetuar cadastro de clientes
    Cadastrar Clientes
Cadastrar ordem de serviço
    Cadastrar ordens de serviço e faturas