#!/usr/bin/env bash

/usr/bin/supervisord -c /home/scripts/supervisord.conf
tail -f /dev/null