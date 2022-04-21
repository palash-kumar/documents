tart
export ORACLE_HOME=/home/db2/app/oracle/product/12.2.0/db_1
export ORACLE_BASE=/home/db2/app/oracle
export PATH=$ORACLE_HOME/bin:$PATH:.

WORKLOC="/home/maestro"

file="$WORKLOC/database.properties"

if [ -f "$file" ]
then
    echo "$file found."
 . $file

  echo "User Id       = " ${userName}
  echo "user password = " ${password}
  echo "url  = " ${url}

#sqlplus -S ${userName}/${password}@${url}

echo "UPDATE USER_SETTINGS SET SVALUE = 'NO' WHERE SNAME = 'MOB_VERI' AND USER_ID = 6113;"| sqlplus -S ${userName}/${password}@${url} >> "$WORKLOC\logs\dboutput.txt "

else
    echo "$file not found."
fi
# DB END
