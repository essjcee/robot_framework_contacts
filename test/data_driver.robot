*** Settings ***
Documentation   Test the contact Python script, data driven approach
Library    OperatingSystem
Library    DataDriver    file=data_driver.csv    dialect=excel
Test Setup    Clear Contacts List
Test Teardown    Clear Contacts List
Test Template    Add Contact Template

*** Variables ***
${APPLICATION}    python ../contact.py

*** Test Cases ***
Add Contact ${first_name} ${last_name}

*** Keywords ***
Add Contact Template    [Documentation]    Template for verifying adding a contact
    [Arguments]    ${first_name}    ${last_name}
    Add Contact    first_name=${first_name}    last_name=${last_name}
    ${output} =    Retrieve Contacts List
    Should Be Equal    ${output}    ['${first_name} ${last_name}']

Clear Contacts List    [Documentation]    Clears the list of contacts
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} remove_all_contacts
    Should Be Equal As Integers    ${rc}    0

Retrieve Contacts List    [Documentation]    Return the list of contacts
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} list_contacts
    Should Be Equal As Integers    ${rc}    0
    [Return]    ${output}

Add Contact    [Documentation]    Add a contact to the list of contacts
    [Arguments]    ${first_name}    ${last_name}
    ${rc}    ${output} =    Run and Return RC and Output    ${APPLICATION} add_contact ${first_name} ${last_name}
    Should Be Equal As Integers    ${rc}    0