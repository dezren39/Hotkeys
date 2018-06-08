# Project A
  
  This project is a series of scripts and libraries that I built to automate
  navigating and utilizing an in-house tool used within the department
  of a company I have worked for. The code has had minimal de-identification
  performed on it, however most of the code is complete. Most
  of the main scripts are useless outside of the scope of use originally intended.
  The libraries can stand on their own, especially the GlobalLib script. All the 
  script names, have been modified, and some other information has been removed. 
  There is still generic information listed, to allow one to see the purpose in
  which the hotkeys have been used. The main uses have been mostly search
  queries, page-to-page navigation, opening apps, and some minimal workflow
  error-checking.
  
  

### Original Project Readme
    Title: ReadMe.txt
    Author: Drewry Pope
    Date: 12/09/2016
    Description: This is a set of scripts written in AutoHotKey for use in the company. The script is built to 
    allow navigation throughout commonly used tools by keyboard and to generally enhance efficiency. 

    This folder must be unzipped for proper operation.

    To Start:
      -Ensure you have unzipped the folder containing this ReadMe.txt file.

      -Ensure that AutoHotkey is installed, if not then a copy of the installer is located in the root folder. 
        --Some clients may need to run AutoHotkey as administrator.

      -Double-click Script_Selector.ahk to choose a script. 
        --Refer to the keylists in the doc folder for information on how to operate your chosen script.

    Script_Selector:
      -Script_Selector will let you switch between any scripts found within the same folder as it is located, and so will
       also allow you to include your own scripts. Press ScrollLock at any time to change scripts. Press ScrollLock while 
       the Script_Selector GUI is open and Script_Selector will completely exit until you open the script again. Close the
       Script_Selector GUI window while it is open and it will hide the GUI until ScrollLock is pressed again.

      -It's suggested to map ScrollLock to the ExitApp command on any custom scripts regularly ran by Script_Selector. 
         --An example you could copy and paste onto a newline is found below:
             ScrollLock::ExitApp

    .\doc folder:
      -Project 1_Keylist.docx is a Word 2016 document that acts as a guide to the hotkeys and functions of the Project 1 script.

      -Project 2_Keylist.docx is a Word 2016 document that acts as a guide to the hotkeys and functions of the Project 2 script.

      -Roadmap.txt covers features that could be implemented at a future date.

    .\doc\changelog folder:
      This folder stores changelogs for various scripts. Changes are only minimally logged. The most recent changes are 
      usually only logged within the comments of the respective script and may not yet be reflected within this folder.

    .\img folder:
      The images are stored in the .\img folder are used for the ImageSearch function used in portions of the scripts. 
      The ImageSearch technique is used to control mouse movement and relies on these images of relevant portions of the 
      screen in order to direct where the mouse should move. Because of the exact nature of images, in order for these portions
      of the scripts to function properly, it is required for browser zoom to be 100% (default), OS zoom to be 100% (default),
      and ClearType to be enabled with default settings. (Cleartype is enabled by default.)

    .\lib folder:
      This folder contains scripts containing functions and hotkeys that are repeated across project scripts.

    .\script folder:
      This folder contains the scripts for each project.
