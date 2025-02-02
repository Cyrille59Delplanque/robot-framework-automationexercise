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
${to_cart}    xpath=//a[contains(.,'Cart')]
${delete_account}    xpath=//a[contains(.,'Delete Account')]

#Product
${product_title}    xpath=//h2[@class='title text-center']
${search_bar}    id=search_product
${search_bar_button}    id=submit_search
${all_items}    class=features_items
${description_of_item}    xpath=//div[@class='product-overlay']//p
${add_to_cart_of_all_items_to_move}    xpath=//div[@class='productinfo text-center']//a
${add_to_cart_of_all_items}    xpath=//div[@class='product-overlay']//a
${text_modal}    xpath=//div[@class='modal-content']//h4
${modal_button}    xpath=//div[@class='modal-content']//button

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
${account_title}    xpath=//*[@class='title text-center']/b
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

#cart
${shopping title}    xpath=//*[@class='breadcrumb']//li[@class='active']
${button_proceed_to_checkout}    xpath=//*[@id='do_action']/div[@class='container']//a
#checkOut
${address_title}    xpath=//*[@class='address_title']//h3
${address_name}    xpath=//*[@class='address_firstname address_lastname']
${address_add}    xpath=//*[@class='address_address1 address_address2']
${address_city}    xpath=//*[@class='address_city address_state_name address_postcode']
${address_country}    xpath=//*[@class='address_country_name']
${address_phone}    xpath=//*[@class='address_phone']


