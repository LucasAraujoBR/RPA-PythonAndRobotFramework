import pyautogui as p
#robo que atualiza arquivo powerBI , fecha e salva
p.hotkey('win','r')
p.sleep(1)
p.write('C:\RPA.pbix')
p.sleep(1)
p.press('enter')
p.sleep(50)
p.click(704,95)
p.sleep(15)
p.click(1341,15)
p.sleep(3)
p.click(691,404)


# p.sleep(5)
# print(p.position())