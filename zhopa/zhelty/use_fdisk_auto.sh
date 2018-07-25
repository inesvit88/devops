#!/bin/bash
# 1. add primary partition (n,p), write table and exit (w)
(echo m; echo p; echo m; echo q) | fdisk /dev/mmcblk0

# echo "" - enter, default choses option
