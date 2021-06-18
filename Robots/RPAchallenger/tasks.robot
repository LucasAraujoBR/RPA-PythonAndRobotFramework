*** Settings ***
Documentation     Desafio de teste RPA
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP


*** Keywords ***
Obtenha a lista de pessoas do arquivo Excel
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${table}


*** Keywords ***
Preencha e envie o formulário
    [Arguments]    ${person}
    Input Text    css:input[ng-reflect-name="labelFirstName"]  ${person}[First Name]
    Input Text    css:input[ng-reflect-name="labelLastName"]  ${person}[Last Name]
    Input Text    css:input[ng-reflect-name="labelCompanyName"]  ${person}[Company Name]
    Input Text    css:input[ng-reflect-name="labelRole"]  ${person}[Role in Company]
    Input Text    css:input[ng-reflect-name="labelAddress"]  ${person}[Address]
    Input Text    css:input[ng-reflect-name="labelEmail"]  ${person}[Email]
    Input Text    css:input[ng-reflect-name="labelPhone"]  ${person}[Phone Number]
    Click Button    Submit


*** Tasks ***
Comece o desafio
    Open Available Browser    http://rpachallenge.com/
    Download  http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    overwrite=True
    Click Button    Start


*** Tasks ***
Preencha os formulários
    ${people}=    Obtenha a lista de pessoas do arquivo Excel
    FOR  ${person}  IN  @{people}
      Preencha e envie o formulário  ${person}
    END


*** Tasks ***
Colete os resultados
    Capture Element Screenshot    css:div.congratulations
    [Teardown]  Close All Browsers