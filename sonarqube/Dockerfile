FROM ubuntu
MAINTAINER Nhan Tran <tranphanquocnhan@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y

# add-apt-repository need these packages to work
RUN apt-get install software-properties-common -y
RUN apt-get install python-software-properties -y

# Install oracle-java6-installer
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN yes | apt-get install oracle-java6-installer -y 

# Install unzip
RUN apt-get install unzip -y

# Install a fast downloader 
RUN apt-get install -y axel

# Download and install Sonarqube
RUN axel -n 10 http://dist.sonar.codehaus.org/sonarqube-4.1.1.zip

RUN unzip -d /opt sonarqube-4.1.1.zip
RUN mv /opt/sonarqube-4.1.1 /opt/sonarqube
RUN rm -f sonarqube-4.1.1.zip

RUN sed -i 's|#wrapper.java.additional.6=-server|wrapper.java.additional.6=-server|g' /opt/sonarqube/conf/wrapper.conf

RUN sed -i 's|sonar.jdbc.password=sonar|sonar.jdbc.password=Passw0rd|g' /opt/sonarqube/conf/sonar.properties
RUN sed -i 's|sonar.jdbc.url=jdbc:h2|#sonar.jdbc.url=jdbc:h2|g' /opt/sonarqube/conf/sonar.properties
RUN sed -i 's|#sonar.jdbc.url=jdbc:mysql://localhost|sonar.jdbc.url=jdbc:mysql://${env:DB_PORT_3306_TCP_ADDR}|g' /opt/sonarqube/conf/sonar.properties

EXPOSE 9000

CMD ["/opt/sonarqube/bin/linux-x86-64/sonar.sh", "console", "/bin/bash"]