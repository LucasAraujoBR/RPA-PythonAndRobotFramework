"""Template robot with Python."""
import requests
import json
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
from selenium.webdriver.common.action_chains import ActionChains
from  RPA.JSON  import JSON

net = webdriver.Chrome('./chromedriver')

def Logar():
    net.get("https://autoatendimento.bb.com.br/apf-apj-acesso/?tipoCliente=empresa&pk_vid=d17ec64343996d3016154810534febe0#/transacao/acesso-apj/0?tipoCliente=empresa&pk_vid=d17ec64343996d3016154810534febe0")          #Abrir url do sistema de ntf de JP
    sleep(5)
    element = net.find_element_by_xpath('//*[@id="ng-view"]/login-box/bb-container-botao[1]/button')
    element.click()
    sleep(5)
    usuario = net.find_element_by_xpath('//*[@id="identificacaoUsuario"]')                 #Procura o campo de Login
    usuario.send_keys('JE853924')                                                   #Insere o Login   
    sleep(2)
    element2 = net.find_element_by_xpath('//*[@id="ng-view"]/login-box/form/bb-container-campo[2]/md-switch')
    element2.click()
    sleep(2)
    element3 = net.find_element_by_xpath('//*[@id="botaoEnviar"]')
    element3.click()
    senha = net.find_element_by_xpath('//*[@id="senhaUsuario"]')
    senha.send_keys('imu91123')
    sleep(2)
    element3.click()

def gerarExtrato():
    sleep(30)
    net.get("https://autoatendimento.bb.com.br/apf-apj-autoatendimento/index.html#/template/~2Fconsultas~2F009-2.bb")
    sleep(15)
    element = net.find_element_by_xpath('//*[@id="dependenciaOrigem"]')
    element.send_keys('16810')
    sleep(2)
    element1 = net.find_element_by_xpath('//*[@id="numeroContratoOrigem"]')
    element1.send_keys('424820')
    sleep(2)
    element2 = net.find_element_by_xpath('//*[@id="senhaConta"]')
    element2.send_keys('imu91123')
    sleep(2)
    element3 = net.find_element_by_xpath('//*[@id="botao.acao.ok"]')
    element3.click()

def deslogar():
    element = net.find_element_by_xpath('//div[5]/div[3]/div')
    element.click()
    sleep(2)
    net.close()

def main():
    Logar()
    gerarExtrato()
    deslogar()


if __name__ == "__main__":
    minimal_task()
