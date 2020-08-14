#!/bin/bash
clear

cd ~

RED='\033[0;31m'
Green='\033[0;32m'
NC='\033[0m' # No Color

lxdf="Running Auto installer....\nby : t.me/AnonimHelper"
echo $lxdf
pkg uninstall golang -y > /dev/null 2>&1
clear
echo $lxdf

echo -n "
${Gren}Step 1 : Update & Upgrade repo.${NC}

"
apt update && apt upgrade
sleep 3
clear
echo $lxdf
echo -n "
Step 2 : Installing git & golang..

"

apt install git -y
sleep 3
clear 
echo $lxdf
echo -n "
Step 3 : Installing golang...

"
cd
mkdir -p foo
cd foo
wget -N --progress=bar:force  https://termux.mentality.rip/termux-packages-24/aarch64/golang_2%3A1.14.7-1_aarch64.deb 2>&1 
dpkg -i golang_2:1.14.7-1_aarch64.deb
cd 
sleep 3
clear 
echo $lxdf

echo -n "

Step 4 : Installing popon-skuy...

"
go get -v -u -d github.com/madiunprogramer/popon-skuy
sleep 2
cd ~/go/src/github.com/madiunprogramer/popon-skuy
sleep 2
go build -ldflags "-s -w"
sleep 3

clear 
echo $lxdf
echo -n "
Step 4 : Installing Tunnel Core...

"
go get -v -u -d github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
sleep 2
cd ~/go/src/github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
sleep 2
go build -ldflags "-s -w" -o ~/go/src/github.com/madiunprogramer/popon-skuy/psiphon-tunnel-core
sleep 2

cd ~/go/src/github.com/madiunprogramer/popon-skuy
./popon-skuy







