#!/usr/bin/env bash

# add_site.sh: Adds provided site to dnsmasq.conf.
# author: tom@reeb.me

# bomb on any error
set -e

# make sure basic paths are set
export PATH=/sbin:/usr/sbin:/bin:/usr/bin:$PATH

CDW=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

EXTIP=$(curl -s http://checkip.amazonaws.com/)

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

echo "address=/$1/$EXTIP" >> ${CDW}/../dnsmasq.conf

sudo docker restart dnsmasq

exit 0