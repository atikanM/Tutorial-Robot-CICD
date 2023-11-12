*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${expect}   MyDockerOnVM
${url}   http://localhost:8080/mygitweb/check4.html
${Browser}   headlesschrome
${delay}   1

*** Test Cases ***
1.Open Browser
    Open Browser   ${url}   ${Browser}   options=add_argument("--headless"); add_argument("no-sandbox")
    Set Selenium Speed   0.3
2. Check page info
    ${result}    Get Text   xpath=(/html/body/p[3])
    Log To Console   ${result}
    Should Contain   ${result}   ${expect}
3. close Browser
    Close Browser