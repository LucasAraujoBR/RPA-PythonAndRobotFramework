*** Settings ***
Documentation     Sending email via Gmail with a file attachment.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${USERNAME}       usuario
${PASSWORD}       senha
${RECIPIENT}      recipiente

*** Tasks ***
Send test email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Cadastro de Pacientes RPA
    ...    body=Olá! sou Lucas
    ...    attachments=imnueKids.jpg