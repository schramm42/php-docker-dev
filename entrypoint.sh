#!/bin/bash

if [ $XDEBUG ] && [ $XDEBUG = 1 ]; then
	phpenmod xdebug
else
	phpdismod xdebug
fi

# Start supervisord and services
exec supervisord -n -c /etc/supervisor/supervisord.conf
#tail -f /dev/null