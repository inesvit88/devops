#!/bin/bash

##
#  handy-hexy for choppa hexdump -C /usr/share/misc/magic.mgc
#
#
##

_file=$1
_chunks=$2
_chunksize="...value..."
o_suffix="Test.class"
: ${1? : [*] =========> usage $0 <file_to_chop> <number of chunks>, for example:>$  $0 myfilename 1024 ===> will chop into 1K pieces}

#for i in {1..3}; do
# better use seq command, POSIX built in for older bash versions
orig_fsize=$(ls -al $_file | awk '{print $5}')

declare -i c
c=$_chunks-1
cchunks=$c

declare -i n 
n=$orig_fsize%$c 
_last_chunk_size=$n

echo -ne "[.] last chunk size: $_last_chunk_size \t"

declare -i k
k=$orig_fsize-$n

declare -i m  
m=$k/$cchunks
_major_fsize=$m

echo -ne "[.] all other chunks size: $major_fsize \t <--->\x0a"
#echo -ne "[t(-_-)] calc it: $n \x0a"
#_chunksize=$n
declare -i j
j=$_chunks-1
_major_chunks=$j

echo -ne "[.] file data: \t orginial size: $orig_fsize bytes, will chop it into $_chunks chunks,\
	with $_major_fsize bytes each\x0a"
echo -ne "[.] and a last chunk, with: $_last_chunk_size bytes \x0a"
for i in $(seq $_major_chunks); do
  _o_fname="$i-$o_suffix"
  declare -i b
  b=($i-1)*$_major_fsize
  _skip_bytes=$b
  echo -ne "[.] chopped filename: $_o_fname\t size:$_major_fsize \x0a";
  echo -ne "[*] -exec dd if=$_file of=$_o_fname bs=1 skip=$_skip_bytes count=$_major_fsize \x0a"
done;

declare -i z
z=$orig_fsize-$_last_chunk_size
_last_skip_bytes=$z
echo -ne "[*] processing last chunk # $_chunks... with size $_last_chunk_size \x0a"
echo -ne "[*] -exec dd if=$_file of=$_chunks-$o_suffix bs=1 skip=$_last_skip_bytes count=$_last_chunk_size \x0a"
echo -ne "[.] post processing verify, orig filesize: $orig_fsize , should equal a sum of: $_last_skip_bytes + $_last_chunk_size \x0a"

echo -ne "\033[01;32m[OK] Done. \033[00m \x0a" 
