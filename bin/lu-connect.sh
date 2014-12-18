#/bin/env sh

ip link set wlp3s0 down
ip link set dev wlp3s0 address 00:1e:64:51:ff:38
netctl start LU\ weblogon\ \(key:\ lu2014-2\)-wlp3s0
chromium --incognito https://wlc-ac.net.lu.se/aaa/web-logon.html
