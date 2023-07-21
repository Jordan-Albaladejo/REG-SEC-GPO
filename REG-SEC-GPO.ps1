# Terms and Conditions:

# ******************************************************************************************************
# WARNING: AUDITING AND REPORTING REGISTRY VALUES AND GROUP POLICY CONFIGURATIONS
# ******************************************************************************************************

#This PowerShell script is designed to conduct audits and generate reports for registry values and Group Policy Object configurations. It will not make any modifications to the registry system or any GPO configurations.

#IMPORTANT:
#Even though this script does not intend to modify the registry or any Group Policy Object configurations, improper usage or misunderstanding of the script's output may lead to unintended consequences. It is crucial to thoroughly inspect and understand the script's actions before executing it.

#BEFORE EXECUTION:
#Consult with the Chief Information Security Officer (CISO), Chief Financial Officer (CFO), Chief Technology Officer (CTO), risk management personnel, compliance management personnel, system administrators, and other relevant parties in your organisation.
#Ensure that you have thoroughly reviewed and understood the script's actions and potential impact.

#DISCLAIMER:
#This script is a work in progress, created with the assistance of ChatGPT, and may contain bugs and/or vulnerabilities. Therefore, it should be used at your own discretion and risk. The creator of this script cannot be held responsible for any damages or issues caused by its execution.

#By running this script, you assume all risks and liabilities associated with auditing the registry system and Group Policy Object configurations. The creator of this script cannot be held responsible for any damages or issues caused by #its execution.

#DISCLAIMER:
#This script is provided as a free resource, without warranties or liabilities of any kind. The creator of this script makes no guarantee regarding its accuracy, reliability, or suitability for any specific purpose. By using this #script, you agree that the creator shall not be held liable for any direct, indirect, incidental, special, exemplary, or consequential damages arising from the use or inability to use this script.

#ADDITIONAL INFORMATION:

#The script is not a substitute for professional security and compliance assessments. It aids in auditing and reporting, but a comprehensive security review should be performed separately.
#Before executing this script, ensure that you have backups of critical data and registry configurations. In the event of any issues, you can restore the system to a known good state.
#The script may require administrative privileges to access registry and Group Policy configurations. Run it with appropriate permissions to avoid any limitations or errors.
#Always verify the script's integrity and authenticity before use. Use the latest version from a trusted source to avoid potential security risks.
#The script may interact with network resources or external systems for reporting. Ensure that it complies with your organisation's security policies and does not expose sensitive information.
#Regularly update and review the script to incorporate improvements, security patches, or updates from the community.
#Any feedback or suggestions to enhance the script's security and reliability are welcome and should be shared with the script's creator.
#Compliance with data protection regulations and other legal requirements is essential when using this script. Verify that it aligns with your organisation's legal obligations.
#The script may include optional parameters or configurations. Ensure that you understand their implications before enabling or disabling them.

#Consult with the relevant parties and obtain necessary permissions before proceeding. Ensure that you have thoroughly reviewed and understood the script's actions and potential impact before executing it.



#########################################################################################################################################################################################################
########################################################################## - Terms and Conditions User agreement prompt. - ##############################################################################

# Display the disclaimer to the user
function Show-Disclaimer {
    $disclaimer = @"

Terms and Conditions:

 ******************************************************************************************************
 WARNING: AUDITING AND REPORTING REGISTRY VALUES AND GROUP POLICY CONFIGURATIONS
 ******************************************************************************************************

This PowerShell script is designed to conduct audits and generate reports for registry values and Group Policy Object configurations. It will not make any modifications to the registry system or any GPO configurations.

IMPORTANT:
Even though this script does not intend to modify the registry or any Group Policy Object configurations, improper usage or misunderstanding of the script's output may lead to unintended consequences. It is crucial to thoroughly inspect and understand the script's actions before executing it.

BEFORE EXECUTION:
Consult with the Chief Information Security Officer (CISO), Chief Financial Officer (CFO), Chief Technology Officer (CTO), risk management personnel, compliance management personnel, system administrators, and other relevant parties in your organisation.
Ensure that you have thoroughly reviewed and understood the script's actions and potential impact.

DISCLAIMER:
This script is a work in progress, created with the assistance of ChatGPT, and may contain bugs and/or vulnerabilities. Therefore, it should be used at your own discretion and risk. The creator of this script cannot be held responsible for any damages or issues caused by its execution.

By running this script, you assume all risks and liabilities associated with auditing the registry system and Group Policy Object configurations. The creator of this script cannot be held responsible for any damages or issues caused by its execution.

DISCLAIMER:
This script is provided as a free resource, without warranties or liabilities of any kind. The creator of this script makes no guarantee regarding its accuracy, reliability, or suitability for any specific purpose. By using this script, you agree that the creator shall not be held liable for any direct, indirect, incidental, special, exemplary, or consequential damages arising from the use or inability to use this script.

ADDITIONAL INFORMATION:

The script is not a substitute for professional security and compliance assessments. It aids in auditing and reporting, but a comprehensive security review should be performed separately.
Before executing this script, ensure that you have backups of critical data and registry configurations. In the event of any issues, you can restore the system to a known good state.
The script may require administrative privileges to access registry and Group Policy configurations. Run it with appropriate permissions to avoid any limitations or errors.
Always verify the script's integrity and authenticity before use. Use the latest version from a trusted source to avoid potential security risks.
The script may interact with network resources or external systems for reporting. Ensure that it complies with your organisation's security policies and does not expose sensitive information.
Regularly update and review the script to incorporate improvements, security patches, or updates from the community.
Any feedback or suggestions to enhance the script's security and reliability are welcome and should be shared with the script's creator.
Compliance with data protection regulations and other legal requirements is essential when using this script. Verify that it aligns with your organisation's legal obligations.
The script may include optional parameters or configurations. Ensure that you understand their implications before enabling or disabling them.

Consult with the relevant parties and obtain necessary permissions before proceeding. Ensure that you have thoroughly reviewed and understood the script's actions and potential impact before executing it.
"@

    Write-Host $disclaimer
}

# Prompt the user to read the disclaimer and confirm understanding
function Prompt-UserConfirmation {
    Write-Host "
Do you agree to the terms and conditions of this script? (Type 'YES' to confirm)" -ForegroundColor Blue
    $input = Read-Host
    if ($input.ToUpper() -ne "YES") {
        Write-Host "You must agree to the terms and conditions to proceed. Exiting script..." -ForegroundColor Red
        Start-Sleep -Seconds 3
        exit
    }
}

# Call the functions to display the disclaimer and prompt user confirmation
Show-Disclaimer
Prompt-UserConfirmation



#########################################################################################################################################################################################################
########################################################################## - Show-off screen for tool. - ################################################################################################


$colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')
$text = "
_____________________ ________            _____________________________             __________________   _____   
\______   \_   _____//  _____/           /   _____/\_   _____/\_   ___ \           /  _____/\______   \ /  _  \  
 |       _/|    __)_/   \  ___   ______  \_____  \  |    __)_ /    \  \/   ______ /   \  ___ |     ___//  | |  \ 
 |    |   \|        \    \_\  \ /_____/  /        \ |        \\     \____ /_____/ \    \_\  \|    |   /   |_|   \
 |____|_  /_______  /\______  /         /_______  //_______  / \______  /          \______  /|____|   \_________/
        \/        \/        \/                  \/         \/         \/                  \/                   
" 
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Count]
    $char = $text[$i]

    Write-Host $char -ForegroundColor $color -NoNewline
}

Write-Host " REG-SEC-GPO v1.1 - P.O.C."


Write-Host "

Provided by:"

Write-Host "Jordan Albaladejo, Owner of: 
"

Write-Host "Ingest services" -ForegroundColor Magenta

Write-Host "www.ingestservices.net" -ForegroundColor Blue

Write-Host "
With the help of ChatGPT.
" -ForegroundColor Green


#########################################################################################################################################################################################################
########################################################################## - Menu Choice - ##############################################################################################################

Write-Host "
[1] Installer"
Write-Host "[2] REG (Registry Audit Tool)"
Write-Host "[3] SEC (Security Audit Tools)"
Write-Host "[4] GPO (Group Policy Objects Audit Tool)"
Write-Host "[x] Exit"

Write-Host "

"

# Prompt user to run the following code.
$TopMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '1') {

Write-Host "You have selected Installer." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice1 = 'True'
}

# # # # # # ################################################################# - Menu Choice 2 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '2') {

Write-Host "You have selected Registry Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice2 = 'True'
}

# # # # # # ################################################################# - Menu Choice 3 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '3') {

Write-Host "You have selected Security Audit Tools." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice3 = 'True'
}

# # # # # # ################################################################# - Menu Choice 3 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '4') {

Write-Host "You have selected Group Policy Objects Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice4 = 'True'
}


# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($TopMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}





if ($TopMenuChoice1 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v1.1 - Installer - ###########################################################################
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	
#########################################################################################################################################################################################################
########################################################################## - Terms and Conditions - #####################################################################################################

# Display the terms and ask for user agreement
function Show-TermsAndAskForAgreement {
    $terms = @"
********************************************************************************
Terms and Conditions:

This script is a proof of concept, early in development, and has been created with the help of ChatGPT. The creator takes no responsibility for any code repercussions as this script is open source and provided as is, with no promises of any kind.

By typing 'AGREE' below, you acknowledge that you have read and understood the terms and agree to use the script at your own risk.

********************************************************************************
"@

    Write-Output $terms
    $userInput = Read-Host "Type 'AGREE' to proceed or any other key to exit."

    if ($userInput -ne "AGREE") {
        Write-Host "You did not agree to the terms. The script will now exit." -ForegroundColor Red
        Start-Sleep -Seconds 3
        exit
    }
}

# Prompt user to agree to terms
Show-TermsAndAskForAgreement


Write-Host "You have agreed to the terms. The script will now proceed." -ForegroundColor Green

# Prompt user to run the following code.
$choice = Read-Host "By proceeding, this script will create the file directory 'Ingestservices' and all dependencies in the C:/ drive, do you agree to proceed?  (Y/N)"

#########################################################################################################################################################################################################
########################################################################## - IF (N) - ###################################################################################################################

if ($choice -eq 'N') {

Write-Host "You have selected not to proceed." -ForegroundColor Red
Write-Host "Script is about to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}

#########################################################################################################################################################################################################
########################################################################## - IF (Y) - ###################################################################################################################

if ($choice -eq 'Y') {

Write-Host "You have agreed to proceed." -ForegroundColor Green
Write-Host "Script is about to proceed. Please wait..."
Start-Sleep -Seconds 3

#########################################################################################################################################################################################################
########################################################################## - Creating directory for tool. - #############################################################################################

# Creates directory if it does not exist.
Set-Location 'C:\Program Files (x86)'
md Ingestservices
Set-Location 'C:\Program Files (x86)\Ingestservices'
md REG-SEC-GPO
Set-Location 'C:\Program Files (x86)\Ingestservices\REG-SEC-GPO'
md Tapes
md Results
Set-Location 'C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results'
md REGResults
md GPOResults
Set-Location 'C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes'
md REGTapes
md GPOTapes

Write-Host "Folders created successfully!" -ForegroundColor Green
Write-Host "About to write out example tapes, Please wait..."
Start-Sleep -Seconds 5

#########################################################################################################################################################################################################
########################################################################## - Writing out Default registry tape. - #######################################################################################

$fileName = "input-Reg-Default"
$filePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\REGTapes\$fileName.csv"

# Create an example predefined data array
$data = @(
    [PSCustomObject]@{
        Name = "Disable TLS 1.0"
        Path = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client"
        Key = "Enabled"
        Value = 0
        Reason = "This will disable the use of outdated and insecure TLS (Transport Layer Security) version 1.0."
    }
)

# Export the data to a CSV file
$data | Export-Csv -Path $filePath -NoTypeInformation

Write-Host "CSV file '$fileName.csv' created successfully!" -ForegroundColor Green
Write-Host "File path: $filePath"

Write-Host "Creation of default REG tape is complete." -ForegroundColor Green
Start-Sleep -Seconds 3

#########################################################################################################################################################################################################
########################################################################## - Writing out Default GPO tape. - ############################################################################################

$fileName = "input-GPO-Default"
$filePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\GPOTapes\$fileName.csv"

# Create your custom GPO tape csv array
$data = @(
    [PSCustomObject]@{
        Name = "Screensaver Timeout Setting"
        Setting = "Software\Policies\Microsoft\Windows\Control Panel\Desktop\ScreenSaveTimeOut"
        ExpectedValue = "900"
        Reason = "This sets the screensaver timeout to 15 minutes."
    }
)

# Export the data to a CSV file
$data | Export-Csv -Path $filePath -NoTypeInformation

Write-Host "CSV file '$fileName.csv' created successfully!" -ForegroundColor Green
Write-Host "File path: $filePath"


Write-Host "Creation of default GPO tape is complete." -ForegroundColor Green
Start-Sleep -Seconds 3


Write-Host "Installation script is complete, about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}

}










if ($TopMenuChoice2 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v1.1 - REG - #################################################################################
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #



#########################################################################################################################################################################################################
########################################################################## - Show-off screen for tool. - ################################################################################################


$colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')
$text = "
_____________________ ________ 
\______   \_   _____//  _____/ 
 |       _/|    __)_/   \  ___ 
 |    |   \|        \    \_\  \
 |____|_  /_______  /\______  /
        \/        \/        \/ 
" 
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Count]
    $char = $text[$i]

    Write-Host $char -ForegroundColor $color -NoNewline
}

Write-Host " REG-SEC-GPO v1.1 - P.O.C."

Write-Host " Sub-Menu: REG" -ForegroundColor Green

Write-Host "

Provided by:"

Write-Host "Jordan Albaladejo, Owner of: 
"

Write-Host "Ingest services" -ForegroundColor Magenta

Write-Host "www.ingestservices.net" -ForegroundColor Blue

Write-Host "
With the help of ChatGPT.
" -ForegroundColor Green

#########################################################################################################################################################################################################
########################################################################## - Menu Choice - ##############################################################################################################

Write-Host "
"
Write-Host "[1] Registry Audit Tool."
Write-Host "[x] Exit."

Write-Host "

"

# Prompt user to run the following code.
$REGMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($REGMenuChoice -eq '1') {

Write-Host "You have selected Registry Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$REGMenuChoice1 = 'True'
}

# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($REGMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}




#########################################################################################################################################################################################################
########################################################################## - Ingest services - REG - Audit your custom REG tapes (CSV) ##################################################################
#########################################################################################################################################################################################################
if ($REGMenuChoice1 -eq 'True') {
#########################################################################################################################################################################################################
########################################################################## - Terms and Conditions - #####################################################################################################

# Display the terms and ask for user agreement
function Show-TermsAndAskForAgreement {
    $terms = @"
********************************************************************************
Terms and Conditions:

This script is a proof of concept, early in development, and has been created with the help of ChatGPT. The creator takes no responsibility for any code repercussions as this script is open source and provided as is, with no promises of any kind.

By typing 'AGREE' below, you acknowledge that you have read and understood the terms and agree to use the script at your own risk.

********************************************************************************
"@

    Write-Output $terms
    $userInput = Read-Host "Type 'AGREE' to proceed or any other key to exit."

    if ($userInput -ne "AGREE") {
        Write-Host "You did not agree to the terms. The script will now exit." -ForegroundColor Red
        Start-Sleep -Seconds 3
        exit
    }
}

# Prompt user to agree to terms
Show-TermsAndAskForAgreement


Write-Host "You have agreed to the terms. The script will now proceed." -ForegroundColor Green

#########################################################################################################################################################################################################
########################################################################## - Insert your tape (Input CSV). - ############################################################################################

# Input CSV cassette tape.
Write-Host "
Select your tape to play. Rock, Jazz, Pop or maybe Vaporwave?
" -ForegroundColor Magenta
$csvchoice = Read-Host "Press Enter for Default or enter the path to your CSV cassette tape file"

if ($csvchoice -eq '') {
    $csvFile = Import-Csv -Path "C:/Program Files (x86)/Ingestservices/REG-SEC-GPO/Tapes/REGTapes/input-REG-Default.csv"
}
if ($csvchoice -ne '') {
    $csvFile = Import-Csv -Path $csvchoice
}

#########################################################################################################################################################################################################
########################################################################## - Playing tape (Input CSV). - ################################################################################################

Write-Host "
.------------------------.
|\\////////              |
| \/  __  ______  __     |
|    /  \|\.....|/  \    |
|    \__/|/_____|\__/    |                                                
| A                      |                                                
|    REG - SEC - GPO     |
|    ________________    |                                               
|___/_._o________o_._\___|
"

Write-Host " Playing tape...
" -ForegroundColor Magenta

# Create an empty array to store the registry items.
$registryItems = @()

# Iterate over the CSV rows and convert them to registry items.
foreach ($row in $csvFile) {
    $registryItem = @{
        "Name" = $row.Name
        "Path" = $row.Path
        "Key" = $row.Key
        "Value" = $row.Value
        "Reason" = $row.Reason
    }
    $registryItems += $registryItem
}

# Create an empty array to store the results.
$results = @()

#########################################################################################################################################################################################################
########################################################################## - REG auditing script. - #####################################################################################################

# Iterate over the registry values.
foreach ($registryItem in $registryItems) {
    $registryName = $registryItem.Name
    $path = $registryItem.Path
    $key = $registryItem.Key
    $expectedValue = $registryItem.Value
    $reason = $registryItem.Reason
        
    # Check if the registry key exists.
    if (Test-Path -Path $path) {
        # Check if the registry value exists.
        if (Get-ItemProperty -Path $path -Name $key -ErrorAction SilentlyContinue) {
            # Get the current value of the registry key.
            $actualValue = (Get-ItemProperty -Path $path -Name $key -ErrorAction SilentlyContinue).$key
            
            # Check if the actual value is null or an empty string.
            if ([string]::IsNullOrEmpty($actualValue)) {
                $result = "..x Path and key present, with no value."
                $actualValue = "N/A"
            }
            # Check if the actual value matches the expected value.
            elseif ($actualValue -eq $expectedValue) {
                $result = "... Path and key, present with expected value."
            }
            else {
                $result = "..x Path and key present, with different value."
            }
        }
        else {
            $result = ".xx Path present, Key not present."
            $actualValue = "N/A"
        }
    }
    else {
        $result = "xxx Path and key not present."
        $actualValue = "N/A"
    }
    
    # Create a custom object with the registry information, result, and reason.
    $registryInfo = [PSCustomObject]@{
        "Name" = $registryName
        "Path" = $path
        "Key" = $key
        "Expected Value" = $expectedValue
        "Actual Value" = $actualValue
        "Result" = $result
        "Reason" = $reason
    }
    
    # Add the registry information to the results array.
    $results += $registryInfo
}

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a CSV file. - #########################################################################################

# Export the results to a CSV file.
$results | Export-Csv -Path "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults\output-REG-audit.csv" -NoTypeInformation

# Create directory with current time and date
$directoryName = Get-Date -Format "dd_MM_yyyy__HH-mm-ss"
$destinationDirectory = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults\$directoryName"
New-Item -ItemType Directory -Path $destinationDirectory | Out-Null

# Move files to the destination directory
$filesToMove = Get-ChildItem -Path "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults" -File
foreach ($file in $filesToMove) {
    Move-Item -Path $file.FullName -Destination $destinationDirectory -Force
}

Write-Host "Your REG's has been ingested, audit report is located at $destinationDirectory" -ForegroundColor Green
Write-Host "The script is about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}
}



	
if ($TopMenuChoice3 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v1.1 - SEC - #################################################################################
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #



#########################################################################################################################################################################################################
########################################################################## - Show-off screen for tool. - ################################################################################################	
	
$colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')
$text = "
  _____________________________  
 /   _____/\_   _____/\_   ___ \ 
 \_____  \  |    __)_ /    \  \/ 
 /        \ |        \\     \____
/_______  //_______  / \______  /
        \/         \/         \/  
" 
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Count]
    $char = $text[$i]

    Write-Host $char -ForegroundColor $color -NoNewline
}
	
Write-Host " REG-SEC-GPO v1.1 - P.O.C."

Write-Host " Sub-Menu: SEC" -ForegroundColor Green

Write-Host "

Provided by:"

Write-Host "Jordan Albaladejo, Owner of: 
"

Write-Host "Ingest services" -ForegroundColor Magenta

Write-Host "www.ingestservices.net" -ForegroundColor Blue

Write-Host "
With the help of ChatGPT.
" -ForegroundColor Green

	
#########################################################################################################################################################################################################
########################################################################## - Menu Choice - ##############################################################################################################

Write-Host "
"
Write-Host "NOTHING HERE YET - THIS IS A PLACEHOLDER"
Write-Host "[x] Exit."

Write-Host "
	
"

# Prompt user to run the following code.
$SECMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($SECMenuChoice -eq '') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}

# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($SECMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}

}	




if ($TopMenuChoice4 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v1.1 - GPO - #################################################################################
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	


#########################################################################################################################################################################################################
########################################################################## - Show-off screen for tool. - ################################################################################################
	
$colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')
$text = "
  __________________   _____   
 /  _____/\______   \ /  _  \  
/   \  ___ |     ___//  | |  \ 
\    \_\  \|    |   /   |_|   \
 \______  /|____|   \_________/
        \/                                     
" 
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Count]
    $char = $text[$i]

    Write-Host $char -ForegroundColor $color -NoNewline
}
	
Write-Host " REG-SEC-GPO v1.1 - P.O.C."
	
Write-Host " Sub-Menu: GPO" -ForegroundColor Green
	
Write-Host "
	
Provided by:"
	
Write-Host "Jordan Albaladejo, Owner of: 
"
	
Write-Host "Ingest services" -ForegroundColor Magenta
	
Write-Host "www.ingestservices.net" -ForegroundColor Blue
	
Write-Host "
With the help of ChatGPT.
" -ForegroundColor Green
	
	
#########################################################################################################################################################################################################
########################################################################## - Menu Choice - ##############################################################################################################

Write-Host "
"
Write-Host "[1] Group Policy Objects Audit Tool."
Write-Host "[x] Exit."

Write-Host "

"

# Prompt user to run the following code.
$GPOMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($GPOMenuChoice -eq '1') {

Write-Host "You have selected Group Policy Objects Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$GPOMenuChoice1 = 'True'
}

# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($GPOMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}




#########################################################################################################################################################################################################
########################################################################## - Ingest services - GPO - Audit your custom GPO tapes (CSV) ##################################################################
#########################################################################################################################################################################################################
if ($GPOMenuChoice1 -eq 'True') {
#########################################################################################################################################################################################################
########################################################################## - Terms and Conditions - #####################################################################################################

# Display the terms and ask for user agreement
function Show-TermsAndAskForAgreement {
    $terms = @"
********************************************************************************
Terms and Conditions:

This script is a proof of concept, early in development, and has been created with the help of ChatGPT. The creator takes no responsibility for any code repercussions as this script is open source and provided as is, with no promises of any kind.

By typing 'AGREE' below, you acknowledge that you have read and understood the terms and agree to use the script at your own risk.

********************************************************************************
"@

    Write-Output $terms
    $userInput = Read-Host "Type 'AGREE' to proceed or any other key to exit."

    if ($userInput -ne "AGREE") {
        Write-Host "You did not agree to the terms. The script will now exit." -ForegroundColor Red
        Start-Sleep -Seconds 3
        exit
    }
}

# Prompt user to agree to terms
Show-TermsAndAskForAgreement


Write-Host "You have agreed to the terms. The script will now proceed." -ForegroundColor Green


# Import the Group Policy module
Import-Module GroupPolicy

#########################################################################################################################################################################################################
########################################################################## - Insert your tape (Input CSV). - ############################################################################################

# Input CSV cassette tape.
Write-Host "
Select your tape to play. Rock, Jazz, Pop or maybe Vaporwave?
" -ForegroundColor Magenta
$csvchoice = Read-Host "Press Enter for Default or enter the path to your CSV cassette tape file"

if ($csvchoice -eq '') {
    $csvFile = Import-Csv -Path "C:/Program Files (x86)/Ingestservices/REG-SEC-GPO/Tapes/GPOTapes/input-GPO-Default.csv"
}
if ($csvchoice -ne '') {
    $csvFile = Import-Csv -Path $csvchoice
}

#########################################################################################################################################################################################################
########################################################################## - Playing tape (Input CSV). - ################################################################################################

Write-Host "
.------------------------.
|\\////////              |
| \/  __  ______  __     |
|    /  \|\.....|/  \    |
|    \__/|/_____|\__/    |                                                
| B                      |                                                
|    REG - SEC - GPO     |
|    ________________    |                                               
|___/_._o________o_._\___|
"

Write-Host " Playing tape...
" -ForegroundColor Magenta

# Create an empty array to store the GPO items.
$gpoItems = @()

# Iterate over the CSV rows and convert them to GPO items.
foreach ($row in $csvFile) {
    $gpoItem = @{
        "Name" = $row.Name
        "Setting" = $row.Setting
        "ExpectedValue" = $row.ExpectedValue
        "Reason" = $row.Reason
    }
    $gpoItems += $gpoItem
}

# Create an empty array to store the results.
$results = @()

#########################################################################################################################################################################################################
########################################################################## - GPO auditing script. - #####################################################################################################

# Iterate over the GPO items.
foreach ($gpoItem in $gpoItems) {
    $gpoName = $gpoItem.Name
    $setting = $gpoItem.Setting
    $expectedValue = $gpoItem.ExpectedValue
    $reason = $gpoItem.Reason

    # Get the GPO settings for the specified GPO.
    $gpo = Get-GPO -Name $gpoName -ErrorAction SilentlyContinue

    if ($gpo) {
        # Get the specific setting value from the GPO
        $actualValue = Get-GPRegistryValue -Guid $gpo.Id -Key $setting -ErrorAction SilentlyContinue

        # Check if the actual value matches the expected value.
        if ($actualValue -eq $expectedValue) {
            $result = "... Setting present with expected value."
        } else {
            $result = "..x Setting present, with different value."
        }
    } else {
        $result = "xxx GPO not found."
        $actualValue = "N/A"
    }

    # Create a custom object with the GPO information, result, and reason.
    $gpoInfo = [PSCustomObject]@{
        "GPO Name" = $gpoName
        "Setting" = $setting
        "Expected Value" = $expectedValue
        "Actual Value" = $actualValue
        "Result" = $result
        "Reason" = $reason
    }

    # Add the GPO information to the results array.
    $results += $gpoInfo
}

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a CSV file. - #########################################################################################

# Export the results to a CSV file.
$results | Export-Csv -Path "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults\output-GPO-audit.csv" -NoTypeInformation

# Create directory with current time and date
$directoryName = Get-Date -Format "dd_MM_yyyy__HH-mm-ss"
$destinationDirectory = "C:\Ingestservices\REG-SEC-GPO\Results\GPOResults\$directoryName"
New-Item -ItemType Directory -Path $destinationDirectory | Out-Null

# Move files to the destination directory
$filesToMove = Get-ChildItem -Path "C:\Ingestservices\REG-SEC-GPO\Results\GPOResults" -File
foreach ($file in $filesToMove) {
    Move-Item -Path $file.FullName -Destination $destinationDirectory -Force
}

Write-Host "Your GPO's has been ingested, audit report is located at $destinationDirectory" -ForegroundColor Green
Write-Host "The script is about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}

}	




#########################################################################################################################################################################################################
########################################################################## - End of Script. You made it here! - #########################################################################################

# Here is your AI easter egg. 

#         (_ _)     |_| 
#         {o o}    (o o)
#   /------\ /    /  |  \
#  / |     ||  =  \ \|/ /  < We milk cows, why not milk AI? It could be utterly delightful!
# *  /\..-/\       \_|_/ 
#    ~~   ~~       | | |


#Created by:            Jordan Albaladejo, Owner of Ingest services, "We ingest, enabling your best." www.ingestservices.net
#                       With the help of: ChatGPT.
#                                                           .............................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*****************/////////////////////(((((((((((((((
#                                               ...    .....................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*****************////////////////////(((((((((((((((((((
#                                              .(@@@*...................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**///***********/////////////////////(((((((((((((((((((
#                                              .(@@&*................,,,,,,,,,,,,,,,,,,,,,,,,,,,,****,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*********&@@(**********///////////////////((((((((((((((((((((((
#                                             ..(@@&*......,,,,..,,*///**,,,,,,,,,,,,,**////**,*&@@@&/,,,,,,,*//((((/**,,,,,******////////*******/&@@(*******////////////////////(((((((((((((((((((((###
#                                          ...../@@&*.....*@@@##@@@@@@@@@@&/,,,,,,,(@@@&%##&@@@@&*,,,,,,,,*#@@@@&&&@@@@%*******#@@@@@@@@@@%***#@@@@@@@@@@@&(///////////////////(((((((((((((((((((((#####
#                                       ......../@@&*.....*%@@&(*,,,,,,*%@@&(,,,,*@@@(,,,,,,,*%@@&*******#@@&/*******#@@@/***/%@&(*************//(&@@(///////////////////////((((((((((((((((((((########
#                                    .........../@@&*....,,#@@%*,,,,,,,,/&@@(*,,,#@@&*,,,,****(@@&/*****#@@&*********/&@@%***/%@@&#/*************(&@&/****/////////////////(((((((((((((((((((((#########
#                                 ..............(@@&*,,,,,,#@@%*,,,,,,,,*%@@(**,**@@@%*******(@@@(*****/&@@@@@@@@@@@@@@@@%*****(&@@@@@@%/********(&@&/***/////////////////((((((((((((((((((((###########
#                               ...............,(@@&*,,,,,*#@@%*,,,,,***/&@@(******/&@@@@@@@@&%(*******/%@@%**********************//#%@@@@&/*****(&@@///////////////////((((((((((((((((((((#############
#                            ..................,(@@&/,,,,,*%@@%*********/&@@#*****/@@#******************(&@@%/*************************/%@@%/////(&@@(//////////////////(((((((((((((((((################
#                         ...................,,,#@@&/,,,,,*%@@%/********/&@@#*****(@@@@&%%####((/********/&@@@@%(///////(/***/((///////#@@@#//////%@@@%(//////////////((((((((((((((((((#################
#                       ..................,,,,,,#&&&/,,,**/%@@%/********(&@&#*****/%@@&&&&&@@@@@@@@&(******/(%&@@@@@@@@@&////(&@@@@@@@@@%#/////////(&@@@@@@#////////((((((((((((((((((#################%%
#                    ...................,,,,,,,,,,,,,***************************/&@&/***********/&@@%/**////////////////////////////////////////////////////////////((((((((((((((((#################%%%%
#                  ..................,,,,,,,,,,,,,,*****************************#@@%/****////////#@@#//////////////////////////////////(///////////////////////////(((((((((((((((((###############%%%%%%
#               ...................,,,,,,,,,,,,,********************************/&@@&(/////////#&@&(/////////////////////#(/((((((/((((#((/(#(#((((///////////////((((((((((((((((################%%%%%%%
#             ..................,,,,,,,,,,,,,,****************************////////(%@@@@@@@@@@@&#////////////////////////(((/(((((//(//(/((((((((((//////////////((((((((((((((((################%%%%%%%%

# Find us on our socials:
# YouTube: https://www.youtube.com/@ingestservices 
# Facebook: https://www.facebook.com/ingestservices/ 
# Instagram: https://www.instagram.com/ingestservices/ 
