*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${VALID FIRST NAME}    Somsong
${VALID LAST NAME}     Sandee
${VALID DESTINATION}   Europe
${VALID CONTACT PERSON}    Sodsai Sandee
${VALID RELATIONSHIP}  Mother
${INVALID EMAIL}         somsong@
${VALID PHONE}         081-111-1234
${ERROR MESSAGE}      Please enter a valid email address

*** Test Cases ***
Test Case 1 - Open Browser
    [Documentation]    Open the form page in the browser.
    Open Form Page

Test Case 2 - Input Form with Invalid Email:
    Submit Form and Verify Errors    ${VALID FIRST NAME}    ${VALID LAST NAME}    ${VALID DESTINATION}    ${VALID CONTACT PERSON}    ${VALID RELATIONSHIP}    ${INVALID EMAIL}    ${VALID PHONE}    ${ERROR MESSAGE}

