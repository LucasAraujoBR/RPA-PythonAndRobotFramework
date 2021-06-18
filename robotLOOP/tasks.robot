*** Settings ***
Documentation   Template robot main suite.
Library         RPA.Browser.Selenium
Library         RPA.JSON
Library         String
Library        Collections
*** Variables ***
${AUX}    0
*** keyword ***
teste loop
    &{people}=    RPA.JSON.Convert string to JSON   {"People": [{"Name": "João"}, {"Name": "Jane"}]}
    @{names}=     RPA.JSON.Get values from JSON     ${people}   $.People[*].Name
    FOR  ${AUX}  IN  @{names}
        Log    $.People[${AUX}].Name  
    END   

*** Keywords ***
Convertendo Strings
    ${Pacientes}    Load JSON from file    dados.json
    ${NOME}    Get value from JSON      ${Pacientes}    $.pacientes[*].nome
    Log     ${NOME}
    ${STRING}    Convert To Number     ${NOME}
    ${STRINGDECODE}    Convert To String   ${STRING} 
    Log    ${STRINGDECODE}
*** Tasks ***
Minimal task
#    teste loop
    Convertendo Strings