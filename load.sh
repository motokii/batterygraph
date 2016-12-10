#!/bin/sh

CURRENT_DIR=`dirname $0`
cd $CURRENT_DIR
pwd
echo ""
./plist/currentBatteryCreater.sh
./plist/cycleBatteryCreater.sh
./plist/maxBatteryCreater.sh

launchctl load $CURRENT_DIR/plist/currentBattery.plist
launchctl load $CURRENT_DIR/plist/cycleBattery.plist
launchctl load $CURRENT_DIR/plist/maxBattery.plist

