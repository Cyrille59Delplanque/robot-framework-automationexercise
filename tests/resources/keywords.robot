*** Settings ***
Library    Collections
Library    Dialogs
Library    Screenshot
Library    String
Library    SeleniumLibrary
Resource   ../resources/variables.robot

Library    ../resources/LibraryCyd.py

*** Keywords ***
Zoom To 50%
    [Documentation]    Page Display to 50%
    Execute Javascript  document.body.style.zoom = '50%'
    Sleep  0.1

Accept Cookie
    ${button}=    Get Web Element    ${button_accept_for_cookie}
    Click Button    ${button}

Control HomePage
    [Documentation]    Control where are in HomePage
    ${presentation_element}=    Get WebElement    ${presentation}   
    ${child}=    Get Child Webelement    parent_element=${presentation_element}    child=${title_presentation}
    ${child_text}=    Get Text    ${child}
    Should Be Equal     ${child_text}    AutomationExercise

Go to ProductsPage
    [Documentation]    Go to ProductsPage
    Click Link    ${to_product}
    Zoom To 50%

Go to SignUp
    [Documentation]    Go to ProductsPage
    Click Link    ${to_signup}
    Zoom To 50%

Go to Cart
    [Documentation]    Go to Cart Page
    Click Link    ${to_cart}
    Zoom To 50%

Control ProductsPage
    [Documentation]    Control where are on ProductsPage
    [Arguments]    ${text_ref}
    ${product_title_on_site}=    Get Text    ${product_title}
    Should Be Equal    ${product_title_on_site}    ${text_ref}

I am on automationexercise website
    [Documentation]    Connect to site automationexercise
    ${index}=    Open Browser    ${url}    ${browser}
    Log    Index Screen ${index}   
    Delete All Cookies
    Maximize Browser Window
    Zoom To 50%
    Accept Cookie
    Control HomePage

On Page Products a User search ${product_to_search} in search bar
    [Documentation]     Search a product in search bar
    Go to ProductsPage
    Control ProductsPage    ALL PRODUCTS
    Input Text    ${search_bar}    ${product_to_search}
    Click Button    ${search_bar_button}

All products display contains ${words_to_contain}
    [Documentation]     Verify products contains
    Control ProductsPage    SEARCHED PRODUCTS
    ${all_item_element}=    Get WebElement    ${all_items}
    ${children}=    Get Child Webelements    parent_element=${all_item_element}    child=${description_of_item}
    FOR    ${index}    ${child}    IN ENUMERATE    @{children}
        ${child_text}=    Get Property    ${child}    textContent
        ${position}=    Evaluate    ${index}+1
        Should Contain    ${child_text}    ${words_to_contain}    msg=Fail! ${child_text} does not contain ${words_to_contain} at the product number ${position}
    END
    
Input ${user} in Signup
    ${user_dict}=    Get User Datas    ${user}
    Input Text    ${name}    ${user_dict["Name"]}
    Input Text    ${email_signup}    ${user_dict["Email"]}
    Click Button    ${sign_up_button}
    Zoom To 50%

Input ${user} in Account Information 
    ${user_dict}=    Get User Datas    ${user}
    IF    '${user_dict["Gender"]}' == 'Mr'
        Click Element    ${checkbox_mr}
    ELSE
        Click Element    ${checkbox_mrs}
    END

    Input Password     ${password_account}    ${user_dict["Password"]}
    
    @{parts}=    Split String    ${user_dict["DateOfBirth"]}    ${SPACE}
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]

    Select From List By Value    ${days}    ${day}
    ${month_number}=    Get From Dictionary    ${MONTHSCYD}    ${month}
    Select From List By Value    ${months}    ${month_number}
    Select From List By Value    ${years}    ${year}

Input ${user} in Account Address
    ${user_dict}=    Get User Datas    ${user}
    Input Text    ${first_name}    ${user_dict["First Name"]}
    Input Text    ${last_name}    ${user_dict["Last Name"]}
    Input Text    ${company}    ${user_dict["Company"]}
    Input Text    ${address1}    ${user_dict["Address1"]}
    Input Text    ${address2}    ${user_dict["Address2"]}
    Select From List By Value    ${country}    ${user_dict["Country"]}
    Input Text    ${city}    ${user_dict["City"]}
    Input Text    ${state}    ${user_dict["State"]}
    Input Text    ${zipcode}    ${user_dict["Zipcode"]}
    Input Text    ${mobile_number}    ${user_dict["Mobile Number"]}

Verify SignUp Page
    Wait Until Element Is Visible    ${signup_title}
    ${title_text}=    Get Text    ${signup_title}
    Should Be Equal    ${title_text}    New User Signup!

Verify Cart Page
    Wait Until Element Is Visible    ${shopping title}
    ${title_text}=    Get Text    ${shopping title}
    Should Be Equal    ${title_text}    Shopping Cart

${user} create account
    Go to SignUp
    Verify SignUp Page
    Input ${user} in Signup
    Verify AccountPage
    Input ${user} in Account Information 
    Input ${user} in Account Address
    Click Button    ${button_create_account}
    Verify Account Created
    Verify ${user} is Logged

Verify Account Page
    Wait Until Element Is Visible    ${account_title}
    ${account_page_title}=    Get Text    ${account_title}
    Should Be Equal    ${account_page_title}    ENTER ACCOUNT INFORMATION

Verify Account ${type_of_creation}
    Wait Until Element Is Visible    ${account_title}
    ${account_page_title}=    Get Text    ${account_title}
    IF    "${type_of_creation}" == "Created"
        Should Be Equal    ${account_page_title}    ACCOUNT CREATED!
    ELSE IF    "${type_of_creation}" == "Deleted"
        Should Be Equal    ${account_page_title}    ACCOUNT DELETED!
    END
    Wait Until Element Is Visible    ${continue_button}
    Click Element    ${continue_button}
    Zoom To 50%

Verify ${user} is Logged
    ${text_of_user_logged}=    Get Text    ${login_in_as}
    Should Be Equal    ${text_of_user_logged}    ${user}

Add ${nb_of_products} Products to Basket
    ${item_list_button_add_to_cart}=    Get WebElements    ${add_to_cart_of_all_items_to_move}
    ${item_list_button_add_to_cart_cl}=    Get WebElements    ${add_to_cart_of_all_items}
    FOR    ${i}    IN RANGE    ${nb_of_products}
        ${ele}=    Set Variable    ${item_list_button_add_to_cart}[${i}]
        ${ele_to_click}=    Set Variable    ${item_list_button_add_to_cart_cl}[${i}]
        Mouse Over    ${ele}
        Click Button    ${ele_to_click}
        Wait Until Element Is Visible    ${text_modal}
        ${text_to_control}=    Get Text    ${text_modal}
        Should Be Equal    ${text_to_control}    Added!
        Click Button    ${modal_button}
    END

Proceed to pay ${nb_of_products} ordered Products
    Add ${nb_of_products} Products to Basket
    Go to Cart
    Verify Cart Page
    Process to Checkout   

Process to Checkout
    Click Element    ${button_proceed_to_checkout}

Delete ${user} account
    Click Element    ${delete_account}
    Verify Account Deleted
 
Delivery Address of ${user} is confirmed
    Verify CheckOut
    Verify Address Title
    ${user_dict}=    Get User Datas    ${user}
    ${text_address_name}=    Get Text    ${address_name}
    ${text_reference}=    Evaluate    "${user_dict["Gender"]}" + ". " + "${user_dict["First Name"]}" + " " + "${user_dict["Last Name"]}"
    Should Be Equal    ${text_address_name}    ${text_reference}
    ${items_address}=    Get WebElements    ${address_add}
    ${text_address_company}=    Get Text    ${items_address}[0]
    ${text_address_address1}=    Get Text    ${items_address}[1]
    ${text_address_address2}=    Get Text    ${items_address}[2]
    Should Be Equal    ${text_address_company}    ${user_dict["Company"]}
    Should Be Equal    ${text_address_address1}    ${user_dict["Address1"]}
    Should Be Equal    ${text_address_address2}    ${user_dict["Address2"]}   
    ${text_reference}=    Evaluate    "${user_dict["City"]}" + " " + "${user_dict["State"]}" + " " + "${user_dict["Zipcode"]}"
    ${text_city}=    Get Text    ${address_city}
    Should Be Equal    ${text_reference}    ${text_city}
    ${text_country}=    Get Text    ${address_country}
    Should Be Equal    ${text_country}    ${user_dict["Country"]}
    ${text_phone}=    Get Text    ${address_phone}
    Should Be Equal    ${text_phone}    ${user_dict["Mobile Number"]}

Verify Address Title
    ${info_title}=    Get Text    ${address_title}
    Should Be Equal    ${info_title}    YOUR DELIVERY ADDRESS

Verify CheckOut
    Wait Until Element Is Visible    ${shopping title}
    ${title_text}=    Get Text    ${shopping title}
    Should Be Equal    ${title_text}    Checkout

Teardown Delete ${user} account
    Delete ${user} account
    Close Browser

Get User Datas
    [Arguments]    ${user}
    # read the raw data
    ${json}=    Get file    ./tests/resources/user_data.json
    # convert the data to a python object
    ${user_dict}=    Evaluate    json.loads('''${json}''')    json
    RETURN    ${user_dict}[${user}]
