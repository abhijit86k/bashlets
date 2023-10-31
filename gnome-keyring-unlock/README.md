keyring_show_all_keys.py
=======================
A python script to print all the SSH key passphrases that are stored in the GNOME keyring.
Moving from one machine to another? Now you just need to copy all the SSH key pairs and config file and then run this script to get all the passphrases.
Then just move to the new machine and type in the passphrases on first use.

keyring_unlock_gnome
===================
A bash script to unlock the GNOME keyring when logging in as a headless user.
Usecase: when ssh-ing into a machine remotely, git pulls/pushes using ssh ask you for the passphrase, 
which you don't remember because notmally Seahorse/gnome-keyring remember it for you on the desktop.
Solution: run keyring_unlock_gnome command first, which unlocks the gnome keyring and now your ssh-agent should not
need to ask you for the passphrase each time.
