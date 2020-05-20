# Running the image

``` sh
docker run --rm \
	-v /var/run/dbus:/var/run/dbus \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e "DISPLAY=unix${DISPLAY}" \
	-e "DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" \
	lens:3.4.0
```
