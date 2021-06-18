import pyautogui as p
import rpa as r

p.doubleClick(37,334)
p.sleep(4)
janela = p.getActiveWindow()
janela.maximize()
p.sleep(2)
p.write('www.udemy.com')
p.press('enter')

p.sleep(6)
localpesq = p.locateOnScreen('imagens/Pesquisa.PNG',confidence=0.7)
localpesquisa = p.center(localpesq)
print(localpesquisa)
xPesquisa, yPesquisa = localpesquisa  #o certo seria xPesquisa, yPesquisa mas adaptei pelo erro da minha imagem
p.moveTo(xPesquisa,yPesquisa,duration=1)
p.click(xPesquisa,yPesquisa)
p.sleep(1)
p.write('Charles Lima')
p.press('enter')
p.sleep(4)
p.screenshot('imagens/Cursos.png')
p.sleep(1)
localClose =p.locateOnScreen('imagens/Close.PNG',confidence=0.7)
localClosing = p.center(localClose)
print(localClosing)
xPesquisa, yPesquisa = localClosing  #o certo seria xPesquisa, yPesquisa mas adaptei pelo erro da minha imagem
p.moveTo(xPesquisa,yPesquisa,duration=1)
p.click(xPesquisa,yPesquisa)


# p.sleep(4)
# print(p.position())