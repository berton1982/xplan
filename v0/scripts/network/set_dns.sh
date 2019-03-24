#!/bin/bash
# set dns for googleapis.com. so storage.googleapis.com can be accessed

devices=$(nmcli connection show --active | sed '1d' | sed -n '/bridge/!p' | gawk '{print $1}')

for device in ${devices[@]}
do
  nmcli connection modify $device ipv4.dns 222.73.144.195
done
