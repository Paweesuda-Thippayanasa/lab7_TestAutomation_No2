*** Settings ***
Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${VALID FIRST NAME}    Somsong
${VALID LAST NAME}     Sandee
${VALID CONTACT PERSON}    Sodsai Sandee
${VALID RELATIONSHIP}  Mother
${VALID EMAIL}         somsong@kkumail.com
${VALID PHONE}         081-111-1234
${ERROR MESSAGE}      Please enter your destination.

*** Test Cases ***
Test Case 1 - Open Browser
    [Documentation]    Open the form page in the browser.
    Open Form Page

Test Case 2 - Input Form with Missing Destination
    [Documentation]    Verify the form submission process when the "Destination" field is left empty.
    Submit Form and Verify Errors    ${VALID FIRST NAME}    ${VALID LAST NAME}    ${EMPTY}    ${VALID CONTACT PERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}    ${ERROR MESSAGE}
