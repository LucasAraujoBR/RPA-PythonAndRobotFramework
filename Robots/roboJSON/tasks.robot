*** Settings ***
Documentation     Examples of JSON operations.
Library           RPA.JSON

*** Tasks ***
JSON operations
    ${json}=    Convert String to JSON    {"orders": [{"id": 1},{"id": 2}]}     #Converte String para JSON
    # ${json} = {'orders': [{'id': 1}, {'id': 2}]}
    ${first_order_id}=    Get value from JSON    ${json}    $.orders[0].id        #Pega o valor do JSON
    # ${first_order_id} = 1
    ${all_ids}=    Get values from JSON    ${json}    $..id
    # ${all_ids} = [1, 2]
    ${json}=    Add to JSON    ${json}    $.orders    {"id": 3}            #Adiciona ao JSON
    # ${json} = {'orders': [{'id': 1}, {'id': 2}, '{"id": 3}']}
    ${json}=    Delete from JSON    ${json}    $.orders[-1:]                #Remove do JSON
    # ${json} = {'orders': [{'id': 1}, {'id': 2}]}
    ${json}=    Update value to JSON    ${json}    $.orders[1].id    4        #Atualiza a captura de valores do JSON
    # ${json} = {'orders': [{'id': 1}, {'id': '4'}]}
    ${json_as_string}=    Convert JSON to String    ${json}                    #Converte JSON para String
    # ${json_as_string} = {"orders": [{"id": 1}, {"id": "4"}]}
    Save JSON to file    ${json_as_string}    orders.json                    #Salva o JSON
    ${json}=    Load JSON from file    orders.json                    #Carrega o arquivo JSON
    # ${json} = {'orders': [{'id': 1}, {'id': '4'}]}