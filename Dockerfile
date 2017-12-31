FROM debian

LABEL maintainer "yuwash at yandex dot com"

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		x11vnc \
		xvfb \
		supervisor \
		sudo \
	&& rm -rf /var/lib/apt/lists/* \
	&& adduser --shell /bin/sh debian \
	&& echo "debian:debian" | /usr/sbin/chpasswd \
	&& echo "debian    ALL=(ALL) ALL" >> /etc/sudoers

WORKDIR /home/debian
EXPOSE 5900
USER debian
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]

USER root
RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		openbox \
		xfce4-terminal \
	&& rm -rf /var/lib/apt/lists/*
USER debian

ADD etc /etc
