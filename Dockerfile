FROM ubuntu
MAINTAINER yuebo <317728991@qq.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
   apt-get update && \
   apt-get upgrade
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8



RUN apt-get -y install tinyproxy


RUN sed -i -e "s/^Allow /#Allow /" /etc/tinyproxy.conf

RUN echo ConnectPort 1194 >> /etc/tinyproxy.conf


EXPOSE 8888
ENTRYPOINT ["/usr/sbin/tinyproxy", "-d"]


