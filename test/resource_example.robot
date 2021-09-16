*** Settings ***
Documentation    Test the contact Python script
Library    OperatingSystem
Resource    data/contact.resource

*** Test Cases ***
Empty Contacts list    [Documentation]    Verify the output of an empty contacts list
    [Setup]    Clear Contacts List
    ${output} =    Retrieve Contacts List
    Should Be Equal    ${output}    []
Add Contact    [Documentation]    Verify adding an contact
    [Setup]    Clear Contacts List
    Add Contact    first_name=Simon    last_name=Miller
    ${output} =    Retrieve Contacts List
    Should Be Equal    ${output}    ['Simon Miller']
    [Teardown]    Clear Contacts List