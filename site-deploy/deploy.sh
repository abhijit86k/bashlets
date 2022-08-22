#!/bin/bash

#Set the path to your GIT Repo
GITROOT="/path/to/git/repo"

#Set the path to the Webserver Root directory. This could be:
#  - a local mount point e.g. if a remote directory is mounted using sshfs, ftp, etc
#  - a remote location specified fully, e.g. user@hostname:/var/www/
#  - For IIT-DH users this would be the location of the local public_html directory synced by Nextcloud, e.g. ~/Nextcloud/public_html/ etc.
WEBROOT="/path/to/webserver/root/"

#Set RSYNC Options
RSYNC_OPTS="-avz --itemize-changes --ignore-times  --exclude=/Files --delete-after"


cd $GITROOT
#Try to fetch from git
#git fetch &> /dev/null || echo "Git fetch failed. Exiting now."

if [ -d .git ]
then
    echo " ";
else
    echo "ERROR: Not a valid Git repo"
    exit 0;
fi

#Update the index
git update-index --refresh;
git diff-index --quiet HEAD --;
if [ $? = 0 ];
    then
    echo "No uncommitted changes found, ready to deploy";
    echo "Attempting Rsync DRY RUN:"
    rsync -n $RSYNC_OPTS ./site/ $WEBROOT
    echo "Proceed? 'y' to continue"
    read response;
    if [ $response = 'y' ]
    then
        echo "Transferring via Rsync";
        rsync $RSYNC_OPTS ./site/ $WEBROOT;
    else
        echo "OK. Exiting";
    fi;

else
    #Files are dirty
    echo "Some files need updates!!";
    echo "Still push updates?";
    read response;
    if [ $response = 'y' ]
    then
            echo "Attempting Rsync DRY RUN:"
            rsync -n $RSYNC_OPTS ./site/ $WEBROOT
            echo "Proceed? 'y' to continue"
            read response;
            if [ $response = 'y' ]
            then
                echo "Transferring via Rsync"
                rsync $RSYNC_OPTS ./site/ $WEBROOT
            else
                echo "OK. Exiting";
            fi;
    else
        echo "no";
    fi;
fi
