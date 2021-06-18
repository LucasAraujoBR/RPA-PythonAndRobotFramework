"""Manipulação JSON em Python"""
from  RPA.JSON  import JSON

jsonControl = JSON()    #Variável que tem acesso a biblioteca json

def jsonManipulation():
    json = jsonControl.convert_string_to_json('{"orders": [{"id": 1},{"id": 2}]}')  #Converte Strings em JSON
    first_order_id = jsonControl.get_value_from_json(json, "$.orders[0].id")        #Variável recebe o valor do JSON na ordem escolhida
    all_ids = jsonControl.get_values_from_json(json, "$..id")
    json = jsonControl.add_to_json(json, "$.orders",    {"id": 3})                  #Add elementos ao JSON
    json = jsonControl.delete_from_json(json, "$.orders[-1:]")                      #Apaga elementos do Json    
    json = jsonControl.update_value_to_json(json, "$.orders[1].id", 4)              #Atualiza um elemento com um novo valor
    json_as_string = jsonControl.convert_json_to_string(json)                       #Transforma JSON em Strings
    jsonControl.save_json_to_file(json_as_string, "orders.json")                    #Salva arquivo JSON
    json = jsonControl.load_json_from_file("orders.json")                           #Carrega arquivo JSON   

def main():
    jsonManipulation()
    

if __name__ == "__main__":
    main()
