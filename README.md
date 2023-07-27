README.md

![Title Banner Screenshot](https://github.com/Jordan-Albaladejo/REG-SEC-GPO/blob/main/Title_Text.png)

REG-SEC-GPO v2.0 (Ready-Set-GO)
Pronounced, Ready, Set, Go. A play on words, as it also represents, Registry, Security and Group Policy Objects, as these are the areas it touches on.

 
Menu Index:
- Overview
- Introduction
- How to Use
	- Menu Options
		- [1] REG (Registry Audit Tool)
			- [1] REG (Registry Audit Tool)
		- [2] SEC (Security Audit Tools)
			- [1] Wi-Fi Pass Audit Tool
			- [2] PII, PCI and DSS Audit Tool
		- [3] GPO (Group Policy Objects Audit Tool)
			- [1] GPO (Group Policy Objects Audit Tool)
		- [i] Installer
		- [r] Remover
		- [a] About
		- [x ] Exit
- Screenshots
- Glossary of Terms
- Attributions and Credits


Overview:
REG-SEC-GPO is a powerful PowerShell tool designed for auditing and reporting on Registry, Security, and Group Policy Objects (GPO).

Introduction:
With the aim to create a baseline for clients that want better security controls and a path to compliance; REG-SEC-GPO was createed.

REG-SEC-GPO is a tool that can quickly and effectively audit an environment for security controls, by extracting registry key values, saved Wi-Fi passwords, PII, PCI and DSS scan results and GPO's,
then compare these to predefined baselines otherwise colloquially known as "Tapes" in this script.

Finally, using this information, REG-SEC-GPO exports easy-to-read reports in both CSV and HTML formats. These reports can be extracted and utilised to enrich the ongoing conversation while working with clients and, ultimately, to aid in assiting their security controls, compliance and posture moving forward.

THANKS TO CHATGPT! This vision and concept has come to life.


How to Use:
1) Download the REG-SEC-GPO.ps1 script or save the RAW script in a text editor, appending it with the .ps1 extension.
2) Open PowerShell as Administrator and navigate to the location where you saved the .ps1 file (e.g., CD ../../Users/JohnDoe/Downloads/REG-SEC-GPO.ps1).
3) Execute the script (./REG-SEC-GPO.ps1).
4) Upon running, read and accept the Terms and Conditions to proceed or choose to end the journey.

Menu Options:
On the menu screen, you have the following options:


_____________________ ________ 
\______   \_   _____//  _____/ 
 |       _/|    __)_/   \  ___ 
 |    |   \|        \    \_\  \
 |____|_  /_______  /\______  /
        \/        \/        \/ 

[1] REG (Registry Audit Tool)
Nested sub-menu option:
	[1] REG (Registry Audit Tool)
	When executed, the Registry Audit Tool will prompt the user to input the full path location of the "REG Tape" (CSV lookup/comparison file). Pressing Enter selects the default tape.
	The script will then extract and "Play" the "Tape," reading the values and comparing them with the local machine's own values.
	Once the comparison is complete, the script generates an output report with "Expected Value" and "Actual Value." The report will be exported in both CSV and HTML formats, saved in:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults\[TimeStampedFolder]


  _____________________________  
 /   _____/\_   _____/\_   ___ \ 
 \_____  \  |    __)_ /    \  \/ 
 /        \ |        \\     \____
/_______  //_______  / \______  /
        \/         \/         \/ 

[2] SEC (Security Audit Tools)
Nested sub-menu options:
	[1] Wi-Fi Pass Audit Tool
	The Wi-Fi password audit tool uses netsh to extract any saved Wi-Fi passwords and compares them to predefined rules of Password Strength, loosely based on NIST password guidelines.
	The results are exported to both CSV and HTML formats in a table format, located in:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\[TimeStampedFolder]

	[2] PII, PCI and DSS Audit Tool
	The PII, PCI, and DSS audit tool uses predefined regex rules based on Australian PII, PCI, and DSS patterns to scan the user directory (by default) or a custom directory as entered by the user.
	The results are exported to both CSV and HTML formats in a table format, located in:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults\[TimeStampedFolder]


  __________________   _____   
 /  _____/\______   \ /  _  \  
/   \  ___ |     ___//  | |  \ 
\    \_\  \|    |   /   |_|   \
 \______  /|____|   \_________/
        \/                     

[3] GPO (Group Policy Objects Audit Tool)
Nested sub-menu option:
	[1] GPO (Group Policy Objects Audit Tool)
	When executed, the Group Policy Objects Audit Tool follows the same process as the Registry Audit Tool but focuses on Group Policy Objects.
	Once the comparison is complete, the script generates an output report with "Expected Value" and "Actual Value." The report will be exported in both CSV and HTML formats, saved in:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults\[TimeStampedFolder]




[i] Installer
The Installer will first check if the parent folder directory is present. If so, it will exit the rest of the script; if not present, it will create the necessary folders in the C:\ drive.
This includes:

    C:\Program Files (x86)\Ingestservices
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\REGTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\GPOTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults

The Installer will then write out 2 example hot-swappable "Tapes" for both REG and GPO input tapes.
Note: Tapes are the CSV values used for comparison during the REG and GPO auditing scans. These example tapes can help users understand the format readable by the script.



[r] Remover
When executed, the Remover will attempt to remove the entire parent folder directory for REG-SEC-GPO, INCLUDING ALL NESTED FILES AND FOLDERS.
This includes:

    C:\Program Files (x86)\Ingestservices
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\REGTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\GPOTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\SECResults



[a] About
Provides information about the project, its contributors, purpose, and the creator.



[x] Exit
This option allows exiting out of the script, whether on the main menu or a sub-menu.


Screenshots:



Glossary of Terms:
.) Tapes: In the context of REG-SEC-GPO, "Tapes" refer to CSV (Comma-Separated Values) files that contain predefined values used for comparison during the auditing scans. These tapes serve as reference points, and the script compares the values from the tape with the corresponding values found on the local machine during the audit.

.) CSV (Comma-Separated Values): CSV is a plain-text file format used to store tabular data. Each line in the file represents a data row, with individual values separated by commas. REG-SEC-GPO uses CSV files for storing and comparing auditing data.

.) Registry (REG): The Windows Registry is a hierarchical database that stores configuration settings and options for the Microsoft Windows operating system. It contains information about hardware, software, user preferences, and system settings. The Registry is critical for the functioning of Windows, and various applications and components access and modify its values. In REG-SEC-GPO, the "REG" (Registry Audit Tool) focuses on auditing and reporting on the Windows Registry. It compares the values present in a "REG Tape" with the local machine's registry values and generates a report to highlight any discrepancies.

.) Group Policy Objects (GPO): Group Policy is a feature in Microsoft Windows that enables administrators to define and enforce specific system configurations and settings for users and computers in a networked environment. Group Policy Objects (GPOs) are containers for these policies. GPOs allow centralized management of various aspects of the operating system and applications. In REG-SEC-GPO, the "GPO" (Group Policy Objects Audit Tool) focuses on auditing Group Policy Objects. It compares the values present in a "GPO Tape" with the local machine's GPO values and generates a report to highlight any discrepancies.

.) Security (SEC): In REG-SEC-GPO, "Security" refers to a collection of audit tools that assess the security settings and configurations on the local machine. The "SEC" (Security Audit Tools) include various utilities such as the "Wi-Fi Pass Audit Tool" and the "PII, PCI, and DSS Audit Tool." These tools report on the security posture of the system based on predefined rules and patterns.

.) PII (Personally Identifiable Information): PII refers to any information that can be used to identify an individual uniquely. Examples include names, addresses, Social Security numbers, etc. REG-SEC-GPO uses predefined regex rules based on Australian PII patterns to scan for PII-related information.

.) PCI (Payment Card Industry): PCI refers to the Payment Card Industry Data Security Standard (PCI DSS), which is a set of security standards designed to protect cardholders' sensitive financial information. The Security Audit Tools in REG-SEC-GPO scan for compliance with PCI DSS rules.

.) DSS (Data Security Standard): DSS stands for Data Security Standard and is a set of security guidelines and practices used to protect sensitive data. The Security Audit Tools in REG-SEC-GPO also include predefined regex rules based on Australian DSS patterns to scan for sensitive data.



Attributions and Credits:

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


 Find us:
 Website: https://www.ingestservices.net
 YouTube: https://www.youtube.com/@ingestservices
 Facebook: https://www.facebook.com/ingestservices
 Instagram: https://www.instagram.com/ingestservices
