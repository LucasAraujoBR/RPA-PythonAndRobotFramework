*** Settings ***
Documentation   Extrato Banco do Brasil ImuneKids.
Library     RPA.Browser.Selenium

*** variable ***
${URL}    https://autoatendimento.bb.com.br/apf-apj-acesso/?tipoCliente=empresa&pk_vid=d17ec64343996d3016154810534febe0#/transacao/acesso-apj/0?tipoCliente=empresa&pk_vid=d17ec64343996d3016154810534febe0
${Login}    ********
${Senha}    ********
${AGENCIA}    ********
${CONTACORRENTE}    ********

*** Keywords ***
Logar
    RPA.Browser.Selenium.Open Chrome Browser    ${URL}
    RPA.Browser.Selenium.Maximize Browser Window
    Sleep  5
    RPA.Browser.Selenium.CLick Button         //*[@id="ng-view"]/login-box/bb-container-botao[1]/button
    Sleep  5
    RPA.Browser.Selenium.Input Text    //*[@id="identificacaoUsuario"]    ${Login}
    Sleep  2
    RPA.Browser.Selenium.Click Element    //*[@id="ng-view"]/login-box/form/bb-container-campo[2]/md-switch
    Sleep  2
    RPA.Browser.Selenium.Click Element    //*[@id="botaoEnviar"]
    Sleep  5
    RPA.Browser.Selenium.Input Password    //*[@id="senhaUsuario"]    ${Senha}
    Sleep  2
    RPA.Browser.Selenium.Click Button    //*[@id="botaoEnviar"]
    
*** Keywords ***
gerar extrato bb
    Sleep   40
    RPA.Browser.Selenium.Go To    https://autoatendimento.bb.com.br/apf-apj-autoatendimento/index.html#/template/~2Fconsultas~2F009-2.bb
    Sleep  35
    ${elementAgencia}    Get WebElement    //*[@id="dependenciaOrigem"]
    Click Element    ${elementAgencia}
#    RPA.Browser.Selenium.Input Text    //*[@id="dependenciaOrigem"]    ${AGENCIA}  
#    Sleep  2
#    RPA.Browser.Selenium.Input Text    //*[@id="numeroContratoOrigem"]    ${CONTACORRENTE}  
#    Sleep  2
#    RPA.Browser.Selenium.Input Password    //*[@id="senhaConta"]    ${Senha}
    RPA.Browser.Selenium.Capture Page Screenshot
    Sleep  2
#    RPA.Browser.Selenium.Click Element    //*[@id="botao.acao.ok"]
    Sleep  5

*** Keywords ***
Deslogar
    Sleep  4    
    RPA.Browser.Selenium.Click Element    //div[5]/div[3]/div
    RPA.Browser.Selenium.Capture Page Screenshot
    Sleep  5
    RPA.Browser.Selenium.Close Browser

*** Tasks ***
Logar na conta
    Logar
Gerar extrato
    gerar extrato bb
#Deslogar da conta
#   Deslogar
