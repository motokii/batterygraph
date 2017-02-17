#!/bin/sh
CURRENT_DIR=`dirname $0`
cd $CURRENT_DIR/../
HOME_DIR=`pwd`
OUT_FILE=$HOME_DIR/plist/motokii.batterylogger.plist
echo creating $OUT_FILE

cat << EOF > $OUT_FILE
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>motokii.batterylogger</string>
    <key>ProgramArguments</key>
    <array>
        <string>$HOME_DIR/logger/writelog.rb</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
        <dict>
            <key>Minute</key>
            <integer>0</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>10</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>20</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>30</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>40</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>50</integer>
        </dict>
    </array>
</dict>
</plist>

EOF
