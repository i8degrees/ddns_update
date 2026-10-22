#!/bin/sh
#
# ddns_update launch wrapper script
#
# SEE ALSO
# 1. man 8 dnsmasq
# 2. https://dnsmasq-man-page.net

#set -o xtrace

# .env
DEBUG=1
DEBUG_TRACE=
VERBOSE=1
SYSLOG=
PYTHONUTF8=1

# The OpenWRT dist script at /usr/lib/dnsmasq/dhcp-script.sh is responsible
# for passing the arguments given below.
CMD=$1
MAC=$2
IPADDR=$3
HOSTNAME=$4

# APP_CONFIG
#SCRIPT_STUB_EXE="/root/.local/share/pipx/venvs/update-ddns-zone/bin/ddns_update"
SCRIPT_STUB_EXE="/root/.local/bin/ddns_update"
#DDNS_UPDATE_CONFIG="/usr/local/etc/app.yml"
DDNS_UPDATE_CONFIG="/usr/local/etc/app.json"
# This overrides potential setting in app.yml
PDNS_API_KEY="xxx"
export PDNS_API_KEY
export DDNS_UPDATE_CONFIG

#/root/.local/share/pipx/venvs/update-ddns-zone/bin/ddns_update $@
"$SCRIPT_STUB_EXE" --config "$DDNS_UPDATE_CONFIG" -lDEBUG \
  "$CMD" "$MAC" "$IPADDR" "$HOSTNAME"

unset PDNS_API_KEY
unset DDNS_UPDATE_CONFIG

