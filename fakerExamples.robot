*** Settings ***
Library                 QForce
Library                 String
Library                 FakerLibrary

Suite Setup             Open Browser               about:blank        chrome
Suite Teardown          CloseAllBrowsers

*** Variables ***
${leads.new_lead}

*** Test Cases ***
Generate Randoms
    # In a cloud container the random value is always the same so initialize generator first
    Evaluate            random.seed()              random
    # From String library
    # https://robotframework.org/robotframework/latest/libraries/String.html#Generate%20Random%20String
    ${str}=             Generate Random String     length=5           chars=[LETTERS][NUMBERS]
    Log                 ${str}                     console=${True}
    # From FakerLibrary
    # https://marketsquare.github.io/robotframework-faker/#Random%20Number
    ${nbr}=             Random Number              digits=5           fix_len=5
    Log                 ${nbr}                     console=${True}
    # From Builtin
    # https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Catenate
    ${combination}=     Catenate                   SEPARATOR=         ${str}                      ${nbr}
    Log                 ${combination}             console=${True}

Generate Random Persona data
    [Documentation]
    [Tags]
    ${first_name}=      FakerLibrary.first_name
    ${last_name}=       FakerLibrary.last_name
    ${email}=           FakerLibrary.email
    ${mobile_phone}=    Generate Random String     10                 [NUMBERS]