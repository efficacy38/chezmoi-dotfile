#!/bin/bash
# $1 is 1 is enable adguardhome, 0 is disable adguardhome
set -x

usage(){
	echo "usage: $0 [1|0|-s]"
	echo "1: enable adguardhome"
	echo "0: disable adguardhome"
	echo "-s: print current status"
	exit 1
}

post(){
	remote="$1"
	enabled="$2"
	

	curl -s -k -X POST -H "Content-Type:application/json" \
		-u "efficacy38:$(cat /home/efficacy38/.local/adguardhome-pwd.txt)" \
		-d "{\"protection_enabled\":$enabled}" \
		"$remote"
}

get(){
	remote="$1"
	curl -s -k -X GET -H "Content-Type:application/json" \
		-u "efficacy38:$(cat /home/efficacy38/.local/adguardhome-pwd.txt)" \
		"$remote"
}

export -f post
export -f get

server_list(){
	for i in $(seq 1 2); do
		echo "adguardhome.n$i.jpc1.oci.csjhuang.net"
	done
}

print_current_status(){
	echo "machine status"
	server_list | xargs -P0 -I{} bash -c 'printf "%s %s\n" "{}" $(get "https://{}/control/dns_info" | jq ".protection_enabled")' _ {}
}


if [ $# -ne 1 ]; then
	usage
fi

if [[ $1 = "-s" ]]; then
	# print_current_status | column -t
	print_current_status | column -t
	exit 0
fi

if [ $1 -eq 1 ]; then
	server_list | xargs -P0 -I{} bash -c 'post https://{}/control/dns_config "true"' _ {}
else
	server_list | xargs -P0 -I{} bash -c 'post https://{}/control/dns_config "false"' _ {}
fi
