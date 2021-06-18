*** Settings ***
Documentation   Baixa arquivos Excel e faz a leitura deles.
Library         RPA.Excel.Files
Library         RPA.HTTP

*** Variables ***
${EXCEL_FILE_URL}=  https://github.com/robocorp/example-activities/raw/master/web-store-order-processor/devdata/Data.xlsx

*** Tasks ***
Download an Excel file and read the rows
    Download        ${EXCEL_FILE_URL}           overwrite=True
    Open Workbook   Data.xlsx
    ${table}=       Read Worksheet As Table     header=True
    Close Workbook

    FOR     ${row}  IN  @{table}
        Log     ${row}
    END