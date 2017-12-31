FROM alpine:3.5

LABEL maintainer "yuwash at yandex dot com"

RUN set -ex \
	&& echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
	&& echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
	&& apk --update upgrade \
	&& apk add --update --no-cache \
		libressl2.5-libcrypto@edge \
		libressl2.5-libssl@edge \
		libvncserver@edge \
		x11vnc@testing \
		xvfb \
		supervisor \
		sudo \
	&& rm -rf /apk /tmp/* /var/cache/apk/* \
	&& addgroup alpine \
	&& adduser  -G alpine -s /bin/sh -D alpine \
	&& echo "alpine:alpine" | /usr/sbin/chpasswd \
	&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers

ADD etc /etc

WORKDIR /home/alpine
EXPOSE 5900
USER alpine
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]

RUN set -ex \
	&& apk add --no-cache \
		openbox \
		st \
		midori
