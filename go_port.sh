#!/bin/bash
# get random number for DPORT
rdport=$(python -S -c "import random; print random.randrange(49152,65535)")
# name of kontainer
dock_kont="npme-couch"
# get IP kontainer
ip=$(/usr/bin/docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq) | grep $dock_kont | awk '{print $3}')
# add NAT to iptables for access
/sbin/iptables -t nat -A DOCKER -p tcp --dport $rdport -j DNAT --to-destination $ip:5984
echo "Kontainer $dock_kont has IP= $ip"
echo "Try to go http://NPME.DOMAIN:$rdport/registry/_all_docs"

