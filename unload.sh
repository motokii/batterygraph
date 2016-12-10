#!/bin/sh

CURRENT_DIR=`dirname $0`
cd $CURRENT_DIR
pwd
echo ""

launchctl unload $CURRENT_DIR/plist/currentBattery.plist
launchctl unload $CURRENT_DIR/plist/cycleBattery.plist
launchctl unload $CURRENT_DIR/plist/maxBattery.plist

