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
    Sleep  0.5

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

Go to SignUp
    [Documentation]    Go to ProductsPage
    Click Link    ${to_signup}

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
    # read the raw data
    ${json}=    Get file    ./tests/resources/user_data.json
    # convert the data to a python object
    ${user_dict}=    Evaluate    json.loads('''${json}''')    json
    #Input Data
    Input Text    ${name}    ${user_dict['${user}']["Name"]}
    Input Text    ${email_signup}    ${user_dict['${user}']["Email"]}
    Click Button    ${sign_up_button}

Input ${user} in Account Information 
    # read the raw data
    ${json}=    Get file    ./tests/resources/user_data.json
    # convert the data to a python object
    ${user_dict}=    Evaluate    json.loads('''${json}''')    json
    #Input Data
    IF    '${user_dict['${user}']["Gender"]}' == 'Mr'
        Click Element    ${checkbox_mr}
    ELSE
        Click Element    ${checkbox_mrs}
    END

    Input Password     ${password_account}    ${user_dict['${user}']["Password"]}
    
    @{parts}=    Split String    ${user_dict['${user}']["DateOfBirth"]}    ${SPACE}
    ${day}=    Set Variable    ${parts}[0]
    ${month}=    Set Variable    ${parts}[1]
    ${year}=    Set Variable    ${parts}[2]

    Select From List By Value    ${days}    ${day}
    ${month_number}=    Get From Dictionary    ${MONTHSCYD}    ${month}
    Select From List By Value    ${months}    ${month_number}
    Select From List By Value    ${years}    ${year}

Input ${user} in Account Address
    # read the raw data
    ${json}=    Get file    ./tests/resources/user_data.json
    # convert the data to a python object
    ${user_dict}=    Evaluate    json.loads('''${json}''')    json
    #Input Data
    Input Text    ${first_name}    ${user_dict['${user}']["First Name"]}
    Input Text    ${last_name}    ${user_dict['${user}']["Last Name"]}
    Input Text    ${company}    ${user_dict['${user}']["Company"]}
    Input Text    ${address1}    ${user_dict['${user}']["Address1"]}
    Input Text    ${address2}    ${user_dict['${user}']["Address2"]}
    Select From List By Value    ${country}    ${user_dict['${user}']["Country"]}
    Input Text    ${city}    ${user_dict['${user}']["City"]}
    Input Text    ${state}    ${user_dict['${user}']["State"]}
    Input Text    ${zipcode}    ${user_dict['${user}']["Zipcode"]}
    Input Text    ${mobile_number}    ${user_dict['${user}']["Mobile Number"]}

Verify SignUp
    ${title_text}=    Get Text    ${signup_title}
    Should Be Equal    ${title_text}    New User Signup!

${user} create account
    Go to SignUp
    Verify SignUp
    Input ${user} in Signup
    Input ${user} in Account Information 
    Input ${user} in Account Address
    Click Button    ${button_create_account}
    Wait Until Element Is Visible    ${continue_button}
    Click Element    ${continue_button}
    Verify ${user} is Logged

Verify ${user} is Logged
    ${text_of_user_logged}=    Get Text    ${login_in_as}
    Should Be Equal    ${text_of_user_logged}    ${user}

Add Products to Basket
    ${item_list_button_add_to_cart}=    Get WebElements    ${add_to_cart_of_all_items}
    FOR    ${i}    IN RANGE    2
        ${ele}=    Set Variable    ${item_list_button_add_to_cart}[${i}]
        Mouse Over    ${ele}
        # ${text_to_control}=    Get Text    ${text_modal}
        # Click Button    ${modal_button}
    END



 


# Go to Book Store Application
#     ${list_main_menu_webel}=    Get WebElements    ${list_main_menu}
#     Click Element    ${list_main_menu_webel}[5]

# Go to Interactions
#     ${list_main_menu_webel}=    Get WebElements    ${list_main_menu}
#     Click Element    ${list_main_menu_webel}[4]

# Go to Widgets
#     ${list_main_menu_webel}=    Get WebElements    ${list_main_menu}
#     Click Element    ${list_main_menu_webel}[3]

# Go to Alerts,Frame and Windows
#     ${list_main_menu_webel}=    Get WebElements    ${list_main_menu}
#     Click Element    ${list_main_menu_webel}[2]

# Go to Elements
#     ${list_main_menu_webel}=    Get WebElements    ${list_main_menu}
#     Click Element    ${list_main_menu_webel}[0]

# I Search ${name_to_search} on Book Store Application
#     Go to Book Store Application
#     Wait Until Page Contains Element    ${input_search_box}
#     Input Text    ${input_search_box}    ${name_to_search}
#     Click Element    ${search_box_button}
    
# The Author is ${name_of_author}
#     Screenshot.Take Screenshot
#     #have the value for table of data at first row and third column
#     ${table_row_datas}=    Get WebElements    ${table_data_row}   
#     ${children}=    Get Child Webelements    parent_element=${table_row_datas}[0]    child_xpath=${table_data_cell}
#     ${recovertext}=    SeleniumLibrary.Get Text    ${children}[2]
#     Should Be Equal     ${name_of_author}    ${recovertext}

# I Log as ${username} on Book Store Application
#     Go to Book Store Application
#     Click Element    ${login}
#     Click Button    ${newuserbutton}
#     # read the raw data
#          ${json}=    Get file    ./resources/user_data.json
#     # convert the data to a python object
#      ${login_dict}=    Evaluate    json.loads('''${json}''')    json
#      #INput Data
#      Input Text    ${newuserfirstname}    ${login_dict['${username}']['firstname']}
#      Input Text    ${newuserlastname}    ${login_dict['${username}']['lastname']}
#      Input Text    ${newuserusername}    ${username}
#      Input Password        ${newuserpassword}    ${login_dict['${username}']['password']}
#     #Click Captcha
#     ${url}=    Get Location
#     Click Element    ${captcha}
#     Sleep    500ms
#     Resolve Cyd Captcha
#     Click Button    ${newuserregisterbutton}
#     ${result}=    Run Keyword And Ignore Error    Alert Should Be Present    User Register Successfully.    
#     Run Keyword If    '${result[0]}' == 'PASS'    Log    Alert
#     Wait Until Element Is Visible    ${newusergotologin}
#     Click Button    ${newusergotologin}
#     Input Text    ${newuserusername}    ${username}
#     Input Password    ${newuserpassword}    ${login_dict['${username}']['password']}
#     Click Button    ${userlogin}
#     Wait Until Element Is Visible    ${loggedusername}

# I am Logged as ${username}
#     ${userdisplayed}=    SeleniumLibrary.Get Text    ${loggedusername}    
#     Should Be Equal    ${username}    ${userdisplayed} 

# I select Morbi leo risus and Cras justo odio on Interactions selectable
#     Go to Interactions
#     Click Element    ${selectable}
#     Element Attribute Value Should Be    ${morbiselect}    class    ${list_isinactive}
#     Element Attribute Value Should Be    ${crasselect}    class    ${list_isinactive}
#     Click Element    ${morbiselect}
#     Click Element    ${crasselect}
#     Element Attribute Value Should Be    ${morbiselect}    class    ${list_isactive}
#     Element Attribute Value Should Be    ${crasselect}    class    ${list_isactive}

# I select 591 in Grid on Interactions selectable
#     Click Element    ${gotogrid}
#     Click Element    ${fiveselect}
#     Click Element    ${nineselect}
#     Click Element    ${oneselect}

# I return to List Page
#     Click Element    ${gotolist}

# Morbi leo risus and Cras justo odio are selectionned
#     Element Attribute Value Should Be    ${morbiselect}    class    ${list_isactive}
#     Element Attribute Value Should Be    ${crasselect}    class    ${list_isactive}

# I set the 5th november 2035 23h45
#     Go to Widgets
#     Click Element    ${datepicker}
#     Wait Until Element Is Enabled    ${dateandtime}
#     Click Element    ${dateandtime}
#     SeleniumLibrary.Press Keys            ${dateandtime}    CTRL+A+DELETE   # Sélectionne tout
#     Input Text    ${dateandtime}    November 5, 2035 11:45 PM
#     Press Key    ${dateandtime}    ENTER
#     SeleniumLibrary.Press Keys            ${dateandtime}    ESC

# Date of 5th november 2035 23h45 is setted
#     ${textdate}=    Get Value    ${dateandtime}
#     Should Be Equal    ${textdate}    November 5, 2035 11:45 PM
#     Screenshot.Take Screenshot

# I select Alert ${selectiontext}
#     Go to Alerts,Frame and Windows
#     Click Element    ${alerts}
#     IF    '${selectiontext}'=='Normal'
#         Click Button    ${alertbutton}
#     ELSE IF    '${selectiontext}'=='Timer'
#         Click Button    ${timeralertbutton} 
#         ELSE IF    '${selectiontext}'=='Confirm'
#             Click Button    ${confirmbutton}
#             ELSE IF    '${selectiontext}'=='Prompt'
#                 Click Button    ${promptbutton}
#                 END

                

# I am able to verify the Alert ${selectiontext} action is correct
#     IF    '${selectiontext}'=='Normal'
#         Alert Should Be Present    You clicked a button
#     ELSE IF    '${selectiontext}'=='Timer'
#         Sleep    5s
#         Alert Should Be Present    This alert appeared after 5 seconds 
#         ELSE IF    '${selectiontext}'=='Confirm'
#             Alert Should Be Present    Do you confirm action?
#             ${textconfirm}=    SeleniumLibrary.Get Text    ${confirmresult}
#             Should Be Equal    You selected Ok    ${textconfirm}
#             ${coloroftext}=    Get Css Property    ${confirmresult}    color
#             Should Be Equal    rgba(40, 167, 69, 1)    ${coloroftext} 
#             ELSE IF    '${selectiontext}'=='Prompt'
#                 Alert Should Be Present    Please enter your name    LEAVE
#                 Input Text Into Alert    Cyrille
#                 ${textconfirm}=    SeleniumLibrary.Get Text    ${promptresult}
#                 Should Be Equal    You entered Cyrille    ${textconfirm} 
#                 ${coloroftext}=    Get Css Property    ${promptresult}    color
#                 Should Be Equal    rgba(40, 167, 69, 1)    ${coloroftext} 
#             END

# I select checkbox except Office and Excel file.doc
#     Go to Elements
#     Click Element    ${checkbox}
#     Click Element    ${checkboxexpandall}
#     Click Element    ${home}
#     Click Element    ${office}
#     Click Element    ${excelfile}

# All elements except Office and Excel file.doc are selected
#     Checkbox Should Not Be Selected    tree-node-home
#     Checkbox Should Be Selected    tree-node-desktop
#     Checkbox Should Be Selected    tree-node-notes
#     Checkbox Should Be Selected    tree-node-commands
#     Checkbox Should Not Be Selected    tree-node-documents
#     Checkbox Should Be Selected    tree-node-workspace
#     Checkbox Should Be Selected    tree-node-react
#     Checkbox Should Be Selected    tree-node-angular
#     Checkbox Should Be Selected    tree-node-veu
#     Checkbox Should Not Be Selected    tree-node-office
#     Checkbox Should Not Be Selected    tree-node-public
#     Checkbox Should Not Be Selected    tree-node-private
#     Checkbox Should Not Be Selected    tree-node-classified
#     Checkbox Should Not Be Selected    tree-node-general
#     Checkbox Should Not Be Selected    tree-node-downloads
#     Checkbox Should Be Selected    tree-node-wordFile
#     Checkbox Should Not Be Selected    tree-node-excelFile
