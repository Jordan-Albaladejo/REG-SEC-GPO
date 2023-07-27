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

Write-Host " REG-SEC-GPO v2.0 - P.O.C."


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


Write-Host ""
Write-Host "[1] REG (Registry Audit Tool)"
Write-Host "[2] SEC (Security Audit Tools)"
Write-Host "[3] GPO (Group Policy Objects Audit Tool)"
Write-Host ""
Write-Host ""
Write-Host "[i] Installer"
Write-Host "[r] Remover"
Write-Host "[a] About"
Write-Host "[x] Exit"

Write-Host ""

# Prompt user to run the following code.
$TopMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '1') {

Write-Host "You have selected Registry Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice1 = 'True'
}

# # # # # # ################################################################# - Menu Choice 2 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '2') {

Write-Host "You have selected Security Audit Tools." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice2 = 'True'
}

# # # # # # ################################################################# - Menu Choice 3 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq '3') {

Write-Host "You have selected Group Policy Objects Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoice3 = 'True'
}

# # # # # # ################################################################# - Menu Choice i - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq 'i') {

Write-Host "You have selected Installer." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoiceI = 'True'
}

# # # # # # ################################################################# - Menu Choice r - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq 'r') {

Write-Host "You have selected Remover." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoiceR = 'True'
}

# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($TopMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($TopMenuChoice -eq 'a') {

Write-Host "You have selected About." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$TopMenuChoiceA = 'True'
}


if ($TopMenuChoiceI -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - Installer - ###########################################################################
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

#########################################################################################################################################################################################################
########################################################################## - Checking if directory already present -#####################################################################################

$directoryPath = "C:\Program Files (x86)\Ingestservices"

# Check if the directory exists
if (Test-Path $directoryPath -PathType Container) {
    Write-Host "The specified directory already exists." -ForegroundColor Red
    Write-Host "Script about to exit. Please wait..." -ForegroundColor Red
    Start-Sleep -Seconds 3
    exit
}

# Prompt user to run the following code.
$choice = Read-Host "By proceeding, this script will create the file directory 'Ingestservices' and all dependencies in the C:/ drive, do you agree to proceed? (Y/N)"
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
md SECResults
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

# Set PS location back to default
Set-Location 'C:\WINDOWS\System32'

Write-Host "Creation of default GPO tape is complete." -ForegroundColor Green
Start-Sleep -Seconds 3


Write-Host "Installation script is complete, about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}

}





if ($TopMenuChoiceR -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - Remover - #############################################################################
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

#########################################################################################################################################################################################################
########################################################################## - Removing directory - #######################################################################################################
# Prompt for the directory path to remove
$directoryPath = "C:\Program Files (x86)\Ingestservices"

# Check if the directory exists
if (Test-Path $directoryPath -PathType Container) {
    # Prompt the user to confirm deletion
    $confirmation = Read-Host "Are you sure you want to remove the directory 'C:\Program Files (x86)\Ingestservices' and its contents? Type YES to proceed."

#########################################################################################################################################################################################################
########################################################################## - IF (Y/N) - ###################################################################################################################

    if ($confirmation -eq "YES") {
        # Remove the directory and its contents recursively
        Remove-Item -Path $directoryPath -Recurse -Force
        Write-Host "Directory and its contents removed successfully."
    } else {
        Write-Host "Removal process aborted. Directory and its contents are not removed."
        Write-Host "Remover script is complete, about to exit. Please wait..."
        Start-Sleep -Seconds 5
        exit
    }
} else {
    Write-Host "The specified directory does not exist."
    Write-Host "Remover script is complete, about to exit. Please wait..."
    Start-Sleep -Seconds 5
    exit
}


}




if ($TopMenuChoiceA -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - About - ###############################################################################
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	
function Animate-WriteHostWithColor {
    param(
        [string]$Text,
        [int]$DelayMilliseconds = 5
    )

    $colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta')

    $TextLength = $Text.Length

    for ($i = 0; $i -lt $TextLength; $i++) {
        $currentChar = $Text[$i]
        $color = $colors[$i % $colors.Count]
        $coloredChar = $currentChar | ForEach-Object { Write-Host $_ -ForegroundColor $color -NoNewline; Start-Sleep -Milliseconds $DelayMilliseconds }
    }

    Write-Host
}

# Example usage:
Animate-WriteHostWithColor -Text "This is the about area of: 
_____________________ ________            _____________________________             __________________   _____   
\______   \_   _____//  _____/           /   _____/\_   _____/\_   ___ \           /  _____/\______   \ /  _  \  
 |       _/|    __)_/   \  ___   ______  \_____  \  |    __)_ /    \  \/   ______ /   \  ___ |     ___//  | |  \ 
 |    |   \|        \    \_\  \ /_____/  /        \ |        \\     \____ /_____/ \    \_\  \|    |   /   |_|   \
 |____|_  /_______  /\______  /         /_______  //_______  / \______  /          \______  /|____|   \_________/
        \/        \/        \/                  \/         \/         \/                  \/                   
"
function Animate-WriteHost {
    param(
        [string]$Text,
        [int]$DelayMilliseconds = 5
    )

    $TextLength = $Text.Length

    for ($i = 0; $i -lt $TextLength; $i++) {
        $currentChar = $Text[$i]
        Write-Host -NoNewline $currentChar
        Start-Sleep -Milliseconds $DelayMilliseconds
    }

    Write-Host
}

# Example usage:
Animate-WriteHost -Text "
Special thanks to:

 _______  __   __  _______  _______  _______  _______  _______ 
|       ||  | |  ||   _   ||       ||       ||       ||       |
|       ||  |_|  ||  |_|  ||_     _||    ___||    _  ||_     _|
|       ||       ||       |  |   |  |   | __ |   |_| |  |   |  
|      _||       ||       |  |   |  |   ||  ||    ___|  |   |  
|     |_ |   _   ||   _   |  |   |  |   |_| ||   |      |   |  
|_______||__| |__||__| |__|  |___|  |_______||___|      |___|  

For helping assist with writing and editing of the PowerShell script.

                  __                        __  __    
______  _____   _/  |_   ____  _______     |__||  | __
\____ \ \__  \  \   __\ /  _ \ \_  __ \    |  ||  |/ /
|  |_> > / __ \_ |  |  (  <_> ) |  | \/    |  ||    < 
|   __/ (____  / |__|   \____/  |__|   /\__|  ||__|_ \
|__|         \/                        \______|     \/.com

For providing text to ASCII generator.



Proudly Created by: 
   
Jordan Albaladejo, Owner of Ingest services, We ingest, enabling your best. www.ingestservices.net
   With the help of: ChatGPT.

..............................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,************
.................................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,***************
.....(@@@*...................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**///**********
.....(@@&*................,,,,,,,,,,,,,,,,,,,,,,,,,,,,****,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*********&@@(**********
.....(@@&*......,,,,..,,*///**,,,,,,,,,,,,,**////**,*&@@@&/,,,,,,,*//((((/**,,,,,******////////*******/&@@(*******///
...../@@&*.....*@@@##@@@@@@@@@@&/,,,,,,,(@@@&%##&@@@@&*,,,,,,,,*#@@@@&&&@@@@%*******#@@@@@@@@@@%***#@@@@@@@@@@@&(////
...../@@&*.....*%@@&(*,,,,,,*%@@&(,,,,*@@@(,,,,,,,*%@@&*******#@@&/*******#@@@/***/%@&(*************//(&@@(//////////
...../@@&*....,,#@@%*,,,,,,,,/&@@(*,,,#@@&*,,,,****(@@&/*****#@@&*********/&@@%***/%@@&#/*************(&@&/****//////
.....(@@&*,,,,,,#@@%*,,,,,,,,*%@@(**,**@@@%*******(@@@(*****/&@@@@@@@@@@@@@@@@%*****(&@@@@@@%/********(&@&/***///////
,,,,,(@@&*,,,,,*#@@%*,,,,,***/&@@(******/&@@@@@@@@&%(*******/%@@%**********************//#%@@@@&/*****(&@@///////////
,,,,,(@@&/,,,,,*%@@%*********/&@@#*****/@@#******************(&@@%/*************************/%@@%/////(&@@(//////////
,,,,,#@@&/,,,,,*%@@%/********/&@@#*****(@@@@&%%####((/********/&@@@@%(///////(/***/((///////#@@@#//////%@@@%(////////
,,,,,#&&&/,,,**/%@@%/********(&@&#*****/%@@&&&&&@@@@@@@@&(******/(%&@@@@@@@@@&////(&@@@@@@@@@%#/////////(&@@@@@@#////
,,,,,,,,,,***************************/&@&/***********/&@@%/**////////////////////////////////////////////////////////
,,,,,,,,*****************************#@@%/****////////#@@#//////////////////////////////////(////////////////////////
,,,,,********************************/&@@&(/////////#&@&(/////////////////////#(/((((((/((((#((/(#(#((((/////////////
,,,****************************////////(%@@@@@@@@@@@&#////////////////////////(((/(((((//(//(/((((((((((/////////////


 Find us on our socials:
 YouTube: https://www.youtube.com/@ingestservices 
 Facebook: https://www.facebook.com/ingestservices/ 
 Instagram: https://www.instagram.com/ingestservices/ 


Here is your AI easter egg. 

         (_ _)     |_| 
         {o o}    (o o)
   /------\ /    /  |  \
  / |     ||  =  \ \|/ /  We milk cows, why not milk AI? It could be utterly delightful!
 *  /\..-/\       \_|_/ 
    ~~   ~~       | | |


"
    Write-Host "Script about to exit. Please wait..."
    Start-Sleep -Seconds 5
    exit

}




if ($TopMenuChoice1 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - REG - #################################################################################
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

Write-Host " REG-SEC-GPO v2.0 - P.O.C."

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
Write-Host "[1] Registry Audit Tool"
Write-Host "[x] Exit"

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

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a HTML file. - #########################################################################################

# Function to read CSV files and convert data to an HTML table column
function ConvertTo-HTMLTableColumn {
    param([string[]]$Rows)

    $htmlColumn = ""
    
    for ($i = 0; $i -lt $Rows.Count; $i++) {
        $htmlColumn += "<td>$($Rows[$i])</td>"
    }

    return $htmlColumn
}

# Main script
$csvFilesPath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults"
$outputFilePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults\output-REG-audit.html"

# List all CSV files in the CSVFiles directory
$csvFiles = Get-ChildItem -Path $csvFilesPath -Filter "*.csv"

# Initialize HTML content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>REG-SEC-GPO: Registry Auditing Results</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>REG-SEC-GPO: Registry Auditing Results</h1>
<table>
    <tr>
"@

# Generate HTML table header using CSV headings
foreach ($csvFile in $csvFiles) {
    $csvData = Import-Csv $csvFile.FullName
    $headers = $csvData[0].PSObject.Properties.Name  # Get the headings from the first row of the CSV
    $htmlContent += ConvertTo-HTMLTableColumn -Rows $headers
}
$htmlContent += '</tr>'

# Get the maximum number of rows in all CSV files
$maxRows = ($csvData | Measure-Object).Count

# Generate HTML table rows
for ($i = 0; $i -lt $maxRows; $i++) {
    $htmlContent += '<tr>'
    foreach ($csvFile in $csvFiles) {
        $csvData = Import-Csv $csvFile.FullName
        $rowData = $csvData[$i].PSObject.Properties.Value  # Get the data for the current row
        foreach ($value in $rowData) {
            $htmlContent += "<td>$value</td>"
        }
    }
    $htmlContent += '</tr>'
}

# Finish HTML content
$htmlContent += @"
</table>
</body>
</html>
"@

# Save the HTML content to a file
$htmlContent | Out-File -FilePath $outputFilePath

#########################################################################################################################################################################################################
########################################################################## - Move results to a time/date folder. - ######################################################################################


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



	
if ($TopMenuChoice2 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - SEC - #################################################################################
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
	
Write-Host " REG-SEC-GPO v2.0 - P.O.C."

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
Write-Host "[1] Wi-Fi Pass Audit Tool"
Write-Host "[2] PII, PCI and DSS Audit Tool"
Write-Host "[x] Exit"

Write-Host "
	
"

# Prompt user to run the following code.
$SECMenuChoice = Read-Host "Make your choice from the menu"

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($SECMenuChoice -eq '1') {

Write-Host "You have selected Wi-Fi Pass Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$SECMenuChoice1 = 'True'
}

# # # # # # ################################################################# - Menu Choice 1 - ############################################################################################## # # # # # 

if ($SECMenuChoice -eq '2') {

Write-Host "You have selected PII, PCI and DSS Audit Tool." -ForegroundColor Green
Write-Host "Script is about to start. Please wait..."
Start-Sleep -Seconds 3
$SECMenuChoice2 = 'True'
}

# # # # # # ################################################################# - Menu Choice x- ############################################################################################### # # # # #

if ($SECMenuChoice -eq 'x') {

Write-Host "You have selected to exit." -ForegroundColor Red
Write-Host "About to exit. Please wait..."
Start-Sleep -Seconds 3
exit
}

}	

#########################################################################################################################################################################################################
########################################################################## - Ingest services - SEC - Audit your Wi-Fi Passwords Strength ################################################################
#########################################################################################################################################################################################################
if ($SECMenuChoice1 -eq 'True') {
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
function Get-WifiPasswords {
    $profiles = netsh wlan show profiles
    $wifiPasswords = @()

    foreach ($profile in $profiles) {
        if ($profile -match 'All User Profile\s+:\s+(.+)') {
            $wifiName = $matches[1]
            $password = (netsh wlan show profile name="$wifiName" key=clear | Select-String -Pattern "Key Content\s+:\s+(.+)").Matches.Groups[1].Value

            $wifiPasswords += [PSCustomObject]@{
                WifiName = $wifiName
                Password = $password
            }
        }
    }

    return $wifiPasswords
}

function Mask-Password {
    param (
        [string]$password
    )

    # Replace password characters with asterisks (*)
    $maskedPassword = ""
    for ($i = 0; $i -lt $password.Length; $i++) {
        $maskedPassword += "*"
    }

    return $maskedPassword
}

function Calculate-PasswordEntropy {
    param (
        [string]$password
    )

    # Calculate password entropy based on character set and password length
    $characterSetSize = 0
    $hasLowercase = $password -cmatch "[a-z]"
    $hasUppercase = $password -cmatch "[A-Z]"
    $hasDigits = $password -cmatch "\d"
    $hasSpecialChar = $password -cmatch "[^a-zA-Z0-9]"

    if ($hasLowercase) { $characterSetSize += 26 }
    if ($hasUppercase) { $characterSetSize += 26 }
    if ($hasDigits) { $characterSetSize += 10 }
    if ($hasSpecialChar) { $characterSetSize += 33 }

    $passwordLength = $password.Length

    if ($characterSetSize -eq 0) {
        return 0
    }

    return $passwordLength * [Math]::Log($characterSetSize, 2)
}

function Measure-PasswordStrength {
    param (
        [string]$password
    )

    # Implement password strength evaluation using NIST guidelines here
    # Checking for password length, special characters, uppercase, lowercase, and entropy
    $hasSpecialChar = $password -cmatch "[^a-zA-Z0-9]"
    $hasUppercase = $password -cmatch "[A-Z]"
    $hasLowercase = $password -cmatch "[a-z]"

    $passwordLength = $password.Length

    $strengthReason = @()

    if ($passwordLength -ge 12) {
        $strengthReason += "Password length is 12 or more characters."
    } else {
        $strengthReason += "Password length is less than 12 characters."
    }

    if ($hasSpecialChar) {
        $strengthReason += "Contains at least one special character."
    } else {
        $strengthReason += "Does not contain any special characters."
    }

    if ($hasUppercase) {
        $strengthReason += "Contains at least one uppercase letter."
    } else {
        $strengthReason += "Does not contain any uppercase letters."
    }

    if ($hasLowercase) {
        $strengthReason += "Contains at least one lowercase letter."
    } else {
        $strengthReason += "Does not contain any lowercase letters."
    }

    $passwordEntropy = Calculate-PasswordEntropy -password $password

    if ($passwordEntropy -ge 70) {
        $strengthReason += "Password entropy is high (strongly random)."
    } elseif ($passwordEntropy -ge 50) {
        $strengthReason += "Password entropy is moderate (reasonably random)."
    } else {
        $strengthReason += "Password entropy is low (potentially predictable)."
    }

    if ($passwordLength -ge 12 -and $hasSpecialChar -and $hasUppercase -and $hasLowercase -and $passwordEntropy -ge 50) {
        return "Strong", ($strengthReason -join " ")
    } elseif (($passwordLength -ge 8 -and $hasSpecialChar -and ($hasUppercase -or $hasLowercase)) -or ($passwordLength -ge 10 -and ($hasUppercase -or $hasLowercase)) -or $passwordEntropy -ge 30) {
        return "Moderate", ($strengthReason -join " ")
    } else {
        return "Weak", ($strengthReason -join " ")
    }
}

# Main script
$wifiPasswords = Get-WifiPasswords

# Set the path for the CSV report
$reportPath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\output-Wi-FiPass-audit.csv"

$report = @()
foreach ($wifi in $wifiPasswords) {
    $passwordStrength, $strengthReason = Measure-PasswordStrength -password $wifi.Password
    $maskedPassword = Mask-Password -password $wifi.Password

    $report += [PSCustomObject]@{
        WifiName = $wifi.WifiName
        Password = $maskedPassword
        PasswordStrength = $passwordStrength
        StrengthReason = $strengthReason
    }
}


#########################################################################################################################################################################################################
########################################################################## - Exporting results to a CSV file. - #########################################################################################

# Export the results to a CSV file.
$report | Export-Csv -Path $reportPath -NoTypeInformation

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a HTML file. - #########################################################################################

# Function to read CSV files and convert data to an HTML table column
function ConvertTo-HTMLTableColumn {
    param([string[]]$Rows)

    $htmlColumn = ""
    
    for ($i = 0; $i -lt $Rows.Count; $i++) {
        $htmlColumn += "<td>$($Rows[$i])</td>"
    }

    return $htmlColumn
}

# Main script
$csvFilesPath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults"
$outputFilePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\output-Wi-FiPass-audit.html"

# List all CSV files in the CSVFiles directory
$csvFiles = Get-ChildItem -Path $csvFilesPath -Filter "*.csv"

# Initialize HTML content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>REG-SEC-GPO: Wi-Fi Password Auditing Results</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>REG-SEC-GPO: Wi-Fi Password Auditing Results</h1>
<table>
    <tr>
"@

# Generate HTML table header using CSV headings
foreach ($csvFile in $csvFiles) {
    $csvData = Import-Csv $csvFile.FullName
    $headers = $csvData[0].PSObject.Properties.Name  # Get the headings from the first row of the CSV
    $htmlContent += ConvertTo-HTMLTableColumn -Rows $headers
}
$htmlContent += '</tr>'

# Get the maximum number of rows in all CSV files
$maxRows = ($csvData | Measure-Object).Count

# Generate HTML table rows
for ($i = 0; $i -lt $maxRows; $i++) {
    $htmlContent += '<tr>'
    foreach ($csvFile in $csvFiles) {
        $csvData = Import-Csv $csvFile.FullName
        $rowData = $csvData[$i].PSObject.Properties.Value  # Get the data for the current row
        foreach ($value in $rowData) {
            $htmlContent += "<td>$value</td>"
        }
    }
    $htmlContent += '</tr>'
}

# Finish HTML content
$htmlContent += @"
</table>
</body>
</html>
"@

# Save the HTML content to a file
$htmlContent | Out-File -FilePath $outputFilePath

#########################################################################################################################################################################################################
########################################################################## - Move results to a time/date folder. - ######################################################################################

# Create directory with current time and date
$directoryName = Get-Date -Format "dd_MM_yyyy__HH-mm-ss"
$destinationDirectory = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\$directoryName"
New-Item -ItemType Directory -Path $destinationDirectory | Out-Null

# Move files to the destination directory
$filesToMove = Get-ChildItem -Path "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults" -File
foreach ($file in $filesToMove) {
    Move-Item -Path $file.FullName -Destination $destinationDirectory -Force
}

Write-Host "Your Wi-Fi Pass has been ingested, audit report is located at $destinationDirectory" -ForegroundColor Green
Write-Host "The script is about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}	




#########################################################################################################################################################################################################
########################################################################## - Ingest services - SEC - Audit your Australian PII, PCI and DSS File Risk ###################################################
#########################################################################################################################################################################################################
if ($SECMenuChoice2 -eq 'True') {
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
	
# Default input tape containing regex patterns and their descriptions
$defaultInputTape = @(

@{Pattern="\d{3}-\d{3}-\d{3}"; Description="Australian Medicare number (e.g., 123-456-789)"; RiskRating="High"}
@{Pattern="[A-Z]\d{6}"; Description="Australian Driver's License number (e.g., A123456)"; RiskRating="Medium"}
@{Pattern="\d{2}-\d{4}-\d{4}-\d{4}"; Description="Australian Bank Details (e.g., 12-3456-7890-1234)"; RiskRating="Medium"}
@{Pattern="[A-Z]{2}\d{6,7}[A-Z0-9]"; Description="Australian passport number (e.g., AB1234567A)"; RiskRating="Medium"}
@{Pattern="\d{9}"; Description="Australian Tax File Number (e.g., 123456789)"; RiskRating="High"}
@{Pattern="\d{16}"; Description="16-digit numeric pattern (e.g., 1234567890123456)"; RiskRating="Low"}
@{Pattern="\b\d{4}\s[A-Z]{2}\b"; Description="Australian Postcode and State (e.g., 1234 NSW)"; RiskRating="Low"}
@{Pattern="\+61\d{9}"; Description="Australian Phone Number with +61 prefix (e.g., +611234567890)"; RiskRating="Low"}
@{Pattern="\d{10}"; Description="Australian Phone Number without +61 prefix (e.g., 1234567890)"; RiskRating="Low"}
@{Pattern="\b\d{15,16}\b"; Description="Australian Credit Card Number (PAN)"; RiskRating="High"}
@{Pattern="\b\d{3}\b"; Description="Australian CVV (Card Verification Value)"; RiskRating="Medium"}
@{Pattern="\b\d{2}/\d{2}\b"; Description="Australian Credit Card Expiration Date"; RiskRating="Low"}
@{Pattern="\b\d{9}\b"; Description="Australian Tax File Number (TFN)"; RiskRating="High"}
@{Pattern="\b\d{6,10}\b"; Description="Australian Bank Account Number"; RiskRating="Medium"}
@{Pattern="[A-Z]{3}\d{3}"; Description="Australian Company Number (e.g., ABC123)"; RiskRating="Medium"}
@{Pattern="[A-Z]{2}\d{6}"; Description="Australian Business Number (e.g., ABN123456)"; RiskRating="Medium"}
@{Pattern="\b\d{6}\b"; Description="Australian Postal Code (e.g., 123456)"; RiskRating="Low"}
@{Pattern="[A-Z]{2}\d{5}"; Description="Australian Business Postal Code (e.g., AB12345)"; RiskRating="Low"}
@{Pattern="[A-Z]\d{5}"; Description="Australian Driver's License Number (New Format) (e.g., A12345)"; RiskRating="Medium"}
@{Pattern="\b\d{4}-\d{4}-\d{2}\b"; Description="Australian National Insurance Number (e.g., 1234-5678-12)"; RiskRating="High"}
@{Pattern="\b\d{5}\b"; Description="Australian Electoral Roll Number (e.g., 12345)"; RiskRating="Medium"}
@{Pattern="\b\d{5}\b"; Description="Australian Pensioner Concession Card Number (e.g., 12345)"; RiskRating="Low"}
@{Pattern="\d{9}"; Description="Australian Healthcare Identifier (e.g., 123456789)"; RiskRating="Medium"}
@{Pattern="[A-Z]{2}\d{3}"; Description="Australian Vehicle Registration Number (e.g., AB123)"; RiskRating="Medium"}

)

# Display the descriptions of predefined regex patterns
Write-Host "Predefined regex patterns for Australian PII, PCI, and DSS data elements:"
$defaultInputTape | ForEach-Object { Write-Host "  $($_.Description)" }
Write-Host ""

# Function to search for regex patterns in filenames and file contents
function SearchForSensitiveInformation {
    param(
        [string]$directory,
        [array]$inputTape
    )

    $files = Get-ChildItem -Path $directory -Recurse -File

    $results = @()

    foreach ($file in $files) {
        $fileName = $file.Name
        $filePath = $file.FullName
        $fileContent = Get-Content -Path $filePath -ErrorAction SilentlyContinue -Raw

        foreach ($tapeEntry in $inputTape) {
            $pattern = $tapeEntry.Pattern
            $data = @{
                Description = $tapeEntry.Description
                RiskRating = $tapeEntry.RiskRating
            }

            if ($fileName -match $pattern) {
                $result = New-Object PSObject -Property @{
                    FoundIn = "Filename"
                    SensitiveInformation = $data.Description
                    FileName = $fileName
                    FilePath = $filePath
                    RiskRating = $data.RiskRating
                }
                $results += $result
            }

            if ($fileContent -match $pattern) {
                $result = New-Object PSObject -Property @{
                    FoundIn = "File Content"
                    SensitiveInformation = $data.Description
                    FileName = $fileName
                    FilePath = $filePath
                    RiskRating = $data.RiskRating
                }
                $results += $result
            }
        }
    }

    return $results
}

# Prompt to select the scan area
$scanArea = Read-Host "Enter the scan area (e.g., C:\Users) or press Enter for default (C:\Users)"

if ($scanArea -eq '') {
    $scanArea = "C:\Users"
}

# Start the scan
$results = SearchForSensitiveInformation -directory $scanArea -inputTape $defaultInputTape

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a CSV file. - #########################################################################################

# Export results to a CSV file
$outputFile = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\output-PII-audit.csv"  # Replace this with the desired output file path
$results | Select-Object FoundIn, SensitiveInformation, FileName, FilePath, RiskRating | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "Scan completed. Results exported to $outputFile."

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a HTML file. - #########################################################################################

# Function to read CSV files and convert data to an HTML table column
function ConvertTo-HTMLTableColumn {
    param([string[]]$Rows)

    $htmlColumn = ""
    
    for ($i = 0; $i -lt $Rows.Count; $i++) {
        $htmlColumn += "<td>$($Rows[$i])</td>"
    }

    return $htmlColumn
}

# Main script
$csvFilesPath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults"
$outputFilePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\output-PII-audit.html"

# List all CSV files in the CSVFiles directory
$csvFiles = Get-ChildItem -Path $csvFilesPath -Filter "*.csv"

# Initialize HTML content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>REG-SEC-GPO: Australian PII, PCI and DSS Auditing Results</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>REG-SEC-GPO: Australian PII, PCI and DSS Auditing Results</h1>
<table>
    <tr>
"@

# Generate HTML table header using CSV headings
foreach ($csvFile in $csvFiles) {
    $csvData = Import-Csv $csvFile.FullName
    $headers = $csvData[0].PSObject.Properties.Name  # Get the headings from the first row of the CSV
    $htmlContent += ConvertTo-HTMLTableColumn -Rows $headers
}
$htmlContent += '</tr>'

# Get the maximum number of rows in all CSV files
$maxRows = ($csvData | Measure-Object).Count

# Generate HTML table rows
for ($i = 0; $i -lt $maxRows; $i++) {
    $htmlContent += '<tr>'
    foreach ($csvFile in $csvFiles) {
        $csvData = Import-Csv $csvFile.FullName
        $rowData = $csvData[$i].PSObject.Properties.Value  # Get the data for the current row
        foreach ($value in $rowData) {
            $htmlContent += "<td>$value</td>"
        }
    }
    $htmlContent += '</tr>'
}

# Finish HTML content
$htmlContent += @"
</table>
</body>
</html>
"@

# Save the HTML content to a file
$htmlContent | Out-File -FilePath $outputFilePath

#########################################################################################################################################################################################################
########################################################################## - Move results to a time/date folder. - ######################################################################################

# Create directory with current time and date
$directoryName = Get-Date -Format "dd_MM_yyyy__HH-mm-ss"
$destinationDirectory = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\$directoryName"
New-Item -ItemType Directory -Path $destinationDirectory | Out-Null

# Move files to the destination directory
$filesToMove = Get-ChildItem -Path "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults" -File
foreach ($file in $filesToMove) {
    Move-Item -Path $file.FullName -Destination $destinationDirectory -Force
}

Write-Host "Your PII, PCI and DSS audit has been ingested, audit report is located at $destinationDirectory" -ForegroundColor Green
Write-Host "The script is about to exit. Please wait..."
Start-Sleep -Seconds 5
exit
}	




if ($TopMenuChoice3 -eq 'True') {
	# # # # # # # # # # ################################################################################################################################################################# # # # # # # # # # #
	########################################################################## - Ingest services - REG-SEC-GPO v2.0 - GPO - #################################################################################
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
	
Write-Host " REG-SEC-GPO v2.0 - P.O.C."
	
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
Write-Host "[1] Group Policy Objects Audit Tool"
Write-Host "[x] Exit"

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

#########################################################################################################################################################################################################
########################################################################## - Exporting results to a HTML file. - #########################################################################################

# Function to read CSV files and convert data to an HTML table column
function ConvertTo-HTMLTableColumn {
    param([string[]]$Rows)

    $htmlColumn = ""
    
    for ($i = 0; $i -lt $Rows.Count; $i++) {
        $htmlColumn += "<td>$($Rows[$i])</td>"
    }

    return $htmlColumn
}

# Main script
$csvFilesPath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults"
$outputFilePath = "C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults\output-GPO-audit.html"

# List all CSV files in the CSVFiles directory
$csvFiles = Get-ChildItem -Path $csvFilesPath -Filter "*.csv"

# Initialize HTML content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>REG-SEC-GPO: Group Policy Objects Auditing Results</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>REG-SEC-GPO: Group Policy Objects Auditing Results</h1>
<table>
    <tr>
"@

# Generate HTML table header using CSV headings
foreach ($csvFile in $csvFiles) {
    $csvData = Import-Csv $csvFile.FullName
    $headers = $csvData[0].PSObject.Properties.Name  # Get the headings from the first row of the CSV
    $htmlContent += ConvertTo-HTMLTableColumn -Rows $headers
}
$htmlContent += '</tr>'

# Get the maximum number of rows in all CSV files
$maxRows = ($csvData | Measure-Object).Count

# Generate HTML table rows
for ($i = 0; $i -lt $maxRows; $i++) {
    $htmlContent += '<tr>'
    foreach ($csvFile in $csvFiles) {
        $csvData = Import-Csv $csvFile.FullName
        $rowData = $csvData[$i].PSObject.Properties.Value  # Get the data for the current row
        foreach ($value in $rowData) {
            $htmlContent += "<td>$value</td>"
        }
    }
    $htmlContent += '</tr>'
}

# Finish HTML content
$htmlContent += @"
</table>
</body>
</html>
"@

# Save the HTML content to a file
$htmlContent | Out-File -FilePath $outputFilePath

#########################################################################################################################################################################################################
########################################################################## - Move results to a time/date folder. - ######################################################################################

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

# Find us:
# Website: https://www.ingestservices.net
# YouTube: https://www.youtube.com/@ingestservices
# Facebook: https://www.facebook.com/ingestservices
# Instagram: https://www.instagram.com/ingestservices
