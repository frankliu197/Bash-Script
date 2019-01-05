Simplifies your linux experience with alias commands and/or preprogrammed commands to use with your keyboard shortcuts.  
Specific to Elementary os Juno but can be edited for any linux distribution.  

Scripts to add to your .bashrc:  
# ./shortcuts:
Contains cdable vars
- PKILL command: functions completely the same as pkill EXCEPT that it kills matching processes in the list *ps aux* instead.
- MOUNT/UMOUNT command: Mounts/Umounts a partition to/from $USER/media/$partition_name and creates a CDABLE var to that directory. You are allowed to shorten the device name from /dev/sd$a to $a. (See the source file for a better description)
- source: When source is used alone, it sources ~/.profile
- addtobin: Creates a soft link of the given file to /usr/bin/. Unlike a normal *ln* command, you do not need to provide the absolute path for your parameters
- quickshred: alias for *sudo shread -vfuz -n 1*
- listapp: List all visible apps

# ./gitshortcuts  
- git init: Executes *git init*, creates a repository on github, adds the repository as origin and pushes your current code into that repository under commit name "first commit"
- -A option to git commit: Stages and Trackes all files before commit
- -C option to git push: Executes *git commit -C* with the given commit message and then executes push normally

Other Scripts:
# ./keyboardshortcutreset
Executing ./keyboardshortcutreset will temporarily fix "elementary os" keyboard shortcut bugs in the screenshot and sound categories.

# ./desktopicon
Creates a .desktop file with the given parameters. 
```
-n Name of program
-c Comment
-t Execute in terminal (true, false options)
-i Icon 
-l Create a local/non-local desktop file (local, non-local options)
```
Format: ./desktopicon [command to execute program] [arguments]  
If the desktop file already exists, you can choose for the program to edit the desktop file with the given arguments instead.  
OR  
./desktopicon -f [name]; to find the location of a desktop file with the given name  


