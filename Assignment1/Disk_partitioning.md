--------------Disk Partitioning-------------
1.	After adding virtual disk, use fdisk [path off disk] to start partition.(Example: fdisk /dev/sdb)
2.	Now, type n to create a new partition.
3.	After typing n you will be given options to either create a primary partition or extended partition. You can select any one of them as per your choice.
4.	Now, you will be asked for partition number you can use default or select among the given options.
5.	Now, you will be asked about the size of partition you can use default values for first sector or any value among the given range. For the last partition if you need to create more than one partition it’s better not to use default value because by using default value whole disk space will be allocated to that partition only and you will be left with no free sectors.
6.	At the last after doing all this press w to write changes into the disk.
