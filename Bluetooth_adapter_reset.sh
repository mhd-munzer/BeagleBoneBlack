#!/bin/bash
#looping across all the 4 usb ports I have
for X in {1..4}
{
#Making sure there is a device connected on this port
if [ -r /sys/bus/usb/devices/1-1.$X ]
then
#exporting the idVendor of the usb device to var and making sure it has the same id as my adapter
var=$(cat /sys/bus/usb/devices/1-1.$X/idVendor)
if [ $var = '0a5c' ]
then
#exporting the idProduct of the usb device to var1 and making sure it has the same id as my adapter
var1=$(cat /sys/bus/usb/devices/1-1.$X/idProduct)
if [ $var1 = '21e8' ]
then
#resetting the port the BLUETOOTH adapter is attached to.
sh -c "echo 0 > /sys/bus/usb/devices/1-1.$X/authorized"
sh -c "echo 1 > /sys/bus/usb/devices/1-1.$X/authorized"
fi
fi
fi
}
