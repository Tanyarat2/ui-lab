*** Settings ***
Documentation     Test case QP-01, A custom pizza reaches the admin list.
Resource          resources/quickpizza.resource
Test Teardown     Close Browser
Library           DateTime

*** Test Cases ***
QP-01 A Custom Pizza Reaches The Admin List
    [Documentation]    A pizza request with restrictions gives a pizza that
    ...    keeps them, rating needs a login, and the admin sees the pizza.
    # QP-01 step 1
    Open QuickPizza
    # QP-01 step 2
    Turn On Advanced
    # QP-01 step 3
    ${stamp}=    Get Current Date    result_format=%Y%m%d-%H%M%S
    ${name}=    Set Variable    Lab Pizza ${stamp}
    Fill In The Pizza Request    600    Knife    ${name}
    Capture Page Screenshot    qp01-step3-fields.png
    # QP-01 step 4
    Ask For A Pizza
    ${tool}=    Recommendation Should Keep The Restrictions
    ...    ${name}    Knife    600
    Capture Element Screenshot    id:recommendations    qp01-step4-pizza.png
    # QP-01 step 5
    Rate The Pizza Without Logging In
    Capture Page Screenshot    qp01-step5-login-needed.png
    # QP-01 step 6
    Log In As Admin    admin    admin
    # QP-01 step 7
    Admin List Should Show The Pizza    ${name}    ${tool}
    Capture Page Screenshot    qp01-step7-admin-list.png
