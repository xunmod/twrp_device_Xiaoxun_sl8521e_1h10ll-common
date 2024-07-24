#!/sbin/busybox sh

echo "======usb" &> /rec.log
/sbin/busybox find /sys/class/android_usb 1>>/rec.log 2>>/rec.log 
/sbin/busybox find /sys/kernel/config 1>>/rec.log 2>>/rec.log 
echo "======log" 1>>/rec.log 2>>/rec.log 
cat /tmp/recovery.log 1>>/rec.log 2>>/rec.log 
echo "======dmesg" 1>>/rec.log 2>>/rec.log 
busybox dmesg 1>>/rec.log 2>>/rec.log 
echo "======logcat" 1>>/rec.log 2>>/rec.log 
sleep 5 && killall logcat &
logcat 1>>/rec.log 2>>/rec.log
sleep 10
cp /rec.log /data/
cp /rec.log /cache/
