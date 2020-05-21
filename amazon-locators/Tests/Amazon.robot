*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results -i current tests/Amazon.robot
# robot -d results tests/Amazon.robot

*** Variables ***
${BROWSER} =  firefox
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458
${LOGIN_EMAIL} =  admin@robotrameworktutorial.com
${LOGIN_PASSWORD} =  myPassword1

*** Test Cases ***
Should be able to login
    [Tags]  Login
    AmazonApp.Login  ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}

Logged out user should be able to search for products
    [Tags]  search
    AmazonApp.Search for Products  ${SEARCH_TERM}

Search results page should contain 30 products
    [Tags]  Current
    AmazonApp.Search for Products  ${SEARCH_TERM}
    AmazonApp.Verify Results Page Contains Products  30

Logged out user should be able to view a product
    AmazonApp.Search for Products  ${SEARCH_TERM}
    AmazonApp.Select Product from Search Results

Logged out user should be able to add product to cart
    AmazonApp.Search for Products  ${SEARCH_TERM}
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart

Logged out user should be asked to sign in to check out
    AmazonApp.Search for Products  ${SEARCH_TERM}
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout
