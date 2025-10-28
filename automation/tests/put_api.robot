*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Verify PUT Update Post API
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com/    verify=False
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    id=1    title=Updated Title    body=Testing PUT request    userId=1
    ${response}=    PUT On Session    jsonplaceholder    url=/posts/1    headers=${headers}    json=${body}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain    ${response.json()}    title
