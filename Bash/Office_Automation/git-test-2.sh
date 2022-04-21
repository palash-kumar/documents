#!/bin/bash
#git fetch
clear;

# git config --global user.name "support"
# git config --global user.password "bbone29sp"
# git config --global user.email "support@maestro.com.bd"
# git config --global credential.helper store
# vim .git/config

#[credential "https://git.maestro.com.bd:58480"]
#        username = support
#        password = bbone29sp

WORKLOC="/home/maestro"

WORKTREE="$WORKLOC/maXimErp-production"


# Navigating to location
cd "$WORKTREE"

cat .git/config | grep credential
cat .git/config | grep username
cat .git/config | grep password

#git --work-tree="$WORKLOC/maXimErp-production" status --porcelain

#pwd
#echo "WT: $WORKTREE"
git branch

# Expect script for login to fetch
#expect -f "/home/maestro/git-fetch.sh"
#FLAG=$(/home/maestro/git-fetch.sh $WORKTREE)
FLAG= $(git fetch)
echo "FETCH OUTPUT: $FLAG";

#git config --global user.name "support"
#git config --global user.email ""
#git config --global user.password "bbone29sp"
# For Remote
git log FETCH_HEAD --decorate=full > "$WORKLOC/FETCH_HEAD"

# For local
git log HEAD --decorate=full > "$WORKLOC/HEAD"

# Read first 6 lines (Only latest commit from local)
LOCAL="$(head -6 $WORKLOC/HEAD)"

#cat /home/maestro/HEAD
# Read first 6 lines (Only latest commit) shihab
REMOTE="$(head -6 $WORKLOC/FETCH_HEAD)"

LOCAL_HASH=($(echo "$LOCAL" | grep commit))

REMOTE_HASH=($(echo "$REMOTE" | grep commit))


echo -e '\nLOCAL:'
echo "$LOCAL"
echo -e '\nREMOTE:'
echo -e "$REMOTE\n"

if [ "${LOCAL_HASH[1]}" = "${REMOTE_HASH[1]}" ]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
    
fi

# Local Date and Remote Date
L_DATE=($(echo "$LOCAL" | grep Date))
R_DATE=($(echo "$REMOTE" | grep Date))

# Date Format samples
#   Thu Sep 30 14:55:37 2021 +0600  (Git log date format)
#   Sat, 02 Oct 2021 18:20:59 +0600 (System can convert)

R_DATE="${R_DATE[1]}, ${R_DATE[3]} ${R_DATE[2]} ${R_DATE[5]} ${R_DATE[4]} ${R_DATE[6]}"
L_DATE="${L_DATE[1]}, ${L_DATE[3]} ${L_DATE[2]} ${L_DATE[5]} ${L_DATE[4]} ${L_DATE[6]}"
echo "$R_DATE"

# Converting Date
l_datatime=`date -d "${L_DATE}" '+%Y%m%d %H%M%S'`
r_datatime=`date -d "${R_DATE}" '+%Y%m%d %H%M%S'`
echo "Local: $l_datatime"
echo "Remote: $r_datatime"

ldate_arr=($(echo "$l_datatime"))
rdate_arr=($(echo "$r_datatime"))
#ldate_add=`echo "${ldate_arr[0]} + ${ldate_arr[1]}" | bc -l`
#rdate_add=`echo "${rdate_arr[0]} + ${rdate_arr[1]}" | bc -l`

ldate_add=`echo "${ldate_arr[0]}${ldate_arr[1]}"`
rdate_add=`echo "${rdate_arr[0]}${rdate_arr[1]}"`

#gstatus=`git status -uno`
#echo "Status: $gstatus"

# show the latest commit without a git fetch
# git rev-parse @{u} 7079f77519c9acf3114ad2a33e6c8610536d41c0
# show the latest commit of LOCAL
# git show-ref --heads --hash

# TRACKS
#Local: 20211004 105449
#Remote: 20211003 160651
#20210930 chk-update

# Log file def
D=$(date +"%Y%B%d")
LOG_FILE="$WORKLOC/git-update-log/git-log-$D"
echo $LOG_FILE

# Comparing Local and Remote Dates (should be removed after hash analysis)
if [[ "$ldate_add" -lt "$rdate_add" ]]; then
    echo "REQUIRED UPDATE"
    echo "UPDATING Application."

    PULL_RES=$(git pull)
    
    case $PULL_RES in

      *"Already up-to-date"*)
        echo -ne "ALREADY UP-TO-DATE\n"
        ;;
      *"CONFLICT"*)
        [[  -f "$LOG_FILE" ]] && echo "FILE EXIST!" || touch "$LOG_FILE"; echo "FILE CREATED!"
        date +"%Y%B%d"
        echo -e "$PULL_RES\n" | cat - "$LOG_FILE" > "$WORKLOC/temp" && mv "$WORKLOC/temp" "$LOG_FILE"
        date +"%dth %B, %Y"  | cat - "$LOG_FILE" > "$WORKLOC/temp" && mv "$WORKLOC/temp" "$LOG_FILE"
        
        #echo -ne "CONFLICT is there.\n" >> /home/maestro/git-log
        ;;
    esac


    #RES=$(/home/maestro/git-pull.sh $WORKTREE)
    #echo "$RES"
else
    echo "LOCAL IS UP-TO-DATE"
fi

#RES=$(/home/maestro/git-pull.sh $WORKTREE)
GITPULL=$(git pull)
echo "REPLY: $GITPULL"

status=$(
  case "$GITPULL" in
    ("Already up-to-date.") echo "REPO IS UP-TO-DATE" ;;
    ("UP-TO-DATE") echo "REPO IS UP TO DATE" ;;
    ("CONFLICT") echo "REPO CONTAINS CONFLICT" ;;
    (*) echo "$GITPULL" ;;
  esac)

echo "STATUS: $status"
git --work-tree=${WORKTREE} status --porcelain
echo $rdate_add
echo $ldate_add
