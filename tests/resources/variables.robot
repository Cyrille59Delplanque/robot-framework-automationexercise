*** Settings ***
Library    OperatingSystem

*** Variables ***

&{MONTHSCYD}    Jan=1    Feb=2    Mar=3    Apr=4    May=5    Jun=6    
...          Jul=7    Aug=8    Sep=9    Oct=10    Nov=11    Dec=12

#General
${url}    http://automationexercise.com
${browser}    chrome

#Cookie
${button_accept_for_cookie}    class=fc-primary-button

#Home
${presentation}    id=slider
${title_presentation}    tag=h1

#Nav Bar
${to_product}    xpath=//a[.=' Products']
${to_signup}    xpath=//a[contains(.,'Signup / Login')]
${login_in_as}    xpath=//a[contains(.,'Logged in as')]/b

#Product
${product_title}    xpath=//h2[@class='title text-center']
${search_bar}    id=search_product
${search_bar_button}    id=submit_search
${all_items}    class=features_items
${description_of_item}    xpath=//div[@class='product-overlay']//p
${add_to_cart_of_all_items}    xpath=//div[@class='product-overlay']//a[.='Add to cart']
${text_modal}    xpath=//div[@class='modal_content']//h4
${modal_button}    xpath=//div[@class='modal_content']//button

#Login
${name}=    name=name
${email_login}=    xpath=//*[@data-qa='login-email']
${email_signup}=    xpath=//*[@data-qa='signup-email']    
${password_login}=    name=password
${sign_up_button}    xpath=//*[@data-qa='signup-button']
${login_button}    xpath=//*[@data-qa='login-button']
${login_title}    xpath=//*[@class='login-form']/h2
${signup_title}    xpath=//*[@class='signup-form']/h2
${continue_button}    xpath=//*[@data-qa='continue-button']

#Account Information
${account_title}    xpath=//*[@class='login-form']/b
${checkbox_mr}    id=id_gender1
${checkbox_mrs}    id=id_gender2
${password_account}    id=password
${days}    id=days
${months}    id=months
${years}    id=years

#Account Address
${first_name}    id=first_name
${last_name}    id=last_name
${company}    id=company
${address1}    id=address1
${address2}    id=address2
${country}    id=country
${city}    id=city
${state}    id=state
${zipcode}    id=zipcode
${mobile_number}    id=mobile_number
${button_create_account}    xpath=//*[@data-qa='create-account']

#account created or deleted
${title}    xpath=//*[@id='form']/h2

# ${list_main_menu}    class:card-up
# ${input_search_box}    id=searchBox
# ${search_box_button}    id=basic-addon2
# ${table_data_row}    xpath://*[@role='rowgroup']
# ${table_data_cell}    xpath:./descendant::*[@role='gridcell']

# ${login}    xpath://li[.='Login']
# ${selectable}    xpath://li[.='Selectable']
# ${datepicker}    xpath://li[.='Date Picker']
# ${alerts}    xpath://li[.='Alerts']
# ${checkbox}    xpath://li[.='Check Box']
# ${morbiselect}    xpath://li[.='Morbi leo risus']
# ${crasselect}    xpath://li[.='Cras justo odio']
# ${nineselect}    xpath://li[.='Nine']
# ${fiveselect}    xpath://li[.='Five']
# ${oneselect}    xpath://li[.='One']
# ${dapibusselect}    xpath://li[.='Dapibus ac facilisis in']
# ${portaselect}    xpath://li[.='Porta ac consectetur ac']

# ${newuserbutton}    newUser
# ${newuserfirstname}    firstname
# ${newuserlastname}    lastname
# ${newuserusername}    userName
# ${newuserpassword}    password
# ${newuserregisterbutton}    register
# ${newusergotologin}    gotologin
# ${userlogin}    login

# ${loggedusername}    userName-value

# ${captcha}    g-recaptcha

# ${gotogrid}    demo-tab-grid
# ${gotolist}    demo-tab-list

# ${list_isactive}    mt-2 list-group-item active list-group-item-action
# ${list_isinactive}     mt-2 list-group-item list-group-item-action

# ${dateandtime}    dateAndTimePickerInput

# ${alertbutton}    alertButton
# ${timeralertbutton}    timerAlertButton
# ${confirmbutton}    confirmButton
# ${promptbutton}    promtButton

# ${confirmresult}    confirmResult
# ${promptresult}    promptResult

# ${checkboxexpandall}    xpath://*[@title='Expand all']
# ${home}    xpath://*[@for='tree-node-home']
# ${office}    xpath://*[@for='tree-node-office']
# ${excelfile}    xpath://*[@for='tree-node-excelFile']

