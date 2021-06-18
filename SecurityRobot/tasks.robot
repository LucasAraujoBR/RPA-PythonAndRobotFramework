*** Settings ***
Documentation   Robô de segurança Imune Kids.
Library      RPA.Browser.Selenium
Library    RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587
Library    DateTime
*** Variables ***
${URL}    https://www.imunekids.com.br/
${USERNAME}       ********
${PASSWORD}       ********
${RECIPIENT}      ********      #Para onde enviar
#tech.imunekids@gmail.com
*** keyword ***
Enviar de email
    [Arguments]    ${URL}    #Recebe um argumento
    ${DATA}    Get Current Date    #Data atual
    ${CONVERTIDADATA}    Convert Date    ${DATA}    result_format=%d.%m.%Y    #Converte no padrão brasileiro
    Authorize Smtp    account=${USERNAME}    password=${PASSWORD}
    Authorize Imap    account=${USERNAME}    password=${PASSWORD}
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Relatório do Teste de Segurança ${CONVERTIDADATA} do site ${URL}
    ...    body=${Relatorio1}\n\n${Relatorio2}\n\n${Relatorio3}
    ...    attachments=output/Relatorio1.png

*** Keywords ***
Executar teste
    [Arguments]    ${URL}    #Recebe um argumento
    Open Chrome Browser    https://www.ssllabs.com/ssltest/        #abrir URL no browser
    Maximize Browser Window                                            #Maximiza tela 
    Sleep    2
    Input Text    //*[@id="main"]/div[1]/center/form/table/tbody/tr[1]/td[2]/input    ${URL}    #Inserir URL na ferramenta 
    Sleep  1
    Click Element    //*[@id="main"]/div[1]/center/form/table/tbody/tr[1]/td[3]/input        #Apertar Submit
    Sleep  90
    Click Element    //*[@id="expandcert1"]/span        #Expandir relatório
    Sleep  2
    ${Relatorio1}    Get Text    //*[@id="main"]/div[5]/div[2]    #Pegando texto do relatório 
    Set Global Variable    ${Relatorio1}    #Tornando a variável global
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[1]    ${OUTPUTDIR}/Relatorio1.png    #Print do relatório
    Sleep  2
    Click Element    //*[@id="expandchain2"]/span    #Expandir segundo relatório
    Sleep  1
    Click Element    //*[@id="expandcert2"]/span    #Expandir segundo relatório
    ${Relatorio2}    Get Text    //*[@id="main"]/div[5]/div[3]/div[2]
    Set Global Variable    ${Relatorio2}    #Tornando a variável global
    Sleep  2
    Click Element    //*[@id="expandsimulations"]/span    #Expandir terceiro relatório
    Sleep  1
    ${Relatorio3}    Get Text    //*[@id="main"]/div[5]/div[4]/div[2]
    Set Global Variable    ${Relatorio3}    #Tornando a variável global
    Sleep  2
    Close Browser    #Fechar browser


*** Tasks ***
Teste de Segurança    
    Executar teste    https://www.imunekids.com.br/    #Executa a keyword mandando esse site como argumento
    Enviar de email    https://www.imunekids.com.br/    #Executa a keyword mandando esse site como argumento
        
