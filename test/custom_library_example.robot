*** Settings ***
Documentation    Test the contact Python script
Library    OperatingSystem
Library    library/contact_lib.py

*** Variables ***
${APPLICATION_PATH}    ../contact.py

*** Test Cases ***
Empty Contacts List    [Documentation]    Verify the output of an empty contacts list
    [Setup]    Clear Contacts List    ${APPLICATION_PATH}
    ${output} =    Retrieve Contacts List    ${APPLICATION_PATH}
    Should Be Equal As Strings    ${output}    []

Add Contact    [Documentation]    Verify adding a contact
    [Setup]    Clear Contacts List    ${APPLICATION_PATH}
    Add Contact    ${APPLICATION_PATH}    first_name=Aine    last_name=Sloan
    ${output} =    Retrieve Contacts List    ${APPLICATION_PATH}
    Should Be Equal    ${output}    ['Aine Sloan']
    [Teardown]    Clear Contacts List    ${APPLICATION_PATH}