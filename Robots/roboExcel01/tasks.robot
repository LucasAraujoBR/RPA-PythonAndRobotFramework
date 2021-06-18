*** Settings ***
Documentation    Aplicações Excel
Library    RPA.Tables
Library    RPA.Excel.Files

*** Keywords ***
Criar nova planilha excel
    Create Workbook  planilhaGeradaRPA.xlsx
    FOR    ${index}    IN RANGE    20
        &{row}=       Create Dictionary
        ...           Row No   ${index}
        ...           Amount   ${index * 2}
        Append Rows to Worksheet  ${row}  header=${TRUE}
    END
    Save Workbook


*** Tasks ***
Aplicações excel
    Criar nova planilha excel
    
    