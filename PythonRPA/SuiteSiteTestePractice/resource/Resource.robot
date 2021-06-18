*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com
*** keyword ***
### Setup e Teardown
abrir navegador
    Open Browser         about:blank        ${BROWSER}

fechar navegador
    Close Browser

### Passo-a-passo
Acessar a página home do site
    Go To                  ${URL}
    Title Should Be           My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query    ${PRODUTO}

clicar no botão pesquisar
    Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    css=#center_column > h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Page Should Contain Link         xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Conferir mensagem de erro "${MENSAGEM}"
      Wait Until Element Is Enabled    //*[@id="center_column"]/p[@class='alert alert-warning']
      Element Text Should Be           //*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM}

Passar o mouse por cima da categoria "${CAREGORIA}" no menu principal superior de categorias
      Mouse Over                      //*[@id="block_top_menu"]/ul/li[1]/a
      Mouse Down On Link              //*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria "${CATEGORIA}"
      Mouse Down                      //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
      Mouse Up                        //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "${BUTTON}" do produto
      Click Element                   //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span

Clicar no botão "${BUTTON}"
    Double Click Element            //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
Clicar no ícone carrinho de compras no menu superior direito
      Mouse Down                        //*[@id="header"]/div[3]/div/div/div[3]/div/a
      Mouse Up                          //*[@id="header"]/div[3]/div/div/div[3]/div/a

Clicar no botão de remoção de produtos (delete) no produto do
carrinho
    Mouse Down                         //*[@id="product_1_1_0_0"]/td[7]/div
    Mouse Up                           //*[@id="product_1_1_0_0"]/td[7]/div
