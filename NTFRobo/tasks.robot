*** Settings ***
Documentation   Gerador de notas fiscais IMUNE KIDS.
Library     RPA.Browser.Selenium
Library     Collections
Library    RPA.JSON
Library     RPA.HTTP
Library    String


*** Variables ***
${URL}       https://sispmjp.joaopessoa.pb.gov.br:8080/nfse/login.jsf
${Login}     ********
${Senha}     ********  
${HOST}         




*** Keywords   ***
Execute GET
    Create Session      dadosImuneWEB     ${HOST}
    ${resp} =  Get Request   dadosImuneWEB    ${HOST}
    ${jsonResponse}    To Json    ${resp.content}
    Save JSON to file    ${jsonResponse}    NTFdados.json

*** Keywords ***
Leitura do JSON
    [arguments]     ${AUX}    
    ${JSONNTF}    Load JSON from file    NTFdados.json 
    ${Nome}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].nome
    Set Global Variable    ${Nome}
    ${dataDaVenda}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].dataDaVenda
    Set Global Variable    ${dataDaVenda}
    ${vacina}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].vacina
    Set Global Variable    ${vacina}
    ${cpf}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].cpf
    Set Global Variable    ${cpf}
    ${numeroReciboImune}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].numeroReciboImune
    Set Global Variable    ${numeroReciboImune}
    ${Valores}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].Valores
    Set Global Variable    ${Valores}
    ${cep}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].cep
    Set Global Variable    ${cep}
    ${numero}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].numero
    Set Global Variable    ${numero}
    ${bairro}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].bairro
    Set Global Variable    ${bairro}
    ${logradouro}    Get value from JSON    ${JSONNTF}    $..notasFiscais[${AUX}].logradouro
    Set Global Variable    ${logradouro}
    ${DescriçãoServ}    Format String    Nota fiscal de serviços para ${Nome}\nVacinas:${vacina}\n\nValor total: R$${Valores}\n\nResponsável Técnica ANDREIA ROQUE DE S. CAVALCANTI, COREN/PB 135382-ENF
    Set Global Variable    ${DescriçãoServ}

*** Keywords ***
Redirecionar nova NTF
    Sleep  5
    Mouse Over    //*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/a/span[1]
    Sleep  2
    Click Element    //*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/ul/li[1]/a/span
    Sleep  5    

*** Keywords ***
Loop da leitura e cadastro
    ${JSONNTF}    Load JSON from file    NTFdados.json
    ${TOTAL}    Get value from JSON    ${JSONNTF}    $.totalNotas
    Set Global Variable    ${TOTAL}
    FOR  ${AUX}  IN RANGE  0    ${TOTAL}
        Leitura do JSON    ${AUX}
        Preencher dados básicos
        Preencher tomador
        Preencher serviços prestados
        Preencher RPS
        Preencher Valores
        Redirecionar nova NTF
    END 
    
    Log     Cadastro finalizado!

*** Keywords ***
Logar
    Open Chrome Browser    ${URL}
    Maximize Browser Window
    Sleep  2
    Input Text    //*[@id="j_username"]    ${Login}
    Input Password    //*[@id="j_password"]    ${Senha}
    Sleep  2
    Capture Page Screenshot
    Press Keys    //*[@id="j_password"]    ENTER
    Sleep  5
*** Keywords ***
Redirecionar NTF
    Sleep  5
    Click Element    //*[@id="formMensagens:commandButton_confirmar"]/span[2]
    Capture Page Screenshot
    Sleep  5
    Mouse Over    //*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/a/span[1]
    Sleep  2
    Capture Page Screenshot
    Click Element    //*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/ul/li[1]/a/span
    Sleep  5

*** Keywords ***  
Preencher dados básicos
    Sleep  5
    Input Text    //*[@id="form_emitir_nfse:calendar_competencia_input"]    ${dataDaVenda}
    Click Element    //*[@id="form_emitir_nfse:panel_dados_basicos"]
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:selectradio_retencao_iss"]/tbody/tr/td[3]/div
    Click Element    //*[@id="form_emitir_nfse:selectOneMenu_tipo_label"]
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:selectOneMenu_tipo_panel"]/div/ul/li[1]
    Sleep  2
    Capture Page Screenshot
    Click Element    //*[@id="form_emitir_nfse:commandButton_continuar"]/span[2]
    Sleep  2
*** Keywords ***
Preencher tomador
    Sleep  5
    Input Text    //*[@id="form_emitir_nfse:inputmask_cpf_cnpj"]    ${cpf}
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:commandbutton_buscar_cpfcnpj"]/span
    Sleep  5
#    Input Text    //*[@id="form_emitir_nfse:inputtext_nomeempresarial_nome"]    ${Nome}
#    Sleep  2
#    Input Text    //*[@id="form_emitir_nfse:sispmjp_endereco:inputmask_cep"]    ${cep}
#    Sleep  2
#    Click Element    //*[@id="form_emitir_nfse:sispmjp_endereco:commandButton_buscar"]    #Buscar CEP
#    Sleep  5
#    Input Text    //*[@id="form_emitir_nfse:sispmjp_endereco:inputtext_lagradouro"]    ${logradouro}
#    Sleep  2
    Input Text    //*[@id="form_emitir_nfse:sispmjp_endereco:inputmask_numero"]    ${numero}
#    Sleep  2
#    Input Text    //*[@id="form_emitir_nfse:sispmjp_endereco:inputtext_bairro"]    ${bairro}
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:commandButton_continuar"]/span[2]
    Sleep  2
*** Keywords ***
Preencher serviços prestados
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:selectOneMenu_lista_servico_label"]
    Click Element    //*[@id="form_emitir_nfse:selectOneMenu_lista_servico_panel"]/div/ul/li[2]
    Input Text    //*[@id="form_emitir_nfse:intputtextarea_descricao_detalhada"]    ${DescriçãoServ} 
    Capture Page Screenshot
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:commandButton_continuar_mensagem"]/span[2]
*** Keywords ***
Preencher RPS
    Sleep  4
    Input Text    //*[@id="form_emitir_nfse:inputtext_numero_rps"]    ${numeroReciboImune}
    Sleep  4
    Input Text    //*[@id="form_emitir_nfse:calendar_data_emissao_rps_input"]    ${dataDaVenda}
    Click Element    //*[@id="form_emitir_nfse:panel_rps"]
    Capture Page Screenshot
    Sleep  2
    Click Element    //*[@id="form_emitir_nfse:commandButton_continuar"]/span[2]
    Sleep  2
*** Keywords ***
Preencher Valores
    Sleep  5
    Input Text    //*[@id="form_emitir_nfse:intputmask_valor_servico"]    ${Valores}
    Capture Page Screenshot
    Sleep    5
#    Click Element    //*[@id="form_emitir_nfse:commandButton_emitir"]/span[2]
#    Sleep  2
#    Click Element    //*[@id="form_emitir_nfse:commandbutton_confirmdialog_sim"]/span
#    Sleep  6
#    Capture Element Screenshot    //*[@id="form_emitir_nfse"]/fieldset
#    Sleep  2
*** Keywords ***
Deslogar
    Sleep  2 
    Click Element    //*[@id="menu_topo"]/ul/li[6]/a
    Capture Page Screenshot
    Sleep  5
    Close Browser
*** Tasks ***
Logar na conta 
    Logar
    Redirecionar NTF
Cadastramento das notas fiscais
    Loop da leitura e cadastro
Deslogar da conta
    Deslogar
#Conentar imuneweb
#    Execute GET
#leitura teste
#    Leitura do JSON    0   