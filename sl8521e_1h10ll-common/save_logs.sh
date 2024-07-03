#!/sbin/busybox sh

sleep 10
echo "======prop" > /data/rec.log
getprop >> /data/rec.log
echo "======usb" >> /data/rec.log
/sbin/busybox find /sys/class/android_usb >> /data/rec.log
/sbin/busybox find /config >> /data/rec.log
echo "======log" >> /data/rec.log
cat /tmp/recovery.log >> /data/rec.log
echo "======dmesg" >> /data/rec.log
busybox dmesg >> /data/rec.log
echo "======logcat" >> /data/rec.log
sleep 10 && killall logcat &
logcat >> /data/rec.log
