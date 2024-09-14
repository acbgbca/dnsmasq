#!/bin/sh

if [ -n "$DNSMASQ_CONF" ]; then
    echo "Setting dnsmasq config to"
    echo "$DNSMASQ_CONF"
    echo $DNSMASQ_CONF > /etc/dnsmasq.conf
else
    echo "DNSMASQ_CONF not set, starting with default configuration"
fi

set -x

dnsmasq "$@"