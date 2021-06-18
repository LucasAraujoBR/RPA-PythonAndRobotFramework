*** Settings ***
Documentation   Teste do site ImuneKids.
Library    RPA.Browser

*** Variables ***
${URL}    https://imunego.imunekids.com.br
#https://imunego.imunekids.com.br
#https://www.imunekids.com.br/
*** Keywords ***
Abrir web site
    Open Chrome Browser    ${URL}
    Maximize Browser Window
*** Keywords ***
Botão Home
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[1]
    Sleep  2
    Capture Page Screenshot     ${OUTPUTDIR}/homePage.png
    Sleep  5
    Close Browser
*** Keywords ***
Botão Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]/div/div/a[1]/button  #Vacina sem dor
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/VacinaSemDor.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]/div/div/a[2]/button    #Qualidade e proteção a saúde
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/QualidadeEProtecaoASaude.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]/div/div/a[3]/button    #Cadeia de Frio
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/CadeiaDeFrio.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[1]/div/div/a[4]/button    #Segurança das vacinas
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/SegurancaDasVacinas.png
    Sleep  5
    Close Browser
*** Keywords ***
Botão vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[1]/button    #Calendário vacinal
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/CalendarioVacinal.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[2]/button    #Avaliação da caderneta
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/AvaliaçãoDaCaderneta.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[3]/button    #Caderneta Vacinação
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/CadernetaVacinacao.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[4]/button    #Clube de vacinas
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ClubeDeVacinas.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[5]/button    #Vacina Corporativa
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/VacinaCorporativa.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[6]/button    #Certificado internacional de vacinação
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/CertificadoInterDeVacinacao.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[7]/button    #Projeto escola imune
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ProjetoEscolaImune.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[8]/button    #Duvidas Frequentes
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/DuvidasFrequentes.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[9]/button    #Vacinas
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Vacinas.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[2]/div/div/a[10]/button    #Doenças
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Doencas.png
    Close Browser
*** Keywords ***
Botão Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[3]/a    #Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[3]/div/div/a[1]/button    #Laserterapia
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Laserterapia.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[3]/a    #Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[3]/div/div/a[2]/button    #Aplicação de brinco
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/AplicacaoDeBrinco.png
    Close Browser
*** Keywords ***
Botão Exames    
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[2]/div/a    #Exames
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[2]/div/div/div/button[1]/a/button    #teste do pezinho
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/TesteDoPezinho.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[2]/div/a    #Exames
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[2]/div/div/div/button[2]/a/button    #ANTI-RH
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ANTI-RH.png
    Close Browser
*** Keywords ***
Botão Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/div/div/a[1]/button    #Ensino
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Ensino.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/div/div/a[2]/button    #Pesquisa
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Pesquisa.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/div[4]/div/div/a[3]/button    #Inovação
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Inovacao.png
    Close Browser
*** Keywords ***
Botão Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[1]/a/button    #aleitamento materno
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/AleitamentoMaterno.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[2]/a/button    #ADM medicamento
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ADMMedicamento.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[3]/a/button    #Consultoria amamentação
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ConsulAmamentacao.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[4]/a/button    #Consultoria introdução alimentar
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ConsulIntroAlimentar.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[5]/a/button    #Tele-Enfermagem
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Tele-Enfermagem.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[6]/a/button    #Retorno ao Trabalho
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/RetornoAoTrabalho.png
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[3]/div/div/div/button[7]/a/button    #Desmame gradual
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/DesmameGradual.png
    Close Browser
*** Keywords ***
Botão agendar vacina
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/a/button    #BTM agendar vacina
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/AgendarVacina.png
    Close Browser
*** Keywords ***
Botão Loja online
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/a/button    #BTM Loja online
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/LojaOnline.png
    Close Browser
*** Keywords ***
Munik 
    Click Element    //*[@id="card-groups"]/a   #COVID
    Sleep  8
    Capture Page Screenshot     ${OUTPUTDIR}/DuvidasCOVID19.png
    Go To    ${URL}
    Click Element    //*[@id="card-groups"]/a    #Aleitamento
    Sleep  8
    Capture Page Screenshot     ${OUTPUTDIR}/DuvidasAleitamento.png
    Go To    ${URL}
    Click Element    //*[@id="card-groups"]/a    #Primeiros Socorros
    Sleep  8
    Capture Page Screenshot     ${OUTPUTDIR}/DuvidasPrimeirosSocorros.png
    Go To    ${URL}
    Click Element    //*[@id="card-groups"]/a    #Sobre vacinas
    Sleep  8
    Capture Page Screenshot     ${OUTPUTDIR}/DuvidasSobreVacinas.png
    Close Browser
*** Keywords ***
Dicas e informações sobre saúde
    Click Element    //*[@id="cardDeck-changed"]/div[1]/div/small/a    #Ebooks
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Ebooks.png
    Go To    ${URL}
    Click Element    //*[@id="cardDeck-changed"]/div[2]/div/small/a    #Informe&campanhas
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/InformesECampanhas.png
    Go To    ${URL}
    Click Element    //*[@id="cardDeck-changed"]/div[3]/div/small/a    #Publicações online
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/PublicacoesOnline.png
    Close Browser
*** Keywords ***
Midias Sociais
    Click Element    //*[@id="div-social"]/svg[1]   #LINKEDIN
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Linkedin.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[2]    #Facebook
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Facebook.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[3]    #Twitter
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Twitter.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[4]    #Instagram
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Instagram.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[5]    #Pinterest
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Pinterest.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[6]    #Youtube
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Youtube.png
    Go To    ${URL}
    Click Element    //*[@id="div-social"]/svg[7]    #Medium
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Medium.png
    Close Browser
*** Keywords ***
A imunekids
    Click Element    //*[@id="ul-fluid"]/li[1]/a    #História
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/História.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[2]/a    #Nossos diferenciais
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/NossosDiferenciais.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[3]/a    #Direitos e deveres do paciente
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/DireitosEDeveresDoPaciente.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[4]/a    #Politicas de privacidade
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/PoliticasDePrivacidade.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[5]/a    #Parcerias
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Parcerias.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[6]/a    #Certificações e premiações
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/CertificaçõesEPremiações.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[7]/a    #Responsabilidade Social
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/ResponsabilidadeSocial.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[8]/a    #Trabalhe conosco
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/TrabalheConosco.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[3]/a    #Whatsapp
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/Whatsapp.png
    Go To    ${URL}
    Click Element    //*[@id="ul-fluid"]/li[1]/a    #Deixar Comentário
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/DeixarComentario.png
    Close Browser
*** Keywords ***
Baixe o App
    Click Element    //*[@id="appstore"]    #AppleStore
    Sleep  10
    Capture Page Screenshot     ${OUTPUTDIR}/AppleStore.png
    Go To    ${URL}
    Click Element    //*[@id="googleplay"]    #GooglePlay
    Sleep  10
    Capture Page Screenshot     ${OUTPUTDIR}/GooglePlay.png
    Close Browser
*** Keywords ***
Atendimento Whatsapp
    Click Button    //*[@id="icone-bot"]/img   #atendimento WhatsApp
    Sleep  5
    Capture Page Screenshot     ${OUTPUTDIR}/AtendimentoWhatsApp.png
    Close Browser
*** Keywords ***
teste performance
    Open Chrome Browser      https://developers.google.com/speed/pagespeed/insights/
    Maximize Browser Window
    Input Text    //*[@id="page-speed-insights"]/div[1]/form/div/input    ${URL}
    Sleep  2
    Click Element    //*[@id="page-speed-insights"]/div[1]/form/div/div/div
    Sleep  60
    Capture Element Screenshot    //*[@id="page-speed-insights"]/div[2]/div[2]/div[2]/div[1]    ${OUTPUTDIR}/ResultadoMOBILE.png
    Capture Element Screenshot    //*[@id="page-speed-insights"]/div[2]/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/div    ${OUTPUTDIR}/ResultadoMOBILERELATORIO.png
    Click Element    //*[@id=":8"]/div/div
    Sleep  2
    Capture Element Screenshot    //*[@id="page-speed-insights"]/div[2]/div[2]/div[2]/div[2]    ${OUTPUTDIR}/ResultadoDESKTOP.png
    Capture Element Screenshot    //*[@id="page-speed-insights"]/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[2]/div[1]    ${OUTPUTDIR}/ResultadoDESKTOPRELATORIO.png
    Sleep  2
    Close Browser



*** Keywords ***
teste segurança
    Open Chrome Browser    https://www.ssllabs.com/ssltest/
    Maximize Browser Window
    Sleep    2
    Input Text    //*[@id="main"]/div[1]/center/form/table/tbody/tr[1]/td[2]/input    ${URL}
    Sleep  1
    Click Element    //*[@id="main"]/div[1]/center/form/table/tbody/tr[1]/td[3]/input
    Sleep  90
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[1]    ${OUTPUTDIR}/Seguranca.png
    Sleep  1
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[2]/div[2]    ${OUTPUTDIR}/Seguranca1.png
    Sleep  1
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[3]        ${OUTPUTDIR}/Seguranca2.png            
    Sleep  1
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[4]/div[2]        ${OUTPUTDIR}/Seguranca3.png
    Sleep  1
    Capture Element Screenshot    //*[@id="main"]/div[5]/div[4]/div[2]        ${OUTPUTDIR}/Seguranca4.png
    Sleep  2
    Close Browser


*** Keywords ***

*** Tasks ***
Teste de Performance
    teste performance
Teste de Segurança    
    teste segurança
#Teste de Funcionalidade
#    Abrir web site
#    Botão Home
#    Abrir web site
#    Botão Padrão Imune
#    Abrir web site
#    Botão vacinação
#    Abrir web site
#    Botão Serviços
#    Abrir web site
#    Botão Exames
#    Abrir web site
#    Botão Cursos
#    Abrir web site
#    Botão Telessaúde
#    Abrir web site
#    Botão agendar vacina
#    Abrir web site
#    Botão Loja online
#    Abrir web site
#    Munik
#    Abrir web site
#    Dicas e informações sobre saúde
#    Abrir web site
#    A imunekids
#    Abrir web site
#    Baixe o App
