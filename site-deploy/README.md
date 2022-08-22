deploy.sh
=========
A quick and reliable script I use to manage web content for a very simple, barebones webserver. 

Background:
-------------

The setup is as follows. A very simple webserver needs to host some content. This is a very small, simple device, probably a RaspberryPi. The content is being developed on a different machine - probably a desktop. The content is also being tracked in a version management system like Git. 

The systematic approach to this would of course be to have the Webhost (RaspberryPi) periodically pull content from git and copy it into the web directory. This has many issues - primarily when and how to trigger pulling content. Alternatively a post-commit script could rsync the files over. 

For better flexibility, I use the following script which needs to be called manually; giving total control over when the content is copied over.
The script first checks if any uncommitted changes are present; and then performs an rsync to copy the files over (and also deleting old any files deleted from the source). 

Setting Up:
-------------
1. Copy this script in a suitable directory and enable execute permissions.
1. Edit the file to assign correct values to the following variables:
	1. ``GITROOT``: Set the path to your GIT Repo
	1. ``WEBROOT``: Set the path to the Webserver Root directory. This could be:
		- a local mount point e.g. if a remote directory is mounted using sshfs, ftp, etc
		- a remote location specified fully, e.g. user@hostname:/var/www/
		- For IIT-DH users this would be the location of the local public_html directory synced by Nextcloud, e.g. ~/Nextcloud/public_html/ etc.
	1. Edit the RSYNC_OPTS parameter to add any files/directories that should be _excluded_ from the syncing. Note that these paths are relative to the path 

Usage:
------
```
$> /path/to/deploy.sh
```


See [this article](https://web.archive.org/web/20190924082202/https://www.consumerreports.org/privacy/what-can-you-tell-from-photo-exif-data/)
