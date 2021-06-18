*** Settings ***
Documentation   Template robot main suite.
Library           RPA.Excel.Files
Library           RPA.Browser.Selenium
Library           RPA.HTTP


*** Keywords ***
Obtenha a lista de pessoas do arquivo Excel
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook


*** Tasks ***
Minimal task
    Obtenha a lista de pessoas do arquivo Excel
