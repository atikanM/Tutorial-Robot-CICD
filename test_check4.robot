*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${expect}    MyDockerOnVM
${url}    http://34.224.95.226:8080/mygitweb/check4.html
${Browser}    chrome
${delay}    1


*** Test Cases ***
1. Open Website
    Open Browser  ${url}  ${Browser}   options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Set Selenium Speed    0.3

2. Check page info
    ${result}=    Get Text    xpath=//html/body/p[3]
    Log To Console    ${result}
    Should Contain    ${result}    ${expect}

3. close Browser
    Close Browser
