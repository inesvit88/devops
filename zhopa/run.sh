#!/bin/bash

${1?"Usage: $0 RHOSTS"}

RHOSTS=$1

showoff(){
  echo "[@] print some cool banner ..."
}

recon(){
  echo "[*] running recon and score against the rhost $1"
  rr_vector=$(ssh -q -t $1 < cmdlist | tail -1) 
  
  echo "[.] recon results vector obtained => [$rr_vector]"
}

showoff
recon $RHOSTS
