#!/bin/bash

: ${1?"[..Discover/recon and score own network. ARGV: <network interface> ..] Usage: $0 IFNAME "}

IFNAME=$1

zaspinner()
{
  local pid=$1
  local delay=0.07
  local spinstr='|/-\'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

grep_ips_from_file(){
  sed -n 's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/\nchop&\n/gp' $1 | grep chop | tr -d 'chop' | sort -u
}

ctype(){
  str=$1
  speed=$2
  if [ -z $speed ]; then speed=".03"; fi
  for (( i=0; i<${#str}; i++ )); do
    echo -n "${str:$i:1}"
    sleep $speed
  done
  echo 
}

showoff(){
echo -e "\
____ ____ ____ ____ _  _    _  _    ____ ____ ____ ____ ____    
|__/ |___ |    |  | |\ |    |\ |    [__  |    |  | |__/ |___    
|  \ |___ |___ |__| | \|    | \|    ___] |___ |__| |  \ |___ ===> BY IFNAME \x0a"

}

print_scoring_matrix(){
  export IFS=$'\n'
  for line in $(cat $1 | grep "#"); do 
    echo $line; 
    sleep .03
  done
}
network_CIDR(){
  ip a s $1 | sed -nE '/^\s*inet\b/ s/^\s*inet\s*(([0-9]+\.){3})[0-9]+(\S+).*/\10\3/p'
}
netscan(){
  NETWORK=$( network_CIDR $1 )
  ctype "[.] scaning the network $NETWORK for running hosts.." .01
  ctype "[*] launching a stealth SYN scan against each machine that is up out of 256 IPs on the class C sized network..." .01
  if [ -d ./nmap ]; then rm -rf ./nmap; fi
  mkdir ./nmap
  sudo nmap -sS -oA nmap/init $NETWORK > /dev/null 2>&1 &
  echo -n "[*] get to da chOppA!!! ==> "; zaspinner $!
  grep_ips_from_file nmap/*
  exit 1
}

netscan $IFNAME
showoff
print_scoring_matrix $CMDFILE
ctype "[+] Starting remote code execution..."
