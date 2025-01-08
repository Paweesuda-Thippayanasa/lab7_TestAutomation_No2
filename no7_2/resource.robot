*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    E:/year3_2/softwareEng/Lab7_Test_Automation/ChromeForTesting2/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     E:/year3_2/softwareEng/Lab7_Test_Automation/ChromeForTesting2/chromedriver-win64/chromedriver.exe
${SERVER}                  localhost:7272
${BROWSER}                 Chrome
${DELAY}                   0.2
${FORM URL}                http://${SERVER}/Form.html
${COMPLETE URL}            http://${SERVER}/Complete.html


*** Keywords ***
Open Form Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Form Data
    [Arguments]    ${first_name}    ${last_name}    ${destination}    ${contact_person}    ${relationship}    ${email}    ${phone}
    Input Text    id=firstname    ${first_name}
    Input Text    id=lastname    ${last_name}
    Input Text    id=destination    ${destination}
    Input Text    id=contactperson    ${contact_person}
    Input Text    id=relationship    ${relationship}
    Input Text    id=email    ${email}
    Input Text    id=phone    ${phone}

Submit Form and Verify Errors
    [Arguments]    ${first_name}    ${last_name}    ${destination}    ${contact_person}    ${relationship}    ${email}    ${phone}    ${error_message}
    Input Text    id=firstname    ${first_name}
    Input Text    id=lastname    ${last_name}
    Input Text    id=destination    ${destination}
    Input Text    id=contactperson    ${contact_person}
    Input Text    id=relationship    ${relationship}
    Input Text    id=email    ${email}
    Input Text    id=phone    ${phone}
    Click Button    id=submitButton
    Page Should Contain    ${error_message}

Verify Error Message
    [Arguments]    ${error_message}
    Location Should Be    ${FORM URL}
    Page Should Contain    ${error_message}

Verify Successful Submission
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly
    Page Should Contain    Thank you for your patient.
