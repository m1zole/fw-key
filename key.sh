#!/bin/bash

echo "This is test tool"
echo "support iOS 7.x"



device=`echo $1 | cut -d "_" -f 1-1`
echo $device

ios_ver=`echo $1 | cut -d "_" -f 2-2`
echo $ios_ver

build_num=`echo $1 | cut -d "_" -f 3-3`
echo $build_num

if [ $ios_ver = "7.0" ] || [ $ios_ver = "7.0.1" ] || [ $ios_ver = "7.0.2" ] ; then
    codename="Innsbruck"
fi

if [ $ios_ver = "7.0.3" ] || [ $ios_ver = "7.0.4" ] || [ $ios_ver = "7.0.6" ] ; then
    codename="InnsbruckTaos"
fi

if [ $ios_ver = "7.1" ] || [ $ios_ver = "7.1.1" ] || [ $ios_ver = "7.1.2" ] ; then
    codename="Sochi"
fi

echo $codename

wget https://www.theiphonewiki.com/wiki/$codename"_"$build_num"_("$device")"

rootfs=`strings $codename"_"$build_num"_("$device")" | grep keypage-rootfs | cut -d ">" -f 5-5 | cut -d "<" -f 1-1 | cut -d ":" -f 1-1`
rootfs_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-rootfs-key | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
echo "==========================================="
echo "ROOTFS :"$rootfs
echo "ROOTFS_KEY: "$rootfs_key

iBSS_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-ibss-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
iBSS_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-ibss-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
echo "==========================================="
echo "iBSS IV: "$iBSS_iv
echo "iBSS KEY: "$iBSS_key

iBEC_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-ibec-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
iBEC_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-ibec-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
echo "==========================================="
echo "iBEC IV: "$iBEC_iv
echo "iBEC KEY: "$iBEC_key

iBoot_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-iboot-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
iBoot_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-iboot-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
echo "==========================================="
echo "iBOOT IV: "$iBoot_iv
echo "iBOOT KEY: "$iBoot_key

ramdisk_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-restoreramdisk-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
ramdisk_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-restoreramdisk-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
ramdisk=`strings $codename"_"$build_num"_("$device")" | grep keypage-restoreramdisk | cut -d ">" -f 5-5 | cut -d "<" -f 1-1 | cut -d ":" -f 1-1 | grep .dmg`
echo "==========================================="
echo "RESTORERAMDISK: "$ramdisk
echo "RESTORERAMDISK IV: "$ramdisk_iv
echo "RESTORERAMDISK KEY: "$ramdisk_key

aplogo_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-applelogo-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
aplogo_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-applelogo-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
echo "==========================================="
echo "APPLELOGO IV: "$aplogo_iv
echo "APPLELOGO KEY: "$aplogo_key

kerch_iv=`strings $codename"_"$build_num"_("$device")" | grep keypage-kernelcache-iv | cut -d ">" -f 6-6 | cut -d "<" -f 1-1`
kerch_key=`strings $codename"_"$build_num"_("$device")" | grep keypage-kernelcache-key | cut -d ">" -f 5-5 | cut -d "<" -f 1-1`
echo "==========================================="
echo "KERNEL IV: "$kerch_iv
echo "KERNEL KEY: "$kerch_key

exit
