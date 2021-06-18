*** Settings ***
Documentation   Robô de dados dataSUS.
Library     RPA.JSON
Library     RPA.Browser.Selenium



*** Variables ***
${URL}    http://sipni.datasus.gov.br/si-pni-web/faces/inicio.jsf
${login}      ********
${senha}      ********
${LocalizaçãoLoginHTML}        //td[1]/input    #//*[@id="j_idt35:usuario"]
                                
${LocalizaçãoSenhaHTML}        //td[2]/input    #//*[@id="j_idt35:senha"]
*** Keywords ***
Leitura do Json Pacientes
    ${Pacientes}    Load JSON from file    dados.json
    Convert JSON to String    ${Pacientes}
    ${IDPacientes}    Get value from JSON    ${Pacientes}    $.pacientes.id
    Set Global Variable    ${IDPacientes}
    ${NOME}    Get value from JSON    ${Pacientes}    $.pacientes.nome
    Set Global Variable      ${NOME}
    ${NASCIMENTO}    Get value from JSON    ${Pacientes}    $.pacientes.nascimento
    Set Global Variable    ${NASCIMENTO}
    ${NOMEDAMAE}    Get value from JSON    ${Pacientes}    $.pacientes.nomeMae
    Set Global Variable    ${NOMEDAMAE}
    ${CPF}    Get value from JSON    ${Pacientes}    $.pacientes.cpf
    Set Global Variable    ${CPF}
    ${TOTAL}    Get value from JSON    ${Pacientes}    $.pacientes.total
    Set Global Variable    ${TOTAL}

*** Keywords ***
Leitura do Json Aplicações
    ${Aplicações}    Load JSON from file    dados.json 
    ${IDAplicações}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.id
    Set Global Variable    ${IDAplicações}
    ${DataAprazamento}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.dataAprazamento
    Set Global Variable    ${DataAprazamento}
    ${GrupoAtendimento}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.grupoAtendimento
    Set Global Variable    ${GrupoAtendimento}
    ${Estrategia}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.estrategia
    Set Global Variable    ${Estrategia}
    ${Imunobiologico}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.imunobiologico
    Set Global Variable    ${Imunobiologico}
    ${Dose}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.dose
    Set Global Variable    ${Dose}
    ${Laboratorio}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.laboratorio
    Set Global Variable    ${Laboratorio}
    ${Lote}    Get value from JSON    ${Aplicações}    $.pacientes.aplicacoes.lote
    Set Global Variable    ${Lote}


*** Keywords ***
Logar
    Open Chrome Browser    ${URL}
    Maximize Browser Window
    Sleep  4
    Click Element    ${LocalizaçãoLoginHTML}
    Sleep  2
    Input Text         ${LocalizaçãoLoginHTML}      ${login}
    Input Password     ${LocalizaçãoSenhaHTML}        ${senha}
    Sleep    5
    Press Keys         ${LocalizaçãoSenhaHTML}           ENTER
    Sleep    5

*** Keywords ***
Pesquisa de pacientes
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/registroVacina/pesquisarPacienteVacina.jsf
    Input Text    //*[@id="pacienteForm:nomePaciente"]    ${NOME}
    Input Text    //*[@id="pacienteForm:nomeMaePaciente"]   ${NOMEDAMAE}
    Sleep  2
    Click Element    //*[@id="pacienteForm:uf_label"]
    Sleep    2
    Click Element    //*[@id="pacienteForm:uf_panel"]/div/ul/li[16]    #16 = PARAIBA
    Sleep  2
    Click Element    //*[@id="pacienteForm:j_idt97"]/span
    Sleep  4

*** Keywords ***
Cadastrar Aplicações
    Click Element    //*[@id="pacienteForm:listaPacienteTable:0:j_idt132"]/img
    Sleep  5
    Input Text        //*[@id="tvVacina:dataAplicacao_input"]        ${DataAprazamento}      #data
    Click Element    //*[@id="tvVacina:grupoAtendimento_label"]
    Sleep     5
    Click Element    //*[@id="tvVacina:grupoAtendimento"]/div[3]
    Input Text     //*[@id="tvVacina:grupoAtendimento_filter"]       ${GrupoAtendimento}    #Grupo de atendimento
    Press Keys      //*[@id="tvVacina:grupoAtendimento_filter"]          ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:estrategia"]/div[3]    
    Input Text     //*[@id="tvVacina:estrategia_filter"]     ${Estrategia}        #Estratégia 
    Press Keys      //*[@id="tvVacina:estrategia_filter"]           ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:produto"]/div[3]
    Input Text          //*[@id="tvVacina:produto_filter"]       ${Imunobiologico}     #Imunologico
    Press Keys      //*[@id="tvVacina:produto_filter"]          ENTER
    Sleep     5
    Click Element    //*[@id="tvVacina:dose"]/div[3]
    Input Text    //*[@id="tvVacina:dose_filter"]    ${Dose}    #Dose
    Press Keys      //*[@id="tvVacina:dose_filter"]          ENTER
    Sleep   5
    Click Element    //*[@id="tvVacina:produtor"]/div[3]
    Input Text      //*[@id="tvVacina:produtor_filter"]     ${Laboratorio}    #Laboratório
    Press Keys      //*[@id="tvVacina:produtor_filter"]          ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:lote"]/div[3]
    Input Text    //*[@id="tvVacina:lote_filter"]    ${Lote}        #Lote
    Press Keys      //*[@id="tvVacina:lote_filter"]          ENTER
    Capture Page Screenshot
    Sleep  5
    Close Browser
    
*** Tasks ***
Coleta de dados.
    Leitura do Json Pacientes
    Leitura do Json Aplicações
#    Logar
#    Pesquisa de pacientes
#    Cadastrar Aplicações