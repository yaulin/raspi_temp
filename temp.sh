#!/bin/bash
# Yaroslav Aulin
# 24/01/2022

echo " # CPU Temperature log file" > temp.csv
echo " 'Timestamp', 'Temperature, C'" >> temp.csv

while true     #endless loop
do
	timestamp=$( date +%Y-%m-%d\ %H:%M:%S ) #take timestamp 
	temp0=$((`cat /sys/class/thermal/thermal_zone0/temp`)) # read the temperature sensor
	temp=$(echo "$temp0/1000" | bc -l) # convert the temperature to C
	
	echo "$timestamp,$temp" >> temp.csv        # write to file
	sleep 1 # wait 1 second
done
