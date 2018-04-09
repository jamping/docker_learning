FROM jamping/ubuntu

MAINTAINER  jamping <jjp123@aliyun.com>

RUN apt-get update && \
     apt-get install -y mongodb pwgen && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /data/db
VOLUME /data/db

ENV AUTH yes

ADD set_mongodb_password.sh /set_mongodb_password.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 27017
EXPOSE 28017

CMD ["/run.sh"]