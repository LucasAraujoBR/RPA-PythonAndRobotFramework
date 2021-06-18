*** Settings ***
Documentation     Sending email via Gmail with a file attachment.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${USERNAME}       login
${PASSWORD}       senha
${RECIPIENT}      destinatario

*** Tasks ***
Send test email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Cadastro de Pacientes RPA
    ...    body=Olá sou Lucas, estágiario de RPA da ImuneKids.\n segue o Link da automação de cadastro que estou desenvolvendo.\nLink: https://youtu.be/qHrmz5g7SXw
    ...    attachments=imnueKids.jpg