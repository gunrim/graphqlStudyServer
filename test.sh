#!/bin/sh

STD_DATETIME=$1

USER_ID=user1
USER_PW=pass1
DB_IP=192.168.0.100:8629
DB_PID=my_db
SQL_FILE=/path/to/my_script.sql
OUT_FILE=''
COL_NAME="EQMT_ID, SPOT_NM, ANALY_DATE, WEATHER_CD"

if [ -n $STD_DATETIME ]; then
    STD_DATETIME=`date +%Y%m%d%H%M`
fi
echo $STD_DATETIME

OUT_FILE=output_$STD_DATETIME.csv

echo $COL_NAME > $OUT_FILE
echo "tbsql -u $USER_ID -p $USER_PW -s $DB_IP -d $DB_PID -f $SQL_FILE --output-delimiter=',' --output-charset=utf8 >> $OUT_FILE"


#test=$1
#test2=$2
#test3=$3

#mysql
#echo "start"
#/usr/bin/mysql -N -uroot -p1234 -h192.168.20.185 --local_infile=1 suser < /home/ccmedia/test.sql | sed 's/\t/,/g' > test.txt
#echo "end"


#Tibero
#sql
## tbsql -u user1 -p pass1 -s 192.168.0.100:8629 -d my_db -c "SELECT * FROM my_table"

#sqlfile
## tbsql -u user1 -p pass1 -s 192.168.0.100:8629 -d my_db -f /path/to/my_script.sql >> /path/to/output.txt
#tbsql -u $USER_ID -p $USER_PW -s $DB_IP -d $DB_PID -f $SQL_FILE --output-delimiter=',' --output-charset=utf8 > $OUT_FILE
