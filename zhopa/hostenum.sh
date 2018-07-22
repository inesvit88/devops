#!/bin/bash

: ${1?"[..Discover/recon and score own network. ARGV: <network interface> ..] Usage: $0 IFNAME "}

IFNAME=$1

zaspinner()
{
  local pid=$1
  local delay=0.1
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

300baud(){
  str=$1
  for (( i=0; i<${#str}; i++ )); do
    echo -n "${str:$i:1}"
    sleep .03
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
  300baud "[.] scaning the network $NETWORK for running hosts.."
  330baud "[*] launching a stealth SYN scan against each machine that is up out of 256 IPs on the class C sized network..."
  if [ -d ./nmap ]; then rm -rf ./nmap; fi
  mkdir nmap
  nmap -sS -oA nmap/init $NETWORK > /dev/null 2>&1 &
  echo -n "[.] get to da chOppA!!! ==> "; zaspinner $!
  grep_ips_from_file nmap/*
  exit 1
}

recon(){
  echo "[*] running recon and score against the rhost $1"
  rr_vector=$(ssh -q -t $1 < $2 | tee -a results | grep resultvector | sed -e 's/^\w*\ *//') 
  echo "[.] recon results vector obtained => [$rr_vector]"
  rrv_expr=$(echo $rr_vector | tr ' ' '+')
  score=$(python3 -c "print($rrv_expr)")
  echo "[.] target score ==> $score"
  if [ $score == "8" ];
    then
      300baud "[.] Dang....most likely no Internet connectivity" 
  fi
}

netscan $IFNAME
showoff
print_scoring_matrix $CMDFILE
300baud "[+] Starting remote code execution..."
recon $RHOSTS $CMDFILE
