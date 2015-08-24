FROM phusion/baseimage:0.9.17
MAINTAINER pressrelations

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8
ENV EDITOR vim
ENV TERM xterm

RUN locale-gen en_US.UTF-8

RUN sed -i -e 's,http://archive.ubuntu.com,http://de.archive.ubuntu.com,g' /etc/apt/sources.list
RUN apt-get update && \
	apt-get -y install git wget curl && \
	apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Deactivate unused services
RUN mv /etc/service/cron /etc/service/.cron
RUN mv /etc/service/sshd /etc/service/.sshd
RUN mv /etc/service/syslog-ng /etc/service/.syslog-ng
RUN mv /etc/service/syslog-forwarder /etc/service/.syslog-forwarder
RUN chmod 444 /etc/my_init.d/00_regen_ssh_host_keys.sh
