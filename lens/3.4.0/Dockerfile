FROM node:lts-buster as builder
WORKDIR /src
RUN git clone https://github.com/lensapp/lens.git && \
	cd lens && \
	yarn config set network-timeout 300000 && \
	make build

FROM ubuntu:focal
RUN addgroup appgroup && adduser --system --ingroup appgroup --home /app --shell /bin/bash appuser
RUN apt-get update && \
	apt-get -y install libglib2.0-0 libgdk-pixbuf2.0-0 libnss3 libgtk-3-0 libx11-xcb1 libxss1 libasound2
USER appuser:appgroup
WORKDIR /home/appuser
COPY --from=builder /src/lens/dist/linux-unpacked .
CMD /home/appuser/kontena-lens --no-sandbox
