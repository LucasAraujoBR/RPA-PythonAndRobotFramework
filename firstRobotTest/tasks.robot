*** Settings ***
Documentation     Google Translate song lyrics from source to target language
...               Saves the original and the translated lyrics as text files.
Library           SeleniumLibrary
Library           OperatingSystem



*** Variables ***
${URL}       https://www.lyrics.com/lyric/36863481/Justin+Bieber/Yummy     

*** Keywords ***
Get lyrics
    Open Browser                         ${URL}    chrome
    Maximize Browser Window
    ${texto}            Get text        //*[@id="lyric-body-text"]
    Set Global Variable     ${texto}
*** Keywords ***
Translate
    Go To                https://translate.google.com.br/?hl=pt-BR  
    Input Text           //*[@id="yDmH0d"]/c-wiz/div/div[2]/c-wiz/div[2]/c-wiz/div[1]/div[2]/div[2]/c-wiz[1]/span/span/div/textarea    ${texto}  
    Sleep    2
    ${translator}            Get Text           //*[@id="yDmH0d"]/c-wiz/div/div[2]/c-wiz/div[2]/c-wiz/div[1]/div[2]/div[2]/c-wiz[2]/div[5]/div/div[1]/span[1]/span
    Set Global Variable    ${translator}
    Capture Page Screenshot    Page.png     
    Close Browser            
*** Keywords ***
Save lyrics
    Create File    ${OUTPUT_DIR}${/}origin.txt    ${texto}
    Create File    ${OUTPUT_DIR}${/}traduc.txt    ${translator}


*** Tasks ***
Google Translate song lyrics from source to target language
    Get lyrics
    Translate
    Save lyrics
   


   













#Teste
#*** Settings ***
#Documentation   Template robot main suite.


#*** Tasks ***
#Minimal task
#    Log  Done.
