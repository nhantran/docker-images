FROM ubuntu
MAINTAINER Nhan Tran <tranphanquocnhan@gmail.com>

# Install a fast downloader 
RUN apt-get update

# Install MySQL server
RUN echo 'mysql-server mysql-server/root_password password Passw0rd' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password Passw0rd' | debconf-set-selections
RUN apt-get install -y mysql-server

# Copy the database script to container
ADD create_database.sql /tmp/create_database.sql
# Allow all hosts to access the database service
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Start MySQL service, sleep 10s waiting for the service ready and execute the database script
RUN /usr/bin/mysqld_safe & sleep 10s && mysql -u root -pPassw0rd < /tmp/create_database.sql

EXPOSE 3306

CMD ["mysqld_safe"]
