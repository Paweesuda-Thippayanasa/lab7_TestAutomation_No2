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
${VALID PHONE}         081-111-1234
${COMPLETE TITLE}      Completed
${COMPLETE MESSAGE 1}  Our agent will contact you shortly.
${COMPLETE MESSAGE 2}  Thank you for your patient.

*** Test Cases ***

Test Case 1 - Open Browser
    [Documentation]    Open the form page in the browser.
    Open Form Page

Test Case 2 - Input Form with Complete Data
    [Documentation]    Verify the form submission process when all fields are correctly filled.
    Submit Form and Verify Errors    ${VALID FIRST NAME}    ${VALID LAST NAME}    ${VALID DESTINATION}    ${VALID CONTACT PERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}    ${COMPLETE MESSAGE 1}
    Verify Successful Submission
