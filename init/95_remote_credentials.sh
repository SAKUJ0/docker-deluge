#!/bin/bash

# Add deluge remote credentials to auth file, if they are not in already
if [ ! -z "${DELUGE_USER}" -a ! -z "${DELUGE_PASSWORD}" ]; then
	grep "${DELUGE_USER}:${DELUGE_PASSWORD}" /config/auth || echo "${DELUGE_USER}:${DELUGE_PASSWORD}:10" > /config/auth
fi

# Make sure that auth file permissions are restrictive
chown abc:abc /config/auth
chmod 600 /config/auth
