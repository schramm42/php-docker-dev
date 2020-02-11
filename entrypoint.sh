#!/bin/bash

# Start supervisord and services
exec supervisord -n -c /etc/supervisor/supervisord.conf
#tail -f /dev/null