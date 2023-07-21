# REG-SEC-GPO v 1.1 (Ready-Set-GO)
![Title Banner Screenshot](https://github.com/Jordan-Albaladejo/REG-SEC-GPO/blob/main/Title_Text.png)

In brief: 
REG-SEC-GPO is a Registry and GPO auditing and reporting PowerShell tool.

INTRO:
With the aim to create a baseline for clients that want better security controls and a path to compliance, I wanted to create a tool that could quickly and effectively scan out an environment for their registry keys and GPO's. Then with this information extracted, compare this to "Tapes" or predefined values that reflect what the client, I as a MSSP or a compliance framework desired. Then, finally with this information, I wanted to create an easy to read CSV file that can be extracted and pose as a talking point with the client.

Due to my inability to write natively in PS, but the avid use of PS in RMM platforms. I thought I would "milk" the AI trend, and use ChatGPT to help form this PS script.

The name is: REG-SEC-GPO. Pronounced, Ready, Set, Go. A play on words, as it also represents, Registry, Security and Group Policy Objects, as these are the areas it touches on.



HOW TO USE:

1) Download the REG-SEC-GPO.ps1 script or save the RAW Script in a text editior appending it with the .ps1 extension.
2) Open Powershell as Administror, navigate to where you saved the .ps1 file.
   (IE. "CD ../../Users/JohnDoe/Downloads/REG-SEC-GPO.ps1")
4) Execute the script.
   (IE. "./REG-SEC-GPO.ps1)

6) Now that it is running, make sure to read the Terms and Conditions, then accept to proceed. Or not and end the journey here.
7) You will now see the Menu screen.

![Menu Screenshot](https://github.com/Jordan-Albaladejo/REG-SEC-GPO/blob/main/Main_Menu.png)

6) On the menu screen, you have 5 options:
    [1] Installer
    [2] REG
    [3] SEC
    [4] GPO
    [x] Exit

6.1.a) Instller will create the following folders in the C:\ Drive:

    C:\Program Files (x86)\Ingestservices
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\REGTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\GPOTapes
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults

6.1.b) Installer will create 2 example "Tapes" as well. Tapes are the CSV values that are use to compare to when completeing the auditing scans. I have named them tapes, as they are interchangable. These example tapes can be used to help with understanding the format that can be read by the script. Please see below where the example tapes are created:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\REGTapes\input-Reg-Default
    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Tapes\GPOTapes\input-GPO-Default

6.2.a) Registry Audit Tool will prompt the user to input the full path location of the "REG Tape", (Remember this is just the CSV lookup/comparision file). If the user presses enter, the default tape is selected.

6.2.b) Once the tape is selected the script will extract the "Play" the "Tape", reading the values and then use these values to lookup the local machines own values. Comparing them when complete.

6.2.c) Once the completed comparision is finished, the script will then create an output of the results, with "Expected Value" and "Actual Value" present in the report. The exported report will be located here:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\REGResults\output-REG-audit.csv
  
Note: The script ends by moving the result into a time stamped folder in this location, so as to all for multiple uses of the tool and better auditing trail.


6.3.a) Group Policy Objects Audit Tool has the exact same process as the Registry Audit Tool, however leaving the results in the following location:

    C:\Program Files (x86)\Ingestservices\REG-SEC-GPO\Results\GPOResults\output-GPO-audit.csv

Note: The script ends by moving the result into a time stamped folder in this location, so as to all for multiple uses of the tool and better auditing trail.

6.x) This will exit the script.
