FROM ubuntu:latest as build

ARG INK_VERSION=0.5.3
ARG LIBINKLEVEL_VERSION=0.9.3

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential pkg-config wget libusb-1.0-0 libusb-1.0-0-dev && \
	wget http://downloads.sourceforge.net/ink/ink-${INK_VERSION}.tar.gz && \
	wget http://downloads.sourceforge.net/libinklevel/libinklevel-${LIBINKLEVEL_VERSION}.tar.gz && \
	tar xpf libinklevel-${LIBINKLEVEL_VERSION}.tar.gz && \
	(cd libinklevel-${LIBINKLEVEL_VERSION} && ./configure --prefix=/usr && make && make install) && \
	tar xpf ink-${INK_VERSION}.tar.gz && \
	(cd ink-${INK_VERSION} && ./configure --prefix=/usr && make && make install)

FROM ubuntu:latest
COPY --from=build /usr/lib/libinklevel.* /usr/lib/
COPY --from=build /usr/bin/ink /bin
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libusb-1.0-0 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/bin/ink" ]
