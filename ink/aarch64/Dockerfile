FROM arm64v8/ubuntu:latest as build

ARG INK_VERSION=0.5.3
ARG LIBINKLEVEL_VERSION=0.9.3

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential pkg-config wget libusb-1.0-0 libusb-1.0-0-dev && \
	wget http://downloads.sourceforge.net/ink/ink-${INK_VERSION}.tar.gz && \
	wget http://downloads.sourceforge.net/libinklevel/libinklevel-${LIBINKLEVEL_VERSION}.tar.gz && \
	tar xpf libinklevel-0.9.3.tar.gz && \
	(cd libinklevel-0.9.3 && ./configure --prefix=/usr && make && make install && cd ..) && \
	tar xpf ink-0.5.3.tar.gz && \
	(cd ink-0.5.3 && ./configure --prefix=/usr && make && make install && cd ..)

FROM arm64v8/ubuntu:latest
COPY --from=build /usr/lib/libinklevel.* /usr/lib/
COPY --from=build /usr/bin/ink /bin
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libusb-1.0-0 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/bin/ink" ]