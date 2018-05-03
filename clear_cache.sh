#!/bin/bash
VARNISH_HOST_LIST=$(cat << EOF
bsro-tools.icrossing.com
bato-tools.icrossing.com
EOF
)
APACHE_HOST_LIST=$(cat << EOF
bsro-tools.icrossing.com
bato-tools.icrossing.com
EOF
)
USER="jenkins"
VARNISH_CMD="uname -a"
APACHE_CMD="cat /etc/hosts"


echo "Restart VARNISH service =====>"

for varnish_host in $VARNISH_HOST_LIST; do ssh $USER@$varnish_host $VARNISH_CMD; done

echo "Clean up APACHE /htdocs =====>"

for apache_host in $APACHE_HOST_LIST; do ssh $USER@$apache_host $APACHE_CMD; done
