#!/bin/bash
#set -x
: ${2?"Usage: $0 RHOSTS CMDFILE"}

RHOSTS=$1
CMDFILE=$2

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
|  \ |___ |___ |__| | \|    | \|    ___] |___ |__| |  \ |___\x0a"

}

print_scoring_matrix(){
  export IFS=$'\n'
  for line in $(cat $1 | grep "#"); do 
    echo $line; 
    sleep .03
  done
}

netscan(){
  300baud "[.] scan the network for port 22"
}

recon(){
  echo "[*] running recon and score against the rhost $1"
  rr_vector=$(ssh -q -t $1 < $2 | tail -1) 
  echo "[.] recon results vector obtained => [$rr_vector]"
  rrv_expr=$(echo $rr_vector | tr ' ' '+')
  score=$(python3 -c "print($rrv_expr)")
  echo "[.] target score ==> $score"
}

300baud "[+] Starting remote code execution... on $RHOSTS"
netscan
showoff
print_scoring_matrix $CMDFILE
recon $RHOSTS $CMDFILE
