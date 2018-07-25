# https://elinux.org/RPi_Resize_Flash_Partitions

1. Use fdisk to add a new partition

  fdisk /dev/mmcblk0
  n - add new partition
    p- primary
  w - write table to disk and exit
  
2. Use parted to extend into newly added partition

$ parted /dev/mmblk0
(parted) unit chs print
(parted) rm 3  ; remove 3rd partition before extending to it (we just needed it to see the last chs)
(parted) rm 2
(parted) mkpart primary 61,2,9 59327,63,31   ; start and end chs(cylinder head sector) 
(parted) quit
$ sudo resize2fs /dev/mmblk0p2
$ df -Th .

Notes: rm 2 will NOT remove the data, choose Ignore options, always good to take a backup
