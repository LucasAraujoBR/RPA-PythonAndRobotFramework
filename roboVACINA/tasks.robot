*** Settings ***
Documentation   Esse robo pega o calendario de vacinas e envia por email para as pessoas.
Library        RPA.Browser
Library        OperatingSystem
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587


*** Variables ***
${URL}    https://www.imunekids.com.br/calendario-vacinal
${USERNAME}       usuario
${PASSWORD}       senha
${RECIPIENT}      destinatario


*** Keywords ***
pegar calendario gestante
    Open Chrome Browser     ${URL} 
    Maximize Browser Window
    Sleep    10
    Click Button        //*[@id="foto-crianca"]/div[4]/button
    Sleep    10
    ${calendario}=         Get Text        //*[@id="div-testando"]/table
    Set Global Variable    ${calendario}
    Close Browser

*** Keywords ***
pegar calendario criança e adolescente
    Open Chrome Browser      ${URL}
    Maximize Browser Window
    Sleep    10
    Click Button        //*[@id="foto-crianca"]/div[1]/button
    Sleep    10
    ${calendario1}=         Get Text        //*[@id="div-testando"]
    Set Global Variable    ${calendario1}
    Close Browser
*** Keywords ***
pegar calendario idosos
    Open Chrome Browser      ${URL}
    Maximize Browser Window
    Sleep    10
    Click Button        //*[@id="foto-crianca"]/div[3]/button
    Sleep    10
    ${calendario2}=         Get Text        //*[@id="div-testando"]/table
    Set Global Variable    ${calendario2}
    Close Browser
*** Keywords ***
pegar calendario prematuros
    Open Chrome Browser      ${URL}
    Maximize Browser Window
    Sleep    10
    Click Button        //*[@id="foto-crianca"]/div[1]/button
    Sleep    10
    ${calendario3}=         Get Text        //*[@id="div-testando"]
    Set Global Variable    ${calendario3}
    Close Browser

*** Keywords ***
enviar pelo email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Calendário de Vacinação
    ...    body=--------Gestante---------------\n${calendario}\n\n--------Criança e Adolescente--\n${calendario1}\n\n--------Adulto e Idoso---------------\n${calendario2}\n\n--------Prematuro---------------\n${calendario3}
    ...    attachments=imnueKids.jpg
    

    
    


*** Tasks ***
ROBO01
    pegar calendario gestante
#    pegar calendario prematuros
#    pegar calendario criança e adolescente
#    pegar calendario idosos
#    enviar pelo email
