*** Settings ***
Documentation   Cadastramento no Onvio.
Library     RPA.Browser.Selenium
*** Variables ***
${URL}    https://onvio.com.br/login/#/?d=https:%2F%2Fonvio.com.br%2Fatendimento-client%2F%23%2Fservice-requesting%2Fpayroll-registration%2Femployee
${Login}    ******************
${Senha}    ******************
${IDEmpresa}    54
${NomeFuncionario}    Fulano da Silva
${CpfFuncionario}    789.456.258-00
${Cargo}        ESTAGIARIO
${Departamento}    GERAL
${CentroDeUso}    GERAL
${Categoria}    MENSALISTA
${DataDeAdmissão}    01/02/2021
${VinculoEmpregaticio}    APRENDIZ
${SituaçãoSeguroDesemprego}    Nenhum requerimento encontrado
${Salario}    600
${Jornada}    08:00 AS 13:00
${HoraMes}    220,00
${HoraSemana}    44,00
${HoraDia}    7,33
${CarteiraProf}    1111111
${Serie}    11111
${DataDeExpedição}    01/01/1990
${UF}    Paraíba
${PIS}    170.33259.50-4
${sexo}    1
${Filhos}      1
${QuantidadeFilhos}    1
${TipoDeEndereço}            Condomínio
${Endereço}    Loteamento Planalto Santa Rita
${Número}    18
${Complemento}    L
${Bairro}    Santa Rita
${CEP}    58000-000
${País}    Brasil
${Municipio}    Santa Rita
${Telefone1}    (83) 36125600
${Telefone2}    (83) 36125601
${DataDeNascimento}    01/01/1990
${PaísDaNacionalidade}    Brasil
${GrauDeInstrução}    Doutorado
${Raça}    Parda
${EstadoCivil}    Solteiro(a)
${NomeDoPai}    Cicrano da Silva 
${NomeDaMãe}    Maria José da Silva
${Identidade}    111111111111111
${OrgExp}    SDS
${TítuloEleitoral}    111111111111111
${ZonaEleitoral}    111
${SeçãoEleitoral}    1111
${NomeFilho}    Cicrano da Silva Neto
*** Keywords ***
Logar
    Open Chrome Browser    ${URL}
    Maximize Browser Window
    Sleep    4
    Input Text    //*[@id="trta1-auth"]/label[1]/span[2]/input    ${Login}
    Input Password    //*[@id="trta1-auth"]/label[2]/span[2]/input    ${Senha}
    Capture Page Screenshot
    Sleep  2
    Press Keys    //*[@id="trta1-auth"]/label[2]/span[2]/input    ENTER
    Sleep  4
    Click Element    //*[@id="trta1-mfs-later"]
    Sleep  2

*** Keywords ***
Cadastramento
    Sleep  4
    Click Element    //*[@id="mainView"]/atendimento-client-main/bm-main/main/ui-view/service-requesting-main/ui-view/service-requesting-payroll-registration-tab/div[2]/bmp-routable-tabset/div/div/ng-transclude/div/service-requesting-payroll-registration/div[1]/ul/li[1]/a
    Sleep  4
    Click Element    //*[@id="client"]/div[1]/input
    Input Text    //*[@id="client"]/div[1]/input    ${IDEmpresa} 
    Sleep  2
    Input Text    //*[@id="name"]    ${NomeFuncionario} 
    Input Text    //*[@id="cpf"]    ${CpfFuncionario}
    Sleep  1
    Click Element    //*[@id="job-position"]/div/input
    Input Text    //*[@id="job-position"]/div/input    ${Cargo}
    Sleep  1
    Click Element    //*[@id="departament"]/div/input
    Input Text    //*[@id="departament"]/div/input    ${Departamento}
    Sleep  1
    Click Element    //*[@id="cost-center"]/div/input
    Input Text    //*[@id="cost-center"]/div/input    ${CentroDeUso}
    Sleep  1
    Click Element    //*[@id="category"]/div/input
    Input Text    //*[@id="category"]/div/input    ${Categoria}
    Sleep  1
    Input Text    //*[@id="admission-date"]    ${DataDeAdmissão}
    Sleep  1
    Click Element    //*[@id="employment-relationship"]/div/input
    Input Text    //*[@id="employment-relationship"]/div/input    ${VinculoEmpregaticio}
    Sleep  1
    Click Element    //*[@id="unemployment-insurance-situation"]/div/input
    Input Text    //*[@id="unemployment-insurance-situation"]/div/input    ${SituaçãoSeguroDesemprego}
    Sleep  1
    Input Text    //*[@id="wage"]    ${Salario}
    Sleep  1
    Click Element    //*[@id="work-day"]/div/input
    Input Text    //*[@id="work-day"]/div/input    ${Jornada}
    Sleep  1
    Input Text    //*[@id="monthly-hours"]    ${HoraMes}
    Input Text    //*[@id="weekly-hours"]    ${HoraSemana}
    Input Text    //*[@id="daily-hours"]    ${HoraDia}
*** Keywords ***
Profissionais
    Sleep  4
    Click Element    //*[@id="detail"]/div/div/div[2]/div/div/div/div/ul/li[2]/a/uib-tab-heading
    Input Text    //*[@id="workpermit-number"]    ${CarteiraProf}
    Sleep  1
    Input Text    //*[@id="workpermit-serial"]    ${Serie}
    Sleep  1
    Input Text    //*[@id="workpermit-expedition-date"]    ${DataDeExpedição}
    Sleep  1
    Click Element    //*[@id="workpermit-state"]/div/input
    Input Text    //*[@id="workpermit-state"]/div/input    ${UF}
    Sleep  1
    Input Text    //*[@id="pis-number"]    ${PIS}

*** Keywords ***
Pessoais
    Click Element    //*[@id="detail"]/div/div/div[2]/div/div/div/div/ul/li[3]/a/uib-tab-heading
    Sleep  4
    Click Element    //*[@id="address-type"]/div/input
    Input Text    //*[@id="address-type"]/div/input    ${TipoDeEndereço}
    Sleep  1
    Input Text    //*[@id="address"]    ${Endereço}
    Sleep  1
    Input Text    //*[@id="address-number"]    ${Número}
    Sleep  1
    Input Text    //*[@id="additional-address"]    ${Complemento}
    Sleep  1
    Input Text    //*[@id="address-neighborhood"]    ${Bairro}
    Sleep  1
    Input Text    //*[@id="address-zip-code"]    ${CEP}
    Sleep  1
    Click Element    //*[@id="address-state"]/div/input
    Input Text    //*[@id="address-state"]/div/input    ${UF}
    Sleep  1
    Click Element    //*[@id="address-city"]/div[1]/input
    Input Text    //*[@id="address-city"]/div[1]/input    ${Municipio}
    Sleep  1
    Input Text    //*[@id="primary-phone"]    ${Telefone1}
    Sleep  1
    Click Element    //*[@id="detail"]/div/div/div[2]/div/div/div/div/div[2]/div[3]/service-requesting-payroll-registration-form-personal/div/ul/li[2]/a/uib-tab-heading
    Sleep  4
    Input Text    //*[@id="birthdate"]    ${DataDeNascimento}
    Sleep  1
    Click Element    //*[@id="country-of-origin"]/div/input
    Input Text    //*[@id="country-of-origin"]/div/input    ${PaísDaNacionalidade}
    Sleep  1
    Click Element    //*[@id="country"]/div/input
    Input Text    //*[@id="country"]/div/input    ${País}
    Sleep  2
    Click Element    //*[@id="state"]/div/input
    Input Text    //*[@id="state"]/div/input    ${UF}
    Sleep  2
    Click Element    //*[@id="birth-city"]/div/input 
    Input Text    //*[@id="birth-city"]/div/input    ${Municipio}
    Sleep  2
    Run Keyword If    ${sexo} == 1     Masculino
    Run Keyword If    ${sexo} == 0     Feminino
    Sleep  2
    Click Element    //*[@id="level-of-schooling"]/div/input
    Input Text    //*[@id="level-of-schooling"]/div/input    ${GrauDeInstrução}
    Sleep  1
    Click Element    //*[@id="race"]/div/input
    Input Text    //*[@id="race"]/div/input    ${Raça}
    Sleep  1
    Click Element    //*[@id="marital-status"]/div/input
    Input Text    //*[@id="marital-status"]/div/input    ${EstadoCivil}
    Sleep  1
    Input Password    //*[@id="father-name"]    ${NomeDoPai}
    Input Text    //*[@id="mother-name"]    ${NomeDaMãe}
    Sleep  1
    Click Element    //*[@id="detail"]/div/div/div[2]/div/div/div/div/div[2]/div[3]/service-requesting-payroll-registration-form-personal/div/ul/li[3]/a/uib-tab-heading
    Sleep  4
    Input Text    //*[@id="identity-card"]    ${Identidade}
    Sleep  1
    Input Text    //*[@id="issuing-agency"]    ${OrgExp}
    Sleep  1
    Click Element    //*[@id="document-state"]/div/input
    Input Text    //*[@id="document-state"]/div/input    ${UF}
    Sleep    2
    Input Text    //*[@id="electoral-card"]    ${TítuloEleitoral}
    Sleep  1
    Input Text    //*[@id="electoral-ward"]    ${ZonaEleitoral}
    Sleep  1
    Input Text    //*[@id="polling-station"]    ${SeçãoEleitoral}
    Sleep  1
    Capture Page Screenshot
    Run Keyword If    ${Filhos} > 0    Cadastrar Filhos
    Sleep  4
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Cadastrar Filhos
    Click Element    //*[@id="detail"]/div/div/div[2]/div/div/div/div/ul/li[4]/a/uib-tab-heading
    Sleep  4
    Input Text    //*[@id="dependent-name-0"]    ${NomeFilho}
    Click Element    //*[@id="ticket-dependent-add-button"]/span[2]
*** Keywords ***
Masculino
    Click Element    //*[@id="gender-male"]
*** Keywords ***
Feminino
    Click Element    //*[@id="gender-female"]
*** Tasks ***
Robô iniciado...
    Logar
    Cadastramento
    Profissionais
    Pessoais
