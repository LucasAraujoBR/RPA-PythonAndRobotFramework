*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
#Test Teardown     Fechar navegador



*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    clicar no botão pesquisar
     Conferir se o produto "Blouse" foi listado no site

 Caso de Teste 02: Pesquisar produto não existente
     Acessar a página home do site
     Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
     clicar no botão pesquisar
     Conferir mensagem de erro "No results were found for your search "itemNãoExistente""
Caso de Teste 03: Listar produtos
      Acessar a página home do site
      Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
      Clicar na sub categoria "Summer Dresses"
Caso de Teste 04: Adicionar Produtos no Carrinho
      Acessar a página home do site
      Digitar o nome do produto "t-shirt" no campo de pesquisa
      clicar no botão pesquisar
      Clicar no botão "Add to cart" do produto
    #  Clicar no botão "Proceed to checkout"
Caso de Teste 05: Remover Produtos
      Acessar a página home do site
      Clicar no ícone carrinho de compras no menu superior direito
      Clicar no botão de remoção de produtos (delete) no produto do
      carrinho
# *** Keywords ***
