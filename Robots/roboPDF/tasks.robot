*** Settings ***
Documentation     Um exemplo de robô para ler o texto contido em arquivos PDF
...               e salve-o em um arquivo de texto correspondente.
Library           RPA.PDF
Library           RPA.FileSystem

*** Variables ***
${TXT_OUTPUT_DIRECTORY_PATH}=    ${CURDIR}${/}output${/}  #diretorio da pasta a ser salvo o arquivoTXT

*** Keywords ***
Extraia o texto de um arquivo PDF e mande o para um arquivo de texto
    [Arguments]    ${pdf_file_name}
    ${text}=    Get Text From Pdf    ${pdf_file_name}
    Create File    ${TXT_OUTPUT_DIRECTORY_PATH}${pdf_file_name}.txt
    FOR    ${page}    IN    @{text.keys()}
        Append To File    ${TXT_OUTPUT_DIRECTORY_PATH}${pdf_file_name}.txt
        ...    ${text[${page}]}
    END

*** Tasks ***
Extrair texto do pdf
    Extraia o texto de um arquivo PDF e mande o para um arquivo de texto    rascunho do artigo final.pdf
    Extraia o texto de um arquivo PDF e mande o para um arquivo de texto    TCC_PauloTeruoIzumi.pdf