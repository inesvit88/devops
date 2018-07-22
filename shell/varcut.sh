#!/bin/bash

:(){ v="some string.rtf" && v2=${v::-4} && echo "$v --> $v2"; };:

#v="some string.rtf"
#v2=${v::-4}
#echo "$v --> $v2"
