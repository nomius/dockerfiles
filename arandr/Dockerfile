FROM python:3-alpine

ENV HOME=/home
WORKDIR /home
RUN apk add gtk+3.0 gobject-introspection gobject-introspection-dev gobject-introspection xrandr wget build-base ttf-freefont fontconfig adwaita-icon-theme && \
	wget http://christian.amsuess.com/tools/arandr/files/arandr-0.1.10.tar.gz && \
	tar xpf arandr-0.1.10.tar.gz && \
	pip install pycairo pygobject && \
	apk del build-base gobject-introspection-dev && \
	mkdir -p /home/.screenlayout
WORKDIR /home/arandr-0.1.10

ENTRYPOINT [ "./arandr" ]

