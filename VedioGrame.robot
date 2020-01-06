*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${bese_url}     http://localhost:8080
${path}         /app/videogames

*** Test Cases ***
TC1:Returns all the videogames(GET)
     create session    mysession   ${bese_url}
     ${response}=    get request    mysession   ${path}
     Log to console    ${response.status_code}
     Log to console    ${response.content}

     #Validation
     ${status_code}=    Convert To String    ${response.status_code}
     Should Be Equal    ${status_code}    200
# TC2:Add a new videogames(Post)
#      create session    mysession   ${bese_url}
#      ${data}=    Create Dictionary
#              ...    id=12
#              ...    name=string
#              ...    releaseDate=2020-01-05T11:56:46.516Z
#              ...    reviewScore=0
#              ...    category=string
#              ...    rating=string
#      ${header}=    Create Dictionary    content-type=application/json
#      ${response}=    post request    mysession   ${path}    data=${data}     headers=${header}
#      Log to console    ${response.status_code}
#      Log to console    ${response.content}
#
#      #Validation
#      ${status_code}=    Convert To String    ${response.status_code}
#      Should Be Equal    ${status_code}    200
#
#      ${res_body}=      Convert To String    ${response.content}
#      Should Contain    ${res_body}    Record Added Successfully

TC3: Returns the details of a single game by ID(GET)
     create session    mysession   ${bese_url}
     ${response}=    get request    mysession   ${path}/12
     Log to console    ${response.status_code}
     Log to console    ${response.content}

     #Validation
     ${status_code}=    Convert To String    ${response.status_code}
     Should Be Equal    ${status_code}    200
     ${res_body}=      Convert To String    ${response.content}
     Should Contain    ${res_body}    string
Tc4:Returns the videogames(PUT)
     create session    mysession   ${bese_url}
     ${data}=    Create Dictionary
             ...    id=12
             ...    name=Test
             ...    releaseDate=2020-01-05T11:56:46.516Z
             ...    reviewScore=100
             ...    category=Teerapan
             ...    rating=Ma
     ${header}=    Create Dictionary    content-type=application/json
     ${response}=    put request    mysession   ${path}/12    data=${data}     headers=${header}
     Log to console    ${response.status_code}
     Log to console    ${response.content}

     #Validation
     ${status_code}=    Convert To String    ${response.status_code}
     Should Be Equal    ${status_code}    200

     ${res_body}=      Convert To String    ${response.content}
     Should Contain    ${res_body}    Test
