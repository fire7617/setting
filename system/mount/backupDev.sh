testsdb=$(ls -l /dev |grep -i  sdb)
testsdc=$(ls -l /dev |grep -i  sdc)

##########################
# mount the backup sdb disk  
#############################
umount /media/*
if [ "$testsdb" != "" ];then
    echo "$testsdb"
    mount /dev/sdb1  /media/backup/DataMainBackup
    mount /dev/sdb2  /media/backup/HomeBackup
else
    echo "there is no sdb"
    exit 1
fi


if [ "$testsdc" != "" ];then
    mount /dev/sdc1   /media/backup/MusicBackup
    #mount /dev/sdc2   /media/backup/MediaBackup
    mount /dev/sdc3   /media/backup/SoftBackup
    mount /dev/sdc4   /media/backup/DataBackup
else
    echo "there is no sdc"
    exit 1
fi

exit 0



