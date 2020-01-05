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
