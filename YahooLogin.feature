Feature: My Feature

# Background: Open Chrome
# Given I assign "text" to variable "searchTxt"
# Given I assign 30 to variable "maxCount"
# Given I assign 1 to variable "counter"
# Given I assign "True" to variable "valid"
# Given I open "Chrome" web browser
# And I maximize web browser

@amazon
Scenario:Amazon
Given I navigate to "https://www.amazon.in" in web browser
And I wait 10 seconds
Once I click element "xPath://i[@class='hm-icon nav-sprite']" in web browser within 10 seconds
And I click element "xPath://div[text()='Amazon Prime Video']" in web browser within 5 seconds
And I click element "xPath://a[text()='All Videos']" in web browser within 5 seconds
Then I see "Prime Video" in web browser

@rediffTable
Scenario:Dyanamic Table
Given I navigate to "https://money.rediff.com/gainers/bse/daily/groupa?src=gain_lose" in web browser
Once I see "Top Gainers" in web browser
While I verify text $valid is equal to "True" ignoring case
		Then I copy value in row $counter column "Company" in table "xPath://table[@class='dataTable']" in web browser as variable "cmpName"
		And I echo $cmpName
        If I verify text $cmpName is equal to "Indian Bank" ignoring case
        	Then I copy value in row $counter column "Current Price (Rs)" in table "xPath://table[@class='dataTable']" in web browser as variable "currentPrice"
            And I echo $currentPrice
            And I assign "False" to variable "valid"
        Else  I increase variable "counter" by 1
        #I assign "False" to variable "valid" 
        EndIf
        
EndWhile



@dynamicTable
Scenario: Dynamic Table
And I assign "https://money.rediff.com/gainers/bse/daily/groupa?src=gain_lose" to variable "URL"
Given I navigate to $URL in web browser within 10 seconds
Then I prompt "Enter Company" and assign user response to variable "Company"
And I assign variable "validateCompany" by combining "xPath://a[.='" $Company "']"
#once i see an 
If I see element $validateCompany in web browser
 Then I execute scenario "dynamictableValue"
 Else I fail step with error message "Company Not Found in Table"
Endif

Scenario:dynamictableValue
Given I assign variable "datatable" by combining "xPath://th[.='Current Price (Rs)']//following::a[contains(text(),'" $Company "')]//following::td[3]"
Then I copy text inside element $datatable in web browser to variable "currentValue"


@rediff
Scenario:Rediff Account details
Given I navigate to "http://register.rediff.com/register/register.php?FormName=user_details" in web browser
When I click element "xPath://input[@type='checkbox']" in web browser within 5 seconds
And I click element "xPath://select[contains(@name,'DOB_Day')]//option[@value='10']" in web browser within $maxCount seconds


@google
Scenario:Google search
Given I assign variable "elt" by combining "xPath:(//span[contains(text(),'" $searchTxt "')])[2]"
Given I navigate to "https://www.google.co.in/" in web browser
And I wait 5 seconds
When I type $searchTxt in element "xPath://input[@name='q']" in web browser
And I wait 10 seconds
Then I click element $elt in web browser within 5 seconds
And I wait 10 seconds
once i see "Fancy Text Generator" in web browser
When I click element "xPath://a[text()='News']" in web browser
Then I see "Tech Behind Facebook's TextStyleBrush" in web browser

@wip
Scenario: Login to Yahoo
Given i navigate to "https://login.yahoo.com/?.src=ym&pspid=159600001&activity=mail-direct&.lang=en-IN&.intl=in&.done=https%3A%2F%2Fin.mail.yahoo.com%2Fd" in web browser within 5 seconds
#When I see value "<TEXT>" equals text in object "id:login-username" in java app within 5 seconds
When I type "seleniumbysonam@yahoo.com" in element "id:login-username" in web browser within 10 seconds
And I click element "id:login-signin" in web browser within 10 seconds
And I type "Yahoopass123" in element "id:login-passwd" in web browser within 5 seconds
Then I click element "id:login-signin" in web browser within 10 seconds
And I echo "Login done"

@alert
Scenario: Ksrtc bus search
When I navigate to "https://ksrtc.in/oprs-web/" in web browser
And I click element "id:corover-close-btn"in web browser within 10 seconds
And I click element "xPath://button[@class='btn btn-primary btn-lg btn-block btn-booking']"in web browser within 10 seconds
And I wait 5 seconds
Then  I press keys "Enter" in web browser
#Then I click ok on javascript modal


@wip
Scenario: Handle Browser
When I navigate to "https://www.naukri.com/" in web browser
And I wait 2 seconds
And I switch to "Next" tab in web browser 
And I wait 2 seconds
Then I close tab in web browser
And I switch to "Next" tab in web browser 
And I wait 2 seconds
Then I close tab in web browser
And I switch to "previous" tab in web browser 
and i switch to tab "1" in web browser
And I wait 5 seconds
Then i click element "xPath://span[text()='Sure']" in web browser within 2 seconds
And I hover mouse over element "xPath://div[text()='More']" in web browser
when i click element "xPath://a[@data-ga-track='Main Navigation More|Naukri Blog']" in web browser
then I echo "Open naukri blog"


@wip
Scenario: Delxplex.com
When I navigate to "https://delaplex.com/" in web browser
then I click element "xPath://a[contains(text(),'Accept')]" in web browser
and I echo "Accept cookie"
When I click element "xPath://a[contains(text(),'Supply Chain')][@tabindex='0']" in web browser within 2 seconds
and I click element "xPath://a[contains(text(),'TaaS ') ]" in web browser
Then I verify current URL is "https://delaplex.com/supply-chain-solutions-taas-testing-as-a-service/" in web browser

Scenario: Date
Given I execute Groovy """import java.time.*; dateStr = LocalDate.now()format("MM/dd/yyyy")"""
Then I echo $dateStr
And "Delxplex.com"

@write
Scenario:Write data to file
Given I echo "Creating file"
Given I assign "Dataset\sample.csv" to variable "filePath"
If I verify file $filePath exists
then I echo "File present"
Else I create file $filePath
EndIf
Then I append "Writing data to csv" to end of file $filePath
And I append "Next line data" to end of file $filePath
And I append "SOme imp data" to end of file $filePath

@list
Scenario:List creation
Given I echo "List creation"
When I create list "Fruits"
If I verify list "Fruits" is empty
Then I echo "Empty list"
EndIf
And I append element "Mango" to list "Fruits"
And I prepend element "Apple" to list "Fruits"
And I append element 1 to list "Fruits"
And I prepend element "Chikoo" to list "Fruits"
Then I echo $Fruits
And I sort list "Fruits"
Then I echo $Fruits
And I reverse list "Fruits"
Then I echo $Fruits


If I verify list "Fruits" contains "Mango"
Then I echo "Mango is in list"
Else I echo "Mango not in list"
EndIf

@notepad
Scenario:Open Notepad
Given I "Open Notepad"
And I wait 5 seconds
When I press keys "CTRL+ESC" 
And I wait 5 seconds
Then I enter "notepad" 
And I wait 5 seconds
And I press keys "Enter" 
Then I echo "Notepad Open" 


@MoneyRediff
Scenario: Automating money.rediff.com website
Given I open "chrome" web browser 
And I maximize web browser
And I navigate to "https://money.rediff.com/index.html" in web browser
And I click element "xPath://a[contains(text(),'Gainers / Losers')]" in web browser within 5 seconds
And I wait 5 seconds

#When I see "Top Gainers" in web browser
And I copy value in row "2" column "3" in table "xPath://table[@class='dataTable']" in web browser as variable "value"
And I wait 5 seconds
And I echo $value

@configRead
Scenario:Read from config
Given I assign value of "Name" from config file "Dataset\test.config" to variable "num1"
Given I assign values from config file "<CONFIG>" to variables
And I echo $num1
