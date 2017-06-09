SCRIPT_HOME=/home/rebecca_liu_usc/elasticDB/scripts

echo "SCRIPT_HOME is set to $SCRIPT_HOME"

source $SCRIPT_HOME/set_env.sh

mysql --user="$MYSQL_USERNAME" --password="$MYSQL_PASSWORD" < $SCRIPT_HOME/../tpcw/mysql.sql

echo "clean mysql done"

cd /home/rebecca_liu_usc/java-tpcw

ant gendb

mysql --user="$MYSQL_USERNAME" --password="$MYSQL_PASSWORD" -e "purge binary logs before now();" 
