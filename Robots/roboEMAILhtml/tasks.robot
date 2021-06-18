*** Settings ***
Documentation     Sending email via Gmail with an inline image.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${USERNAME}       
${PASSWORD}       
${RECIPIENT}      

*** Tasks ***
Send test email
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=ImuneKids
    ...    html=True
    ...    images=download.jpg
    ...    body=<p>Enviada imagem no corpo HTML: <img src='download.jpg' alt='approved image'/></p>
