*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${expect}    MyDockerOnVM
${url}    http://localhost:8080/mygitweb/check4.html
${delay}    1

*** Keywords ***
Open Headless Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ${exclude_switches}=    Create List    enable-logging
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${exclude_switches}
    Create WebDriver    Chrome    options=${options}
    Set Window Size    1920    1080

*** Test Cases ***
1. Open Website
    Open Headless Chrome
    Go To    ${url}
    Set Selenium Speed    ${delay}

2. Check page info
    ${result}=    Get Text    xpath=//html/body/p[3]
    Log To Console    ${result}
    Should Contain    ${result}    ${expect}

3. Close Browser
    Close Browser
