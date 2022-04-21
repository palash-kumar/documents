#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
ORANGE='\033[1;33m'
NC='\033[0m' # No Color


cd maXimErp-production

pwd

commitTimeProcessing(){
	rcvdDate=$1
  
	IFS=' ' read -ra dateArray <<< "${rcvdDate}"
	
	#printf "${dateArray[2]} ${dateArray[3]} ${dateArray[4]} ${dateArray[5]}\n"
	vdate="${dateArray[2]} ${dateArray[3]} ${dateArray[4]} ${dateArray[5]}"
	epoch=$(date -d "${vdate}" +"%s")
	echo $epoch

}


# Getting details for local HASH
#read -ra LOCAL_COMMIT_HASH <<< $(git log -2 | grep Date)
LOCAL_COMMIT_HASH=$(git log -1 | grep Date)

echo ${LOCAL_COMMIT_HASH}

LOCAL_COMMIT_TIME=$(commitTimeProcessing "${LOCAL_COMMIT_HASH}")

printf '\n'
echo $LOCAL_COMMIT_TIME

# Getting details from remote HASH

REMOTE_COMMIT_HASH=$(git rev-parse @{u})
git show $REMOTE_COMMIT_HASH | grep Date

REMOTE_COMMIT_DATE=$(git show e0fe34e681d766229a1a3569b097f3d6108b2ec4 | grep Date)

echo $REMOTE_COMMIT_DATE


REMOTE_COMMIT_TIME=$(commitTimeProcessing "${REMOTE_COMMIT_DATE}")

printf '\n'
echo $REMOTE_COMMIT_TIME

if (( $LOCAL_COMMIT_TIME > $REMOTE_COMMIT_TIME )); then
    echo -e "${GREEN}Project Already UP-TO-DATE${NC}\n"
elif (( $LOCAL_COMMIT_TIME < $REMOTE_COMMIT_TIME )); then
    echo -e  "${ORANGE}Need to pull${NC}\n"
fi



printf '\n====================================\n'
UPSTREAM=${1:-'@u'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

echo $UPSTREAM

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi

