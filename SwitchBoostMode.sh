#!/bin/bash

CURRENT=$(cat /sys/devices/system/cpu/cpufreq/boost)

if [[ $CURRENT == 0 ]]
then
#     read -n1 -p "CPU boost is currently disabled, enable boost? (y/n)" input
#     echo ""
#
#     if [[ $input == "y" ]]
#     then
        echo "Enabling boost..."
        kdialog --passivepopup 'Enabling boost...'
        pkexec bash -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'
#         sudo sh -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'
#         echo "Setting profile to 'Balanced'"
#         asusctl profile -P Balanced
#     fi
else
#     read -n1 -p "CPU boost is currently enabled, disable boost? (y/n)" input
#     echo ""
#
#     if [[ $input == "y" ]]
#     then
        echo "Disabling boost..."
        kdialog --passivepopup 'Disabling boost...'
        pkexec bash -c 'echo 0 > /sys/devices/system/cpu/cpufreq/boost'
#         sudo sh -c 'echo 0 > /sys/devices/system/cpu/cpufreq/boost'
#         echo "Setting profile to 'Quiet'"
#         asusctl profile -P Quiet
#     fi
fi

BOOST=$(cat /sys/devices/system/cpu/cpufreq/boost)

if [[ $BOOST == 0 ]]
then
    BOOST="Disabled"
else
    BOOST="Enabled"
fi

kdialog --passivepopup "CPU boost: $BOOST."
