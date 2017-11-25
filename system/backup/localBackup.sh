#locate in the /backup/
#umount /media/local/*
#umount /medi/backup/*
mountBackupDev=/home/fire7617/setting/mount/backupDev.sh
mountLocalDev=/home/fire7617/setting/mount/localDev.sh

backupDeviceRoot=/media/backup

backupDevice0=DataBackup
backupDevice1=MusicBackup
backupDevice2=SoftBackup
backupDevice3=MediaBackup
backupDevice4=HomeBackup

################# error #####################
check_backup=0
check_local=0
# Check that sh does exist
testBackupSh=$(test -e $mountBackupDev && echo "$mountBackupDev is already mounted" || echo "")
testLocalSh=$(test -e $mountLocalDev && echo "$mountLocalDev is already mounted" || echo "")

#mount the local device 
sh $mountLocalDev
sh $mountBackupDev

if [ $? -eq 1 ];then
    echo "the backup devices are not mounted"
        exit 
fi

##############################
#
# to start the backup
# 
#   Device: /dev/sda
#############################

echo "############################"
echo "Start to backup the /home/fire7617"
echo "############################"

#backup the directory of the home
echo "to backup the home directory to $backupDeviceRoot/$backupDevice4"
rsync -avl --delete --exclude=".*" --exclude="Music" /home/fire7617/ /media/backup/HomeBackup/Home/


echo "############################"
echo "Start to backup the /media/local"
echo "############################"

testcommand=$(df -h|grep -i $backupDevice0)
##backup data
if [ "$testcommand" != "" ];then
    echo "to backup the data  to $backupDeviceRoot /$backupDevice0" 
    rsync -avl --delete /media/local/data/ /media/backup/DataMainBackup/  #160GB
    rsync -avl --delete /media/local/data/ /media/backup/DataBackup/      #external disk
else
    echo "$backupDeviceRoot /$backupDevice0 is not mounted" 
fi
#
#
##backup music
testcommand=$(df -h|grep -i $backupDevice1)
if [ "$testcommand" != "" ];then
    echo "to backup the music to $backupDeviceRoot/$backupDevice1"
    rsync -avl --delete /media/local/music/女生/    /media/backup/MusicBackup/女生/
    rsync -avl --delete /media/local/music/男生/    /media/backup/MusicBackup/男生/
    rsync -avl --delete /media/local/music2/散歌/   /media/backup/MusicBackup/散歌/
    rsync -avl --delete /media/local/music2/樂團/   /media/backup/MusicBackup/樂團/
    rsync -avl --delete /media/local/music2/原聲帶/ /media/backup/MusicBackup/原聲帶/
    rsync -avl --delete /media/local/music2/純音樂/ /media/backup/MusicBackup/純音樂/
else
    echo "$backupDeviceRoot/$backupDevice1 is not mounted" 
fi

#backup software
testcommand=$(df -h|grep -i $backupDevice2)
if [ "$testcommand" != "" ];then
    echo "to backup the music to $backupDeviceRoot/$backupDevice2"
    rsync -avl  --exclude=War3 /media/local/media/ /media/backup/MediaBackup/

else
    echo "$backupDeviceRoot/$backupDevice2 is not mounted" 
fi

##backup media
testcommand=$(df -h|grep -i $backupDevice3)
if [ "$testcommand" != "" ];then
    echo "to backup the music to $backupDeviceRoot/$backupDevice3"
#    rsync -avl --delete  /media/local/software/ /media/backup/SoftBackup/
else
    echo "$backupDeviceRoot/$backupDevice3 is not mounted" 
fi

#if [ "$testBackupSh" == "" ] ;then
#    echo "backup shell doesn't exist"
#    if [ "$testLocalSh" == "" ];then
#        echo "local shell doesn't exist"
#    fi
#    exit
#fi
#
## mount the backup device
#sh $mountBackupDev 
#
#if [ $? -eq 1 ];then
#    echo "the backup devices are not mounted"
#    exit 
#fi
#




