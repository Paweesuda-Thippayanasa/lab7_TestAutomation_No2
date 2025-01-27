*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}  E:/year3_2/softwareEng/Lab7_Test_Automation/ChromeForTesting/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}   E:/year3_2/softwareEng/Lab7_Test_Automation/ChromeForTesting/chromedriver-win64/chromedriver.exe
${URL}                  https://www.kku.ac.th

*** Test Cases ***
TC_001: Start Chrome For Testing
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}  Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
