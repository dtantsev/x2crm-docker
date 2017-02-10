#!/bin/sh

chown -R apache:apache /app
crond -l 2
rm -f /run/apache2/httpd.pid
httpd -DFOREGROUND
