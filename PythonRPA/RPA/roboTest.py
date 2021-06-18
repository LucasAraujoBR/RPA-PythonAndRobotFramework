import pyautogui as p
import pandas as pd

def botRoboTest():
    p.FAILSAFE = False
    p.hotkey('win','r')
    p.sleep(1)
    p.typewrite('notepad')
    p.press('enter')
    p.sleep(2)
    p.typewrite('Robo funcionando em ' + str(pd.Timestamp('today')))
    p.sleep(2)
    p.click(1007,251)
    p.press('right')
    p.sleep(2)
    p.press('enter')

# botRoboTest()