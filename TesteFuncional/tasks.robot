*** Settings ***
Documentation       Teste funcional Imune Kids.
Library           RPA.Browser.Selenium
Library           RPA.Excel.Files
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587
Library           DateTime
*** Variables ***
${URL}    https://www.imunekids.com.br/
#https://imunego.imunekids.com.br
#https://www.imunekids.com.br/
${USERNAME}       ********    #Email que vou usar para enviar
${PASSWORD}       ********                   #Senha do email
${RECIPIENT}      ********      #Para onde enviar
#@{erros}    RelatorioFuncional.xlsx

*** Keywords ***
Relatório Excel
    Create Workbook    RelatorioFuncional.xlsx
    Set Worksheet Value    1    1    Teste    #Nome do teste
    Set Worksheet Value    1    10    Resultado    #Resultado do teste
*** Keywords ***
Salvar Relatório Excel
    Save Workbook

*** Keywords ***
Enviar relatório pelo email
    [Arguments]    ${URL}
    ${DATA}    Get Current Date        #Data atual
    ${CONVERTIDADATA}    Convert Date    ${DATA}    result_format=%d.%m.%Y    #Converte no padrão brasileiro
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Relatório do Teste Funcional ${CONVERTIDADATA} do site ${URL}    
    ...    body=Segue arquivo Excel com o relatório funcional do site ${URL}. 
    ...    attachments=RelatorioFuncional.xlsx 

*** Keywords ***
Cadastrar resultado no excel
    [Arguments]    ${NomeDoTeste}    ${Status}    ${AUX}
    Set Worksheet Value    ${AUX}    1    ${NomeDoTeste}    #Nome do teste
    Set Worksheet Value    ${AUX}    10     ${Status}        #Resultado do teste   OK(Passou)    Fail(Erro)
    
*** Keywords ***
BTM Home
    ${NomeDoTeste}    Convert To String    Teste BTM Home
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     2 
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="__next"]/div[1]/nav/div[1]
    Sleep  5
    ${TtitleHome}    Get Title
    Sleep  2
    Run Keyword IF    '${TtitleHome}'=='Clínica de Vacinas - Venha Conhecer a Imune Kids!'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  2
    Close Browser
*** Keywords ***
Botão Padrão Imune
    ${NomeDoTeste}    Convert To String    Teste BTM Padrão Imune(Vacina sem dor)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     3 
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[1]/p  #Vacina sem dor
    Sleep  8
    ${Ttitle}    Get Title
    Sleep  2
    Run Keyword IF    '${Ttitle}'=='Clínica de Vacinas - Vacinas Sem Dor: Método para diminuir a dor!'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Padrão Imune(Qualidade e proteção a saúde)
    ${AUX1}   Convert To Integer     4 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[2]/p    #Qualidade e proteção a saúde
    Sleep  5
    ${Ttitle}    Get Title    #Clínica de Vacinas - Política de Qualidade
    Sleep  2
    Run Keyword IF    '${Ttitle}'=='Clínica de Vacinas - Política de Qualidade'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Teste BTM Padrão Imune(Cadeia de Frio)
    ${AUX2}   Convert To Integer     5 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[3]/p    #Cadeia de Frio
    Sleep  5
    ${Ttitle}    Get Title    #Clínica de Vacinas - Cadeia de Frios das Vacinas
    Sleep  2
    Run Keyword IF    '${Ttitle}'=='Clínica de Vacinas - Cadeia de Frios das Vacinas'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2}  
    Sleep  5
    ${NomeDoTeste3}    Convert To String    Teste BTM Padrão Imune(Segurança das vacinas)
    ${AUX3}   Convert To Integer     6 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[4]/p    #Segurança das vacinas
    Sleep  5
    ${Ttitle}    Get Title    #Segurança de Vacinas- Dúvidas Frequentes
    Sleep  2
    Run Keyword IF    '${Ttitle}'=='Segurança de Vacinas- Dúvidas Frequentes'    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3}  
    Sleep  5
    Close Browser

*** Keywords ***
Botão vacinação
    Open Chrome Browser    ${URL}
    ${NomeDoTeste}    Convert To String    Teste BTM Vacinação(Calendário vacinal)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     7 
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[1]/p    #Calendário vacinal
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Calendário Vacinal: Criança ao Idoso
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Calendário Vacinal: Criança ao Idoso'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Vacinação(Avaliação da caderneta)
    ${AUX1}   Convert To Integer     8 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[2]/p    #Avaliação da caderneta
    Sleep  8
    ${Title}    Get Title       #NULL
    Sleep  2
    Run Keyword IF    '${Title}'==''    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Teste BTM Vacinação(Caderneta Vacinação)
    ${AUX2}   Convert To Integer     9 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[4]    #Caderneta Vacinação
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Caderneta Vacinação
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Caderneta Vacinação'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2}  
    Sleep  5
    ${NomeDoTeste3}    Convert To String    Teste BTM Vacinação(Clube de vacinas)
    ${AUX3}   Convert To Integer     10 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[3]/p    #Clube de vacinas
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Clube de Vacinas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Clube de Vacinas'    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3}  
    Sleep  5
    ${NomeDoTeste4}    Convert To String    Teste BTM Vacinação(Vacina Corporativa)
    ${AUX4}   Convert To Integer     11 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[5]/p    #Vacina Corporativa
    Sleep  2
    ${Title}    Get Title    #Clínica de Vacinas - Nossos serviços de imunização: Vacinas Corporativas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Nossos serviços de imunização: Vacinas Corporativas'    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status}   ${AUX4}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status2}   ${AUX4}  
    Sleep  5
    ${NomeDoTeste5}    Convert To String    Teste BTM Vacinação(Certificado internacional de vacinação)
    ${AUX5}   Convert To Integer     12 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[6]/p    #Certificado internacional de vacinação
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Certificado Internacional de Vacinação
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Certificado Internacional de Vacinação'    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status}   ${AUX5}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status2}   ${AUX5}  
    Sleep  5
    ${NomeDoTeste6}    Convert To String    Teste BTM Vacinação(Projeto escola imune)
    ${AUX6}   Convert To Integer     13 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[7]/p    #Projeto escola imune
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Projeto Escola Imunes
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Projeto Escola Imunes'    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status}   ${AUX6}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status2}   ${AUX6}  
    Sleep  5
    ${NomeDoTeste7}    Convert To String    Teste BTM Vacinação(Duvidas Frequentes)
    ${AUX7}   Convert To Integer     14   
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[8]/p    #Duvidas Frequentes
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Dúvidas Frequentes: Vacinas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Dúvidas Frequentes: Vacinas'    Cadastrar resultado no excel    ${NomeDoTeste7}    ${Status}   ${AUX7}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste7}    ${Status2}   ${AUX7}  
    Sleep  5
    ${NomeDoTeste8}    Convert To String    Teste BTM Vacinação(Vacinas)
    ${AUX8}   Convert To Integer     15 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[9]/p    #Vacinas
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - vacinas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - vacinas'    Cadastrar resultado no excel    ${NomeDoTeste8}    ${Status}   ${AUX8}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste8}    ${Status2}   ${AUX8}  
    Sleep  5
    ${NomeDoTeste9}    Convert To String    Teste BTM Vacinação(Doenças)
    ${AUX9}   Convert To Integer     16 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[10]/p    #Doenças
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Doenças preveníveis por vacinas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Doenças preveníveis por vacinas'    Cadastrar resultado no excel    ${NomeDoTeste9}    ${Status}   ${AUX9}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste9}    ${Status2}   ${AUX9}  
    Sleep  5
    Close Browser
*** Keywords ***
Botão Serviços
    Open Chrome Browser    ${URL}
    ${NomeDoTeste}    Convert To String    Teste BTM Serviços(Laserterapia)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     17
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/a    #Serviços
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/div/div/button[1]/p    #Laserterapia
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Laserterapia
    Sleep  2
    Run Keyword IF    '${Title}'==''    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Serviços(Aplicação de brinco)
    ${AUX1}   Convert To Integer     18
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/a    #Serviços
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/div/div/button[2]/p    #Aplicação de brinco
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Doenças preveníveis por vacinas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Aplicação de brinco'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5 
    Close Browser

*** Keywords ***
Botão Exames
    Open Chrome Browser    ${URL}
    ${NomeDoTeste}    Convert To String    Teste BTM Exames(teste do pezinho)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     19
    Sleep  5    
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/a    #Exames
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/div/div/button[1]/p    #teste do pezinho
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Teste do pezinho
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Teste do pezinho'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Exames(ANTI-RH)
    ${AUX1}   Convert To Integer     20
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/a    #Exames
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/div/div/button[2]/p    #ANTI-RH
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - ANTI - RH
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - ANTI - RH'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5 
    Close Browser

*** Keywords ***
Botão Cursos
    Open Chrome Browser    ${URL}
    ${NomeDoTeste}    Convert To String    Teste BTM Cursos(Ensino)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     21
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[1]/p    #Ensino
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Serviço Inovador: Ensino
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Serviço Inovador: Ensino'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Cursos(teste do pezinho)
    ${AUX1}   Convert To Integer     22 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[2]/p    #Pesquisa
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Serviço Inovador: Pesquisas
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Serviço Inovador: Pesquisas'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Teste BTM Cursos(Inovação)
    ${AUX2}   Convert To Integer     23  
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[3]/p    #Inovação
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Serviço Inovador: Inovação
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Serviço Inovador: Inovação'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2}  
    Sleep  5 
    Close Browser

*** Keywords ***
Botão Telessaúde
    ${NomeDoTeste}    Convert To String    Teste BTM Telessaúde(aleitamento materno)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     24
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[1]/p   #aleitamento materno
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Aleitamento Materno
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Aleitamento Materno'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Telessaúde(ADM medicamento)
    ${AUX1}   Convert To Integer     25
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[2]/p    #ADM medicamento
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Administração de Medicamentos
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Administração de Medicamentos'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1}  
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Teste BTM Telessaúde(Consultoria amamentação)
    ${AUX2}   Convert To Integer     26   
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[3]/p    #Consultoria amamentação
    Sleep  5
    ${Title}    Get Title    #NULL
    Sleep  2
    Run Keyword IF    '${Title}'==''    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2}  
    Sleep  5 
    ${NomeDoTeste3}    Convert To String    Teste BTM Telessaúde(Consultoria introdução alimentar)
    ${AUX3}   Convert To Integer     27   
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[4]/p    #Consultoria introdução alimentar
    Sleep  5
    ${Title}    Get Title    #NULL
    Sleep  2
    Run Keyword IF    '${Title}'==''    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3}  
    Sleep  5
    ${NomeDoTeste4}    Convert To String    Teste BTM Telessaúde(Tele-Enfermagem)
    ${AUX4}   Convert To Integer     28 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[5]/p    #Tele-Enfermagem
    Sleep  5
    ${Title}    Get Title    #NULL
    Sleep  2
    Run Keyword IF    '${Title}'==''    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status}   ${AUX4}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status2}   ${AUX4}  
    Sleep  5
    ${NomeDoTeste5}    Convert To String    Teste BTM Telessaúde(Retorno ao Trabalho)
    ${AUX5}   Convert To Integer     29 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[6]/p    #Retorno ao Trabalho
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Retorno ao trabalho
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Retorno ao trabalho'    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status}   ${AUX5}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status2}   ${AUX5}  
    Sleep  5
    ${NomeDoTeste6}    Convert To String    Teste BTM Telessaúde(Desmame gradual)
    ${AUX6}   Convert To Integer     30  
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Sleep  2
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[7]/p    #Desmame gradual
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Desmame gradual
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Desmame gradual'    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status}   ${AUX6}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status2}   ${AUX6}  
    Sleep  5  
    Close Browser

*** Keywords ***
Botão agendar vacina
    ${NomeDoTeste}    Convert To String    Teste BTM Agendar vacina
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     31
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="agenda-button"]    #BTM agendar vacina
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Agendar vacina
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Agendar vacina'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5  
    Close Browser

*** Keywords ***
Botão Loja online
    ${NomeDoTeste}    Convert To String    Teste BTM Loja online
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     32
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="loja-vacina"]    #BTM Loja online
    Sleep  5
    ${Title}    Get Title    #Clinica de Vacinas - Loja online
    Sleep  2
    Run Keyword IF    '${Title}'=='Clinica de Vacinas - Loja online'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX}  
    Sleep  5 
    Close Browser

*** Keywords ***
Munik
    ${NomeDoTeste}    Convert To String    Teste BTM Munik(COVID)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     33
    Open Chrome Browser    ${URL}
    Sleep  5 
    Click Element    //div[2]/div[1]/a   #COVID
    Sleep  15
    ${Title}    Get Title    #Clínica de Vacinas - Chatbot Covid19
    Sleep  2
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Chatbot Covid19'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX} 
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Munik(Aleitamento)
    ${AUX1}   Convert To Integer     34 
    Go To    ${URL}
    Sleep  5
    Click Element    //div[3]/div[2]/div[2]/a    #Aleitamento
    Sleep  15
    ${Title}    Get Title    #Clínica de Vacinas - Chatbot Aleitamento
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Chatbot Aleitamento'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1} 
    Sleep  5 
    ${NomeDoTeste2}    Convert To String    Teste BTM Munik(Primeiros Socorros)
    ${AUX2}   Convert To Integer     35     
    Go To    ${URL}
    Sleep  5
    Click Element    //div[2]/div[3]/a    #Primeiros Socorros
    Sleep  15
    ${Title}    Get Title    #Clínica de Vacinas - Chatbot Primeiros Socorros
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Chatbot Primeiros Socorros'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2} 
    Sleep  5
    ${NomeDoTeste3}    Convert To String    Teste BTM Munik(Sobre vacinas)
    ${AUX3}   Convert To Integer     36   
    Go To    ${URL}
    Click Element    //div[2]/div[4]/a    #Sobre vacinas
    Sleep  15
    ${Title}    Get Title    #Clínica de Vacinas - Sobre Vacinas
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Sobre Vacinas'    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3} 
    Sleep  5   
    Close Browser

*** Keywords ***
Dicas e informações sobre saúde
    ${NomeDoTeste}    Convert To String    Teste BTM Dicas e informações sobre saúde(Ebooks)
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    ${AUX}   Convert To Integer     37
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[1]/a    #Ebooks
    ${Title}    Get Title    #Clínica de Vacinas - Ebooks
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Ebooks'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX} 
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Teste BTM Dicas e informações sobre saúde(Informe&campanhas)
    ${AUX1}   Convert To Integer     38    
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[2]/a    #Informe&campanhas
    ${Title}    Get Title    #Clínica de Vacinas - Venha Conhecer a Imune Kids!
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Venha Conhecer a Imune Kids!'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1} 
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Teste BTM Dicas e informações sobre saúde(Publicações online)
    ${AUX2}   Convert To Integer     39   
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[3]/a    #Publicações online
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Publicações online
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Publicações online'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2} 
    Sleep  5    
    Close Browser

*** Keywords ***
Midias Sociais
    ${NomeDoTeste}    Convert To String    Midias Sociais(LINKEDIN)
    ${AUX}   Convert To Integer     40
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[1]   #LINKEDIN
    Sleep  5
    ${Title}    Get Title    #Imune Kids | LinkedIn
    Run Keyword IF    '${Title}'=='Imune Kids | LinkedIn'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX} 
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Midias Sociais(Facebook)
    ${AUX1}   Convert To Integer     41 
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[2]   #Facebook
    Sleep  5
    ${Title}    Get Title    #Imune Kids - Página inicial | Facebook
    Run Keyword IF    '${Title}'=='Imune Kids - Página inicial | Facebook'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1} 
    Sleep  5
    ${NomeDoTeste2}    Convert To String    Midias Sociais(Twitter)
    ${AUX2}   Convert To Integer     42   
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[3]    #Twitter
    Sleep  5
    ${Title}    Get Title    #Imune Kids (@imune_kids) / Twitter
    Run Keyword IF    '${Title}'=='Imune Kids (@imune_kids) / Twitter'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2} 
    Sleep  5
    ${NomeDoTeste3}    Convert To String    Midias Sociais(Instagram)
    ${AUX3}   Convert To Integer     43   
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[4]    #Instagram
    Sleep  5
    ${Title}    Get Title    #Entrar • Instagram
    Run Keyword IF    '${Title}'=='Entrar • Instagram'    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3} 
    Sleep  5
    ${NomeDoTeste4}    Convert To String    Midias Sociais(Pinterest)
    ${AUX4}   Convert To Integer     44       
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[5]    #Pinterest
    Sleep  5
    ${Title}    Get Title    #IMUNE KIDS (imunekids) — Perfil | Pinterest
    Run Keyword IF    '${Title}'=='IMUNE KIDS (imunekids) — Perfil | Pinterest'    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status}   ${AUX4}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status2}   ${AUX4} 
    Sleep  5
    ${NomeDoTeste5}    Convert To String    Midias Sociais(Youtube)
    ${AUX5}   Convert To Integer     45  
    Go To    ${URL}
    Sleep  5
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[6]    #Youtube
    Sleep  5
    ${Title}    Get Title    #IMUNE KIDS - YouTube
    Run Keyword IF    '${Title}'=='IMUNE KIDS - YouTube'    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status}   ${AUX5}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status2}   ${AUX5} 
    Sleep  5
    ${NomeDoTeste6}    Convert To String    Midias Sociais(Medium)
    ${AUX6}   Convert To Integer     46 
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[7]    #Medium
    Sleep  5
    ${Title}    Get Title    #Imune Kids – Medium
    Run Keyword IF    '${Title}'=='Imune Kids – Medium'    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status}   ${AUX6}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status2}   ${AUX6} 
    Sleep  5
    Close Browser

*** Keywords ***
Baixe o App
    ${NomeDoTeste}    Convert To String    Baixe o App(AppleStore)
    ${AUX}   Convert To Integer     47
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //div[6]/div[3]/div[1]
    Sleep  5
    Click Element    //*[@id="rd-close_button-knith3hr"]
    Sleep  5
    Click Element    //div[3]/div[1]/div[4]/div[1]    #AppleStore
    Sleep  10
    ${Title}    Get Title    #Imune Kids – AppleStore
    Run Keyword IF    '${Title}'=='Imune Kids – AppleStore'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX} 
    Sleep  5
    ${NomeDoTeste1}    Convert To String    Baixe o App(GooglePlay)
    ${AUX1}   Convert To Integer     48  
    Go To    ${URL}
    Sleep  5
    Click Element    //div[4]/div[2]    #GooglePlay
    Sleep  10
    ${Title}    Get Title    #Imune Kids – GooglePlay
    Run Keyword IF    '${Title}'=='Imune Kids – GooglePlay'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1} 
    Sleep  5  
    Close Browser

*** Keywords ***
A imunekids
    ${NomeDoTeste}    Convert To String    A imunekids(História)
    ${AUX}   Convert To Integer     49
    ${Status}    Convert To String   OK    
    ${Status2}    Convert To String   FAIL
    Open Chrome Browser    ${URL}
    Sleep  5
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[1]    #História
    Sleep  5
    ${Title}    Get Title    #Clínica Vacinas - Conheça a Clínica e todo seu diferencial!
    Run Keyword IF    '${Title}'=='Clínica Vacinas - Conheça a Clínica e todo seu diferencial!'    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status}   ${AUX}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste}    ${Status2}   ${AUX} 
    Sleep  5
    ${NomeDoTeste1}    Convert To String    A imunekids(Nossos diferenciais)
    ${AUX1}   Convert To Integer     50
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[2]    #Nossos diferenciais
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - CONHEÇA OS NOSSOS DIFERENCIAIS!
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - CONHEÇA OS NOSSOS DIFERENCIAIS!'    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status}   ${AUX1}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste1}    ${Status2}   ${AUX1} 
    Sleep  5
    ${NomeDoTeste2}    Convert To String    A imunekids(Direitos e deveres do paciente)
    ${AUX2}   Convert To Integer     51
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[3]    #Direitos e deveres do paciente
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Conheça os Direitos e Deveres do paciente!
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Conheça os Direitos e Deveres do paciente!'    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status}   ${AUX2}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste2}    ${Status2}   ${AUX2} 
    Sleep  5
    ${NomeDoTeste3}    Convert To String    A imunekids(Politicas de privacidade)
    ${AUX3}   Convert To Integer     52
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[4]    #Politicas de privacidade
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Conheça Nossa Política de Privacidade
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Conheça Nossa Política de Privacidade'    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status}   ${AUX3}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste3}    ${Status2}   ${AUX3} 
    Sleep  5
    ${NomeDoTeste4}    Convert To String    A imunekids(Parcerias)
    ${AUX4}   Convert To Integer     53
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[5]    #Parcerias
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Conheça Nossos Parceiros
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Conheça Nossos Parceiros'    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status}   ${AUX4}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste4}    ${Status2}   ${AUX4} 
    Sleep  5
    ${NomeDoTeste5}    Convert To String    A imunekids(Certificações e premiações)
    ${AUX5}   Convert To Integer     54
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[6]    #Certificações e premiações
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Nossas Certificações, Selos e Premiações!
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Nossas Certificações, Selos e Premiações!'    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status}   ${AUX5}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste5}    ${Status2}   ${AUX5} 
    Sleep  5
    ${NomeDoTeste6}    Convert To String    A imunekids(Responsabilidade Social)
    ${AUX6}   Convert To Integer     55
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[7]    #Responsabilidade Social
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - Responsabilidade Social
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - Responsabilidade Social'    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status}   ${AUX6}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste6}    ${Status2}   ${AUX6} 
    Sleep  5
    ${NomeDoTeste7}    Convert To String    A imunekids(Trabalhe conosco)
    ${AUX7}   Convert To Integer     56
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[8]    #Trabalhe conosco
    Sleep  5
    ${Title}    Get Title    #Clínica de Vacinas - TRABALHE CONOSCO! FAÇA PARTE DESSE TIME!
    Run Keyword IF    '${Title}'=='Clínica de Vacinas - TRABALHE CONOSCO! FAÇA PARTE DESSE TIME!'    Cadastrar resultado no excel    ${NomeDoTeste7}    ${Status}   ${AUX7}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste7}    ${Status2}   ${AUX7} 
    Sleep  5
    ${NomeDoTeste8}    Convert To String    A imunekids(Whatsapp)
    ${AUX8}   Convert To Integer     57
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[2]/div[2]/div/p[1]    #Whatsapp
    Sleep  5
    ${Title}    Get Title    #Compartilhe no WhatsApp
    Run Keyword IF    '${Title}'=='Compartilhe no WhatsApp'    Cadastrar resultado no excel    ${NomeDoTeste8}    ${Status}   ${AUX8}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste8}    ${Status2}   ${AUX8} 
    Sleep  5
    ${NomeDoTeste9}    Convert To String    A imunekids(Deixar Comentário)
    ${AUX9}   Convert To Integer     58
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[2]/div[3]/div/p[2]    #Deixar Comentário
    Sleep  5
    ${Title}    Get Title    #Vacinas Imune Kids - Sua Clínica de Vacinação João Pessoa - Google Maps
    Run Keyword IF    '${Title}'=='Vacinas Imune Kids - Sua Clínica de Vacinação João Pessoa - Google Maps'    Cadastrar resultado no excel    ${NomeDoTeste9}    ${Status}   ${AUX9}    
    ...    ELSE    Cadastrar resultado no excel    ${NomeDoTeste9}    ${Status2}   ${AUX9} 
    Sleep  5
    Close Browser










*** Tasks ***
Gerar Relatorio Funcional
    Relatório Excel
Teste BTM Home
    BTM Home
    Botão Padrão Imune
    Botão vacinação
    Botão Serviços
    Botão Exames
    Botão Cursos
    Botão Telessaúde 
    Botão agendar vacina  
    Botão Loja online
    Munik
    Dicas e informações sobre saúde
    Midias Sociais
    Baixe o App
    A imunekids
Salvar Relatorio Funcional
    Salvar Relatório Excel
Enviar pelo Email o Relatorio
    Enviar relatório pelo email    ${URL}
