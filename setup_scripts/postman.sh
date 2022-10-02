#!/bin/sh

# Postman.
# https://learning.postman.com/docs/getting-started/installation-and-updates/#installing-postman-on-linux

POSTMAN_DOWNLOAD_LOCATION="/home/$USER/Apps"

# Download and untar the file.
# wget -c https://dl.pstmn.io/download/latest/linux64 -O - | sudo tar -xz -C $POSTMAN_DOWNLOAD_LOCATION

POSTMAN_DESKTOP_FILE="/home/$USER/.local/share/applications/Postman.desktop"
POSTMAN_DESKTOP_DIR=`dirname $POSTMAN_DESKTOP_FILE`
[ ! -d $POSTMAN_DESKTOP_DIR ] && mkdir -p $POSTMAN_DESKTOP_DIR

# Create a desktop file.
/bin/cat <<EOM >$POSTMAN_DESKTOP_FILE
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=$POSTMAN_DOWNLOAD_LOCATION/Postman/app/Postman %U
Icon=$POSTMAN_DOWNLOAD_LOCATION/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOM

# To access postman command in terminal.
sudo ln -s $POSTMAN_DOWNLOAD_LOCATION/Postman/app/Postman /usr/local/bin/postman