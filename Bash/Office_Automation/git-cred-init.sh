#!/bin/bash

WORKLOC="/home/maestro"
STR='GNU/Linux is an CONFLICT operating system'
SUB='Lin-ux'
LOG_PATH="$WORKLOC/git-update-log"
D=$(date +"%Y%B%d")
LOG_FILE="git-log-$D"
echo $LOG_FILE

[[  -d "$LOG_PATH" ]] && echo "Directory Exist!" || mkdir "$LOG_PATH"; echo "DIRECTORY CREATED!"

[[ ! -d "$LOG_PATH" ]] && mkdir "$LOG_PATH"
#[[ -f "$LOG_PATH" ]] && echo "This file exists!"

#case $STR in

#  *"$SUB"*)
#    echo -ne "It's there.\n"
#    ;;
#  *"CONFLICT"*)
#    date +"%Y%B%d"
#    echo -e "CONFLICT is there.\n" | cat - /home/maestro/git-log > /home/maestro/temp && mv /home/maestro/temp /home/maestro/git-log
#    date +"%dth %B, %Y"  | cat - /home/maestro/git-log > /home/maestro/temp && mv /home/maestro/temp /home/maestro/git-log
#    
#    #echo -ne "CONFLICT is there.\n" >> /home/maestro/git-log
#    ;;
#esac

#WORKLOC="/home/maestro"

#WORKTREE="$WORKLOC/maXimErp-production"
#cd "$WORKTREE"

#git config --global credential.helper store
#git config --global user.name "support"
#git config --global user.password "bbone29sp"
#git config --global user.email "support@maestro.com.bd"

#mkdir "$WORKLOC/erpImages"
#mkdir "$WORKLOC/erpImages/Inventory"
#mkdir "$WORKLOC/erpDoc/Inventory"
#touch "$WORKLOC/erpLog/app.log "