FROM ubuntu:latest

RUN apt-get update && \
	apt-get install -y \
        software-properties-common \
		wget \
		openjdk-21-jre \
		xvfb \
        xz-utils \
		libgtk2.0-bin && \
	add-apt-repository ppa:ubuntuhandbook1/apps \
    && apt-get update \
    && apt-get install -y avrdude avrdude-doc \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* && \
	mkdir -p /root/.local/share

ENV ARDUINO_IDE_VERSION=1.8.19
RUN (wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz \
	| tar xJC /usr/local/share \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

ENTRYPOINT [ "arduino" ]
