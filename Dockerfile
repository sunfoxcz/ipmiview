FROM ubuntu:18.04
MAINTAINER Tomas Jacik <tomas@jacik.cz>

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0.0

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD IPMIView_2.17.0_build.200505_bundleJRE_Linux_x64 /opt/IPMIView

RUN apt-get update
RUN apt-get dist-upgrade -y --no-install-recommends
RUN apt-get install -y --no-install-recommends \
	software-properties-common \
	xvfb \
	x11vnc \
	supervisor \
	fluxbox \
	firefox \
	git
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC
RUN git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

RUN apt-get remove --purge -y git && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /build && \
	rm -rf /tmp/* /var/tmp/* && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
