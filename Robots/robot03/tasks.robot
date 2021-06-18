*** Settings ***
Documentation     Esse robo salva textos da web em arquivos TXT.
Library           RPA.Browser
Library           RPA.FileSystem

*** Variables ***
${URL}=           https://www.pensador.com/textos/

*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}
    ${text}=    Get Text    //*[@id="MTYyODY"]
    Create File
    ...    ${CURDIR}${/}output${/}text.txt
    ...    ${text}
    ...    overwrite=True
    Screenshot
    ...    css:.img-fluid
    ...    ${CURDIR}${/}output${/}screenshot.png
    [Teardown]    Close Browser
    