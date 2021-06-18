*** Settings ***
Documentation   Manipulação JSON.
Library    RPA.JSON

*** Keywords ***
Iniciar operações com JSON
    ${json}=    Convert String to JSON    {"orders": [{"id": 1},{"id": 2}]}       #Converte Strings em JSON
    # ${json} = {'orders': [{'id': 1}, {'id': 2}]}
    ${first_order_id}=    Get value from JSON    ${json}    $.orders[0].id        #Variável recebe o valor do JSON na ordem escolhida
    # ${first_order_id} = 1
    ${all_ids}=    Get values from JSON    ${json}    $..id
    # ${all_ids} = [1, 2]
    ${json}=    Add to JSON    ${json}    $.orders    {"id": 3}                   #Add elementos ao JSON
    # ${json} = {'orders': [{'id': 1}, {'id': 2}, '{"id": 3}']}
    ${json}=    Delete from JSON    ${json}    $.orders[-1:]                      #Apaga elementos do Json
    # ${json} = {'orders': [{'id': 1}, {'id': 2}]}
    ${json}=    Update value to JSON    ${json}    $.orders[1].id    4            #Atualiza um elemento com um novo valor
    # ${json} = {'orders': [{'id': 1}, {'id': '4'}]}
    ${json_as_string}=    Convert JSON to String    ${json}                       #Transforma JSON em Strings
    # ${json_as_string} = {"orders": [{"id": 1}, {"id": "4"}]}
    Save JSON to file    ${json_as_string}    orders.json                         #Salva JSON 
    ${json}=    Load JSON from file    orders.json                                #Carrega arquivo JSON
    # ${json} = {'orders': [{'id': 1}, {'id': '4'}]}

*** Keywords ***
Leitura JSON
#Para leitura json se usa um loop passando valores indices para leitura de cada componente do Json
    &{people}=    RPA.JSON.Convert string to JSON   {"Pessoas": [{"Name": "João"}, {"Name": "Maria"}]}
    @{names}=     RPA.JSON.Get values from JSON     ${people}   $.Pessoas[*].Name    # o uso do '*' significa pegar todas componentes da tag Name
    FOR  ${AUX}  IN  @{names}    #Aux parte de 0 até o total names
        Log    $.People[${AUX}].Name      #Log gera o nome na tela de cada posição 
    END     
    


*** Tasks ***
start
    Iniciar operações com JSON
    Leitura JSON