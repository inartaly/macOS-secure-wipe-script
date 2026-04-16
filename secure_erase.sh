#!/bin/bash

input=$1

Echo :::Usage "sudo ./secure_erase.sh 2", where "2" is the number of the disk to wipe...:::

##sudo diskutil secureErase 4 /dev/$input 

osascript -e "tell application \"Terminal\" to do script \"sudo diskutil secureErase 4 /dev/disk$input\""
