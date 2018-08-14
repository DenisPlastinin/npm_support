# npm_support
some scripts for npme
1. #./go_port.sh  
	search cotainer "npme-couch"
	get container IP
	get random port between 49152 - 65535
	add rule NAT to iptable :random_port -> ip_npme-couch:5984
You may access http://NPME.IP:ramdom_port/registry/_all_docs
