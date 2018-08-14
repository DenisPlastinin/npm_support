# npm_support
some scripts for npme
1. <p>#./go_port.sh  </p>
	search cotainer "npme-couch"<br>
	get container IP<br>
	get random port between 49152 - 65535<br>
	add rule NAT to iptable :random_port -> ip_npme-couch:5984<br>
You may access http://NPME.IP:ramdom_port/registry/_all_docs
