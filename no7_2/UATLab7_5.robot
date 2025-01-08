*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${VALID FIRST NAME}    Somsong
${VALID LAST NAME}     Sandee
${VALID DESTINATION}   Europe
${VALID CONTACT PERSON}    Sodsai Sandee
${VALID RELATIONSHIP}  Mother
${VALID EMAIL}         somsong@kkumail.com
${EMPTY PHONE}         ${EMPTY}
${ERROR MESSAGE}       Please enter a phone number.

*** Test Cases ***

Test Case 1 - Open Browser
    [Documentation]    Open the form page in the browser.
    Open Form Page

Test Case 2 - Input Form with Missing Phone Number
    Submit Form and Verify Errors    ${VALID FIRST NAME}    ${VALID LAST NAME}    ${VALID DESTINATION}    ${VALID CONTACT PERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${EMPTY PHONE}    ${ERROR MESSAGE}
