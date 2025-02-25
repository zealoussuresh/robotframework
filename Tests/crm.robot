*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary


*** Variables ***
${BROWSER}  chrome



*** Test Cases ***
Should be able to add new customer
    [Documentation]    This is a some basic info about the test
    [Tags]    1006  Smoke   Contacts
    #Intialize Selenium
    set selenium speed    .2s
    set selenium timeout   10s

    #open the browser
    log             Starting the test case
    open browser    https://automationplayground.com/crm/       ${BROWSER}
    maximize browser window

    # validate page load
    page should contain    Customers Are Priority One

    #click on sign in link
    click link    SignIn    # can use xpath or css selector as well
    page should contain button    Submit

    #enter login credentials and submit form
    input text    id=email-id    test@demo.com
    input text    id=password    qwe
    click button  id=submit-id

    #add new customer
    wait until element is visible    id=new-customer
    click link      css:#new-customer
    wait until element is visible    xpath:.//div/.//button[contains(text(),'Submit')]
    input text    id=EmailAddress       test@demo.com
    input text    id=FirstName          John
    input text    id=LastName           Doe
    input text    id=City               Miami
    select from list by value    id=StateOrRegion   FL
    click element    css:input[name='gender'][value='male']
    wait until element is visible   css:input[name='promos-name'][value='promos-yes']
    click element    css:input[name='promos-name'][value='promos-yes']
    click button    Submit

    wait until page contains        New customer added.


    sleep           3s
    close browser






*** Keywords ***


