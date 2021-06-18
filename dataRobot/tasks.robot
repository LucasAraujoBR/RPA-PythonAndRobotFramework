# coding: utf-8
*** Settings ***
Documentation     Robô de dados dataSUS.
Library           RPA.JSON
Library           RPA.Browser.Selenium
Library           Collections
Library           DateTime
Library           RPA.HTTP
Library           String
Library           RPA.Excel.Files
Library      RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${URL}            http://sipni.datasus.gov.br/si-pni-web/faces/inicio.jsf
${login}          CIADAVACINA1234
${senha}          Ciavacina3255
${HOST}           http://ciadavacina.azurewebsites.net/
&{headers}=       app-id=servico-sipni
${parametros}     ********
${textando}    nothing
@{erros}     ErrorPacienteNoSistema.xlsx    ErrorAplicacoes.xlsx    response.json
${USERNAME}       contatesteti73br@gmail.com    #Email que vou usar para enviar
${PASSWORD}       conta123321                   #Senha do email
${RECIPIENT}      contatesteti73br@gmail.com      #Para onde enviar

*** Keywords ***
Execute GET
    ${DATA}    Get Current Date
    ${Dia}    Convert Date    ${DATA}    result_format=%Y-%m-%d
    Create Session    dados    ${HOST}    headers=${headers}
    ${resp} =    Get Request    dados    API.asmx/ExportSIPNIData?unidade=campinas&dataInicio=${Dia}&dataFim=${Dia}    #${Dia}
    ${jsonResponse}    To Json    ${resp.content}
    Save JSON to file    ${jsonResponse}    response.json

*** Keywords ***
Leitura do Json Pacientes
    [Arguments]    ${AUX}
    ${Pacientes}    Load JSON from file    response.json
    Convert JSON to String    ${Pacientes}
    ${IDPacientes}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].id
    Set Global Variable    ${IDPacientes}
    ${NOME}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].nome
    Set Global Variable    ${NOME}
    ${NASCIMENTO}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].nascimento
    Set Global Variable    ${NASCIMENTO}
    ${NOMEDAMAE}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].nomeMae
    Set Global Variable    ${NOMEDAMAE}
    ${CPF}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].cpf
    Set Global Variable    ${CPF}

*** Keywords ***
Leitura do Json Aplicações
    [Arguments]    ${AUX}    ${AUX2}
    ${Aplicações}    Load JSON from file    response.json
    ${IDAplicações}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].id
    Set Global Variable    ${IDAplicações}
    ${DataAprazamento}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].dataAprazamento
    Set Global Variable    ${DataAprazamento}
    ${GrupoAtendimento}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].grupoAtendimento
    Set Global Variable    ${GrupoAtendimento}
    ${Estrategia}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].estrategia
    Set Global Variable    ${Estrategia}
    ${Imunobiologico}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].imunobiologico
    Set Global Variable    ${Imunobiologico}
    ${Dose}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].dose
    Set Global Variable    ${Dose}
    ${Laboratorio}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].laboratorio
    Set Global Variable    ${Laboratorio}
    ${Lote}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].lote
    Set Global Variable    ${Lote}
    ${TotalAplicações}    Get value from JSON    ${Aplicações}    $.pacientes[${AUX}].aplicacoes[${AUX2}].total
    Set Global Variable    ${TotalAplicações}

*** Keywords ***
Enviar erros pelo email
    ${DATA}    Get Current Date        #Data atual
    ${CONVERTIDADATA}    Convert Date    ${DATA}    result_format=%d.%m.%Y    #Converte no padrão brasileiro
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=DataSUS SNPI relatório de erros ${CONVERTIDADATA}
    ...    body=Segue arquivos Excel com os erros, e o JSON com os pacientes. 
    ...    attachments=@{erros}    

*** Keywords ***
Logar
    Open Chrome Browser    ${URL}
    Maximize Browser Window
    Sleep    4
    Click Element    //td[1]/input
    Sleep    2
    Input Text    //td[1]/input    ${login}
    Input Password    //td[2]/input    ${senha}
    Sleep    5
    Press Keys    //td[2]/input    ENTER
    Sleep    5
    ${DATA}    Get Current Date
    ${Dia}    Convert Date    ${DATA}    result_format=%d
    ${integer}    Convert To Integer    ${Dia}
    ${diaLocator}    Convert To String    ${integer+3}
    Set Global Variable    ${diaLocator}

*** Keywords ***
cadastrar no sistema
    [Arguments]    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/registroVacina/pesquisarPacienteVacina.jsf
    Sleep    10
    Click Element    //td[3]/button    #//*[@id="pacienteForm:j_idt99"]
    Sleep    5
    Click Element    //*[@id="selectPaciente"]
    Sleep    5
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomePaciente"]    ${NOME}
    Sleep    2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomeMaePaciente"]    ${NOMEDAMAE}
    Sleep    2
    FOR  ${ContAux}  IN RANGE   0   1000
        Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:dataNascimento_input"]    ${NASCIMENTO}
        Sleep  2        
        Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomeMaePaciente"]
        ${Value}    Get Value    //*[@id="dialogPesquisarPacienteWSCadsusForm:dataNascimento_input"]
        Exit For Loop If    '${Value}' == '${NASCIMENTO}' 
    END
    Sleep  15
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:j_idt235"]
    Sleep    35
    ${textNome}    Get Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:dialogPesquisarPacienteWSCadsusListTable_data"]/tr[1]/td[3]
    Sleep  2
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:dialogPesquisarPacienteWSCadsusListTable_data"]/tr/td[1]/div/div[2]
    Sleep    2
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:j_idt265"]
    sleep    15
    Click Element    //*[@id="j_idt186_content"]/table/tbody/tr/td[2]/input    #Salvar
    Sleep  10
#    Click Element    //*[@id="j_idt186_content"]/table/tbody/tr/td[1]/input    #Voltar
    Sleep    2
    Capture Page Screenshot
    Sleep    2
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/registroVacina/pesquisarPacienteVacina.jsf
    Sleep  2
    Run Keyword if    '${textNome}' != '${NOME}'    Cadastrar erro no excel    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
*** Keywords ***
Cadastrar erro no excel
    [Arguments]    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
    Set Worksheet Value    ${AUX+2}    1    ${NOME}    #NOME
    Set Worksheet Value    ${AUX+2}    6     ${NOMEDAMAE}    #NOME Da Mãe
    Set Worksheet Value    ${AUX+2}    11    ${CPF}    #CPF
    Set Worksheet Value    ${AUX+2}    16    ${NASCIMENTO}    #Data de Nascimento
*** Keywords ***
Cadastrar erro no excel aplicações
    [Arguments]    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
    Set Worksheet Value    ${AUX+2}    1    ${NOME}    #NOME
    Set Worksheet Value    ${AUX+2}    6     ${NOMEDAMAE}    #NOME Da Mãe
    Set Worksheet Value    ${AUX+2}    11    ${CPF}    #CPF
    Set Worksheet Value    ${AUX+2}    16    ${NASCIMENTO}    #Data de Nascimento

*** Keywords ***
Loop de cadastro no sistema
    Create Workbook    ErrorPacienteNoSistema.xlsx
    Set Worksheet Value    1    1    Nome    #NOME
    Set Worksheet Value    1    6    Nome Da Mãe    #NOME Da Mãe
    Set Worksheet Value    1    11    CPF    #CPF
    Set Worksheet Value    1    16    Data de Nascimento    #Nascimento
    ${Pacientes}    Load JSON from file    response.json
    ${TOTAL}    Get value from JSON    ${Pacientes}    $.total
    Set Global Variable    ${TOTAL}
    FOR    ${AUX}    IN RANGE    0    ${TOTAL}
        Passando valores para leitura JSON Pacientes    ${AUX}
        Run Keyword And Ignore Error    cadastrar no sistema    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
        Exit For Loop If    ${AUX}==${TOTAL}
    END
    Save Workbook

*** Keywords ***
Pesquisa de pacientes
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/registroVacina/pesquisarPacienteVacina.jsf
    Sleep    10
    Click Element    //*[@id="pacienteForm:j_idt98"]/span
    Sleep    5
    Input Text    //*[@id="pacienteForm:nomePaciente"]    ${NOME}
    Sleep  2
#    Input Text    //*[@id="pacienteForm:nomeMaePaciente"]    ${NOMEDAMAE}
    Sleep    2
    FOR  ${cont}  IN RANGE   0   1000
        Input Text    //*[@id="pacienteForm:dataNascimento_input"]    ${NASCIMENTO}
        Sleep  2
        Click Element    //*[@id="pacienteForm:nomeMaePaciente"]
        Sleep  2    
        ${Value}    Get Value    //*[@id="pacienteForm:dataNascimento_input"]
        Exit For Loop If    '${Value}' == '${NASCIMENTO}'    
    END
#    Sleep  2
#    Input Text    //*[@id="pacienteForm:documento"]    ${CPF}
    Sleep  2
    Click Element    //*[@id="pacienteForm:uf_label"]
    Sleep    2
    Click Element    //*[@id="pacienteForm:uf_panel"]/div/ul/li[26]    #26 = SP
    Sleep    8
    Click Element    //*[@id="pacienteForm:j_idt97"]/span
    Capture Page Screenshot
    Sleep    5

*** Keywords ***
data primeira tabela
    [Arguments]    ${diaLocator}
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[1]/td[${diaLocator}]

*** Keywords ***
data segunda tabela
    [Arguments]    ${diaLocator}
    ${integer}    Convert To Integer    ${diaLocator}
    ${segundaDiaLocator}    Convert To String    ${integer-7}
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[2]/td[${segundaDiaLocator}]

*** Keywords ***
data terceira tabela
    [Arguments]    ${diaLocator}
    ${integer}    Convert To Integer    ${diaLocator}
    ${terceiroDiaLocator}    Convert To String    ${integer-14}
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[3]/td[${terceiroDiaLocator}]

*** Keywords ***
data quarta tabela
    [Arguments]    ${diaLocator}
    ${integer}    Convert To Integer    ${diaLocator}
    ${quartaDiaLocator}    Convert To String    ${integer-21}
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[4]/td[${quartaDiaLocator}]

*** Keywords ***
data quinta tabela
    [Arguments]    ${diaLocator}
    ${integer}    Convert To Integer    ${diaLocator}
    ${quintaDiaLocator}    Convert To String    ${integer-28}
    Click Element    //*[@id="ui-datepicker-div"]/table/tbody/tr[5]/td[${quintaDiaLocator}]

*** Keywords ***
terceira dose reforçada
    Click Element    //*[@id="tvVacina:doseAnterior_label"]
    Sleep    5
    Input Text    //*[@id="tvVacina:doseAnterior_filter"]    3    #Dose
    Sleep    5
    Press Keys    //*[@id="tvVacina:doseAnterior_filter"]    ENTER
    Sleep    5

*** Keywords ***
Cadastrar Laboratorio aleatorio
    Click Element    //*[@id="tvVacina:produtorAnterior_label"]
    Sleep    5
    Click Element    //*[@id="tvVacina:produtorAnterior_panel"]/div[2]/ul/li[2]    #Laboratório aleatório
    Sleep    5

*** Keywords ***
Cadastrar Aplicações
    [Arguments]    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}    ${diaLocator}
    ${ChecaData}    Get Text    //*[@id="pacienteForm:listaPacienteTable_data"]/tr[1]/td[8]
    Sleep  2
    Run Keyword If    '${ChecaData}'=='${NASCIMENTO}'    roda aplicações sem erro
    Sleep    10
    Click Element    //*[@id="tvVacina"]/ul/li[6]
    Sleep    4
#    Click Element    //*[@id="tvVacina:dataAplicacaoAnterior"]/button
    Sleep    2
    # locator data //*[@id="tvVacina:dataAplicacaoAnterior_input"]
    FOR  ${cont}  IN RANGE   0   1000
        Input Text    //*[@id="tvVacina:dataAplicacaoAnterior_input"]    ${diaLocator}
        Sleep  2    
        ${Value}    Get Value    //*[@id="tvVacina:dataAplicacaoAnterior_input"]
        Exit For Loop If    '${Value}' == '${NASCIMENTO}'    
    END
#    Run Keyword If    ${diaLocator}<=7    data primeira tabela    ${diaLocator}
#    ...    ELSE IF    ${diaLocator}<=14    data segunda tabela    ${diaLocator}
#    ...    ELSE IF    ${diaLocator}<=21    data terceira tabela    ${diaLocator}
#    ...    ELSE IF    ${diaLocator}<=28    data quarta tabela    ${diaLocator}
#    ...    ELSE    data quinta tabela    ${diaLocator}
    Sleep    2
    Click Element    //*[@id="tvVacina:estrategiaAnterior_label"]
    Sleep  2
    Input Text    //*[@id="tvVacina:estrategiaAnterior_filter"]    ${Estrategia}    #Estratégia
    Sleep  2
    Press Keys    //*[@id="tvVacina:estrategiaAnterior_filter"]    ENTER
    Sleep    5
    Run Keyword If    '${Imunobiologico}' == 'Gripe ad'    Outro Imunobiologico
    ...    ELSE    Imunobiologico padrão    
    Click Element    //*[@id="tvVacina:doseAnterior_label"]
    Sleep    5
    Input Text    //*[@id="tvVacina:doseAnterior_filter"]    ${Dose}    #Dose
    Sleep    5
    Press Keys    //*[@id="tvVacina:doseAnterior_filter"]    ENTER
    Sleep    5
    Run Keyword If    ${Dose} == 4    terceira dose reforçada
    Sleep    5
    Click Element    //*[@id="tvVacina:produtorAnterior_label"]
    Sleep    5
    Input Text    //*[@id="tvVacina:produtorAnterior_filter"]    ${Laboratorio}    #Laboratório
    Sleep    5
    Press Keys    //*[@id="tvVacina:produtorAnterior_filter"]    ENTER
    Sleep    5
#    ${textoFormatado}    Convert To String    ${Laboratorio}
#    ${result}    Should Be Equal As Strings    ${textoFormatado}    N\u00e3o Informado
#    Run Keyword If    ${result} == True    Cadastrar Laboratorio aleatorio
    Sleep    5
    Input Text    //*[@id="tvVacina:loteAnterior"]    ${Lote}    #Lote
    Sleep    5
    ${textando}    Get Text    //*[@id="tvVacina:j_idt734"]
    Set Global Variable    ${textando}
    Sleep  5 
    Click Element    //*[@id="tvVacina:j_idt763"]    #Adicionar
    Capture Page Screenshot
    Sleep    5
    Click Element    //*[@id="tvVacina:j_idt827_content"]/table/tbody/tr/td[2]/input    Salvar
    Sleep  10
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/registroVacina/pesquisarPacienteVacina.jsf
    Sleep    5

*** Keywords ***
Outro Imunobiologico
    Click Element    //*[@id="tvVacina:produtoAnterior_label"]
    Sleep    5
    Click Element    //*[@id="tvVacina:produtoAnterior_panel"]/div[2]/ul/li[35]    
    Sleep  15   
*** Keywords ***
Imunobiologico padrão
    Click Element    //*[@id="tvVacina:produtoAnterior_label"]
    Sleep    5
    Input Text    //*[@id="tvVacina:produtoAnterior_filter"]    ${Imunobiologico}    #Imunologico
    Sleep    5
    Press Keys    //*[@id="tvVacina:produtoAnterior_filter"]    ENTER
    Sleep    15     

*** Keywords ***
Passando valores para leitura JSON Pacientes
    [Arguments]    ${AUX}
    Leitura do Json Pacientes    ${AUX}

*** Keywords ***
Passando valores para leitura JSON Aplicações
    [Arguments]    ${AUX}    ${AUX2}
    Leitura do Json Aplicações    ${AUX}    ${AUX2}

*** Keywords ***
Loop da leitura e cadastro
    Create Workbook    ErrorAplicacoes.xlsx
    Set Worksheet Value    1    1    Nome    #NOME
    Set Worksheet Value    1    6    Nome Da Mãe    #NOME Da Mãe
    Set Worksheet Value    1    11    CPF    #CPF
    Set Worksheet Value    1    16    Data de Nascimento    #Nascimento
    ${Pacientes}    Load JSON from file    response.json
    ${TOTAL}    Get value from JSON    ${Pacientes}    $.total
    Set Global Variable    ${TOTAL}
    FOR    ${AUX}    IN RANGE    0    ${TOTAL}
        Passando valores para leitura JSON Pacientes    ${AUX}
        Pesquisa de pacientes
        Run Keyword And Ignore Error    Loop de aplicacoes    ${AUX}
        Exit For Loop If    ${AUX}==${TOTAL}
    END
    Log    Cadastro finalizado!
    Sleep    5
    Save Workbook
*** Keywords ***
Deslogar
    Mouse Over    //*[@id="j_idt38:j_idt39"]/ul/li[11]/a/span[1]
    Sleep    2
    Click Element    //*[@id="j_idt38:j_idt39"]/ul/li[11]/ul/li/a
    Sleep    5
    Capture Page Screenshot
    Sleep    2
    Close Browser

*** Keywords ***
Loop de aplicacoes
    [Arguments]    ${AUX}
    ${DATA}    Get Current Date
    ${Dia}    Convert Date    ${DATA}    result_format=%d/%m/%Y
    ${diaLocator}    Convert To String    ${Dia}
    Set Global Variable    ${diaLocator}
    ${Pacientes}    Load JSON from file    response.json
    ${TotalAplicações}    Get value from JSON    ${Pacientes}    $.pacientes[${AUX}].total
    FOR    ${AUX2}    IN RANGE    0    ${TotalAplicações}
        Passando valores para leitura JSON Aplicações    ${AUX}    ${AUX2}
        Run Keyword And Ignore Error    Cadastrar Aplicações    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX2}    ${diaLocator}
#        Run Keyword if    '${textando}' != '3942996 - COMPANHIA DA VACINA'    Cadastrar erro no excel aplicações    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX2}
        Exit For Loop If    ${AUX2}==${TotalAplicações}
    END
#    Run keyword    Cadastrar erro no excel aplicações    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
    Run Keyword if    '${textando}' != '3942996 - COMPANHIA DA VACINA'    Cadastrar erro no excel aplicações    ${NOME}    ${NOMEDAMAE}    ${CPF}    ${NASCIMENTO}    ${AUX}
*** Keywords ***
roda aplicações sem erro
    Sleep  5
    Click Element    //*[@id="pacienteForm:listaPacienteTable:0:j_idt132"]/img
*** Tasks ***
Logando
    Logar

Leitura Api
    Execute GET

Cadastro de pacientes no sistema dataSUS
    Loop de cadastro no sistema

Cadastrando
    Loop da leitura e cadastro

Deslogar do sipni
    Deslogar

Enviar pelo Email
    Enviar erros pelo email
