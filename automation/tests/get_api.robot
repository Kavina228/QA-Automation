*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Verify GET Users API
    Create Session    reqres    https://reqres.in/    verify=False
    ${response}=    GET On Session    reqres    url=/api/users?page=2
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain    ${response.json()}    data
