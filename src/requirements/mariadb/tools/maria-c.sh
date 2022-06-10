service mysql start;

sleep 5;

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -e "CREATE USER IF NOT EXISTS 'swang'@'%' IDENTIFIED BY 'swang4242';"

mysql -e "GRANT ALL ON wordpress.* TO 'swang'@'%';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root4242';"

mysqladmin -uroot -proot4242 shutdown

sleep 5;

exec mysqld