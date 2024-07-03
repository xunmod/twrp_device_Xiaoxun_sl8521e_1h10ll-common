#!/sbin/busybox sh

echo "======usb" &> /cache/rec.log
/sbin/busybox find /sys/class/android_usb 1>>/cache/rec.log 2>>/cache/rec.log 
/sbin/busybox find /sys/kernel/config 1>>/cache/rec.log 2>>/cache/rec.log 
echo "======log" 1>>/cache/rec.log 2>>/cache/rec.log 
cat /tmp/recovery.log 1>>/cache/rec.log 2>>/cache/rec.log 
echo "======dmesg" 1>>/cache/rec.log 2>>/cache/rec.log 
busybox dmesg 1>>/cache/rec.log 2>>/cache/rec.log 
echo "======logcat" 1>>/cache/rec.log 2>>/cache/rec.log 
sleep 5 && killall logcat &
logcat 1>>/cache/rec.log 2>>/cache/rec.log 
cp /cache/rec.log /data/
