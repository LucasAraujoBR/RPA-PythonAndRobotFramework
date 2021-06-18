*** Settings ***
Documentation   RPA HTTP Related Keywords Example
Library         RPA.HTTP
Library         RPA.JSON


# +
*** Variables   ***
${URL}     
${APP_KEY}      
${APP_SECRET}   
*** Keywords   ***
Execute GET
    [Arguments]     ${session}     ${url}
    ${resp} =  Get Request    ${session}    ${url}
    Status Should Be    200    ${resp}
    [Return]    ${resp.json()}
*** Tasks ***
Minimal task
    Create Session    reqres    ${URL}
    &{response} =   Execute GET       reqres    ${URL}usuario=${APP_KEY}&token=${APP_SECRET}
