LoadNewKeymap
=============
A script to modify the keymap that allows the printscr key to be used as a "menu" or right-click key on laptops.

About
-----
On many Laptops, including Lenovos, the keyboard has a Printscreen key to the right of the space bar as shown below:
![Thinkpad Keyboard](https://github.com/abhijit86k/bashlets/blob/master/ThinkScr/ThinkpadKeyboard.jpg)

I'd much rather have a menu / right click key instead. It is possible to do this by remapping the keymap, so the OS interprets a press of that key as a menu key press. The code here is based on the [answer by Petr Vsetecka on the AskUbuntu Forum](https://askubuntu.com/a/1111670).


Instructions
------------
1. First you need to find the existing keymap, edit the key command for the key to be changed, and then reload the keymap.

To get the existing keymap, run:
```
$> xmodmap -pke > ~/.xmodmap
```
This will dump the existing keymap to the file .xmodmap

2. Make a copy of this file, save it as .xmodmap_new and change the function listed for the printscreen key (Key Code 107) to "Menu" instead of "Print".
Note that the key code for your keyboard may be different. A modified .xmodmap file is included here for reference. (You may need to enable hidden files to see it in your local directory)

3. Load the new keymap. Note that this command may cause your input devices to become unresponsive for a minute or so - be patient!
```
xmodmap ~/.xmodmap_new
```
If the new keymap works, set up a startup script to load the new keymap at every login.

4. Copy the script LoadNewKeymap to somewhere on your local path, e.g. ~/bin/ and make it executable.

5. Open the Startup Applications dialog and create a new entry as shown below:
![Startup Application](https://github.com/abhijit86k/bashlets/blob/master/ThinkScr/StartupApplicationSetup.png)

