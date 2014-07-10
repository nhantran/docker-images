FROM nhantran/utility:1.0
MAINTAINER Nhan Tran <tranphanquocnhan@gmail.com>

RUN adduser --system --group --shell /bin/sh git

USER git
WORKDIR /home/git
ADD templates/nhantran.pub /home/git/nhantran.pub
RUN mkdir -p /home/git/bin
RUN su - git -c 'git clone git://github.com/sitaramc/gitolite' 
RUN gitolite/install -to /home/git/bin
RUN export PATH=$PATH:/home/git/bin && gitolite setup -pk /home/git/nhantran.pub
