*** Settings ***
Library      jsonparser.jsonparse    WITH NAME    user_attribute
Library      Collections

*** Variables ***
${path}    elements.json
${Node1}    phone1
${Node2}    phone2


*** Test cases ***
Load json elements
    Load mobile elements json    ${Node1}    ${Node2}

*** Keywords ***
Load mobile elements json
    [Arguments]    @{list}
    Set Suite variable    @{list}
    ${numberofphones}=    Get Length    ${list}
    : FOR    ${j}    IN RANGE    0    ${numberofphones}
    \    Set suite variable    ${j}
    \    ${user_result}=    user_attribute.getting_attributes_of_phones    ${path}    @{list}[${j}]
    \    Log    ${user_result}
    \    Test device details    ${user_result}



Test device details
    [Arguments]    ${user_result}
    LOG    ${user_result}
    :FOR  ${item}  IN  ${user_result}
    \    LOG    ${item}
    :FOR    ${key}    IN    @{user_result.keys()}
    \    ${value}=    Get From Dictionary    ${user_result}    ${key}
    \    Set suite Variable    ${@{list}[${j}].${key}}    ${value}
    \    Log    @{list}[${j}].${key},${value}


