"""Template robot with Python."""
import requests
import json
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
from selenium.webdriver.common.action_chains import ActionChains
from  RPA.JSON  import JSON

net = webdriver.Chrome('./chromedriver')
action = ActionChains(net)
jsonControl = JSON()
def buscar_dados():
    request = requests.get("https://sistema.imuneweb6.com.br/api/imuneweb/v1/paciente/respfinanceiro/12345678920?usuario=usuarioTeste&token=4E7E1FB2E39F41CE8FA")
    todos = json.loads(request.content)
    print(todos)
    nomeDoCliente = jsonControl.get_value_from_json(todos,"$.dados[0].respFinanceiro")  #Pega nome do responsável financeiro
    print(nomeDoCliente)
    cpfDoCliente = jsonControl.get_value_from_json(todos,"$.dados[0].cpfRespFinanceiro") #Pega o CPF
    print(cpfDoCliente)
    #Padrão da descrição
    descricaoDoServico = 'Nota fiscal de serviços para ${NomeCliente}\nVacinas:     ${Vacina}\n\nValor total: R$690,00\n\nResponsável Técnica ANDREIA ROQUE DE S. CAVALCANTI, COREN/PB 135382-ENF'
    """
    Preciso também de:
    *data da venda(ex: 20/01/2021)    
    *Vacina (ex: HPV 4V, 3 dose, R$690,00)
    *Número do recibo imune
    *valor (ex: 690,00)  s  
    """
    
def Logar():
    net.get("https://sispmjp.joaopessoa.pb.gov.br:8080/nfse/login.jsf")          #Abrir url do sistema de ntf de JP
    usuario = net.find_element_by_xpath('//*[@id="j_username"]')                 #Procura o campo de Login
    usuario.send_keys('11707678000125')                                                   #Insere o Login   
    sleep(2)
    senha = net.find_element_by_xpath('//*[@id="j_password"]')                   #Procura o campo de Password  
    senha.send_keys('108859811', Keys.ENTER)                                                     #Insere a senha       
    sleep(5)
    
def redirecionarNTF():
    element = net.find_element_by_xpath('//*[@id="formMensagens:commandButton_confirmar"]/span[2]')   #Procura e clica no botão confirmar
    element.click()                                                                                   #  ""
    sleep(2)
    element2 = net.find_element_by_xpath('//*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/a/span[1]')  #Procura e deixa o mouse sobre
    action.move_to_element(element2).perform()                                                             #  ""     
    sleep(2)
    element3 = net.find_element_by_xpath('//*[@id="formMenuPrincipal:menuPrincipal"]/ul/li[1]/ul/li[1]/a/span')  #procura e clica no elemento
    element3.click()

def dadosBasicos():
    element = net.find_element_by_xpath('//*[@id="form_emitir_nfse:calendar_competencia_input"]')
    element.send_keys('')


def main():
    buscar_dados()




if __name__ == '__main__':
    main()
