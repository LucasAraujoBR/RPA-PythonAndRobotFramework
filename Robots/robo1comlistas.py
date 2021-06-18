from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

print("Iniciando nosso robô...\n")

driver = webdriver.Chrome('C:/Users/lucar/Desktop/Robos/chromedriver')
driver.get("https://registro.br/")


dominios = ["roboscompython.com.br","udemy.com","uol.com.br","LucasAraujo.com"]
for dominio in dominios:
    pesquisa = driver.find_element_by_id("is-avail-field")
    pesquisa.clear() #Limpando a barra de pesquisa
    pesquisa.send_keys(dominio)
    pesquisa.send_keys(Keys.RETURN)
    time.sleep(2)
    resultados = driver.find_elements_by_tag_name("strong")
    print("Domínio %s %s" % (dominio, resultados[4].text))


time.sleep(2) #Dormindo
driver.close()
