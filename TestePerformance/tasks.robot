*** Settings ***
Documentation   Teste de performance ImuneKids.
Library      RPA.Browser.Selenium
Library    DateTime
Library      RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** variable ***
${URL}    https://www.imunekids.com.br/
${USERNAME}       ********
${PASSWORD}       ********
${RECIPIENT}      ********    #Para onde enviar

@{Capturas}    output/RelatorioMobile.png    output/RelatorioDesktop.png        

*** keyword ***
Enviar email
    [Arguments]    ${URL}    #Recebe um argumento
    ${DATA}    Get Current Date    #Data atual
    ${CONVERTIDADATA}    Convert Date    ${DATA}    result_format=%d.%m.%Y    #Converte no padrão brasileiro
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Relatório do Teste de Performance ${CONVERTIDADATA} do site ${URL}
    ...    body=${Relatorio}\n\n${Relatorio2}
    ...    attachments=@{Capturas}

*** Keywords ***
Executar teste
    Open Chrome Browser      https://developers.google.com/speed/pagespeed/insights/    #Abrir browser na url
    Maximize Browser Window
    Input Text    //*[@id="page-speed-insights"]/div[1]/form/div/input    ${URL}    #Inserir URL na API
    Sleep  2
    Click Element    //*[@id="page-speed-insights"]/div[1]/form/div/div/div
    Sleep  90
    Capture Page Screenshot    ${OUTPUTDIR}/RelatorioMobile.png
    Sleep  2 
    Click Element    //*[@id="page-speed-insights"]/div[2]/div[3]/div[2]/div[1]/div[2]/div/div[2]/div[1]/div/details/summary/div
    Sleep  2
    ${Relatorio}    Get Text    //*[@id="page-speed-insights"]/div[2]/div[3]/div[2]/div[1]/div[2]/div/div[2]/div[1]/div
    Set Global Variable    ${Relatorio}        #Pegar texto do relatorio
    Sleep  2
    Click Element    //*[@id=":8"]/div/div
    Sleep  2
    Capture Element Screenshot      //*[@id="page-speed-insights"]/div[2]/div[3]/div[2]/div[2]/div[1]/div      ${OUTPUTDIR}/RelatorioDesktop.png
    Sleep  5 
    Click Element     //*[@id="page-speed-insights"]/div[2]/div[3]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div/details/summary/div
    Sleep  2
    ${Relatorio2}    Get Text    //*[@id="page-speed-insights"]/div[2]/div[3]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div
    Set Global Variable    ${Relatorio2}    #Pegar texto do relatorio
    Sleep  2
    Close Browser
    

*** Tasks ***
Teste de Performance
    Executar teste
    Enviar email    https://www.imunekids.com.br/
    
