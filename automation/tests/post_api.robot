*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Verify POST Create Post API
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com/    verify=False
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    title=QA Test    body=Testing POST request    userId=1
    ${response}=    POST On Session    jsonplaceholder    url=/posts    headers=${headers}    json=${body}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    201
    Should Contain    ${response.json()}    id
