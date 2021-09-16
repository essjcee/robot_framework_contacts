*** Settings ***
Documentation    Resource for Contact interactions
Library    OperatingSystem

*** Variables ***
${APPLICATION}    python ../contact.py

*** Keywords ***
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