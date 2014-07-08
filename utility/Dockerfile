FROM ubuntu
MAINTAINER Nhan Tran <nhantran@kms-technology.com>

RUN apt-get update

RUN apt-get install -y wget 
RUN apt-get install -y unzip 
RUN apt-get install -y git-core 
RUN apt-get install -y openssh-server 
RUN apt-get install -y supervisor 
RUN apt-get install -y inetutils-ping

RUN mkdir -p /var/run/sshd
RUN echo 'root:Passw0rd' | chpasswd

RUN mkdir -p /var/log/supervisor

ADD templates/etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22