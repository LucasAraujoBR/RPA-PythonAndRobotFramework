*** Settings ***
Documentation     Sending email via Gmail with multiple file attachments,
...               and saving the attachments.
Library           RPA.Email.ImapSmtp
...               smtp_server=smtp.gmail.com
...               smtp_port=587
Library           RPA.Robocloud.Secrets

*** Variables ***
${USERNAME}       
${PASSWORD}       
${BODY}=          corpo
${RECIPIENT}=     
${SENDER}=        
${SUBJECT}=       titulo
@{ATTACHMENTS}=
...               ${CURDIR}${/}output${/}texto1.txt
...               ${CURDIR}${/}output${/}texto2.txt

*** Keywords ***
Send Email With Attachments
    #${secret}=     Get Secret    ${USERNAME}     
    #${secret2}=    Get Secret   ${PASSWORD}
    Authorize    account=${USERNAME}   password=${PASSWORD}
    Send Message
    ...    sender=${SENDER}
    ...    recipients=${RECIPIENT}
    ...    subject=${SUBJECT}
    ...    body=${BODY}
    ...    attachments=@{ATTACHMENTS}

*** Keywords ***
Get Messages Where Subject Contains
    [Arguments]    ${subject}
    @{emails}    List Messages    SUBJECT "${subject}"
    FOR    ${email}    IN    @{emails}
        Log    ${email}[Subject]
        Log    ${email}[From]
        Log    ${email}[Date]
        Log    ${email}[Received]
        Log    ${email}[Has-Attachments]
    END
    [Return]    @{emails}

*** Keywords ***
Download Attachments
    [Arguments]    @{emails}
    FOR    ${email}    IN    @{emails}
        Run Keyword If    ${email}[Has-Attachments] == True
        ...    Save Attachment    ${email}    target_folder=${CURDIR}${/}output    overwrite=True
    END

*** Tasks ***
Send email with attachments, list messages, and download the attachments
    Send Email With Attachments
    @{emails}=    Get Messages Where Subject Contains    ${SUBJECT}
    Download Attachments    @{emails}
