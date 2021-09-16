*** Settings ***
Documentation    Test the contact Python script
Library          OperatingSystem

*** Variables ***
${APPLICATION}    python ../contact.py

*** Test Cases ***
Empty Contacts List    [Documentation]    Verify the output of an empty contacts list
    [Setup]    Clear Contacts List
    ${rc}    ${output} =    Run And Return Rc And Output    ${APPLICATION} list_contacts
    Should Be Equal As Integers    ${rc}    0
    Should Be Equal    ${output}    []

Add Contact    [Documentation]    Verify adding a contact
    [Setup]    Clear Contacts List
    ${rc}    ${output} =    Run And Return Rc And Output    ${APPLICATION} add_contact Joe Smyth
    Should Be Equal As Integers    ${rc}    0
    ${rc}    ${output} =    Run And Return Rc And Output    ${APPLICATION} list_contacts
    Should Be Equal As Integers    ${rc}    0
    Should Be Equal    ${output}    ['Joe Smyth']
    [Teardown]    Clear Contacts List

*** Keywords ***
Clear Contacts List    [Documentation]    Clears the list of contacts
    ${rc}    ${output} =    Run And Return Rc And Output    ${APPLICATION} remove_all_contacts
    Should Be Equal As Integers    ${rc}    0