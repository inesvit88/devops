chop_chop(){
  sed -n 's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/\nchop&\n/gp' $1 | grep chop | tr -d 'chop' | sort -u
}
