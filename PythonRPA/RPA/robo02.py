import rpa as r
import pyautogui as p

r.init() #visual vem desabilitado e o browser bem habilitado
r.url('https://www.google.com')
janela = p.getActiveWindow()  #capturar tela
janela.maximize()       #Maximizar tela
r.wait(2.0)             #Versao Sleep da library RPA usar valores decimais
r.type('//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input','RPA[enter] ') #html xpath pegado no search do google, o que quero pesquisar [ tecla ]
r.wait(2.0)
r.snap('page','imagens/RPA_page.png') #bate o print da tela
r.wait(2.0)
r.close() # fecha a janela