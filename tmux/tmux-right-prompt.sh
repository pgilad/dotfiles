#!/usr/bin/env bash

set -euo pipefail

NETWORK=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')

echo "WIFI: $NETWORK"
