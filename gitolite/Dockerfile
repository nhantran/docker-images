FROM nhantran/utility:1.0
MAINTAINER Nhan Tran <tranphanquocnhan@gmail.com>

RUN useradd git -m -s /bin/bash

USER git

WORKDIR /home/git

RUN mkdir -p bin
RUN git clone git://github.com/sitaramc/gitolite 
RUN gitolite/install --to /home/git/bin
