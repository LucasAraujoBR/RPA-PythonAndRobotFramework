*** Settings ***
Documentation   Teste funcional Imune Kids.
Library           RPA.Browser.Selenium


*** Variables ***
${URL}    https://www.imunekids.com.br/
#https://imunego.imunekids.com.br
#https://www.imunekids.com.br/

*** Keywords ***
Abrir web site
    Open Chrome Browser    ${URL}
*** Keywords ***
Botão Home
    Click Element    //*[@id="__next"]/div[1]/nav/div[1]
    Sleep  2
    
    Sleep  5
    Close Browser
*** Keywords ***
Botão Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[1]/p  #Vacina sem dor
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[2]/p    #Qualidade e proteção a saúde
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[3]/p    #Cadeia de Frio
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div    #Padrão Imune
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[4]/div/div/div/button[4]/p    #Segurança das vacinas
    Sleep  5
    Capture Page Screenshot
    Sleep  5
    Close Browser
*** Keywords ***
Botão vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[1]/p    #Calendário vacinal
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[2]/p    #Avaliação da caderneta
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[3]/p    #Caderneta Vacinação
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[4]/p    #Clube de vacinas
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[5]/p    #Vacina Corporativa
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[6]/p    #Certificado internacional de vacinação
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[7]/p    #Projeto escola imune
    Sleep  5
    Capture Page Screenshot  
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[8]/p    #Duvidas Frequentes
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[9]/p    #Vacinas
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/a    #Vacinação
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[5]/div/div/div/button[10]/p    #Doenças
    Sleep  5
    Capture Page Screenshot 
    Close Browser
*** Keywords ***
Botão Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/a    #Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/div/div/button[1]/p    #Laserterapia
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/a    #Serviços
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[6]/div/div/div/button[2]/p    #Aplicação de brinco
    Sleep  5
    Capture Page Screenshot  
    Close Browser
*** Keywords ***
Botão Exames    
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/a    #Exames
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/div/div/button[1]/p    #teste do pezinho
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/a    #Exames
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[7]/div/div/div/button[2]/p    #ANTI-RH
    Sleep  5
    Capture Page Screenshot
    Close Browser
*** Keywords ***
Botão Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[1]/p    #Ensino
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[2]/p    #Pesquisa
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/a    #Cursos
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[8]/div/div/div/button[3]/p    #Inovação
    Sleep  5
    Capture Page Screenshot 
    Close Browser
*** Keywords ***
Botão Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[1]/p   #aleitamento materno
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[2]/p    #ADM medicamento
    Sleep  5
    Capture Page Screenshot   
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[3]/p    #Consultoria amamentação
    Sleep  5
    Capture Page Screenshot   
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[4]/p    #Consultoria introdução alimentar
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[5]/p    #Tele-Enfermagem
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[6]/p    #Retorno ao Trabalho
    Sleep  5
    Capture Page Screenshot  
    Go To    ${URL}
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/a    #Telessaúde
    Click Element    //*[@id="navbarCollapse3"]/ul[1]/li[9]/div/div/div/button[7]/p    #Desmame gradual
    Sleep  5
    Capture Page Screenshot  
    Close Browser
*** Keywords ***
Botão agendar vacina
    Click Element    //*[@id="agenda-button"]    #BTM agendar vacina
    Sleep  5
    Capture Page Screenshot  
    Close Browser
*** Keywords ***
Botão Loja online
    Click Element    //*[@id="loja-vacina"]    #BTM Loja online
    Sleep  5
    Capture Page Screenshot 
    Close Browser
*** Keywords ***
Munik 
    Click Element    //*[@id="container-carousel"]/div[3]/div[2]/div[1]   #COVID
    Sleep  8
    Capture Page Screenshot  
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[3]/div[2]/div[2]    #Aleitamento
    Sleep  8
    Capture Page Screenshot     
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[3]/div[2]/div[3]    #Primeiros Socorros
    Sleep  8
    Capture Page Screenshot    
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[3]/div[2]/div[4]    #Sobre vacinas
    Sleep  8
    Capture Page Screenshot   
    Close Browser
*** Keywords ***
Dicas e informações sobre saúdes
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[1]/a    #Ebooks
    Sleep  5
    Capture Page Screenshot    
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[2]/a    #Informe&campanhas
    Sleep  5
    Capture Page Screenshot    
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[5]/div/div[3]/a    #Publicações online
    Sleep  5
    Capture Page Screenshot     
    Close Browser
*** Keywords ***
Midias Sociais
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[1]   #LINKEDIN
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[2]   #Facebook
    Sleep  5
    Capture Page Screenshot   
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[3]    #Twitter
    Sleep  5
    Capture Page Screenshot   
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[4]    #Instagram
    Sleep  5
    Capture Page Screenshot  
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[5]    #Pinterest
    Sleep  5
    Capture Page Screenshot 
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[6]    #Youtube
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="container-carousel"]/div[8]/div/img[7]    #Medium
    Sleep  5
    Capture Page Screenshot
    Close Browser
*** Keywords ***
A imunekids
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[1]    #História
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[2]    #Nossos diferenciais
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[3]    #Direitos e deveres do paciente
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[4]    #Politicas de privacidade
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[5]    #Parcerias
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[6]    #Certificações e premiações
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[7]    #Responsabilidade Social
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[1]/p[8]    #Trabalhe conosco
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[2]/div[2]/div/p[1]    #Whatsapp
    Sleep  5
    Capture Page Screenshot
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[2]/div[3]/div/p[2]    #Deixar Comentário
    Sleep  5
    Capture Page Screenshot
    Close Browser
*** Keywords ***
Baixe o App
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[4]/div[2]    #AppleStore
    Sleep  10
    Capture Page Screenshot  
    Go To    ${URL}
    Click Element    //*[@id="__next"]/div[3]/div[1]/div[4]/div[1]    #GooglePlay
    Sleep  10
    Capture Page Screenshot  
    Close Browser


*** Tasks ***
Teste Home
    Abrir web site
    Botão Home
Teste Padrão Imune
    Abrir web site
    Botão Padrão Imune
Teste Vacinação
    Abrir web site
    Botão vacinação
Teste Serviços
    Abrir web site
    Botão Serviços
Teste Exames
    Abrir web site
    Botão Exames
Teste Cursos
    Abrir web site
    Botão Cursos
Teste Telessaúde
    Abrir web site
    Botão Telessaúde
Teste Agendar Vacina
    Abrir web site
    Botão agendar vacina
Teste Loja online 
    Abrir web site
    Botão Loja online
Teste Munik
    Abrir web site
    Munik
Teste Informações sobre saúde
    Abrir web site
    Dicas e informações sobre saúde
Teste A imunekids
    Abrir web site
    A imunekids
Teste Apps
    Abrir web site
    Baixe o App
Teste Midias Sociais
    Abrir web site
    Midias Sociais
