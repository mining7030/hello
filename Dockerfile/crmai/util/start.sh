#/bin/bash

/etc/init.d/nginx start

uwsgi --ini uwsgi.ini