*** Settings ***
Documentation     Sending plain text email via Gmail.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${USERNAME}       
${PASSWORD}       
${RECIPIENT}         #destino do email

*** Tasks ***
Send test email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Titulo da mensagem
    ...    body=Corpo da mensagem