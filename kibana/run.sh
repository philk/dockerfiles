#!/bin/bash

sed -i "s/%es_upstream%/$ES_UPSTREAM/g" /etc/nginx/conf.d/kibana.conf
sed -i "s/%server_name%/$SERVER_NAME/g" /etc/nginx/conf.d/kibana.conf
sed -i "/    elasticsearch:.*/c elasticsearch: window.location.protocol+\"//\"+window.location.hostname+\":\"+window.location.port," /opt/kibana/config.js

nginx -t -c /etc/nginx/nginx.conf
nginx -c /etc/nginx/nginx.conf
