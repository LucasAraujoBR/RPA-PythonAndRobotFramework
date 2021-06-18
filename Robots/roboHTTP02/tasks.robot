*** Settings ***
Documentation   Download a PDF document from an HTTP server and save as a local file.
Library         RPA.HTTP

*** Variables ***
${PDF_URL}  https://ec.europa.eu/energy/sites/ener/files/documents/EnergyDailyPricesReport-EUROPA_0.pdf

*** Tasks ***
Download a PDF document from an HTTP server
    Download    ${PDF_URL}

*** Tasks ***
Download a PDF document from an HTTP server and overwrite existing file
    Download    ${PDF_URL}  overwrite=True

*** Tasks ***
Download a PDF document from an HTTP server using specific target location and name
    Download    ${PDF_URL}  target_file=output/my.pdf