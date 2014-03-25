kill -9 `ps auxwww | grep hltv | grep -v grep | awk '{print $2}'`
cd /usr/local/games/hlds/
./27020.sh
