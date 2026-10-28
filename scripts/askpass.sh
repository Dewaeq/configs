#!/bin/sh
# sudo -A helper: asks for the password in a popup (sudo passes its prompt as $1)
exec zenity --password --title="$1"
