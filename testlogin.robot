*** Settings ***
Library SeleniumLibrary

*** Variables ***
${expect} My Test App
${url} http://demo.apichon.com/
${Browser} chrome
${delay} 1

*** Test Cases ***
1. Open Website
    Open Browser ${url} ${Browser} options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Set Selenium Speed 0.3
2. Input username and password
    Input Text id=username karn.yong@melivecode.com
    Input Text id=password melivecode
3. Login
    Click Button id=loginbutton
4. Check page info
    ${result} Get Text xpath=(/html/body/nav/div/a)
    Log To Console ${result}
    Should Contain ${result} ${expect}
5. Login out
    Click Element xpath=(/html/body/nav/div/div/ul/li/a)
    Click Element xpath=(/html/body/nav/div/div/ul/li/ul/li/a)
6. close Browser
    Close Browser