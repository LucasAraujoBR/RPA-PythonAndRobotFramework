from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

# Atribuição de Variaveis
email = "roboparapython@gmail.com"
senha = "cursopython123"

destinatario = "roboparapython@gmail.com"
assunto = "E-mail enviado pelo robo"
mensagem = "Primeiro e-mail enviado pelo nosso robô."

driver = webdriver.Chrome("C:/Users/lucar/Desktop/Robos/chromedriver")

print("Iniciando nosso robô...\n")
print("Acessando o Gmail...")
driver.get("https://gmail.com.br/")
#necessario para passar pela verificação de segurança
t.sleep(2)
botaoAvvancado = driver.find_element_by_id("details-button")
botaoAvvancado.click()
t.sleep(2)
naoSeguro = driver.find_element_by_id("proceed-link")
naoSeguro.click()
t.sleep(5)

#LOGIN
print("Realizando login...")
login = driver.find_element_by_id("identifierId")
login.clear()
login.send_keys(email)
login.send_keys(Keys.RETURN)
time.sleep(2)

password = driver.find_element_by_name("password")
password.clear()
password.send_keys(senha)
password.send_keys(Keys.RETURN)
time.sleep(6)
print("Login realizado...")



driver.close()
