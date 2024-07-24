#!/sbin/busybox sh

busybox dmesg 1>>/early_dmesg 2>>/early_dmesg
sleep 0.2
busybox dmesg 1>>/dmesg 2>>/dmesg
sleep 10
echo "======usb" >/rec.log
/sbin/busybox find /sys/class/android_usb 1>>/rec.log 2>>/rec.log 
/sbin/busybox find /config 1>>/rec.log 2>>/rec.log 
echo "======log" >>/rec.log 
cat /tmp/recovery.log 1>>/rec.log 2>>/rec.log 
echo "======early_dmesg" >>/rec.log
cat /early_dmesg >>/rec.log
echo "======dmesg" >>/rec.log
cat /dmesg >>/rec.log
echo "======logcat" >>/rec.log 
sleep 5 && killall logcat &
logcat 1>>/rec.log 2>>/rec.log
cp /rec.log /data/
cp /rec.log /cache/
