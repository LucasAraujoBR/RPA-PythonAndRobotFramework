*** Settings ***
Documentation     Sending email via Gmail with multiple file attachments.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${USERNAME}       
${PASSWORD}       
${RECIPIENT}      
@{ATTACHMENTS}    rpa.jpg    rpa.png    Saude.png    vacinacao.jpg    download.jpg

*** Tasks ***
Send test email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=ImuneKids
    ...    body=Esse email trás diversos anexos
    ...    attachments=@{ATTACHMENTS}