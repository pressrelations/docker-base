FROM phusion/baseimage:0.9.15
MAINTAINER pressrelations
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install git wget curl

RUN mv /etc/service/cron /etc/service/.cron
RUN mv /etc/service/sshd /etc/service/.sshd
RUN mv /etc/service/syslog-ng /etc/service/.syslog-ng
RUN chmod 444 /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm
