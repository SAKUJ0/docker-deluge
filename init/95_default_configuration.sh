#!/bin/bash
if [ ! -e /config/core.conf ]; then
	mv /core.conf /config/core.conf
	chown abc:abc /config/core.conf
	chmod 644 /config/core.conf
fi
