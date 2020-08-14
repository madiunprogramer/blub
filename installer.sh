#!/bin/bash env

R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
N='\033[0m'
clear

ABI=$(getprop ro.product.cpu.abi)
ARCH="${ABI%-*}"
sleep 3& PID=$! #simulate a long process

echo "${R}Proses cek architecture...${N}"
printf "[ "
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep .1
done
printf " ]"
echo -n "






"
echo "System archi terdeteksi = ${R}${ARCH}${N}"
sleep 5

clear

cd ~

lxdf="${G}Running Auto installer....${N}"

echo $lxdf
pkg uninstall golang -y > /dev/null 2>&1
clear
echo $lxdf

echo -n "
${Y}Step 1 : Update & Upgrade repo.${N}

"
apt update && apt upgrade
sleep 3
clear
echo $lxdf
echo -n "
${Y}Step 2 : Installing git & golang..${N}

"

apt install git -y
sleep 3
clear 
echo $lxdf
echo -n "
${Y}Step 3 : Installing golang...${N}

"
cd
mkdir -p foo
cd foo

if [ $ARCH = 'arm' ]
then
wget -N --progress=bar:force https://termux.mentality.rip/termux-packages-24/arm/golang_2%3A1.14.7-1_arm.deb 2>&1 
dpkg -i golang_2:1.14.7-1_arm.deb
fi
if [ $ARCH = 'arm64' ]
then
wget -N --progress=bar:force  https://termux.mentality.rip/termux-packages-24/aarch64/golang_2%3A1.14.7-1_aarch64.deb 2>&1 
dpkg -i golang_2:1.14.7-1_aarch64.deb
fi

cd 
sleep 3
clear 
echo $lxdf

echo -n "
${Y}Step 4 : Installing popon-skuy...${N}

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
${Y}Step 4 : Installing Tunnel Core...${N}

"
go get -v -u -d github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
sleep 2
cd ~/go/src/github.com/Psiphon-Labs/psiphon-tunnel-core/ConsoleClient
sleep 2
go build -ldflags "-s -w" -o ~/go/src/github.com/madiunprogramer/popon-skuy/psiphon-tunnel-core
sleep 2

cd ~/go/src/github.com/madiunprogramer/popon-skuy
./popon-skuy


