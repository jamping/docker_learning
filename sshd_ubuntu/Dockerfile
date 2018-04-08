#set the base 
FROM ubuntu:14.04

MAINTAINER  jamping <jjp123@aliyun.com>

RUN apt-get update && \
     apt-get install -y openssh-server && \
     rm -rf /var/lib/apt/lists/* && \
     mkdir -p /var/run/sshd && \
     mkdir -p /root/.ssh && \
     sed -ri 's/session required pam_loginuid.so/$session required pam_loginuid.so/g' /etc/pam.d/sshd

ADD authorized_keys /root/.ssh/authorized_keys
ADD run.sh /root/run.sh
RUN chmod 755 /root/run.sh

EXPOSE 22

CMD ["/root/run.sh"]