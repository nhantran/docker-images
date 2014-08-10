# Create SonarQube database and user.
#
# Command: mysql -u root -p < create_database.sql
#

CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'sonar'@'%' IDENTIFIED BY '{{MYSQL_PASSWD}}';
GRANT ALL PRIVILEGES ON sonar.* TO 'sonar'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;