#!/bin/bash
# color
# get random number for DPORT
rdport=$(python -S -c "import random; print random.randrange(49152,65535)")

# name of container
dock_cont="npme-couch"
#dock_cont="npme-rr-service"

# get IP container
ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $dock_cont)
# more long var for get IP container
ip=$(/usr/bin/docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep $dock_cont | awk '{print $3}')

# add NAT to iptables for access
/sbin/iptables -t nat -A DOCKER -p tcp --dport $rdport -j DNAT --to-destination $ip:5984

echo -e "\e[49m Container \e[44m $dock_cont \e[49m has IP=\e[44m $ip \e[49m"
echo -e "\e[49m Try to go http://NPME.DOMAIN:\e[44m$rdport\e[49m/registry/_all_docs\e[49m"

