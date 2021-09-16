*** Settings ***
Documentation    Test the contact Python script, data driven approach
Library    OperatingSystem

*** Variables ***
${APPLICATION}    python ../contact.py

*** Test Cases ***
Empty Contacts List    [Documentation]    Verify the output of an empty contacts list
    [Setup]    Clear Contacts List
    ${output} =    Retrieve Contacts List
    Should Be Equal    ${output}    []

Add Contact    [Documentation]    Verify adding a contact
    [Template]    Add Contact Template
    first_name=John    last_name=Doe
    first_name=Monty    last_name=Python
    first_name=Susan    last_name=Jones

*** Keywords ***
Add Contact Template    [Documentation]    Template for verifying adding a contact
    [Arguments]    ${first_name}    ${last_name}
    Clear Contacts List
    Add Contact    first_name=${first_name}    last_name=${last_name}
    ${output} =    Retrieve Contacts List
    Should Be Equal    ${output}    ['${first_name} ${last_name}']
    [Teardown]    Clear Contacts List

Clear Contacts List    [Documentation]    Clears the list of contacts
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} remove_all_contacts
    Should Be Equal As Integers    ${rc}    0

Retrieve Contacts List    [Documentation]    Return the list of contacts
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} list_contacts
    Should Be Equal As Integers    ${rc}    0
    [Return]    ${output}

Add Contact    [Documentation]    Add a contacts to the list of contacts
    [Arguments]    ${first_name}    ${last_name}
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} add_contact ${first_name} ${last_name}
    Should Be Equal As Integers    ${rc}    0