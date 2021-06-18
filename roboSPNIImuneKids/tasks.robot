*** Settings ***
Documentation   Robo parcial de cadastro de paciente
Library    RPA.Browser
Library    OperatingSystem


*** Variables ***
${URL}        http://sipni.datasus.gov.br/si-pni-web/faces/inicio.jsf
${login}      ********
${senha}      ********
${paciente}    GEICIANFRAN DA SILVA ROQUE
${UF}        18
${paciente2}    joão da silva
${Data}        25/02/2021
${Imunologico}    Dupla Viral - SR
${Municipio}        Recife
${CartãoSUS}        700500710394055
${NomeSocial}        
${NomeDaMãe}        FRANCISCA ANALIA DA SILVA LIMA
${NomeDoPai}        Francisco da Silva
${DataNascimento}        26/05/1989
${UFCADASTRO}        PARAIBA
${MunicipioDeNascimento}    POMBAL
${TipoDeDocumento}    2
${CPF}        845.524.456-00
${NomeDaMãePesquisa}        MARIA DA PENHA
${DataNascimentoPesquisa}    17/10/1953
${GrupoDeAtendimento}     População Geral
${Estratégia}    Bloqueio
${Dose}            Dose
${Laboratório}    NI
${Lote}
${ViaDeADM}        Endovenosa
${LocaDeAplicação}        Glúteo
${Vacinador}        KAROLINY ALVES PEREIRA
${CartãoSusPesquisa}
${Documento}



*** Keywords ***
Logar na conta
    Open Chrome Browser    ${URL}
    Maximize Browser Window
    Input Text         //*[@id="j_idt22:usuario"]      ${login}
    Input Password     //*[@id="j_idt22:senha"]        ${senha}
    Sleep    5
    Press Keys             //*[@id="j_idt22:senha"]           ENTER
    Sleep    5

    
*** Keywords ***
validar paciente
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/paciente/listarPaciente.jsf
    Sleep    2
    Input Text    //*[@id="pacienteForm:nomePaciente"]    ${paciente}    #Coloca o nome
    Click Element    //*[@id="pacienteForm:uf"]/div[3]      #Clica no formulário UF
    Sleep     2
    Click Element    //*[@id="pacienteForm:uf_panel"]/div/ul/li[${UF}]     #nessa pagina não tinha barra de pesquisa, usei uma variavel contenod 18 que corresponde a PERNAMBUCO
    Sleep     5
    Click Element    //*[@id="pacienteForm:municipio"]/div[3]
    Sleep     5
    Input Text    //*[@id="pacienteForm:municipio_filter"]        ${Municipio}    #Escolhe o municipio
    Press Keys             //*[@id="pacienteForm:municipio_filter"]          ENTER
    Sleep    5
    Click Element    //*[@id="pacienteForm:j_idt97"]        #Pesquisar
    Sleep      10
    ${Situação}=     Get Text        //*[@id="pacienteForm:listaPacienteTable_data"]    #Pega texto 
    Screenshot
    Sleep    2
    Click Element    //*[@id="pacienteForm:j_idt98"]    #Limpar
    Sleep     10 

*** Keywords ***
Cadastrar paciente
    Click Element     //*[@id="pacienteForm:j_idt99"]
    Sleep     5
    Click Element    //*[@id="j_idt66"]
    Sleep     10
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:numeroCartao"]    ${CartãoSUS}     #Cartão SUS
    Sleep     2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomePaciente"]        ${paciente}
    Sleep     2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomeSocial"]    ${NomeSocial}   #Nome social
    Sleep     2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomeMaePaciente"]    ${NomeDaMãe}      #Nome da mãe
    Sleep    2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:nomePaiPaciente"]    ${NomeDoPai}     #NOme do pai
    Sleep     2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:dataNascimento_input"]     ${DataNascimento}        #Data de Nascismento
    Sleep     2
    Click Element     //*[@id="dialogPesquisarPacienteWSCadsusForm:uf"]/div[3]        #Clicar no botção de formulario UF
    Sleep     2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:uf_filter"]     ${UFCADASTRO}       #Coloca o estado
    Press Keys             //*[@id="dialogPesquisarPacienteWSCadsusForm:uf_filter"]           ENTER
    Sleep    5
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:municipio"]/div[3]     #Clica no botão de formulário do Municipio
    Sleep    2
    Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:municipio_filter"]     ${MunicipioDeNascimento}    #INsere o municipio de nascimento
    Press Keys      //*[@id="dialogPesquisarPacienteWSCadsusForm:municipio_filter"]           ENTER
    Sleep    5
    #Comandos prontos para inserir documentação na parte cadastral
#    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:tipoDocumento"]/div[3]      #Clica no formulário tipo de documento
#    Sleep    2
#   Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:tipoDocumento_panel"]/div/ul/li[${TipoDeDocumento}]     #Escolhe o documento
#   Sleep    5
#   Input Text    //*[@id="dialogPesquisarPacienteWSCadsusForm:documento"]    ${CPF}        #Insere o CPF
#    Sleep   2
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:j_idt235"]    #clica em pesquisar
    Sleep     5
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:dialogPesquisarPacienteWSCadsusListTable_data"]/tr/td[1]/div/div[2]  #Seleciona o paciente
    Sleep     5
    Click Element    //*[@id="dialogPesquisarPacienteWSCadsusForm:j_idt265"]     #Clica em Selecionar
    Sleep    5
    Screenshot
    Sleep     2
    Close Browser
    
*** Keywords ***
Pesquisar paciente e Cadastrar vacina
    Go To    http://sipni.datasus.gov.br/si-pni-web/faces/paciente/listarPaciente.jsf
    Sleep    2
    Input Text    //*[@id="pacienteForm:nomePaciente"]    ${paciente2}        #Nome do paciente
    Sleep   1
    Input Text    //*[@id="pacienteForm:nomeMaePaciente"]    ${NomeDaMãePesquisa}    #Nome da mãe
    Sleep  1
    Input Text    //*[@id="pacienteForm:nomeSocial"]    ${NomeSocial}        #Nome social
    Sleep  1
    Input Text    //*[@id="pacienteForm:dataNascimento_input"]    ${DataNascimentoPesquisa}     #Data de nascimento
    Sleep  5
#    Input Text     //*[@id="pacienteForm:numeroCartao"]     ${CartãoSusPesquisa}    #Cartão SUS
#    Sleep  1
#    Input Text     //*[@id="pacienteForm:documento"]     ${Documento}            #Documento
#    Sleep  1
    Click Element    //*[@id="pacienteForm:uf"]/div[3]
    Sleep     5
    Click Element    //*[@id="pacienteForm:uf_panel"]/div/ul/li[${UF}]    #${UF} = 18 = PERNAMBUCO
    Sleep     5
    Click Element    //*[@id="pacienteForm:j_idt97"]
    Sleep     10
    Click Element    //*[@id="pacienteForm:listaPacienteTable:0:j_idt132"]/img
    Sleep     5
    Input Text        //*[@id="tvVacina:dataAplicacao_input"]        ${Data}      #data
    Click Element    //*[@id="tvVacina:grupoAtendimento_label"]
    Sleep     5
    Click Element    //*[@id="tvVacina:grupoAtendimento"]/div[3]
    Input Text     //*[@id="tvVacina:grupoAtendimento_filter"]       ${GrupoDeAtendimento}    #Grupo de atendimento
    Press Keys      //*[@id="tvVacina:grupoAtendimento_filter"]          ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:estrategia"]/div[3]    
    Input Text     //*[@id="tvVacina:estrategia_filter"]     ${Estratégia}        #Estratégia 
    Press Keys      //*[@id="tvVacina:estrategia_filter"]           ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:produto"]/div[3]
    Input Text          //*[@id="tvVacina:produto_filter"]       ${Imunologico}     #Imunologico
    Press Keys      //*[@id="tvVacina:produto_filter"]          ENTER
    Sleep     5
    Click Element    //*[@id="tvVacina:dose"]/div[3]
    Input Text    //*[@id="tvVacina:dose_filter"]    ${Dose}    #Dose
    Press Keys      //*[@id="tvVacina:dose_filter"]          ENTER
    Sleep   5
    Click Element    //*[@id="tvVacina:produtor"]/div[3]
    Input Text      //*[@id="tvVacina:produtor_filter"]     ${Laboratório}    #Laboratório
    Press Keys      //*[@id="tvVacina:produtor_filter"]          ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:lote"]/div[3]
    Input Text    //*[@id="tvVacina:lote_filter"]    ${Lote}        #Lote
    Press Keys      //*[@id="tvVacina:lote_filter"]          ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:viaAdministracao"]/div[3]
    Input Text        //*[@id="tvVacina:viaAdministracao_filter"]        ${ViaDeADM}     #Via de administração
    Press Keys      //*[@id="tvVacina:viaAdministracao_filter"]         ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:localAplicacao"]/div[3]
    Input Text        //*[@id="tvVacina:localAplicacao_filter"]    ${LocaDeAplicação}        #Local de Aplicação
    Press Keys      //*[@id="tvVacina:localAplicacao_filter"]         ENTER
    Sleep  5
    Click Element    //*[@id="tvVacina:vacinador"]/div[3]
    Input Text    //*[@id="tvVacina:vacinador_filter"]    ${Vacinador}        #Vacinador
    Press Keys      //*[@id="tvVacina:vacinador_filter"]         ENTER
    Sleep  5
#   Click Element    //*[@id="tvVacina:j_idt166"]            #Adicionar
    Screenshot
#    Click Button    //*[@id="tvVacina:j_idt165"]           #Limpar
    Sleep  2
    Close Browser


*** Tasks ***
#Teste Pesquisa
#    Logar na conta
#    Pesquisar paciente e Cadastrar vacina
#Teste cadastral
#   Logar na conta
#   validar paciente
#   Cadastrar paciente
#Teste Cadastrar vacina
#    Logar na conta
#    Pesquisar paciente e Cadastrar vacina
Teste Lote    
    Logar na conta
    