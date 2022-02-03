#!/bin/bash

# echo "Profile options:"
# echo "	1. Balanced"
# echo "	2. Performance"
# echo "	3. Quiet"
# echo ""
# echo "Choose an option from above or 'q' to quit:"
#
# read input
#
# if [[ $input != 'q' && ! -z $input ]]
# then
# 	asusctl profile -P $input
# fi

asusctl profile -n
CURR=$(asusctl profile -p)
BOOST=$(cat /sys/devices/system/cpu/cpufreq/boost)

if [[ $BOOST == 0 ]]
then
    BOOST="Disabled"
else
    BOOST="Enabled"
fi

kdialog --passivepopup "Profile set to: $CURR\nCPU boost: $BOOST"
